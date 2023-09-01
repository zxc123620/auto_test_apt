from django.db import models

from basic_data.models import TbModule, TbPageService, TbProject


class TbPageFunction(models.Model):
    id = models.BigAutoField(primary_key=True)
    function_name = models.CharField("名称", max_length=50, blank=True, null=True)
    tb_module = models.ForeignKey(TbModule, models.DO_NOTHING, verbose_name="所属模块", blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_page_function'
        verbose_name_plural = "功能管理"

    def __str__(self):
        return self.function_name


class TbTestCases(models.Model):
    id = models.BigAutoField(primary_key=True)
    case_name = models.CharField("用例名称", max_length=30, blank=True, null=True)
    case_description = models.CharField("用例描述", max_length=200, blank=True, null=True)
    page_function = models.ForeignKey(TbPageFunction, models.DO_NOTHING, verbose_name="所属功能", blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_test_cases'
        verbose_name_plural = "用例管理"


class TbCaseService(models.Model):
    id = models.AutoField(primary_key=True)
    service = models.ForeignKey(TbPageService, on_delete=models.CASCADE, verbose_name="业务", blank=True, null=True)
    case = models.ForeignKey(TbTestCases, on_delete=models.CASCADE, verbose_name="用例", blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_case_service'
        verbose_name_plural = "业务操作"

    def __str__(self):
        return ""


class TbCaseServiceArgs(models.Model):
    case_service = models.ForeignKey(TbCaseService, on_delete=models.CASCADE, blank=True, null=True)
    key = models.CharField("参数名", max_length=255, blank=True, null=True)
    type = models.CharField("参数类型", max_length=255, blank=True, null=True)
    value = models.CharField("参数值", max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_case_service_args'
        verbose_name_plural = "参数"

    def __str__(self):
        return ""


class TbTask(models.Model):
    name = models.CharField("任务名称", max_length=255, blank=True, null=True)
    description = models.CharField("任务描述", max_length=255, blank=True, null=True)
    project = models.ForeignKey(TbProject, on_delete=models.CASCADE, blank=True, null=True, verbose_name="所属项目")

    class Meta:
        managed = True
        db_table = 'tb_task'
        verbose_name_plural = "测试执行"


class TbVars(models.Model):
    task = models.ForeignKey(TbTask, models.DO_NOTHING, blank=True, null=True)
    key = models.CharField('参数名', max_length=255, blank=True, null=True)
    value = models.CharField('参数值', max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_vars'
        verbose_name_plural = "全局参数"

    def __str__(self):
        return ''
