from django.contrib import admin,messages
from .models import Participator,Province,University,City,VerifyCategory,VerifyAttachment
from message.models import Message
# Register your models here.

def participator_verify(modeladmin, request, queryset):
    queryset.update(status='verified')
    for participator in queryset:
        try:
            content = "{"+'"{0}":"{1}"'.format('address','www.qikezuche.com')+"}"
            Message(target=participator.user.username,
                content=content,
                template_code='SMS_6975097'
                ).save()
        except Exception:
            pass

participator_verify.short_description = u"用户通过验证"

@admin.register(VerifyCategory)
class VerifyCategoryAdmin(admin.ModelAdmin):
    list_display = ('title',)

@admin.register(VerifyAttachment)
class VerifyAttachmentAdmin(admin.ModelAdmin):
    list_display = ('owner','title')

class VerifyAttachmentInline(admin.TabularInline):
    model = VerifyAttachment
    extra = 0
    readonly_fields = ('preview',)
    def preview(self, obj):
        return '<a href="%s" target="_blank"><img src="%s" width="320"></a>'.format(obj.attachment.url, obj.attachment.url)
    preview.short_description = "预览"

@admin.register(Participator)
class ParticipatorAdmin(admin.ModelAdmin):
    search_fields = ['realname','user__username','university__name']
    list_display = ('user','realname','status')
    inlines = (VerifyAttachmentInline,)
    actions = [participator_verify]


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

