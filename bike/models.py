from django.db import models
from participator.models import Participator,University
from . import suitHeightChoices,howOldChoices,equipmentChoices,statusChoices,pledgeChoices,GENDER,speedChangeChoices,suspensionChoices,wheelSizeChoices,brakeTypeChoices,handlebarChoices

# Create your models here.
class Brand(models.Model):
    name = models.CharField(u'名称', max_length=32, primary_key=True)
    thumbnail = models.ImageField(u'缩略图', max_length=128,upload_to ='brand/' ,blank=True)
    order = models.SmallIntegerField(u'顺序', default=0)
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'品牌'
        verbose_name_plural = u'品牌'
        ordering = ('order', 'name')

class Category(models.Model):
    name = models.CharField(u'名称',max_length=32,primary_key=True)
    order = models.SmallIntegerField(u'顺序',default=0)
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'分类'
        verbose_name_plural = u'分类'
        ordering = ['order']

class Version(models.Model):
    name = models.CharField(u'型号名称',max_length=32,primary_key=True)
    brand = models.ForeignKey(Brand,verbose_name=u'品牌')
    order = models.SmallIntegerField(u'顺序', default=0)
    category = models.ForeignKey(Category,verbose_name=u'单车类型')
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'型号'
        verbose_name_plural = u'型号'
        ordering = ('order', 'name')


class Attribute(models.Model):
    price = models.IntegerField(u'原价',blank=True,default=0)
    speedChange = models.CharField(u'变速',choices=speedChangeChoices,blank=True,max_length=10)
    wheelSize = models.CharField(u'车轮尺寸',choices=wheelSizeChoices,blank=True,max_length=10)
    brakeType = models.CharField(u'刹车类型',choices=brakeTypeChoices,blank=True,max_length=10)
    handlebar = models.CharField(u'车把类型',choices=handlebarChoices,blank=True,max_length=10)
    suspension = models.CharField(u'避震类型',choices=suspensionChoices,blank=True,max_length=10)
    quickRelease = models.BooleanField(u'是否快拆',default=True)
    version = models.ForeignKey(Version,verbose_name=u'单车型号')
    class Meta:
        verbose_name = u'属性'
        verbose_name_plural = u'属性'


class Address(models.Model):
    name = models.CharField(u'位置名称',max_length=32)
    longitude = models.CharField(u'经度',max_length = 20)
    latitude = models.CharField(u'纬度',max_length = 20)
    def __str__(self):
        bike = Bike.objects.get(address=self)
        return u'%s %s' % (
                bike.owner.school,
                self.name
            )
    class Meta:
        verbose_name = u'地理位置'
        verbose_name_plural = u'地理位置'


class Bike(models.Model):
    name = models.CharField(u'单车名称',max_length= 20,null=True)
    number = models.CharField(u'编号',max_length=20,blank=True,null=True)
    version = models.ForeignKey(Version,verbose_name=u'型号',null=True)
    owner = models.ForeignKey(Participator,verbose_name=u'车主',null=True)
    amount = models.IntegerField(u'单车数量',default=1)
    address = models.ForeignKey(Address,verbose_name='具体位置',null=True)
    status = models.CharField(u'状态',choices=statusChoices,max_length = 10,default='checking')
    hourRent = models.DecimalField("每小时租金",max_digits=6,decimal_places=2)
    dayRent = models.DecimalField("每天租金",max_digits=6,decimal_places=2)
    weekRent = models.DecimalField("每周租金",max_digits=6,decimal_places=2)
    deposit = models.IntegerField(u'押金',blank=True,null=True)
    studentDeposit = models.BooleanField(u'学生租客是否免押金',default=True)
    pledge = models.CharField(u'抵押',choices=pledgeChoices,max_length = 10,blank=True,null=True)
    suitHeight = models.CharField(u'适合身高',choices=suitHeightChoices,max_length = 10,blank=True,null=True)
    howOld = models.IntegerField(u'新旧程度',choices=howOldChoices,blank=True,null=True)
    sexualFix = models.CharField(u'适合男女',choices=GENDER,max_length=15,default=None,null=True)
    equipment = models.CharField(u'提供装备',max_length=100,blank=True,null=True)
    maxDuration = models.DurationField(u'最长租期',blank=True,null=True)
    minDuration = models.DurationField(u'最短租期',blank=True,null=True)
    added = models.DateTimeField('发布时间',auto_now_add=True)
    beginTime = models.DateTimeField('暂停起始时间',null=True,blank=True)
    endTime = models.DateTimeField('暂停结束时间',blank=True,null=True)
    description = models.TextField(u'描述', blank=True,null=True)
    def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
        return 'user/{0}/{1}'.format(instance.bike.owner.user.username, filename)
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'自行车'
        verbose_name_plural = u'自行车'


class Photo(models.Model):
    def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
        return 'user/{0}/{1}'.format(instance.bike.owner.user.username, filename)
    title = models.CharField(u'图片说明',max_length=10,blank=True)
    content = models.ImageField(u'图片内容',upload_to=user_directory_path)
    bike = models.ForeignKey(Bike,verbose_name='所属车')
    class Meta:
        verbose_name = u'缩略图'
        verbose_name_plural = u'缩略图'

