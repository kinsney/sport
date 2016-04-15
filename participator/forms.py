from participator.models import Participator
from django import forms
class verifyForm(forms.ModelForm):
    class Meta:
        model = Participator
        fields = ('realname','studentId','PersonId','school')
