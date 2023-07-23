# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TbProject(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True, db_comment='名称')
    ip_address = models.CharField(max_length=20, blank=True, null=True, db_comment='项目IP地址')
    project_url = models.CharField(max_length=100, blank=True, null=True, db_comment='项目路径')
    db_username = models.CharField(max_length=50, blank=True, null=True, db_comment='数据库用户名')
    db_password = models.CharField(max_length=50, blank=True, null=True, db_comment='数据库密码')

    class Meta:
        managed = True
        db_table = 'tb_project'
