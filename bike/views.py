from django.shortcuts import render,redirect
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound,QueryDict
from django.template.loader import render_to_string
from django.db.models import Q,Sum,Count
from bike.models import Bike,Brand,Version,Address,Photo,Category
from participator.models import Participator,Province,University,City
from bike.forms import bikeForm
from order.models import Order
from datetime import timedelta
from random import randint
import constance
import logging
import time
import json
import datetime
logger = logging.getLogger("django")
# Create your views here.
def bikeSearch(request):
    bikes = Bike.objects.filter(status='Renting')
    citys = City.objects.all()
    categories = Category.objects.all()
    result={}
    if request.POST:
        starttime = request.POST['starttime']
        endtime = request.POST['endtime']
        if starttime:
            starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
        else :
            starttime = datetime.datetime.now()
        if endtime:
            endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
        else :
            endtime = starttime + datetime.timedelta(days=1)
        orders = Order.objects.filter(bike__in=bikes,status__in=['confirmed','confirming']).exclude(Q(endTime__lte=starttime)|Q(beginTime__gte=endtime))
        bikes = bikes.exclude(order__in=orders).filter(Q(beginTime__gte=endtime)|Q(endTime__lte=starttime)|Q(beginTime=None)|Q(endTime=None))
    if request.is_ajax():
        university = request.POST['university']
        category =request.POST['category']
        deposit = request.POST['deposit']
        height = request.POST['height']
        price = request.POST['price']
        starttime = request.POST['starttime']
        endtime = request.POST['endtime']
        if university:
            bikes = bikes.filter(owner__school=university)
        if category and category!='null':
            category = Category.objects.get(name=category)
            bikes=bikes.filter(version__category=category)
        if deposit:
            if deposit == 'True':
                bikes=bikes.filter(studentDeposit=True)
            else :
                bikes=bikes.filter(studentDeposit=False)
        if height and height!='null' :
            bikes = bikes.filter(suitHeight=height)
        if price and price!='null':
            price = int(price)
            roof = price+15
            if price == 45:
                bikes = bikes.filter(dayRent__gte=price)
            else :
                bikes = bikes.filter(dayRent__gte=price,dayRent__lte=roof)
        if starttime:
            starttime = datetime.datetime.strptime(starttime,'%Y-%m-%d %H:%M')
        else :
            starttime = datetime.datetime.now()
        if endtime:
            endtime = datetime.datetime.strptime(endtime,'%Y-%m-%d %H:%M')
        else :
            endtime = starttime + datetime.timedelta(days=1)
        orders = Order.objects.filter(bike__in=bikes,status__in=['confirmed','confirming']).exclude(Q(endTime__lte=starttime)|Q(beginTime__gte=endtime))
        bikes = bikes.exclude(order__in=orders).filter(Q(beginTime__gte=endtime)|Q(endTime__lte=starttime)|Q(beginTime=None)|Q(endTime=None))
        result["bikes"]=[]
        for bike in bikes:
            bike.photo = Photo.objects.filter(bike=bike)[0]
            map = {}
            map['number'] = bike.number
            map['longitude'] = bike.address.longitude
            map['latitude'] = bike.address.latitude
            result["bikes"].append(map)
        html = render_to_string('bikeCard.html',{'bikes':bikes,'starttime':starttime,'endtime':endtime})
        result["html"]=html

        return HttpResponse(json.dumps(result))
    else:
        result["bikes"]=[]
        for bike in bikes:
            bike.photo = Photo.objects.filter(bike=bike)[0]
            map = {}
            map['number'] = bike.number
            map['longitude'] = bike.address.longitude
            map['latitude'] = bike.address.latitude
            result["bikes"].append(map)
        return render(request,'bikeSearch.html',locals())

def bikeSubmit(request):
    participator = Participator.objects.of_user(request.user)
    provinces = Province.objects.all()
    bikeTypeForm = bikeForm(request.POST or None)
    brands = Brand.objects.all()
    if request.POST and bikeTypeForm.is_valid():
        try:
            bikeNumberLength = constance.config.bikeNumberLength
            name = request.POST['name']
            amount = request.POST['amount']
            suitHeight = bikeTypeForm.cleaned_data.get('suitHeight')
            howOld = bikeTypeForm.cleaned_data.get('howOld')
            sexualFix = bikeTypeForm.cleaned_data.get('sexualFix')
            equipment = request.POST.getlist('equipment')
            version_name = request.POST['version']
            brand_name = request.POST['brand']
            pledge = request.POST['pledge']
            address_info = request.POST['address']
            longitude = request.POST['longitude']
            latitude = request.POST['latitude']
            university = request.POST['university']
            hourRent = request.POST['hourRent']
            dayRent = request.POST['dayRent']
            weekRent = request.POST['weekRent']
            deposit =request.POST['deposit']
            minTime = request.POST['minTime']
            maxTime = request.POST['maxTime']
            howManyBikes = request.POST['amount']
            description = request.POST['description']
            brand = Brand.objects.get(name=brand_name)
            version = Version.objects.get(name=version_name,brand=brand)
            address = Address.objects.create(name=address_info,longitude=longitude,latitude=latitude)
            bike = Bike.objects.create(name=name,version=version,owner=participator,address=address)
            if 'studentDeposit' in request.POST:
                bike.studentDeposit = True
            else :
                bike.studentDeposit = False

            now_time = str(int(time.time()))[-10:-1]
            number = str(randint(0,10 ** (bikeNumberLength-1-len(now_time))))
            number = now_time + number
            number = '0' * (bikeNumberLength - len(number)) + number
            bike.number = number
            bike.amount = amount
            bike.sexualFix = sexualFix
            bike.address = address
            bike.hourRent = hourRent
            bike.dayRent = dayRent
            bike.weekRent =weekRent
            bike.deposit = deposit or 0
            bike.description = description
            bike.suitHeight = suitHeight
            bike.howOld = howOld
            bike.amount = howManyBikes
            bike.pledge = pledge
            equipment = ','.join(equipment)
            bike.equipment = equipment
            bike.maxDuration = timedelta(weeks=int(maxTime))
            bike.minDuration = timedelta(hours=int(minTime))
            school = University.objects.get(name=university)

            if participator.school:
                pass
            else:
                participator.school = school
                participator.save()

            for i in range(1,len(request.FILES)+1):
                content = request.FILES['photo'+str(1)]
                photo = Photo.objects.create(content=content,bike=bike,title='缩略图'+str(i))

            bike.save()

            return redirect('/participator/mybike')
        except:
            return HttpResponseForbidden()
    return render(request,'bikeSubmit.html',locals())
