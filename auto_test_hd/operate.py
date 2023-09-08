#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/9/5 21:03
# @Author    :zhouxiaochuan
# @Description: 
import inspect

methods = {}


def get_methods():
    return methods


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
        methods[desc] = {"method_name": function.__name__, "args": method_args, "method": function}

        def wrapper(*args, **kwargs):
            function(*args, **kwargs)

        return wrapper

    return inner


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

