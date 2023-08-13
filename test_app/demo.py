#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :demo.py
# @Time      :2023/7/31 22:01
# @Author    :zhouxiaochuan
# @Description:
import json

data = '''
[{
    "name": "小明",
    "height": "170",
    "age": "18"
}, {
     "name": "小红",
    "height": "165",
    "age": "20"
}]
'''
a = '{"a":"1"}'
print(json.loads(a))