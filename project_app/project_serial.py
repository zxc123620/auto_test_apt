#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :project_serial.py
# @Time      :2023/7/23 15:16
# @Author    :zhouxiaochuan
from rest_framework import serializers


class TbProjectSerializer(serializers.Serializer):
    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        pass

    id = serializers.IntegerField()
    name = serializers.CharField()
    ip_address = serializers.CharField()
    project_url = serializers.CharField()
    db_username = serializers.CharField()
    db_password = serializers.CharField()
