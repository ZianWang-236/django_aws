# 菜品类别信息视图文件
from django.shortcuts import render
from django.http import HttpResponse
from myadmin.models import Category, Shop
from django.core.paginator import Paginator
from django.db.models import Q
from datetime import datetime
from django.http import JsonResponse

def index(request, pIndex = 1):
    umod = Category.objects
    ulist = umod.filter(status__lt = 9)
    mywhere=[]
    # 获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        ulist = ulist.filter(name__contains=kw)
        mywhere.append('keyword='+kw)
    # 获取并封装状态条件
    status = request.GET.get('status', '')
    if status != '':
        ulist = ulist.filter(status=status)
        mywhere.append("status="+status)

    # 分页操作
    pIndex = int(pIndex)
    page = Paginator(ulist, 10) # 十条一页
    maxpage = page.num_pages # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpage:
        pIndex = maxpage
    elif pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) # 获取当前页数据
    plist = page.page_range # 获取页码列表信息# 获取页码范围

    # 遍历当前菜品所对应的店铺信息
    for vo in list2:
        sob = Shop.objects.get(id = vo.shop_id)
        vo.shopname = sob.name

    context = {"categorylist":list2, "plist":plist, 'pIndex':pIndex, "maxpage":maxpage, "mywhere":mywhere}
    return render(request, "myadmin/category/index.html", context)


def add(request):
    '''添加信息'''
    # 获取当前所有店铺信息
    slist = Shop.objects.values("id", "name")
    context = {"shoplist":slist}
    return render(request, "myadmin/category/add.html", context)


def insert(request):
    '''提交信息'''
    try:
        ob = Category()
        ob.shop_id = request.POST['shop_id']
        ob.name = request.POST['name']
        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"添加成功!"}
    except Exception as err:
        print(err)
        context = {'info':"添加失败!"}
    return render(request, "myadmin/info.html", context)
    
def delete(request, cid=0):
    '''删除信息'''
    try:
        ob = Category.objects.get(id = cid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"删除成功!"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败!"}
    return render(request, "myadmin/info.html", context)

def edit(request, cid=0):
    '''编辑信息'''
    try:
        slist = Shop.objects.values("id", "name")
        ob = Category.objects.get(id = cid)
        context = {'category':ob, 'shoplist': slist}
        return render(request, "myadmin/category/edit.html", context)
    except Exception as err:
        print(err)
        context = {'info':"找不到对应信息！"}
    return render(request, "myadmin/info.html", context)

    
def update(request, cid=0):
    '''更新信息'''
    try:
        ob = Category.objects.get(id = cid)
        ob.shop_id = request.POST['shop_id']
        ob.name = request.POST['name']
        ob.status = request.POST['status']
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        context = {'info':"修改成功!"}
    except Exception as err:
        print(err)
        context = {'info':"修改失败!"}
    return render(request, "myadmin/info.html", context)


def loadCategory(request,sid):
    clist = Category.objects.filter(status__lt=9,shop_id=sid).values("id","name")
    #返回QuerySet对象，使用list强转成对应的菜品分类列表信息
    return JsonResponse({'data':list(clist)})

