from django.db import models

from basic_data.models import TbPageService, TbProject, TbPage


class TbPageFunction(models.Model):
    id = models.BigAutoField(primary_key=True)
    function_name = models.CharField("名称", max_length=50, blank=True, null=True)
    tb_page = models.ForeignKey(TbPage, models.CASCADE, verbose_name="所属页面", blank=True, null=True)

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

    def __str__(self):
        return self.case_name


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
    # type = models.CharField("参数类型", max_length=255, blank=True, null=True)
    value = models.CharField("参数值", max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_case_service_args'
        verbose_name_plural = "参数"

    def __str__(self):
        return ""


status_choice = [
    ("0", "未执行"),
    ("1", "正在执行"),
    ("2", "执行完毕")
]


class TbTask(models.Model):
    name = models.CharField("任务名称", max_length=255, blank=True, null=True)
    description = models.CharField("任务描述", max_length=255, blank=True, null=True)
    project = models.ForeignKey(TbProject, on_delete=models.CASCADE, blank=True, null=True, verbose_name="所属项目")
    status = models.CharField("状态", choices=status_choice, max_length=10, blank=True, null=True)
    report_url = models.CharField("测试报告地址", max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_task'
        verbose_name_plural = "测试执行"

    def __str__(self):
        return str([self.id, self.name])


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


class TbTaskCase(models.Model):
    task = models.ForeignKey(TbTask, models.DO_NOTHING, blank=True, null=True)
    case = models.ForeignKey(TbTestCases, models.DO_NOTHING, blank=True, null=True, verbose_name="用例")

    class Meta:
        managed = True
        db_table = 'tb_task_case'
        verbose_name_plural = "执行用例"

    def __str__(self):
        return ""


class TbAssertOption(models.Model):
    id = models.BigAutoField(primary_key=True)
    operate_name = models.CharField("断言名称", blank=True, null=True, max_length=255)
    operate_key = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_assert_operation'

    def __str__(self):
        return self.operate_name


class TbExpect(models.Model):
    id = models.BigAutoField(primary_key=True)
    case = models.ForeignKey(TbTestCases, on_delete=models.CASCADE, blank=True, null=True, verbose_name="所属用例")
    expect = models.CharField("用例预期结果", max_length=255, blank=True, null=True)
    assert_operate = models.ForeignKey(TbAssertOption, on_delete=models.CASCADE, verbose_name="验证方式")
    actual = models.CharField("页面实际结果", max_length=255, blank=True, null=True)
    description = models.CharField("验证项描述", max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_expect_operate_assert'
        verbose_name_plural = "验证项"

    def __str__(self):
        return ""
