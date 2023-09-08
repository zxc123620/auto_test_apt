from django.contrib import admin
from nested_admin.nested import NestedModelAdmin, NestedTabularInline

from auto_test_hd.operate import get_method_args
from basic_data.models import TbProject, TbModule, TbOperateItem, TbPageService, TbPage, TbServiceArgs, \
    TbServiceOperateArgs, TbElement


@admin.register(TbProject)
class ProjectAdmin(NestedModelAdmin):
    list_display = ["name", "ip_address"]


@admin.register(TbModule)
class ModuleAdmin(NestedModelAdmin):
    list_display = ["name", "project"]


class TbElementAdmin(NestedTabularInline):
    model = TbElement
    extra = 0


@admin.register(TbPage)
class PageAdmin(NestedModelAdmin):
    list_display = ["name"]
    inlines = [TbElementAdmin]


class PageServiceArgAdmin(NestedTabularInline):
    model = TbServiceArgs
    list_display = ["service_key"]
    # readonly_fields = ["service_key"]
    extra = 0

    # def get_readonly_fields(self, request, obj=None):
    #     if obj is None:
    #         return []
    #     else:
    #         return super().get_readonly_fields(request, obj)


class ServiceOperateArgsAdmin(NestedTabularInline):
    model = TbServiceOperateArgs
    extra = 0
    list_display = ["operate_key", "operate_val"]
    readonly_fields = ["operate_key"]
    #
    # def get_readonly_fields(self, request, obj=None):
    #     if obj is None:
    #         return []
    #     else:
    #         return super().get_readonly_fields(request, obj)


class OperateAdmin(NestedTabularInline):
    model = TbOperateItem
    extra = 0
    list_display = ["operate_name"]
    inlines = [ServiceOperateArgsAdmin]


@admin.register(TbPageService)
class PageServiceAdmin(NestedModelAdmin):
    list_display = ["service_name", "tb_page"]
    inlines = [PageServiceArgAdmin, OperateAdmin]

    def save_model(self, request, obj, form, change):
        for operate in obj.tboperateitem_set.all():
            if not operate.tbserviceoperateargs_set.all().exists():
                operate_name = operate.operate_name
                method_args = get_method_args(operate_name)
                for method_arg in method_args:
                    arg_obj = TbServiceOperateArgs(operate=operate, operate_key=method_arg)
                    arg_obj.save()
        super().save_model(request, obj, form, change)
