from django.shortcuts import render
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound
from django.contrib.auth import authenticate, login as do_login, logout as do_logout
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.shortcuts import render, redirect
from django.db.models import Q,Sum,Count

from message.models import IPRecord, VerificationCode

from participator.models import Participator,Province,VerifyCategory,VerifyAttachment
from order.models import Order
from bike.models import Bike,Photo
from participator.forms import verifyForm
import datetime
import logging
logger = logging.getLogger("django")
# Create your views here.
#

def login_required(view):
    def wrapped_view(request, *args, **kwargs):
        if request.user.is_authenticated():
            return view(request, *args, **kwargs)
        elif request.is_ajax():
            return HttpResponseForbidden()
        else:
            return render(request, 'login.html')
    return wrapped_view

def login(request):
    try:
        assert request.is_ajax()
        identity = request.POST['identity']
        password = request.POST['password']
        assert len(identity) > 0
    except (KeyError,AssertionError):
        return HttpResponseBadRequest()

    user = authenticate(username=identity,password=password)
    if user is None:
        return HttpResponseForbidden()
    do_login(request,user)
    if not request.POST.get('memorize'):
        request.session.set_expiry(0)
    return HttpResponse(status=205)

def logout(request):
    do_logout(request)
    return redirect(reverse('home'))

def register_code(request):
    try:
        assert request.is_ajax()
        phone = request.POST['phone']
        ip = request.META.get('HTTP_X_REAL_IP', request.META['REMOTE_ADDR'])

        try:
            User.objects.get(username=phone)
        except User.DoesNotExist:
            pass
        else:
            return HttpResponse(status=409)

        ip_record = IPRecord(ip = ip)
        try:
            ip_record.clean()
        except ValidationError:
            return HttpResponse(status=421)
        code = VerificationCode(target=phone)
        code.save()
        ip_record.message = code.message
        ip_record.save()
    except (KeyError, AssertionError, ValidationError):
        return HttpResponseBadRequest()

    return HttpResponse(status=204)

def register(request):
    try:
        assert request.is_ajax()
        phone = request.POST['phone']
        code = request.POST['code']
        password = request.POST['password']
        confirm = request.POST['confirm']
        nickname = request.POST['nickname']
        assert 'agree' in request.POST
        assert password == confirm
    except (KeyError, AssertionError):
        return HttpResponseBadRequest()

    if not VerificationCode.objects.verify(phone, code):
        return HttpResponseForbidden()
    try:
        user = User.objects.create_user(
            username=phone, email="",
            password=password)
    except:
        return HttpResponse(status=409)

    user = authenticate(username=phone, password=password)
    user.participator = Participator.objects.create(user=user,nickname=nickname)
    do_login(request, user)
    return HttpResponse(status=205)
#个人中心
def selfCenter(request):
    participator = Participator.objects.of_user(request.user)
    provinces = Province.objects.all()
    verifyCategories = VerifyCategory.objects.all()

    for verifyCategory in verifyCategories:
        try :
            verifyCategory.attachment = VerifyAttachment.objects.get(Q(owner=participator)&Q(title=verifyCategory))
            verifyCategory.save()
        except:
            pass

    return render(request,'selfCenter.html',locals())

#订单处理
def orderManage(request):
    participator = Participator.objects.of_user(request.user)
    orders_all = Order.objects.filter(
        Q(renter = participator)
        |Q(bike__owner = participator)
        )
    for order in orders_all :
        order.bike.photo = Photo.objects.filter(bike=order.bike)[0]
    orders_renter = Order.objects.filter(renter = participator)
    for order in orders_renter:
        order.bike.photo = Photo.objects.filter(bike=order.bike)[0]
    orders_owner = Order.objects.filter(bike__owner = participator)
    for order in orders_owner :
        order.bike.photo = Photo.objects.filter(bike=order.bike)[0]
    return render(request,'orderManage.html',locals())

def myBike(request):
    participator = Participator.objects.of_user(request.user)
    bikes = Bike.objects.filter(owner = participator)
    for bike in bikes:
        bike.photos = Photo.objects.filter(bike=bike)
    if request.POST:
            pass
    return render(request,'myBike.html',locals())

def beginTime(request,bikeNumber):
    try:
        assert request.is_ajax()
        bike = Bike.objects.get(number = bikeNumber)
        beginTime = request.POST['beginTime']
        endTime = request.POST['endTime']
        beginTime = datetime.datetime.strptime(beginTime,'%Y-%m-%d %H:%M')
        bike.beginTime = beginTime
        endTime = datetime.datetime.strptime(endTime,'%Y-%m-%d %H:%M')
        bike.endTime = endTime
        bike.save()
        return HttpResponse(status=205)
    except:
        return HttpResponseBadRequest()

def eraseTime(request,bikeNumber):
    try:
        assert request.is_ajax()
        bike = Bike.objects.get(number = bikeNumber)
        bike.beginTime = None
        bike.endTime = None
        bike.save()
        return HttpResponse(status=205)
    except:
        return HttpResponseBadRequest()

def verifyInfo(request):
    participator = Participator.objects.of_user(request.user)
    provinces = Province.objects.all()
    verifyCategories = VerifyCategory.objects.all()
    VerifyAttachments = VerifyAttachment.objects.filter(owner = participator)
    if participator.status == 'verified':
        return HttpResponseForbidden()
    try:

        form = verifyForm(request.POST,instance=participator)
        form.save()
        request.user.save()
        attachmentType = VerifyCategory.objects.all()
        for i in range(1,len(request.FILES)+1):
            content = request.FILES['#'+str(i)]
            title = attachmentType[i-1]
            if participator.verifyattachment_set.all().filter(title = title).exists():
                attachment = participator.verifyattachment_set.all().get(title=title)
                attachment.attachment = content
                attachment.save()
            else :
                 attachment = VerifyAttachment.objects.create(owner = participator,title=title,attachment = content)
        participator.status = 'verifing'
        participator.save()
    except:
        return HttpResponseBadRequest(form.errors.as_json())
    return render(request,'selfCenter.html',locals())



