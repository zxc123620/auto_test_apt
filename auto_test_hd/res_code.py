#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :res_code.py
# @Time      :2023/7/16 17:53
# @Author    :zhouxiaochuan
from enum import Enum


class Doing(Enum):
    SUCCESS = 20000


class PROJECT(Enum):
    PROJECT_EXIST = 30001


class Module(Enum):
    MODULE_EXIST = 40001


class FORM(Enum):
    FORM_ERROR = 98001


NOT_AUTH = 30001

DOING_SUCCESS = 20000

LOGIN_FAILED = 20001
LOGIN_PARAM_FAILED = 20002
