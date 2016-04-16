from django.shortcuts import render,redirect
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound,QueryDict
from .models import Order
from bike.models import Bike,Photo
from participator.models import Participator
from django.core.urlresolvers import reverse, reverse_lazy
# Create your views here.
import logging
import datetime
import time
import constance
from random import randint
logger = logging.getLogger("django")
def overbooking(request,bikeNumber,starttime,endtime):
    participator = Participator.objects.of_user(request.user)
    bike = Bike.objects.get(number= bikeNumber)
    photos = Photo.objects.filter(bike=bike)
    equipments = bike.equipment.split(',')
    starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
    endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
    return render(request,'overbooking.html',locals())

def orderSubmit(request,bikeNumber):
    participator = Participator.objects.of_user(request.user)
    bike = Bike.objects.get(number= bikeNumber)
    equipments = bike.equipment.split(',')
    photo = Photo.objects.filter(bike=bike)[0]
    bike.photo = photo
    if request.POST:
        starttime = request.POST["starttime"]
        endtime = request.POST["endtime"]
        starttime_object = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
        endtime_object = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
        week = int(request.POST['week'])
        day = int(request.POST['day'])
        hour = int(request.POST['hour'])
        rentMoney = bike.dayRent*day + bike.hourRent*hour+bike.weekRent*week
    return render(request,'orderSubmit.html',locals())

def submitDone(request):
    try :
        if request.POST:
            number = request.POST['number']
            rentMoney = request.POST["rentMoney"]
            orderNumberLength = constance.config.orderNumberLength
            deposit = request.POST["deposit"]
            pledge = request.POST["pledge"]
            participator = Participator.objects.of_user(request.user)
            starttime = request.POST["starttime"]
            endtime = request.POST["endtime"]
            amount = request.POST["amount"]
            equipments = request.POST["equipments"]
            bike = Bike.objects.get(number=number)
            starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
            endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
            now_time = str(int(time.time()))
            number = str(randint(0,10 ** orderNumberLength-1-len(now_time)))
            number = now_time + number
            number = '0' * (orderNumberLength - len(number)) + number
            order = Order.objects.create(bike=bike,renter=participator,status="confirming",number=number)
            order.beginTime = starttime
            order.endTime = endtime
            order.rentMoney = rentMoney
            order.deposit = deposit
            order.pledge = pledge
            order.equipments = equipments
            order.amount = amount
            order.save()
        else :
            return HttpResponseBadRequest()
    except (KeyError,AssertionError):
        return HttpResponseBadRequest()
    return redirect(reverse('orderManage'))