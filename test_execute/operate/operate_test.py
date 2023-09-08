#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/8/28 20:23
# @Author    :zhouxiaochuan
# @Description:
import allure
from selenium import webdriver

from auto_test_hd.operate import registry_method


class Operate:
    """
    测试用,可删除
    """

    @staticmethod
    @allure.step("点击操作")
    @registry_method(desc="点击操作")
    def click(driver: webdriver.Chrome, element, **kwargs):
        print(f"进行点击操作,element:{element}")
        pass

    @staticmethod
    @allure.step("输入操作")
    @registry_method(desc="输入操作")
    def send_key(driver: webdriver.Chrome, element, text, **kwargs):
        print(f"进行点击操作,element:{element}, text: {text}")

# print(get_choices())
# print(get_method_args("点击操作"))
# print(get_method_args("输入操作"))
