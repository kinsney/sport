from django.conf.urls import   url
from . import views
urlpatterns = [
    url(r'^login$',views.login,name='login'),
    url(r'^logout$',views.logout,name='logout'),
    url(r'^register-code$',views.register_code,name='register_code'),
    url(r'^register$',views.register,name='register'),
    url(r'^selfcenter$',views.selfCenter,name='selfCenter'),
    url(r'^selfcenter/modify$',views.modify,name='modify'),
    url(r'^ordermanage$',views.orderManage,name='orderManage'),
    url(r'^ordermanage/(?P<tab>[a-zA-Z]+)$',views.orderDisplay,name='orderDisplay'),
    url(r'^mybike$',views.myBike,name='myBike'),
    url(r'^verifyInfo$',views.verifyInfo,name='verifyInfo'),
    url(r'^beginTime/(?P<bikeNumber>[0-9]+)$',views.beginTime,name='beginTime'),
    url(r'^eraseTime/(?P<bikeNumber>[0-9]+)$',views.eraseTime,name='eraseTime'),
    url(r'^bikeDelete/(?P<bikeNumber>[0-9]+)$',views.bikeDelete,name='bikeDelete'),
    url(r'^orderConfirm/(?P<orderNumber>[0-9]+)$',views.orderConfirm,name='orderConfirm'),
    url(r'^cancel/(?P<orderNumber>[0-9]+)$',views.cancel,name='cancel'),
    url(r'^orderComment/(?P<orderNumber>[0-9]+)$',views.orderComment,name="orderComment")
]
