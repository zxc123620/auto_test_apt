#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/8/28 20:23
# @Author    :zhouxiaochuan
# @Description:
import inspect

methods = {}


def registry_method(desc=None):
    """
    注册操作
    Args:
        desc: 操作描述
    Returns:
    """

    def inner(function):
        nonlocal desc
        if desc is None:
            desc = function.__name__
        sig = inspect.signature(function)
        method_args = []
        for name, param in sig.parameters.items():
            method_args.append(name)
        methods[desc] = {"method_name": function.__name__, "args": method_args}

        def wrapper(*args, **kwargs):
            function(*args, **kwargs)

        return wrapper

    return inner


class Operate:
    """
    测试用,可删除
    """

    @staticmethod
    @registry_method(desc="点击操作")
    def click(element):
        aaa = ""
        pass

    @staticmethod
    @registry_method(desc="输入操作")
    def send_key(element, text):
        pass


def get_choices():
    """
    获取操作项目
    Returns:

    """
    choices = []
    for desc, other in methods.items():
        choices.append((other["method_name"], desc))
    return choices


def get_method_args(method_name):
    return methods[method_name]["args"]

#
# print(get_choices())
# print(get_method_args("点击操作"))
# print(get_method_args("输入操作"))
