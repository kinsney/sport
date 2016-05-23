from django import forms
from bike.models import Bike
from . import suitHeightChoices,howOldChoices,equipmentChoices,GENDER


class bikeForm(forms.Form):
    name = forms.CharField(widget=forms.TextInput(attrs={'class':'ui input','placeholder':'如：北邮学十全新迪卡侬5.2'}),label='单车名称')

    amount = forms.IntegerField(widget=forms.NumberInput(attrs={'class':'ui input','placeholder':'1'}),label='单车数量')

    suitHeight = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown'}),choices = suitHeightChoices,label=u'适合身高（cm）')
    howOld = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown '}),choices = howOldChoices,label=u'新旧程度')
    sexualFix = forms.ChoiceField(widget=forms.Select(attrs={'class':'ui dropdown'}),choices = GENDER,label=u'适合性别',required=False)
    equipment = forms.MultipleChoiceField(widget=forms.SelectMultiple(attrs={'class':'ui dropdown'}),choices = equipmentChoices,label='提供装备')


