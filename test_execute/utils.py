#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :utils.py
# @Time      :2023/9/4 20:11
# @Author    :zhouxiaochuan
# @Description:
import re

from basic_data.models import TbPageService
from test_execute.models import TbTestCases


class MyTestCase:
    def __init__(self, project_name, function_name, global_params, case: TbTestCases, page):
        self.project_name = project_name
        self.module_name = page.module_name
        self.page = page
        self.function_name = function_name
        self.test_case_name = case.case_name
        self.test_description = case.case_description
        self.services = self.get_services(case, global_params=global_params)
        self.assert_operation = case.tbexpect_set.all()  # 验证项目
        self.result = {}  # 操作执行完成后返回值保存的位置

    def get_services(self, test_case: TbTestCases, global_params: dict):
        """
        获取用例下的所有业务操作
        Args:
            global_params: 全局变量
            test_case: 用例Model
        Returns:
        """
        result = []
        case_services_obj = test_case.tbcaseservice_set.all()
        for case_service in case_services_obj:
            params = {}
            service = case_service.service  # 业务
            params_obj = case_service.tbcaseserviceargs_set.all()
            for param in params_obj:
                arg_name = param.key
                arg_value = param.value
                arg_ref = re.match("{{(.*)}}", arg_value) if arg_value is not None else None
                if arg_ref is not None:
                    arg_ref_name = arg_ref.group(1)
                    arg_value = global_params.get(arg_ref_name, None)
                params[arg_name] = arg_value
            service = Service(service, params=params, global_params=global_params, case=self)
            # ServiceUtils.get_methods(service)
            result.append(service)
        return result

    def __str__(self):
        return str(self.__dict__)


class Service:
    def __init__(self, service: TbPageService, params: dict, global_params: dict, case: MyTestCase):
        self.case = case
        self.service = service
        self.params = params
        self.global_params = global_params
        self.methods = self.get_methods()

    def get_methods(self):
        """
        获取业务所有操作项目
        Args:
        Returns:
        """
        all_operate_objs = self.service.tboperateitem_set.all()  # 该业务操作下的所有操作
        methods = []
        for operate_obj in all_operate_objs:
            params = {}
            operate_method_name = operate_obj.operate_name  # 执行方法名称
            result_obj = operate_obj.tbserviceoperatereturn_set.all()  # 方法执行完成后返回值保存的key
            result_key = result_obj[0].result_key if result_obj.exists() else None
            # if result_key is not None: self.case.result[result_key] = None
            for param_obj in operate_obj.tbserviceoperateargs_set.all():  # 该方法所有参数
                arg_name = param_obj.operate_key
                arg_value = param_obj.operate_val
                arg_ref = re.match("{{(.*):(.*)}}", arg_value) if arg_value is not None else None
                if arg_ref is not None:
                    arg_ref_type = arg_ref.group(1)
                    arg_ref_name = arg_ref.group(2)
                    if arg_ref_type == "val":
                        arg_value = self.global_params.get(arg_ref_name, None)
                        arg_value_new = self.params.get(arg_ref_name, None)
                        arg_value = arg_value_new if arg_value_new is not None else arg_value
                    elif arg_ref_type == "el":
                        arg_value = self.case.page.element_locates[arg_ref_name]
                params[arg_name] = arg_value
            methods.append(Method(method_name=operate_method_name, params=params, result_key=result_key))
        return methods

    def __str__(self):
        return str(self.__dict__)


class Method:
    def __init__(self, method_name, params: dict, result_key):
        self.method_name = method_name
        self.params = params
        self.result_key = result_key

    def __str__(self):
        return str(self.__dict__)
