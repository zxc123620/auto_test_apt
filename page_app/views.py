import json

from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponse

from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST, require_GET

from auto_test_hd.res_code import FORM, Doing
from auto_test_hd.res_template import ResTemPlate
from module_app.models import TbModule
from page_app.forms import AddPageForm, AddElementForm
from page_app.models import TbPage, TbLocatestyle, TbElement
from page_app.page_serial import TbPageSerializer, TbElementSerializer


class PageView:
    @staticmethod
    @csrf_exempt
    @require_POST
    def add_page(request):
        """
        添加页面
        Args:
            request:
        Returns:

        """
        form = AddPageForm(json.loads(request.body.decode("utf-8")))
        if form.is_valid():
            module_id = form.cleaned_data["module"]
            try:
                form.cleaned_data["module"] = TbModule.objects.get(pk=module_id)
            except ObjectDoesNotExist:
                print(f"module={module_id}不存在与数据库中")
                form.cleaned_data["module"] = None
            finally:
                page = TbPage()
                for key, value in form.cleaned_data.items():
                    setattr(page, key, value)
                page.save()
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        else:
            result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @csrf_exempt
    @require_GET
    def get_page(request):
        """
        获取页面信息
        Args:
            request:
        Returns:

        """
        data = TbPage.objects.all()
        if data.exists():
            serializer = TbPageSerializer(instance=data, many=True)
            result = ResTemPlate(code=20000, data=serializer.data)
        else:
            result = ResTemPlate(code=20000, data=[])
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @csrf_exempt
    @require_POST
    def del_page(request, page_id):
        """
        删除项目
        Args:
            request:
            page_id:
        Returns:
        """
        try:
            page = TbPage.objects.get(pk=page_id)
            page.delete()
        except ObjectDoesNotExist:
            print("没有根据page_id找到项目")
        finally:
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        return HttpResponse(result.json_str, "application/json")


class ElementView:
    @staticmethod
    @csrf_exempt
    @require_POST
    def add_element(request):
        """
        添加元素
        Args:
            request:
        Returns:

        """
        form = AddElementForm(json.loads(request.body.decode("utf-8")))
        if form.is_valid():
            page_id = form.cleaned_data["page"]
            locate_style = form.cleaned_data["locatestyle"]
            try:
                form.cleaned_data["page"] = TbPage.objects.get(pk=page_id)
                form.cleaned_data["locatestyle"] = TbLocatestyle.objects.get(pk=locate_style)
            except ObjectDoesNotExist:
                print(f"page_id:{page_id} 或者 locate_style:{locate_style} 不存在与数据库中")
                form.cleaned_data["page"] = None
                form.cleaned_data["locatestyle"] = None
            finally:
                element = TbElement()
                for key, value in form.cleaned_data.items():
                    setattr(element, key, value)
                element.save()
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        else:
            result = ResTemPlate(FORM.FORM_ERROR.value, message="请求参数有误")
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @csrf_exempt
    @require_GET
    def get_element(request):
        """
        获取元素信息
        Args:
            request:
        Returns:

        """
        data = TbElement.objects.all()
        if data.exists():
            serializer = TbElementSerializer(instance=data, many=True)
            result = ResTemPlate(code=20000, data=serializer.data)
        else:
            result = ResTemPlate(code=20000, data=[])
        return HttpResponse(result.json_str, "application/json")

    @staticmethod
    @csrf_exempt
    @require_POST
    def del_element(request, element_id):
        """
        删除元素
        Args:
            request:
            element_id:
        Returns:
        """
        try:
            demo = TbElement.objects.get(pk=element_id)
            demo.delete()
        except ObjectDoesNotExist:
            print("没有根据element_id找到项目")
        finally:
            result = ResTemPlate(Doing.SUCCESS.value, data=1)
        return HttpResponse(result.json_str, "application/json")
