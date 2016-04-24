from django.shortcuts import render,redirect,get_object_or_404
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound,QueryDict
from .models import Order,Comments
from bike.models import Bike,Photo
from participator.models import Participator
from django.core.urlresolvers import reverse, reverse_lazy
from message.models import Message
from participator.views import login_required
from django.views.decorators.csrf import csrf_exempt
from order.api import verify_alipay_notify,get_alipay_url_params,ALIPAY_GATEWAY

from urllib.request import urlopen
# Create your views here.
import logging
import datetime
import time,math
import constance
from random import randint
logger = logging.getLogger("django")

#输入为时间戳
def get_time(starttime, endtime):
    dates  = abs(starttime-endtime)/(60*60*24)
    week = math.floor(dates/7) + int((dates - math.floor(dates/7)*7)>=6.25)
    day = math.floor(dates) + int((dates-math.floor(dates))>=0.25) - week*7
    if dates*24 - week*7*24 - day*24>0:
        hours = round(dates*24 - week*7*24 - day*24)
    else :
        hours = 0
    rentTime = {"week":week,"day":day,"hours":hours}
    return rentTime


@login_required
def overbooking(request,bikeNumber,starttime,endtime):
    participator = Participator.objects.of_user(request.user)
    bike = Bike.objects.get(number= bikeNumber)
    photos = Photo.objects.filter(bike=bike)
    equipments = bike.equipment.split(',')
    starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
    endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
    orders = Order.objects.filter(bike=bike)
    for order in orders:
        order.comments = Comments.objects.filter(order = order)
    return render(request,'overbooking.html',locals())
@login_required
def orderSubmit(request,bikeNumber):
    participator = Participator.objects.of_user(request.user)
    bike = get_object_or_404(Bike,number= bikeNumber)
    equipments = bike.equipment.split(',')
    photo = Photo.objects.filter(bike=bike)[0]
    bike.photo = photo
    if request.POST:
        try :
            assert bike.owner != participator
            starttime = request.POST["starttime"]
            endtime = request.POST["endtime"]
            starttime_object = time.mktime(time.strptime(starttime,'%Y-%m-%d %H:%M'))
            endtime_object = time.mktime(time.strptime(endtime,'%Y-%m-%d %H:%M'))
            rentTime = get_time(starttime_object, endtime_object)
            week = rentTime["week"]
            day = rentTime["day"]
            hours = rentTime["hours"]
            rentMoney = bike.dayRent*day + bike.hourRent*hours+bike.weekRent*week
        except:
            HttpResponseBadRequest()
    return render(request,'orderSubmit.html',locals())
@login_required
def submitDone(request):
    try :
        if request.POST:
            number = request.POST['number']
            orderNumberLength = constance.config.orderNumberLength
            participator = Participator.objects.of_user(request.user)
            starttime = request.POST["starttime"]
            endtime = request.POST["endtime"]
            amount = request.POST["amount"]
            equipments = request.POST["equipments"]
            starttime_object = time.mktime(time.strptime(starttime,'%Y-%m-%d %H:%M'))
            endtime_object = time.mktime(time.strptime(endtime,'%Y-%m-%d %H:%M'))
            logger.info(starttime_object)
            rentTime = get_time(starttime_object, endtime_object)
            bike = get_object_or_404(Bike,number=number)
            starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
            endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
            now_time = str(int(time.time()))[-10:-1]
            number = str(randint(0,10 ** (orderNumberLength-1-len(now_time))))
            number = now_time + number
            number = '0' * (orderNumberLength - len(number)) + number
            rentMoney = bike.dayRent*rentTime["day"] + bike.hourRent*rentTime["hours"]+bike.weekRent*rentTime["week"]
            order = Order.objects.create(bike=bike,renter=participator,number=number,rentMoney = rentMoney)
            order.beginTime = starttime
            order.endTime = endtime
            order.deposit = bike.deposit
            order.pledge = bike.pledge
            order.equipments = equipments
            order.amount = amount
            order.save()
            param = get_alipay_url_params(request,order)
            url = ALIPAY_GATEWAY + '?' + param
            content = "{"+'"{0}":"{1}"'.format('address','www.qikezuche.com/participator/orderManage')+',"{0}":"{1}"'.format('tell',order.renter.user.username)+"}"
            Message(target=bike.owner.user.username,
                content=content,
                template_code='SMS_7000039'
                ).save()
            logger.info(url)
            return redirect(url)
        else :
            return HttpResponseBadRequest()
    except (KeyError,AssertionError):
        return HttpResponseBadRequest()
    return redirect(reverse('orderManage'))

@csrf_exempt
def payed(request):
    logger.debug(request.POST)
    verify_alipay_notify(request.POST)
    return HttpResponse('success')
