from django.contrib import admin
from bike.models import Version,Brand,Attribute,Category,Bike,Address
# Register your models here.
@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    pass
@admin.register(Bike)
class BikeAdmin(admin.ModelAdmin):
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
