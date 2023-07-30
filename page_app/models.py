# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

# Unable to inspect table 'my_apt'
# The error was: (1146, "Table 'my_apt.my_apt' doesn't exist")
from module_app.models import TbModule


class TbPage(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=50, blank=True, null=True)
    module = models.ForeignKey(TbModule, models.DO_NOTHING)

    class Meta:
        managed = True
        db_table = 'tb_page'


class TbPageFunction(models.Model):
    id = models.BigAutoField(primary_key=True)
    function_name = models.CharField(max_length=50, blank=True, null=True)
    tb_module = models.ForeignKey(TbModule, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_page_function'


class TbPageService(models.Model):
    id = models.BigAutoField(primary_key=True)
    service_name = models.CharField(max_length=50, blank=True, null=True)
    page = models.ForeignKey(TbPage, models.DO_NOTHING, blank=True, null=True)
    service_method_args = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_page_service'

#
# class TbPageServiceElementItem(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     page_service = models.ForeignKey(TbPageService, models.DO_NOTHING, blank=True, null=True)
#     tb_operate_item = models.ForeignKey('TbOperateItem', models.DO_NOTHING, blank=True, null=True)
#     operate_args = models.CharField(max_length=100, blank=True, null=True)
#
#     class Meta:
#         managed = True
#         db_table = 'tb_page_service_element_item'
#

class TbLocatestyle(models.Model):
    name = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_locatestyle'


class TbElement(models.Model):
    id = models.BigAutoField(primary_key=True)
    element_name = models.CharField(max_length=20, blank=True, null=True)
    locatestyle = models.ForeignKey(TbLocatestyle, models.DO_NOTHING, blank=True, null=True)
    locate_value = models.CharField(max_length=200, blank=True, null=True)
    page = models.ForeignKey(TbPage, models.DO_NOTHING, null=True)

    class Meta:
        managed = True
        db_table = 'tb_element'
