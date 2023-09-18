#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :ui_test.py
# @Time      :2023/9/5 19:17
# @Author    :zhouxiaochuan
# @Description:
import allure
import pytest
from selenium import webdriver

from auto_test_hd.operate import get_methods
from test_execute.utils import MyTestCase

TEST_CASES = []


@pytest.fixture(scope="session", autouse=True)
def driver_start():
    driver = webdriver.Chrome()
    driver.maximize_window()
    yield driver
    driver.quit()


@pytest.fixture(scope="function", autouse=True)
def test_setup_and_teardown(driver_start):
    driver = driver_start
    yield driver
    driver.delete_all_cookies()


@pytest.mark.parametrize(argnames="test_case", argvalues=TEST_CASES, ids=[case.test_case_name for case in TEST_CASES])
def test_ui_execute(test_case: MyTestCase, test_setup_and_teardown):
    driver = test_setup_and_teardown
    # allure配置
    allure.dynamic.feature(test_case.module_name)
    allure.dynamic.story(test_case.function_name)
    allure.dynamic.title(test_case.test_case_name)
    allure.dynamic.description(test_case.test_description)
    # 执行操作
    global_methods = get_methods()
    for service in test_case.services:
        for method in service.methods:
            global_methods.get(method.method_name).get("method")(driver=driver, **method.params)
    # 断言操作
