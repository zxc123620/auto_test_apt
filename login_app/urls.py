#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/7/16 16:20
# @Author    :zhouxiaochuan
from django.urls import path
from login_app.views import *
urlpatterns = [
    path('user/login', login),
    path('user/info', user_info),
    path('user/logout', log_out),
]
