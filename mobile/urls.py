# mobile 
from django.contrib import admin
from django.urls import path
from mobile.views import index, member, cart

urlpatterns = [
    path('', index.index, name='mobile_index'),

    path('register', index.register, name='mobile_register'),
    path('doregister', index.doRegister, name='mobile_doregister'),

    path('shop', index.shop, name='mobile_shop'),
    path('shop/select', index.selectShop, name='mobile_selectshop'),

    # cart management
    path('cart/add', cart.add, name='mobile_cart_add'), 
    path('cart/delete', cart.delete, name='mobile_cart_delete'), 
    path('cart/clear', cart.clear, name='mobile_cart_clear'), 
    path('cart/change', cart.change, name='mobile_cart_change'), 

    path('orders/add', index.addOrders, name='mobile_addorders'),
    path('orders/doadd', index.doAddOrders, name='mobile_doaddorders'),

    path('member', member.index, name='mobile_member_index'),
    path('member/orders', member.orders, name='mobile_member_orders'),
    path('member/detail', member.detail, name='mobile_member_detail'),
    path('member/logout', member.logout, name='mobile_member_logout'),
]
