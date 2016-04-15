from django.contrib import admin
from advertisement.models import Advertisement
# Register your models here.
admin.site.register(Advertisement)
class AdvertisementAdmin(admin.ModelAdmin):
    list_display = ('image', 'link', 'position', 'show', 'order')
    list_display_links = None
    list_editable = ('image', 'link', 'position', 'show', 'order')
