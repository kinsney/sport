from django.contrib import admin
from bike.models import Version,Brand,Attribute,Category,Bike,Address
from message.models import Message
# Register your models here.

def bike_verify(modeladmin, request, queryset):
    queryset.update(status='Renting')
    for bike in queryset:
        try:
            content = "{"+"}"
            Message(target=bike.owner.user.username,
                content=content,
                template_code='SMS_7280632'
                ).save()
        except Exception:
            pass
bike_verify.short_description = "单车通过验证"
@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    pass
@admin.register(Bike)
class BikeAdmin(admin.ModelAdmin):
    list_display=['name','status']
    actions = [bike_verify]
    pass
@admin.register(Category)
class AttributeAdmin(admin.ModelAdmin):
    pass
@admin.register(Attribute)
class AttributeAdmin(admin.ModelAdmin):
    pass
class AttributeInline(admin.TabularInline):
    model = Attribute
    extra = 0

@admin.register(Version)
class VersionAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    inlines = (AttributeInline,)

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
