import time

from django.contrib import admin
from django.utils.html import format_html

from nested_admin.nested import NestedModelAdmin, NestedTabularInline

from basic_data.models import TbServiceArgs, TbPage
from test_execute.main_service.ui.main import ui_run, ui_report
import test_execute.main_service.ui.ui_test as t
from test_execute.models import TbPageFunction, TbTestCases, TbCaseService, TbCaseServiceArgs, TbTask, TbVars, \
    TbTaskCase, TbExpect
from test_execute.utils import MyTestCase


@admin.register(TbPageFunction)
class FunctionAdmin(NestedModelAdmin):
    list_display = ["function_name", "tb_page"]


class CaseServiceArgsAdmin(NestedTabularInline):
    model = TbCaseServiceArgs
    readonly_fields = ["key"]
    extra = 0


class TbCaseServiceAdmin(NestedTabularInline):
    model = TbCaseService
    extra = 0
    inlines = [CaseServiceArgsAdmin]


class TbExpectAdmin(NestedTabularInline):
    model = TbExpect
    extra = 0


@admin.register(TbTestCases)
class CaseAdmin(NestedModelAdmin):
    list_display = ["case_name", "page_function"]
    inlines = [TbCaseServiceAdmin, TbExpectAdmin]

    def save_model(self, request, obj, form, change):
        obj.save()
        for service in obj.tbcaseservice_set.all():
            if not service.tbcaseserviceargs_set.all().exists():
                service_args = TbServiceArgs.objects.filter(service_id=service.service_id)
                for arg in service_args:
                    TbCaseServiceArgs(case_service=service, key=arg.service_key).save()
        super().save_model(request, obj, form, change)


class TbVarsAdmin(NestedTabularInline):
    model = TbVars
    extra = 0


class TaskCaseAdmin(NestedTabularInline):
    model = TbTaskCase
    extra = 0


pages = {}


def get_page(page: TbPage):
    if page.name not in pages.keys():
        pages[page.name] = Page(page)
    return pages[page.name]


class Page:
    def __init__(self, page: TbPage):
        self.__page = page
        self.page_name = page.name
        self.module_name = page.module.name
        self.element_locates = self.get_elements()

    def get_elements(self):
        element_objs = self.__page.tbelement_set.all()
        element_locates = {
            element_obj.element_name:
                (element_obj.locatestyle, element_obj.locate_value)
            for element_obj in element_objs
        }
        return element_locates


@admin.register(TbTask)
class TbTaskAdmin(NestedModelAdmin):
    list_display = ["name", "description", "result"]
    actions = ["execute"]
    inlines = [TbVarsAdmin, TaskCaseAdmin]
    readonly_fields = ["report_url"]

    @admin.display(description="结果")
    def result(self, obj: TbTask):
        if obj.report_url is None:
            return None
        return format_html(f"<a href='{obj.report_url}' target='_blank'>查看结果<a/>")

    @admin.action(description="执行")
    def execute(self, request, queryset):
        task = queryset[0]
        t.TEST_CASES.clear()
        project_name = task.project.name
        all_test_case = []
        global_vars = {vars_obj.key: vars_obj.value for vars_obj in task.tbvars_set.all()}
        for task_case in task.tbtaskcase_set.all():
            test_case = task_case.case  # 用例
            page_function = test_case.page_function  # 所属功能
            page = page_function.tb_page  # 所属页面
            test_case = MyTestCase(project_name=project_name,
                                   function_name=page_function.function_name,
                                   global_params=global_vars, case=test_case, page=get_page(page))
            all_test_case.append(test_case)
        t.TEST_CASES.extend(all_test_case)
        ui_run()
        url = f"/static/report/{time.strftime('%Y-%m-%d-%H-%M-%S')}/"
        ui_report(url)
        task.report_url = url + "index.html"
        task.save()

    execute.type = 'primary'
