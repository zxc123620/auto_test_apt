#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :forms.py
# @Time      :2023/7/17 21:27
# @Author    :zhouxiaochuan
from django import forms


class ProjectForm(forms.Form):
    """
    项目表单
    """
    name = forms.CharField(max_length=50, label='项目名称')
    ip_address = forms.CharField(max_length=20, label='项目IP地址')
    project_url = forms.CharField(max_length=100, label='项目路径')
    db_username = forms.CharField(max_length=50, label='数据库用户名')
    db_password = forms.CharField(max_length=50, label='数据库密码')


class ProjectUpdateForm(forms.Form):
    """
    项目更新表单
    """
    project_id = forms.IntegerField()
    name = forms.CharField(max_length=50, label='项目名称')
    ip_address = forms.CharField(max_length=20, label='项目IP地址')
    project_url = forms.CharField(max_length=100, label='项目路径')
    db_username = forms.CharField(max_length=50, label='数据库用户名')
    db_password = forms.CharField(max_length=50, label='数据库密码')
