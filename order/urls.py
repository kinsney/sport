from django.conf.urls import   url
from . import views
urlpatterns = [
    url(r'^overbooking/(?P<bikeNumber>[0-9]+)/(?P<starttime>([0-9]+)-([0-9]+)-([0-9]+)\s([0-9]+):([0-9]+))&(?P<endtime>([0-9]+)-([0-9]+)-([0-9]+)\s([0-9]+):([0-9]+))$',views.overbooking,name='overbooking'),
    url(r'^soldorder/(?P<bikeNumber>[0-9]+)$',views.soldorder,name="soldorder"),
    url(r'^orderSubmit/(?P<bikeNumber>[0-9]+)$',views.orderSubmit,name="orderSubmit"),
    url(r'^submitDone$',views.submitDone,name="submitDone"),
    url(r'^soldConfirm/(?P<bikeNumber>[0-9]+)$',views.soldConfirm,name="soldConfirm"),
    ]
