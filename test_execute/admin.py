from django.contrib import admin
from django.utils.html import format_html

from nested_admin.nested import NestedModelAdmin, NestedTabularInline

from basic_data.models import TbServiceArgs
from test_execute.models import TbPageFunction, TbTestCases, TbCaseService, TbCaseServiceArgs, TbTask, TbVars


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


@admin.register(TbTask)
class TbTaskAdmin(NestedModelAdmin):
    list_display = ["name", "description", "execute_btn"]
    inlines = [TbVarsAdmin]

    @admin.display(description='执行')
    def execute_btn(self, obj):
        return format_html('<img src="./templates/static/image/execute.svg"></img>')

    execute_btn.icon = 'fas fa-audio-description'
    execute_btn.type = 'primary'
