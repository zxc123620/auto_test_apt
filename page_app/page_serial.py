#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :project_serial.py
# @Time      :2023/7/23 15:16
# @Author    :zhouxiaochuan
from rest_framework import serializers


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
