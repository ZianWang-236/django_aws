# main urls
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('web.urls')), # default front order
    path('myadmin/', include('myadmin.urls')), # backend management
    path('mobile/', include('mobile.urls')), # mobile 
]
