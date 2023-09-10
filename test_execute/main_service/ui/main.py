#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :main.py
# @Time      :2023/9/5 19:18
# @Author    :zhouxiaochuan
# @Description:
import os
import time

import pytest


def get_project_path():
    p_name = 'auto_test_apt'
    p_path = os.path.abspath(os.path.dirname(__file__))
    return p_path[:p_path.index(p_name) + len(p_name)]


result_dir = f"{get_project_path()}/templates/static/result/"


def ui_run():
    pytest.main(["-vs", "--alluredir", result_dir, "--clean-alluredir"])


def ui_report(url):
    report_dir = f"{get_project_path()}/templates" + url
    os.mkdir(report_dir)
    os.system(f"allure generate {result_dir} -o {report_dir} --clean")
