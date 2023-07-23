#!/usr/bin/env python
# -*- coding:utf-8 -*-
# @FileName  :res_template.py
# @Time      :2023/7/17 21:45
# @Author    :zhouxiaochuan
import copy
import json
from json import JSONEncoder


class ResTemPlate:
    """
    响应模板
    """

    def __init__(self, code, data=None, message=None):
        self.code = code
        self.data = data
        self.message = message

    class ResEncoder(JSONEncoder):
        def default(self, obj):
            res_param = copy.deepcopy(obj.__dict__)
            res_param = dict(filter(lambda item: item[1] is not None, res_param.items()))
            return res_param

    @property
    def json_str(self):
        return json.dumps(self, cls=self.ResEncoder)


if __name__ == '__main__':
    print(ResTemPlate(code="a", data="2", message="aaaa").json_str)
