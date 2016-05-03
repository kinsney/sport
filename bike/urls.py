from django.conf.urls import   url
from . import views
urlpatterns = [
    url(r'^search$',views.bikeSearch,name='bikeSearch'),
    url(r'^submit$',views.bikeSubmit,name='bikeSubmit'),
    url(r'^modify/(?P<bikeNumber>[0-9]+)$',views.bikeModify,name="bikeModify")
    ]
