from django.conf.urls import   url
from . import views
urlpatterns = [
    url(r'^login$',views.login,name='login'),
    url(r'^logout$',views.logout,name='logout'),
    url(r'^register-code$',views.register_code,name='register_code'),
    url(r'^register$',views.register,name='register'),
    url(r'^selfcenter$',views.selfCenter,name='selfCenter'),
    url(r'^ordermanage$',views.orderManage,name='orderManage'),
    url(r'^mybike$',views.myBike,name='myBike'),
    url(r'^verifyInfo$',views.verifyInfo,name='verifyInfo'),
    url(r'^beginTime/(?P<bikeNumber>[0-9]+)$',views.beginTime,name='beginTime'),
    url(r'^eraseTime/(?P<bikeNumber>[0-9]+)$',views.eraseTime,name='eraseTime')
]
