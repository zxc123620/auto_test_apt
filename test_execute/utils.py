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
    def __init__(self, project_name, module_name, function_name, global_params, case: TbTestCases):
        self.project_name = project_name
        self.module_name = module_name
        self.function_name = function_name
        self.test_case_name = case.case_name
        self.test_description = case.case_description
        self.services = TestCaseUtils.get_services(case, global_params=global_params)

    def __str__(self):
        return str(self.__dict__)


class Service:
    def __init__(self, service: TbPageService, params: dict, global_params: dict):
        self.service = service
        self.params = params
        self.global_params = global_params
        self.methods = []

    def __str__(self):
        return str(self.__dict__)


class Method:
    def __init__(self, method_name, params: dict):
        self.method_name = method_name
        self.params = params

    def __str__(self):
        return str(self.__dict__)


class TestCaseUtils:
    @staticmethod
    def get_services(test_case: TbTestCases, global_params: dict):
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
            service = Service(service, params=params, global_params=global_params)
            ServiceUtils.get_methods(service)
            result.append(service)
        return result


class ServiceUtils:
    @staticmethod
    def get_methods(service_data: Service):
        """
        获取业务所有操作项目
        Args:
            service_data: 业务
        Returns:
        """
        all_operate_objs = service_data.service.tboperateitem_set.all()  # 该业务操作下的所有操作
        for operate_obj in all_operate_objs:
            params = {}
            operate_method_name = operate_obj.operate_name  # 执行方法名称
            for param_obj in operate_obj.tbserviceoperateargs_set.all():  # 该方法所有参数
                arg_name = param_obj.operate_key
                arg_value = param_obj.operate_val
                arg_ref = re.match("{{(.*)}}", arg_value) if arg_value is not None else None
                if arg_ref is not None:
                    arg_ref_name = arg_ref.group(1)
                    arg_value = service_data.global_params.get(arg_ref_name, None)
                    arg_value_new = service_data.params.get(arg_ref_name, None)
                    arg_value = arg_value_new if arg_value_new is not None else arg_value
                params[arg_name] = arg_value
            service_data.methods.append(Method(method_name=operate_method_name, params=params))
