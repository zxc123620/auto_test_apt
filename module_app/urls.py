#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/7/23 18:14
# @Author    :zhouxiaochuan
from django.urls import path
from module_app.views import *
urlpatterns = [
    path('add', add_module),
    path('update', update_module),
    path('get', get_module),
    path('del/<int:module_id>', del_module)
]
