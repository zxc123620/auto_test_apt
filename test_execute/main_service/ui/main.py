#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :main.py
# @Time      :2023/9/5 19:18
# @Author    :zhouxiaochuan
# @Description:
import os

import pytest

from auto_test_hd.operate import get_methods
import test_execute.operate.basic


def get_project_path():
    p_name = 'auto_test_apt'
    p_path = os.path.abspath(os.path.dirname(__file__))
    return p_path[:p_path.index(p_name) + len(p_name)]


def ui_run():
    result_dir = f"{get_project_path()}/templates/result/"
    report_dir = f"{get_project_path()}/templates/report/"
    pytest.main(["-vs", "--alluredir", result_dir, "--clean-alluredir"])
    os.system(f"allure generate {result_dir} -o {report_dir} --clean")
