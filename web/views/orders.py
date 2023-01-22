# order management

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import reverse
from myadmin.models import Orders, OrderDetail, Payment, User, Member
from datetime import datetime
from django.core.paginator import Paginator
from django.db.models import Q

# Create your views here.

def index(request, pIndex = 1):
    umod = Orders.objects.all()
    # get current shop id
    sid = request.session['shopinfo']['id']
    ulist = umod.filter(shop_id = sid)
    mywhere=[]
    # 获取并判断搜索条件
    status = request.GET.get('status','')
    # if status != '':
    ulist = ulist.filter(status=status)
    mywhere.append("status="+status)
    ulist = ulist.order_by("-id")
    # kw = request.GET.get("keyword", None)
    # if kw:
    #     ulist = ulist.filter(Q(username__contains=kw) | Q(nickname__contains=kw))
    #     mywhere.append('keyword='+kw)


    # 分页操作
    pIndex = int(pIndex) 
    page = Paginator(ulist, 10) # 10条一页
    maxpage = page.num_pages # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpage:
        pIndex = maxpage
    elif pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) # 获取当前页数据
    plist = page.page_range # 获取页码列表信息# 获取页码范围

    for vo in list2:
        if vo.user_id == 0: #staff order
            vo.nickname = "NONE"
        else:
            user = User.objects.only("nickname").get(id=vo.user_id)
            vo.nickname = user.nickname

        if vo.member_id == 0: #staff order
            vo.membername = "staff-order"
        else:
            member = Member.objects.only("mobile").get(id=vo.member_id)
            vo.membername = member.mobile

    context = {"orderslist":list2, "plist":plist, 'pIndex':pIndex, "maxpage":maxpage, "mywhere":mywhere}
    return render(request, "web/list.html", context)

def insert(request):
    try:
        od = Orders()

        od.shop_id = request.session['shopinfo']['id']
        od.member_id = 0 # shop staff place order, no member id
        od.user_id = request.session['webuser']['id']
        od.money = request.session['total_money']
    
        od.status = 1 #订单状态:1过行中/2无效/3已完成
        od.payment_status = 2 #支付状态:1未支付/2已支付/3已退款

        od.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        od.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        od.save()

        # add payment info
        op = Payment()
        op.order_id = od.id
        op.member_id = 0
        op.type = 2
        op.bank = request.GET.get("bank", 3)
        op.money = request.session['total_money']
        op.status = 2 #订单状态:1过行中/2无效/3已完成
        op.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        op.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        op.save()

        # add order info
        cartlist = request.session.get("cartlist", {})
        for item in cartlist.values():
            ov = OrderDetail()
            ov.order_id = od.id
            ov.product_id = item['id']
            ov.product_name = item['name']
            ov.price = item['price']
            ov.quantity = item['num']
            ov.status = 1
            ov.save()

        del request.session['cartlist']
        del request.session['total_money']
        return HttpResponse("Y")
    except Exception as err:
        print(err)
        return HttpResponse("N")
    


def detail(request):
    oid = request.GET.get("oid", 0)
    dlist = OrderDetail.objects.filter(order_id=oid)
    context = {"detaillist": dlist}
    return render(request, "web/detail.html", context)



def status(request):
    try:
        oid = request.GET.get("oid", 0)
        print(1)
        ob = Orders.objects.get(id = oid)
        print(2)
        ob.status = request.GET['status']
        print(3)
        ob.save()
        print(4)
        return HttpResponse("Y")
    except Exception as err:
        print(err)
        return HttpResponse("N")
