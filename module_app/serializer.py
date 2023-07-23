#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :serializer.py
# @Time      :2023/7/23 21:24
# @Author    :zhouxiaochuan
from rest_framework import serializers


class TbModuleSerializer(serializers.Serializer):
    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        pass

    id = serializers.IntegerField()
    name = serializers.CharField()
    project_id = serializers.IntegerField()
    parent_module_id = serializers.IntegerField()


