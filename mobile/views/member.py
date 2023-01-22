from django.shortcuts import render
from django.http import HttpResponse
from myadmin.models import Orders, OrderDetail, Payment, User, Shop

# Create your views here.
# 个人中心相关 

def index(request):
    return render(request, "mobile/member.html")

def orders(request):
    mod = Orders.objects.all()
    # get current shop id
    mid = request.session['mobileuser']['id']
    olist = mod.filter(member_id = mid)
    # 获取并判断搜索条件
    status = request.GET.get('status','')
    if status != '':
        olist = olist.filter(status=status)
    list2 = olist.order_by("-id")

    orders_status = ['无','排队中','已撤销','已完成']
    for vo in list2:
        plist = OrderDetail.objects.filter(order_id=vo.id)[:4]
        vo.plist = plist
        vo.statusinfo = orders_status[vo.status]


    context = {"orderslist":list2}
    # return render(request, "web/list.html", context)
    return render(request, "mobile/member_orders.html",context)

def detail(request):
    pid = request.GET.get("pid", 0)
    order = Orders.objects.get(id=pid)
    plist = OrderDetail.objects.filter(order_id=order.id)
    order.plist = plist
    shop = Shop.objects.only("name").get(id=order.shop_id)
    order.shopname = shop.name
    orders_status = ['无','排队中','已撤销','已完成']
    order.statusinfo = orders_status[order.status]

    return render(request, "mobile/member_detail.html",{"order":order})

def logout(request): # select shop
    del request.session['mobileuser']
    return render(request, "mobile/register.html")

