# 员工信息视图文件
from django.shortcuts import render
from django.http import HttpResponse
from myadmin.models import User
from django.core.paginator import Paginator
from django.db.models import Q
from datetime import datetime


def index(request, pIndex = 1):
    umod = User.objects
    ulist = umod.filter(status__lt = 9)
    mywhere=[]
    # 获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        ulist = ulist.filter(Q(username__contains=kw) | Q(nickname__contains=kw))
        mywhere.append('keyword='+kw)


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
    context = {"userlist":list2, "plist":plist, 'pIndex':pIndex, "maxpage":maxpage, "mywhere":mywhere}
    return render(request, "myadmin/user/index.html", context)

def add(request):
    '''添加信息'''

    return render(request, "myadmin/user/add.html")
def insert(request):
    '''提交信息'''
    try:
        ob = User()
        ob.username = request.POST['username']
        ob.nickname = request.POST['nickname']
        # 密码
        import hashlib, random
        md5 = hashlib.md5()
        n = random.randint(100000, 999999)
        s = request.POST['password']+str(n) #原密码加入随机数
        md5.update(s.encode('utf-8')) 
        ob.password_hash = md5.hexdigest() #获取md5值
        ob.password_salt = n

        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"添加成功!"}
    except Exception as err:
        print(err)
        context = {'info':"添加失败!"}
    return render(request, "myadmin/info.html", context)
    
def delete(request, uid=0):
    '''删除信息'''
    try:
        ob = User.objects.get(id = uid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"删除成功!"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败!"}
    return render(request, "myadmin/info.html", context)

def edit(request, uid=0):
    '''编辑信息'''
    try:
        ob = User.objects.get(id = uid)
        context = {'user':ob}
        return render(request, "myadmin/user/edit.html", context)
    except Exception as err:
        print(err)
        context = {'info':"找不到对应信息！"}
    return render(request, "myadmin/info.html", context)

    
def update(request, uid=0):
    '''更新信息'''
    try:
        ob = User.objects.get(id = uid)
        ob.status = request.POST['status']
        ob.nickname = request.POST['nickname']
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"修改成功!"}
    except Exception as err:
        print(err)
        context = {'info':"修改失败!"}
    return render(request, "myadmin/info.html", context)

 

