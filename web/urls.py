# front 
from django.contrib import admin
from django.urls import path, include
from web.views import index, cart, orders

urlpatterns = [
    path('', index.index, name='index'),
    
    # 前台登录验证退出 可以不登录直接访问
    path('login', index.login, name='web_login'),
    path('dologin', index.dologin, name='web_dologin'),
    path('logout', index.logout, name='web_logout'),
    path('verify', index.verify, name='web_verify'),
    
    # 为url路由添加请求前缀, 为请求地址自动加“web"方便后续中间件做过滤
    path("web/", include([
        path('', index.webindex, name='web_index'), # 前台大堂点餐首页
        # cart management
        path('cart/add/<str:pid>', cart.add, name='web_cart_add'), 
        path('cart/delete/<str:pid>', cart.delete, name='web_cart_delete'), 
        path('cart/clear', cart.clear, name='web_cart_clear'), 
        path('cart/change', cart.change, name='web_cart_change'), 

        # orders
        path('orders/<int:pIndex>', orders.index, name='web_orders_index'), 
        path('orders/insert', orders.insert, name='web_orders_insert'), 
        path('orders/detail', orders.detail, name='web_orders_detail'), 
        path('orders/status', orders.status, name='web_orders_status'), 
    ]))
]
