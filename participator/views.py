from django.shortcuts import render,render_to_response,get_object_or_404,redirect
from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound
from django.contrib.auth import authenticate, login as do_login, logout as do_logout
from django.core.urlresolvers import reverse, reverse_lazy
from django.template import RequestContext
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.db.models import Q,Sum,Count
from django.template.loader import render_to_string
from message.models import IPRecord, VerificationCode,Message
from order.models import Comments
from participator.models import Participator,Province,VerifyCategory,VerifyAttachment
from order.models import Order,Transaction
from bike.models import Bike,Photo
from participator.forms import verifyForm
import constance
import datetime
import logging
from django.utils import timezone
logger = logging.getLogger("django")
# Create your views here.
month = datetime.date.today().month
year = datetime.date.today().year

def get_month_profit(user):
    '''每月收益'''
    orders = Order.objects.filter(bike__owner=user,beginTime__month=month,beginTime__year=year,status='completed')
    profit= orders.aggregate(Sum('rentMoney'))
    return profit["rentMoney__sum"] or 0

def get_ratio(user):
    '''接单率'''
    orders_success = Order.objects.filter(bike__owner=user,status__in=["completed","confirmed"])
    orders_all = Order.objects.filter(bike__owner=user)
    if len(orders_all)>0:
        ratio = round(len(orders_success)/len(orders_all)*100)
    else:
        ratio =0
    return ratio

def get_average_time(user):
    '''平均接单时间'''
    orders = Order.objects.filter(bike__owner=user,status__in=["completed","confirmed"])
    times = orders.aggregate(Sum('receiveTime'))
    if len(orders) != 0:
        time = times["receiveTime__sum"]/len(orders)
        time = time-datetime.timedelta(microseconds=time.microseconds)
        return time
    else :
        return "暂无"
    # time = datetime.timedelta(0)


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
@login_required
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
@login_required
def orderManage(request):
    participator = Participator.objects.of_user(request.user)
    profit = get_month_profit(participator)
    ratio = get_ratio(participator)
    successOrders = len(Order.objects.filter(bike__owner=participator,status='completed'))
    time = get_average_time(participator)
    return render(request,'orderManage.html',locals())

@login_required
def orderDisplay(request,tab):
    participator = Participator.objects.of_user(request.user)
    orders = Order.objects.filter(
            Q(renter = participator)
            |Q(bike__owner = participator)
            )
    transactions = Transaction.objects.filter(
        Q(renter = participator)
            |Q(bike__owner = participator)
        )
    if tab == 'recent':
        orders = orders.filter(Q(status='confirming')|Q(status='confirmed'))
        transactions = transactions.filter(status="confirming")
    elif tab == 'owner':
        orders = orders.filter(bike__owner = participator)
        transactions = transactions.filter(bike__owner = participator)
    elif tab == 'renter':
        orders = orders.filter(renter = participator)
        transactions = transactions.filter(renter = participator)
    for order in orders :
        order.bike.photo = Photo.objects.filter(bike=order.bike)[0]
        order.comments = Comments.objects.filter(order = order)
    for transaction in transactions:
        transaction.bike.photo = Photo.objects.filter(bike=transaction.bike)[0]
    return render_to_response('orderTable.html',{'orders':orders,'participator':participator,'transactions':transactions},context_instance = RequestContext(request))
@login_required
def myBike(request):
    participator = Participator.objects.of_user(request.user)
    bikes = Bike.objects.filter(owner = participator).exclude(status= 'deleted')
    for bike in bikes:
        bike.photos = Photo.objects.filter(bike=bike)
    if request.POST:
            pass
    return render(request,'myBike.html',locals())
@login_required
def modify(request):
    participator = Participator.objects.of_user(request.user)
    try :
        if request.is_ajax():
            nickname = request.POST['nickname']
            participator.nickname = nickname
            participator.save()
            return HttpResponse(nickname)
        if request.FILES:
            avatar = request.FILES['avatar']
            participator.avatar = avatar
            participator.save()
            return redirect(reverse('selfCenter'))
    except :
        return HttpResponseBadRequest()

@login_required
def beginTime(request,bikeNumber):

    try:
        bike = Bike.objects.get(number = bikeNumber)
        beginTime = request.POST['beginTime']
        endTime = request.POST['endTime']
        beginTime = datetime.datetime.strptime(beginTime,'%Y-%m-%d %H:%M')
        bike.beginTime = beginTime
        endTime = datetime.datetime.strptime(endTime,'%Y-%m-%d %H:%M')
        bike.endTime = endTime
        bike.save()
        return HttpResponse(status=200)
    except:
        return HttpResponseBadRequest()
@login_required
def eraseTime(request,bikeNumber):
    try:
        assert request.is_ajax()
        bike = Bike.objects.get(number = bikeNumber)
        bike.beginTime = None
        bike.endTime = None
        bike.save()
        return HttpResponse(status=200)
    except:
        return HttpResponseBadRequest()
@login_required
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
    return redirect(reverse('selfCenter'))

@login_required
def orderConfirm(request,orderNumber):
    try:
        assert request.is_ajax()
        participator = Participator.objects.of_user(request.user)
        order = Order.objects.get(number = orderNumber)
        assert order.bike.owner == participator
        if  order.status == 'confirming':
            order.set_status('confirmed')
            content = "{"+'"{0}":"{1}"'.format('tell',order.bike.owner.user.username)+"}"
            #车主确认订单
            Message(target=order.renter.user.username,
                content=content,
                template_code='SMS_25390240'
                ).save()
            return redirect(reverse('orderManage'))
        if order.status == 'confirmed':
            order.set_status('completed')
            content = "{"+"}"
            #车主完成订单
            Message(target=order.renter.user.username,
                content=content,
                template_code='SMS_25325300'
                ).save()
            return HttpResponse(status=200)
    except (Order.DoesNotExist,AssertionError) :
        return HttpResponseBadRequest()

# *******************************取消订单****************************
@login_required
def cancel(request,orderNumber):
    try:
        participator = Participator.objects.of_user(request.user)
        order = Order.objects.get(number = orderNumber)
        if "reason" in request.POST:
            reason = request.POST["reason"]
        else:
            reason = ""
        if "others" in request.POST:
            others = request.POST["others"]
        else:
            ohters = ""
        if order.bike.owner == participator :
            order.set_status('rejected')
            order.rejectReason = reason + '' + others
            content = "{"+'"{0}":"{1}"'.format('reason',order.rejectReason)+"}"
            #车主拒绝订单
            Message(target=order.renter.user.username,
                content=content,
                template_code='SMS_25520320'
                ).save()
        elif order.renter == participator :
            order.set_status('canceled')
            order.canceledReason = reason + ':' + others
            content = "{"+'"{0}":"{1}"'.format('oid',order.number)+',"{0}":"{1}"'.format('reason',order.canceledReason)+"}"
            #租客取消订单
            Message(target=order.bike.owner.user.username,
                content=content,
                template_code='SMS_25405301'
                ).save()
        order.save()
        return HttpResponse(status=200)
    except (Order.DoesNotExist,AssertionError) :
        return HttpResponseBadRequest()
@login_required
def orderComment(request,orderNumber):
    try:
        content = request.POST['content']
        if "rating" in request.POST:
            rating = request.POST['rating']
        else :
            rating = 0
        participator = Participator.objects.of_user(request.user)
        order = Order.objects.get(number = orderNumber)
        if participator == order.bike.owner and rating:
            order.ScoreOnRenter = int(rating)
        elif participator == order.renter and rating:
            order.ScoreOnOwner = int(rating)
        order.save()
        comment = Comments.objects.create(owner=participator,content=content,order =order)
        return HttpResponse(status=200)
    except:
        return HttpResponseBadRequest()

#删除单车
@login_required
def bikeDelete(request,bikeNumber):
    try:
        bike = Bike.objects.get(number=bikeNumber)
        bike.status = "deleted"
        bike.save()
    except (KeyError, AssertionError):
        HttpResponseBadRequest()
    return HttpResponse(status=200)

#拒绝交易
@login_required
def cancelTransaction(request,trannumber):
    try:
        participator = Participator.objects.of_user(request.user)
        transaction = get_object_or_404(Transaction,number=trannumber)
        if transaction.renter == participator:
            transaction.set_status('canceled')
        elif transaction.bike.owner == participator:
            transaction.set_status('rejected')
    except:
        return HttpResponseBadRequest()
    return HttpResponse(200)

@login_required
def confirmTransaction(request,trannumber):
    try:
        participator = Participator.objects.of_user(request.user)
        transaction = get_object_or_404(Transaction,number=trannumber)
        assert transaction.bike.owner == participator
        transaction.set_status("completed")
        content = "{"+"}"
        #二手车成交通知
        Message(target=transaction.bike.owner,
            content=content,
            template_code='SMS_24880413'
            ).save()
    except:
        return HttpResponseBadRequest()
    return HttpResponse(200)
