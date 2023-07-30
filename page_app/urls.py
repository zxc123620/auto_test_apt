#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :urls.py
# @Time      :2023/7/26 21:23
# @Author    :zhouxiaochuan
# @Description: 
from django.urls import path

from page_app.views import PageView, ElementView, PageServiceView

urlpatterns = [
    path('add', PageView.add_page),
    path('get', PageView.get_page),
    path('del/<int:page_id>', PageView.del_page),
    path('element/add', ElementView.add_element),
    path('element/get', ElementView.get_element),
    path('element/del/<int:element_id>', ElementView.del_element),
    path('service/add', PageServiceView.add_service),
    path('service/get', PageServiceView.get_service)
]
