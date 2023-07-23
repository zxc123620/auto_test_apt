import json

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST, require_GET

from auto_test_hd.res_code import Doing, PROJECT, FORM
from auto_test_hd.res_template import ResTemPlate
from project_app import models
from project_app.forms import ProjectForm, ProjectUpdateForm
from project_app.models import TbProject
from project_app.project_serial import TbProjectSerializer


@csrf_exempt
@require_POST
def add_project(request):
    """
    添加项目
    Args:
        request:
    Returns:

    """
    form = ProjectForm(json.loads(request.body.decode("utf-8")))
    if form.is_valid():
        if TbProject.objects.filter(name=form.cleaned_data["name"]).exists():
            result = ResTemPlate(PROJECT.PROJECT_EXIST.value, message="项目已存在")
        else:
            pro_obj = TbProject()
            for key, value in form.cleaned_data.items():
                setattr(pro_obj, key, value)
            pro_obj.save()
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        return HttpResponse(result.json_str)
    else:
        result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
        return HttpResponse(result.json_str)


@csrf_exempt
@require_GET
def get_project(request):
    """
    获取项目信息
    Args:
        request:
    Returns:

    """
    data = TbProject.objects.all()
    serializer = TbProjectSerializer(instance=data, many=True)
    result = ResTemPlate(code=20000, data=serializer.data)
    return HttpResponse(result.json_str, "application/json")


@csrf_exempt
@require_POST
def update_project(request):
    """
    获取项目信息
    Args:
        request:
    Returns:
    """
    form = ProjectUpdateForm(json.loads(request.body.decode("utf-8")))
    if form.is_valid():
        try:
            project = TbProject.objects.get(pk=form.cleaned_data["project_id"])
            for key, value in form.cleaned_data.items():
                setattr(project, key, value)
            project.save()
        except models.TbProject.DoesNotExist:
            print("没有根据project_id找到项目")
        finally:
            result = ResTemPlate(Doing.SUCCESS.value, data="1")
    else:
        result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
    return HttpResponse(result.json_str)


@csrf_exempt
@require_POST
def del_project(request, project_id):
    """
    删除项目
    Args:
        request:
        project_id:
    Returns:
    """
    try:
        project = TbProject.objects.get(pk=project_id)
        print(project)
        project.delete()
    except models.TbProject.DoesNotExist:
        print("没有根据project_id找到项目")
    finally:
        result = ResTemPlate(Doing.SUCCESS.value, data=1)
    return HttpResponse(result.json_str)
