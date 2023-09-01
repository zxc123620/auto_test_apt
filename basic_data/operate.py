#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :operate.py
# @Time      :2023/8/28 20:23
# @Author    :zhouxiaochuan
# @Description: 
class Operate:
    @staticmethod
    def click(element):
        pass

    @staticmethod
    def send_key(element, text):
        pass


def get_methods():
    """
    获取所有的方法与注释
    Returns: [[method_name:str, method_args:tuple], ...]
    """
    result = {}
    for key, value in Operate.__dict__.items():
        if (not str(key).startswith("__")) and isinstance(value, staticmethod):
            method_name = key
            method_args = getattr(Operate, method_name).__code__.co_varnames
            result[method_name] = method_args
    return result


def get_choices():
    """
    获取操作项目
    Returns:

    """
    choices = []
    for method_name, method_args in get_methods().items():
        choices.append((method_name, method_name))
    return choices


def get_method_args(method_name):
    return get_methods()[method_name]
