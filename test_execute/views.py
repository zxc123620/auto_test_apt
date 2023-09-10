from django.shortcuts import render


# Create your views here.

def get_test_result(request):
    print("执行")
    return render(request, "test_execute/report/index.html")
