from django.shortcuts import render, redirect
from datetime import datetime
from myadmin.models import Member, Shop, Category, Product, Orders, OrderDetail, Payment
from django.urls import reverse

# Create your views here.
# 会员注册相关

def index(request):

    # get the current shop
    shopinfo = request.session.get("shopinfo", None)
    if not shopinfo:
        return redirect(reverse("mobile_shop"))
    # get all category and product under the target shop
    clist = Category.objects.filter(shop_id=shopinfo['id'], status=1)
    productlist = dict()
    for vo in clist:
        plist = Product.objects.filter(category_id=vo.id, status=1)
        productlist[vo.id] = plist
    context = {"categorylist":clist,"productlist":productlist.items(),"cid":clist[0]}
    return render(request, "mobile/index.html", context)

def register(request):
    return render(request, "mobile/register.html")

def doRegister(request):
    # return render(request, "mobile/index.html")
    verifycode = "1234" # request.session['verifycode']
    if verifycode != request.POST['code']:
        context = {"info":"captch Wrong!"}
        return render(request, "mobile/register.html", context) 
    try:
        member = Member.objects.get(mobile=request.POST['mobile'])
        
    except Exception as err:
        # print(err)
        # context = {"info":"account dont exist"}
        # return render(request, "mobile/register.html", context)
        ob = Member()
        ob.nickname = 'customer'
        ob.avatar = 'moren.png'
        ob.mobile = request.POST['mobile']
        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        ob.save()
        member = ob
    if member.status == 1:
        request.session['mobileuser'] = member.toDict()
        return redirect(reverse("mobile_index"))
    else:
        context = {"info":"account suspended!"}
        return render(request, "mobile/register.html", context)

def shop(request): # select shop
    context = {"shoplist":Shop.objects.filter(status=1)}
    return render(request, "mobile/shop.html", context)

def selectShop(request): # do select shop
    # return render(request, "mobile/index.html")
    sid = request.GET['sid']
    ob = Shop.objects.get(id=sid)
    request.session['shopinfo'] = ob.toDict()
    request.session['cartlist'] = {}
    return redirect(reverse("mobile_index"))

def addOrders(request): # add order
    cartlist = request.session.get('cartlist', {})
    total_money = 0
    # loop through cart and calculate the sum
    for vo in cartlist.values():
        total_money += vo['num'] * vo['price']
    request.session['total_money'] = total_money
    return render(request, "mobile/addOrders.html")


def doAddOrders(request):
    try:
        od = Orders()

        od.shop_id = request.session['shopinfo']['id']
        od.member_id = request.session['mobileuser']['id']
        od.user_id = 0
        od.money = request.session['total_money']
    
        od.status = 1 #订单状态:1过行中/2无效/3已完成
        od.payment_status = 2 #支付状态:1未支付/2已支付/3已退款

        od.create_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        od.update_at = datetime.now().strftime("%Y-%m-%d %H:%m:%S")
        od.save()

        # add payment info
        op = Payment()
        op.order_id = od.id
        op.member_id = request.session['mobileuser']['id']
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
    except Exception as err:
        print(err)
    return render(request, "mobile/orderinfo.html", {"order":od})   