from django.shortcuts import render
from advertisement.models import Advertisement
def home(request):
    carousels = Advertisement.objects.filter(position='carousel',show=True)
    return render(request,'home.html',locals())
