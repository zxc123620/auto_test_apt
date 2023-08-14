# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from module_app.models import TbModule


class TbTestArgs(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=10, blank=True, null=True)
    value = models.CharField(max_length=255, blank=True, null=True)
    case_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tb_test_args'


class TbPageFunction(models.Model):
    id = models.BigAutoField(primary_key=True)
    function_name = models.CharField(max_length=50, blank=True, null=True)
    tb_module = models.ForeignKey(TbModule, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_page_function'


class TbTestCases(models.Model):
    id = models.BigAutoField(primary_key=True)
    case_name = models.CharField(max_length=30, blank=True, null=True)
    case_description = models.CharField(max_length=200, blank=True, null=True)
    page_function = models.ForeignKey(TbPageFunction, models.CASCADE, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_test_cases'
