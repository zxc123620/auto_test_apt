import json

from django.http import HttpResponse

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST, require_GET

from auto_test_hd.res_code import LOGIN_PARAM_FAILED, LOGIN_FAILED, NOT_AUTH, DOING_SUCCESS
from auto_test_hd.res_template import ResTemPlate
from login_app.models import TbUser


@csrf_exempt
@require_POST
def login(request):
    request_body = json.loads(request.body.decode("utf-8"))
    username = request_body.get("username", None)
    password = request_body.get("password", None)
    if username and password is not None:
        obj_users = TbUser.objects.filter(username=username, password=password)
        if not obj_users.exists():
            data = {
                "code": LOGIN_FAILED,
                "message": "用户名密码错误"
            }
        else:
            data = {
                "code": DOING_SUCCESS,
                "data": {
                    "token": "admin-token"
                }
            }
    else:
        data = {
            "code": LOGIN_PARAM_FAILED,
            "message": "用户名或者密码为空"
        }
    data = json.dumps(data)
    return HttpResponse(data, content_type='application/json')


@csrf_exempt
@require_GET
def user_info(request):
    param_res = request.GET
    param = param_res.dict()
    if param.get("token", None) is not None:
        data = ResTemPlate(code=20000, data={
                "roles": ["admin"],
                "avatar": "",
                "introduction": "I am a super administration",
                "name": "Super Admin"
            })
    else:
        data = {
            "code": NOT_AUTH,
            "message": "没有登录,无法访问"
        }
    data = json.dumps(data)
    return HttpResponse(data, content_type='application/json')


@csrf_exempt
@require_POST
def log_out(request):
    data = {
        "code": 20000,
        "data": ""
    }
    data = json.dumps(data)
    return HttpResponse(data, content_type='application/json')
