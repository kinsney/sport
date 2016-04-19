from django.db import models
from bike.models import Bike
from participator.models import Participator
from bike import pledgeChoices
from datetime import date, datetime
from django.utils import timezone
# Create your models here.
class Order(models.Model):
    number = models.CharField("编号",max_length=16,null=True,unique=True)
    bike = models.ForeignKey(Bike,verbose_name=u'所租车辆')
    amount = models.IntegerField("单车数量",default=1)
    added = models.DateTimeField(u'下单时间',auto_now_add=True)
    renter = models.ForeignKey(Participator,verbose_name='租车人')
    beginTime = models.DateTimeField(u'订单开始时间',null=True)
    endTime = models.DateTimeField(u'订单结束时间',null=True)
    rentMoney = models.IntegerField("租金",null=True)
    deposit = models.IntegerField("押金",null=True)
    pledge = models.CharField("抵押证件",null=True,max_length=10,choices=pledgeChoices)
    equipments = models.CharField(u'提供装备',max_length=100,blank=True,null=True)
    status = models.CharField(u'订单状态',max_length=20,choices=(('completed','已完成'),
        ('confirming','待确认'),
        ('confirmed','已确认'),
        ('rejected','车主已拒绝'),
        ('canceled','车主已取消'),
        ('withdraw','租客已撤回'),
        ('withdraw_confirmed','租客已违约'),
        ),default='confirming')
    status_modified = models.DateTimeField(u'状态修改时间',auto_now_add=True,null=True)

    ScoreOnRenter = models.PositiveSmallIntegerField(u'租车人得分',choices=((1,u'一分'),
        (2,u'两分'),
        (3,u'三分'),
        (4,u'四分'),
        (5,u'五分')),null=True,blank=True)
    ScoreOnOwner = models.PositiveSmallIntegerField(u'车主得分',choices=((1,u'一分'),
        (2,u'两分'),
        (3,u'三分'),
        (4,u'四分'),
        (5,u'五分')),null=True,blank=True)
    def __str__(self):
        return self.number
    class Meta:
        verbose_name = u'订单'
        verbose_name_plural = u'订单'
        ordering = ('-added', '-pk')
    def set_status(self,status):
        '''设置订单状态'''
        if self.status == status:
            return
        self.status = status
        self.status_modified = timezone.now()
        self.save()

class Comments(models.Model):
    order = models.ForeignKey(Order,verbose_name='所属订单')
    owner = models.ForeignKey(Participator,verbose_name='所属人')
    content = models.TextField('内容',null=True,blank=True)
    added = models.DateTimeField('添加时间',auto_now_add = True)
    class Meta:
        verbose_name = u'评论'
        verbose_name_plural = u'评论'
        ordering = ('added', 'pk')
    def __str__(self):
        return self.content
