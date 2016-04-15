from django.contrib import admin
from .models import Participator,Province,University,City,VerifyCategory,VerifyAttachment
# Register your models here.
@admin.register(VerifyCategory)
class VerifyCategoryAdmin(admin.ModelAdmin):
    list_display = ('title',)

@admin.register(VerifyAttachment)
class VerifyAttachmentAdmin(admin.ModelAdmin):
    list_display = ('owner','title')

class VerifyAttachmentInline(admin.TabularInline):
    model = VerifyAttachment

@admin.register(Participator)
class ParticipatorAdmin(admin.ModelAdmin):
    search_fields = ['realname','user__username','university__name']
    list_display = ('user','realname')
    inlines = (VerifyAttachmentInline,)


@admin.register(University)
class UniversityAdmin(admin.ModelAdmin):
    search_fields = ('name',)

class UniversityInline(admin.TabularInline):
    model = University
    extra = 0
    sortable_field_name = 'order'

@admin.register(City)
class CityAdmin(admin.ModelAdmin):
    search_fields = ('name',)
    inlines = (UniversityInline,)

class CityInline(admin.TabularInline):
    model = City
    extra = 0
    sortable_field_name = 'order'
    exclude = ('agents',)

@admin.register(Province)
class ProvinceAdmin(admin.ModelAdmin):
    list_display = ('name', 'order')
    list_editable = ('order',)
    inlines = (CityInline,)

