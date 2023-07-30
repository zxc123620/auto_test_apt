#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :forms.py
# @Time      :2023/7/26 21:29
# @Author    :zhouxiaochuan
# @Description:
from django import forms


class AddPageForm(forms.Form):
    name = forms.CharField(max_length=50, required=True)
    module = forms.IntegerField(required=True)


class AddElementForm(forms.Form):
    page = forms.IntegerField()
    locatestyle = forms.IntegerField()
    locate_value = forms.CharField(max_length=200)
    element_name = forms.CharField(max_length=20)

# class PageServiceForm(forms.Form):
#     service_name = forms.CharField(max_length=50)
#     page = forms.IntegerField()
#     service_method_args = forms.CharField(max_length=50)
#     page_name = forms.CharField(max_length=200)
