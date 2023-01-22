# 用户信息视图文件
from django.shortcuts import render
from django.http import HttpResponse
from myadmin.models import User, Member
from django.core.paginator import Paginator
from datetime import datetime


def index(request, pIndex = 1):
    umod = Member.objects
    ulist = umod.filter(status__lt = 9)
    mywhere=[]
    status = request.GET.get('status', '')
    if status != '':
        ulist = ulist.filter(status=status)
        mywhere.append("status+"+status)
    # 分页操作
    pIndex = int(pIndex)
    page = Paginator(ulist, 10) # 五条一页
    maxpage = page.num_pages # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpage:
        pIndex = maxpage
    elif pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) # 获取当前页数据
    plist = page.page_range # 获取页码列表信息# 获取页码范围
    context = {"memberlist":list2, "plist":plist, 'pIndex':pIndex, "maxpage":maxpage, "mywhere":mywhere}
    return render(request, "myadmin/member/index.html", context)


def delete(request, uid=0):
    '''删除信息'''
    try:
        ob = Member.objects.get(id = uid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"删除成功!"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败!"}
    return render(request, "myadmin/info.html", context)

