#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/7/31 20:26
# @Author    :zhouxiaochuan
# @Description:

from django.urls import path

from test_app.views import *

urlpatterns = [
    path("function/add", FunctionView.add_function),
    path("function/update", FunctionView.update_function),
    path("function/del/<int:function_id>", FunctionView.del_function),
    path("function/get", FunctionView.get_function),
    path("case/add", CaseView.add_case),
    path("case/update", CaseView.update_case),
    path("case/del/<int:function_id>", CaseView.del_case),
    path("case/get", CaseView.get_case),
]