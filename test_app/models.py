
from django.db import models

from module_app.models import TbModule


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
