from django.db import models

from project_app.models import TbProject


class TbModule(models.Model):
    id = models.BigAutoField(primary_key=True)
    project = models.ForeignKey(TbProject, models.DO_NOTHING)
    name = models.CharField(max_length=50, blank=True, null=True)
    parent_module = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tb_module'
