import json

from django.db import transaction
from django.http import HttpResponse

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST, require_GET

from auto_test_hd.res_code import Doing, FORM
from auto_test_hd.res_template import ResTemPlate
from test_app.models import TbPageFunction, TbTestCases
from test_app.serial import FunctionSerializer, TestCaseSerializer


class FunctionView:
    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def add_function(request):
        form = FunctionSerializer(data=json.loads(request.body.decode("utf-8")))
        if form.is_valid():
            form.save()
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        else:
            result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_GET
    def get_function(request):
        page_func_objs = TbPageFunction.objects.all()
        if page_func_objs.exists():
            result = ResTemPlate(Doing.SUCCESS.value, data=FunctionSerializer(instance=page_func_objs, many=True).data)
        else:
            result = ResTemPlate(Doing.SUCCESS.value, data=[])
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def del_function(request, function_id):
        objs = TbPageFunction.objects.filter(pk=function_id)
        if objs.exists():
            func_obj = objs.first()
            func_obj.delete()
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def update_function(request):
        form = json.loads(request.body.decode("utf-8"))
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
        if form.get("id", None) is None:
            return HttpResponse(result.json_str, "application/json")
        objs = TbPageFunction.objects.filter(pk=form.get("id"))
        if objs.exists():
            func_obj = objs.first()
            serial = FunctionSerializer(instance=func_obj, data=form, partial=True)
            if serial.is_valid():
                serial.save()
        return HttpResponse(result.json_str, "application/json")

class CaseView:
    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def add_case(request):
        form = json.loads(request.body.decode("utf-8"))
        form = TestCaseSerializer(data=form)
        if form.is_valid():
            form.save()
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        else:
            result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_GET
    def get_case(request):
        case_objs = TbTestCases.objects.all()
        if case_objs.exists():
            result = ResTemPlate(Doing.SUCCESS.value, data=TestCaseSerializer(instance=case_objs, many=True).data)
        else:
            result = ResTemPlate(Doing.SUCCESS.value, data=[])
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def del_case(request, function_id):
        objs = TbTestCases.objects.filter(pk=function_id)
        if objs.exists():
            func_obj = objs.first()
            func_obj.delete()
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @transaction.atomic
    @csrf_exempt
    @require_POST
    def update_case(request):
        form = json.loads(request.body.decode("utf-8"))
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
        if form.get("id", None) is None:
            return HttpResponse(result.json_str, "application/json")
        objs = TbTestCases.objects.filter(pk=form.get("id"))
        if objs.exists():
            func_obj = objs.first()
            serial = TestCaseSerializer(instance=func_obj, data=form, partial=True)
            if serial.is_valid():
                serial.save()
        return HttpResponse(result.json_str, "application/json")
