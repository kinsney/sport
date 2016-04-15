from django import forms
from bike.models import Bike
from . import suitHeightChoices,howOldChoices,equipmentChoices,GENDER


class bikeForm(forms.Form):
    suitHeight = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown'}),choices = suitHeightChoices,label=u'适合身高（cm）')
    howOld = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown '}),choices = howOldChoices,label=u'新旧程度')
    sexualFix = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown'}),choices = GENDER,label=u'适合性别',required=False)



