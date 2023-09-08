from django.contrib import admin

from nested_admin.nested import NestedModelAdmin, NestedTabularInline

from basic_data.models import TbServiceArgs
from test_execute.main_service.ui.main import ui_run
import test_execute.main_service.ui.ui_test as t
from test_execute.models import TbPageFunction, TbTestCases, TbCaseService, TbCaseServiceArgs, TbTask, TbVars, \
    TbTaskCase
from test_execute.utils import MyTestCase


@admin.register(TbPageFunction)
class FunctionAdmin(NestedModelAdmin):
    list_display = ["function_name", "tb_module"]


class CaseServiceArgsAdmin(NestedTabularInline):
    model = TbCaseServiceArgs
    readonly_fields = ["key"]
    extra = 0


class TbCaseServiceAdmin(NestedTabularInline):
    model = TbCaseService
    extra = 0
    inlines = [CaseServiceArgsAdmin]


@admin.register(TbTestCases)
class CaseAdmin(NestedModelAdmin):
    list_display = ["case_name", "page_function"]
    inlines = [TbCaseServiceAdmin]

    def save_model(self, request, obj, form, change):
        obj.save()
        for service in obj.tbcaseservice_set.all():
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


@admin.register(TbTask)
class TbTaskAdmin(NestedModelAdmin):
    list_display = ["name", "description"]
    actions = ["execute"]
    inlines = [TbVarsAdmin, TaskCaseAdmin]

    @admin.action(description="执行")
    def execute(self, request, queryset):
        task = queryset[0]
        project_name = task.project.name
        all_test_case = []
        global_vars = task.tbvars_set.all()
        for task_case in task.tbtaskcase_set.all():
            test_case = task_case.case  # 用例
            page_function = test_case.page_function  # 所属功能
            module = page_function.tb_module  # 所属模块
            test_case = MyTestCase(project_name=project_name, module_name=module.name,
                                   function_name=page_function.function_name,
                                   global_params=global_vars, case=test_case)
            all_test_case.append(test_case)
        t.TEST_CASES.extend(all_test_case)
        ui_run()

    execute.type = 'primary'
