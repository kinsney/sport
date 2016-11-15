from django.contrib import admin
from bike.models import Version,Brand,Category,Bike,Address
from message.models import Message
# Register your models here.
#单车通过验证代码
def bike_verify(modeladmin, request, queryset):
    queryset.update(status='renting')
    for bike in queryset:
        try:
            content = "{"+"}"
            Message(target=bike.owner.user.username,
                content=content,
                template_code='SMS_25550447'
                ).save()
        except Exception:
            pass
bike_verify.short_description = "单车通过验证"
#单车未通过验证
def bike_fail(modeladmin, request, queryset):
    queryset.update(status='failed')
    for bike in queryset:
        try:
            content = "{"+"}"
            Message(target=bike.owner.user.username,
                content=content,
                template_code='SMS_25540308'
                ).save()
        except Exception:
            pass
bike_fail.short_description = "单车未通过验证"

@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    pass
@admin.register(Bike)
class BikeAdmin(admin.ModelAdmin):
    list_display=['name','status']
    actions = [bike_verify,bike_fail]
    pass
@admin.register(Category)


@admin.register(Version)
class VersionAdmin(admin.ModelAdmin):
    search_fields = ('name',)

class VersionInline(admin.TabularInline):
    model = Version
    extra = 0
    sortable_field_name = 'order'

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    inlines = (VersionInline,)

class BrandInline(admin.TabularInline):
    model = Brand
    extra = 0
    sortable_field_name = 'order'
