#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/9/10 16:35
# @Author    :zhouxiaochuan
from django.urls import path

from test_execute.views import get_test_result

urlpatterns = [
    path('result', get_test_result)
]
