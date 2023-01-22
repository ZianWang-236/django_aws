# cart management

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import reverse
from myadmin.models import User, Shop, Category, Product
import hashlib

# Create your views here.

def add(request, pid):
    # add cart
    # access session for product list and select the target product
    product = request.session['productlist'][pid]
    product['num'] = 1 # add default purchase number 
    # try access cart info from session
    cartlist = request.session.get('cartlist', {})
    if pid in cartlist:
        cartlist[pid]['num'] += product['num']
    else:
        cartlist[pid] = product
    # add cartlist into cart
    request.session['cartlist'] = cartlist
    # print(cartlist)
    return redirect(reverse('web_index'))

def delete(request, pid):
    # get the product info from session that is going to be deleted
    cartlist = request.session.get('cartlist', {})
    del cartlist[pid]
    request.session['cartlist'] = cartlist
    return redirect(reverse('web_index'))

def clear(request):
    request.session['cartlist'] = {}
    return redirect(reverse('web_index'))

def change(request):
    cartlist = request.session.get('cartlist', {})
    pid = request.GET.get("pid", 0)
    m = int(request.GET.get("num", 1))
    if m < 1:
        m = 1
    cartlist[pid]['num'] = m
    request.session['cartlist'] = cartlist
    return redirect(reverse('web_index'))

