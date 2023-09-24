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
from test_execute.main_service.ui.validater import VALIDATE_MAPPING
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
            result = global_methods.get(method.method_name).get("method")(driver=driver, **method.params)
            if method.result_key is not None:
                test_case.result[method.result_key] = result

    # 断言操作
    for assert_item in test_case.assert_operation:
        print(f"进行断言操作:{assert_item.description}")  # 打印是哪一项操作
        expect = assert_item.expect
        actual = assert_item.actual
        temp_actual = test_case.result.get(actual, None)
        print(f"temp_actual: {temp_actual}")
        actual = temp_actual if temp_actual is not None else actual
        operate_key = assert_item.assert_operate.operate_key
        VALIDATE_MAPPING.get(str(operate_key))(expect, actual)
