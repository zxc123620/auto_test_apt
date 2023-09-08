from django.db import models
from selenium.webdriver.common.by import By
from django.contrib import admin

from auto_test_hd.operate import get_choices


class TbProject(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField("项目名称", max_length=50, blank=True, null=True, db_comment='名称')
    ip_address = models.CharField("项目IP地址", max_length=20, blank=True, null=True, db_comment='项目IP地址')
    project_url = models.CharField("项目访问路径", max_length=100, blank=True, null=True, db_comment='项目路径')
    db_username = models.CharField("项目数据库用户名", max_length=50, blank=True, null=True, db_comment='数据库用户名')
    db_password = models.CharField("项目数据库密码", max_length=50, blank=True, null=True, db_comment='数据库密码')

    class Meta:
        managed = True
        db_table = 'tb_project'
        verbose_name_plural = '项目管理'

    def __str__(self):
        return self.name


class TbModule(models.Model):
    id = models.BigAutoField(primary_key=True)
    project = models.ForeignKey(TbProject, models.CASCADE, verbose_name="所属项目")
    name = models.CharField("模块名称", max_length=50, blank=True, null=True)

    # parent_module = models.ForeignKey('self', models.CASCADE, blank=True, null=True)
    class Meta:
        managed = True
        db_table = 'tb_module'
        verbose_name_plural = '模块管理'

    def __str__(self):
        return self.name


class TbPage(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField("页面名称", max_length=50, blank=True, null=True)
    module = models.ForeignKey(TbModule, models.CASCADE, blank=True, null=True, verbose_name="所属模块")

    class Meta:
        managed = True
        db_table = 'tb_page'
        verbose_name_plural = '页面管理'

    def __str__(self):
        return self.name


class TbPageService(models.Model):
    id = models.BigAutoField(primary_key=True)
    service_name = models.CharField("业务名称", max_length=50, blank=True, null=True)
    tb_page = models.ForeignKey(TbPage, models.CASCADE, blank=True, null=True, verbose_name="所属页面")

    class Meta:
        managed = True
        db_table = 'tb_page_service'
        verbose_name_plural = '业务管理'

    def __str__(self):
        return self.service_name


locate_type = (
    (By.ID, "Id"),
    (By.CLASS_NAME, "Class Name"),
    (By.XPATH, "Xpath"),
    (By.NAME, "Name")
)


class TbElement(models.Model):
    id = models.BigAutoField(primary_key=True)
    element_name = models.CharField("元素名称", max_length=20, blank=True, null=True)
    locatestyle = models.CharField('定位方式', choices=locate_type, max_length=10, blank=True, null=True)
    locate_value = models.CharField("定位值", max_length=200, blank=True, null=True)
    page = models.ForeignKey(TbPage, models.CASCADE, null=True)

    class Meta:
        managed = True
        db_table = 'tb_element'
        verbose_name_plural = '元素管理'

    def __str__(self):
        return ""


class TbOperateArgs(models.Model):
    operate_name = models.CharField(max_length=100, blank=True, null=True, db_comment='所属操作id值')
    operate_key = models.CharField("参数名称", max_length=255, blank=True, null=True, db_comment='所属操作argname')

    class Meta:
        managed = True
        db_table = 'tb_operate_args'
        verbose_name_plural = '参数'

    def __str__(self):
        return ""


class TbOperateItem(models.Model):
    id = models.BigAutoField(primary_key=True)
    operate_name = models.CharField("操作名称", choices=get_choices(), max_length=50, blank=True, null=True)
    # operate_name = models.CharField("操作名称", max_length=50, blank=True, null=True)
    service = models.ForeignKey(TbPageService, models.CASCADE, blank=True, null=True, verbose_name="所属服务")

    class Meta:
        managed = True
        db_table = 'tb_operate_item'
        verbose_name_plural = '操作'

    def __str__(self):
        return ''


class TbPageServiceElementItem(models.Model):
    id = models.BigAutoField(primary_key=True)
    page_service = models.ForeignKey(TbPageService, models.CASCADE, blank=True, null=True, verbose_name="所属业务")
    tb_operate_item = models.ForeignKey(TbOperateItem, models.CASCADE, blank=True, null=True, verbose_name="所属操作")
    key = models.CharField("参数名", max_length=100, blank=True, null=True)
    value = models.CharField("参数值", max_length=100, blank=True, null=True)
    order = models.IntegerField("执行顺序", blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_page_service_element_item'
        verbose_name_plural = '业务操作参数设置'


class TbServiceOperateArgs(models.Model):
    operate = models.ForeignKey(TbOperateItem, models.CASCADE, blank=True, null=True, db_comment='页面操作项id')
    operate_key = models.CharField("参数名", max_length=255, blank=True, null=True, db_comment='args_name')
    operate_val = models.CharField("参数值", max_length=255, blank=True, null=True, db_comment='args_value')

    class Meta:
        managed = True
        db_table = 'tb_service_operate_args'
        verbose_name_plural = '操作参数设置'

    def __str__(self):
        return ""


class TbServiceArgs(models.Model):
    service = models.ForeignKey(TbPageService, models.CASCADE, blank=True, null=True)
    service_key = models.CharField("参数", max_length=20, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_service_args'
        verbose_name_plural = '参数'

    def __str__(self):
        return ""
