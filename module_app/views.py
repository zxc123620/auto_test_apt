import json

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST, require_GET

from auto_test_hd.res_code import Doing, FORM
from auto_test_hd.res_template import ResTemPlate
from module_app import models
from module_app.forms import AddModuleForm, UpdateModuleForm
from module_app.models import TbModule

from module_app.serializer import TbModuleSerializer


@csrf_exempt
@require_POST
def add_module(request):
    """
    添加模块
    Args:
        request:
    Returns:

    """
    form = AddModuleForm(json.loads(request.body.decode("utf-8")))
    if form.is_valid():
        pro_obj = TbModule()
        parent_module_id = form.cleaned_data["parent_module_id"]
        if parent_module_id is not None:
            form.cleaned_data["parent_module_id"] = TbModule.objects.get(pk=parent_module_id)
        for key, value in form.cleaned_data.items():
            setattr(pro_obj, key, value)
        pro_obj.save()
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
    else:
        result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
    return HttpResponse(result.json_str)


@csrf_exempt
@require_GET
def get_module(request):
    """
    获取项目信息
    Args:
        request:
    Returns:

    """
    data = TbModule.objects.all()
    if data.exists():
        serializer = TbModuleSerializer(instance=data, many=True)
        result = ResTemPlate(code=20000, data=serializer.data)
    else:
        result = ResTemPlate(code=20000, data=[])
    return HttpResponse(result.json_str, "application/json")


@csrf_exempt
@require_POST
def update_module(request):
    """
    获取项目信息
    Args:
        request:
    Returns:
    """
    form = UpdateModuleForm(json.loads(request.body.decode("utf-8")))
    if form.is_valid():
        try:
            module = TbModule.objects.get(pk=form.cleaned_data["module_id"])
            for key, value in form.cleaned_data.items():
                setattr(module, key, value)
            module.save()
        except models.TbModule.DoesNotExist:
            print("没有根据module_id找到项目")
        finally:
            result = ResTemPlate(Doing.SUCCESS.value, data="1")
    else:
        result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
    return HttpResponse(result.json_str)


@csrf_exempt
@require_POST
def del_module(request, module_id):
    """
    删除项目
    Args:
        request:
        module_id:
    Returns:
    """
    try:
        module = TbModule.objects.get(pk=module_id)
        module.delete()
    except models.TbModule.DoesNotExist:
        print("没有根据module_id找到项目")
    finally:
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
    return HttpResponse(result.json_str)
