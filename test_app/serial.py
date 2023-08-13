#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :serial.py
# @Time      :2023/7/31 20:26
# @Author    :zhouxiaochuan
# @Description:
from rest_framework import serializers

from test_app.models import TbPageFunction, TbTestCases


class FunctionSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    def create(self, validated_data):
        page_func_obj = TbPageFunction(
            function_name=validated_data.get("function_name"),
            tb_module=validated_data.get("tb_module")
        )
        page_func_obj.save()
        return page_func_obj

    def update(self, instance, validated_data):
        instance.function_name = validated_data.get("function_name")
        instance.save()
        return instance

    class Meta:
        model = TbPageFunction
        fields = '__all__'


class TestCaseSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    function_id = serializers.IntegerField(source="page_function_id")

    def create(self, validated_data):
        obj = TbTestCases(
            case_name=validated_data.get("case_name"),
            case_description=validated_data.get("case_description"),
            page_function_id=validated_data.get("page_function_id")
        )
        obj.save()
        return obj

    def update(self, instance, validated_data):
        return super().update(instance, validated_data)

    class Meta:
        model = TbTestCases
        fields = ('id', 'case_name', 'case_description', 'function_id')
