#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/7/17 21:16
# @Author    :zhouxiaochuan
from django.urls import path
from project_app.views import *

urlpatterns = [
    path('add', add_project),
    path('get', get_project),
    path('update', update_project),
    path('del/<int:project_id>', del_project)
]
