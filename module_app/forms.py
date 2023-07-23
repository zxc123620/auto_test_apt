#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :forms.py
# @Time      :2023/7/23 18:16
# @Author    :zhouxiaochuan
from django import forms


class AddModuleForm(forms.Form):
    project_id = forms.IntegerField()
    name = forms.CharField(max_length=50)
    parent_module_id = forms.IntegerField(required=False)


class UpdateModuleForm(forms.Form):
    id = forms.IntegerField()
    project_id = forms.IntegerField()
    name = forms.CharField(max_length=50)
    parent_module = forms.IntegerField(required=False)
