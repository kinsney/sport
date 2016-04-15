from django.contrib import admin
from message.models import Message, IPRecord, VerificationCode
# Register your models here.
@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ('target', 'content', 'sentTime', 'response')

@admin.register(IPRecord)
class IPRecordAdmin(admin.ModelAdmin):
    list_display = ('ip', 'date', 'message')

@admin.register(VerificationCode)
class VerificationCodeAdmin(admin.ModelAdmin):
    list_display = ('target', 'code', 'added', 'message', 'available')
