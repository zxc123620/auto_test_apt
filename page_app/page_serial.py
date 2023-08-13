#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :project_serial.py
# @Time      :2023/7/23 15:16
# @Author    :zhouxiaochuan
from rest_framework import serializers

from page_app.models import TbPageServiceElementItem, TbServiceOperateArgs, TbPageService, TbServiceArgs


class TbPageSerializer(serializers.Serializer):
    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        pass

    id = serializers.IntegerField()
    name = serializers.CharField()
    module_id = serializers.IntegerField()


class TbElementSerializer(serializers.Serializer):
    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        pass

    id = serializers.IntegerField()
    page_id = serializers.IntegerField()
    locatestyle_id = serializers.IntegerField()
    locate_value = serializers.CharField()
    element_name = serializers.CharField()


class TbServiceOperateArgsSerializer(serializers.ModelSerializer):
    class Meta:
        model = TbServiceOperateArgs
        fields = ('operate_key', 'operate_val')


class TbPageServiceElementItemSerializer(serializers.ModelSerializer):
    operate_id = serializers.IntegerField(source="id")
    args = serializers.SerializerMethodField()
    operate_name = serializers.CharField(source="tb_operate_item.operate_name")

    class Meta:
        model = TbPageServiceElementItem
        fields = ("operate_id", "operate_name", "args")

    def get_args(self, obj):
        args_objs = TbServiceOperateArgs.objects.filter(service_operate_id=obj.id)
        return TbServiceOperateArgsSerializer(args_objs, many=True).data


class TbPageServiceSerializer(serializers.ModelSerializer):
    # """
    # [{
    #     "service_name": "测试操作",
    #     "page": "1",
    #     "page_name": "",
    #     "operate": [
    #         {
    #             "id": "1",
    #             "operate_name" :""
    #             "args": [
    #                 {
    #                     "operate_key" :"element",
    #                     "operate_val" : "111"
    #                 }
    #             ]
    #         }
    #     ]
    # },
    # {
    # },
    # {
    # }]
    # """
    operate_list = serializers.SerializerMethodField()
    page_name = serializers.CharField(source="tb_page.name")
    page_id = serializers.CharField(source="tb_page_id")
    args = serializers.SerializerMethodField()

    def get_operate_list(self, obj):
        operate_ids = TbPageServiceElementItem.objects.filter(page_service_id=obj.id)
        return TbPageServiceElementItemSerializer(operate_ids, many=True).data

    def get_args(self, obj):
        service_id = obj.id
        values_list = list(TbServiceArgs.objects.filter(service_id=service_id).values_list("operate_key"))
        values_list = [value[0] for value in values_list]
        return values_list

    class Meta:
        model = TbPageService
        # fields = ("id", "service_name", "page_id", "page_name", "operate_list")
        fields = ("id", "service_name", "page_id", 'args', "page_name", "operate_list")
