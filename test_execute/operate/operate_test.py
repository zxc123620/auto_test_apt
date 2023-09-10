#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/8/28 20:23
# @Author    :zhouxiaochuan
# @Description:
import time

import allure
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait

from auto_test_hd.operate import registry_method


class BaseOperate:
    @staticmethod
    def locate_element(driver, element):
        element = driver.find_element(*element)
        wait = WebDriverWait(driver=driver, timeout=30)
        wait.until(expected_conditions.visibility_of(element))
        driver.execute_script("arguments[0].setAttribute('style','border:2px solid red;')", element)
        time.sleep(0.5)
        return element


class Operate:
    """
    测试用,可删除
    """

    @staticmethod
    @allure.step("打开浏览器")
    @registry_method(desc="打开浏览器")
    def open_url(driver, url, **kwargs):
        print(f"打开浏览器操作,url:{url}")
        driver.get(url)

    @staticmethod
    @allure.step("点击操作")
    @registry_method(desc="点击操作")
    def click(driver, element, **kwargs):
        print(f"进行点击操作,element:{element}")
        BaseOperate.locate_element(driver, element).click()

    @staticmethod
    @allure.step("输入操作")
    @registry_method(desc="输入操作")
    def send_key(driver, element, text, **kwargs):
        print(f"进行输入操作,element:{element}, text: {text}")
        BaseOperate.locate_element(driver, element).send_keys(text)
