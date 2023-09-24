#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :validater.py
# @Time      :2023/9/24 14:27
# @Author    :zhouxiaochuan
import allure


@allure.step("等值判断")
def assert_equal(expect, actual):
    """等值判断"""
    print(f"[等值判断] 预期: {expect}, 实际:{actual}")
    assert expect == actual, f"[等值判断]预期结果和实际结果不一致,预期:{expect}[{type(expect)}],实际:{actual}[{type(actual)}]"


@allure.step("包含判断")
def assert_contains(expect, actual):
    """包含判断"""
    print(f"[包含判断] 预期:{expect}, 实际:{actual}")
    assert expect in actual, f"[包含判断]预期结果不在实际结果中,预期:{expect}"


VALIDATE_MAPPING = {
    "1": assert_equal,
    "2": assert_contains
}
