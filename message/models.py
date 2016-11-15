from django.db import models

# Create your models here.
from datetime import date, datetime, timedelta
from random import randint

from django.core.exceptions import ValidationError
from django.utils.encoding import smart_text
from message.api import send
import constance,logging
from message.validators import MobileValidator
logger = logging.getLogger("django")
class Message(models.Model):
    target = models.CharField(u'目标',max_length=11,validators=[MobileValidator()])
    content = models.CharField(u'内容',max_length=500)
    sentTime = models.DateTimeField(u'发送时间',auto_now_add=True)
    template_code = models.CharField(u'短信模板',max_length=20,default="SMS_6812186")
    response = models.TextField(u'服务器响应',editable=False)
    def __str__(self):
        return u'%s @ %s : %s' % (self.target, self.sentTime, self.response)

    def clean(self):
        if self.pk is not None: # Modify a message
            raise ValidationError(u'禁止修改已存在的信息')
        super(Message, self).clean()

    def save(self, *args, **kwargs):
        send(self)
        super(Message, self).save(*args, **kwargs)
    class Meta:
        verbose_name = u'消息'
        verbose_name_plural = u'消息'

class IPRecord(models.Model):
    ip = models.GenericIPAddressField(u'来源', db_index=True)
    date = models.DateField(u'日期', auto_now_add=True, db_index=True)
    message = models.OneToOneField(Message, verbose_name=u'消息')

    def __str__(self):
        return u'%s @ %s' % (self.ip, self.date)

    def clean(self):
        if self.pk is not None: # Modify a message
            raise ValidationError(u'禁止修改已存在的信息')
        if IPRecord.objects.filter(ip=self.ip, date=date.today()).count() >= constance.config.IPMessageLimit:
            raise ValidationError(u'当日 IP 记录已经超出限制: %d条/日' % (constance.config.IPMessageLimit,))
        super(IPRecord, self).clean()

        class Meta:
            verbose_name = u'IP记录'
            verbose_name_plural = u'IP记录'

class VerificationCodeManager(models.Manager):
    def verify(self, target, code, delete=True):
        try:
            latest = self.filter(target=target, available=True,
                added__gte=datetime.now() - timedelta(minutes=constance.config.VerificationAvailableMinutes)).latest()
        except self.model.DoesNotExist:
            return False
        else:
            if smart_text(latest.code) == smart_text(code):
                if delete:
                    latest.available = False
                    latest.save()
                return True
            return False

class VerificationCode(models.Model):
    target = models.CharField(u'目标', max_length=11, validators=[MobileValidator()], db_index=True)
    code = models.DecimalField(u'验证码', max_digits=31, decimal_places=0, editable=False)
    added = models.DateTimeField(u'生成时间', auto_now_add=True)
    message = models.OneToOneField(Message, verbose_name=u'消息', editable=False)
    available = models.BooleanField(u'有效', default=True, editable=False)
    objects = VerificationCodeManager()

    def __str__(self):
        return u'%s : %s' % (self.target, self.code)

    def clean(self):
        if self.pk is not None: # Modify a verification code
            raise ValidationError(u'禁止修改已存在的验证码')
        super(VerificationCode, self).clean()
    # 用户注册验证码
    def save(self, *args, **kwargs):
        if self.pk is None: # Create a verification code
            length = constance.config.VerificationCodeLength
            code = str(randint(0, 10 ** length - 1))
            code = '0' * (length - len(code)) + code
            content = "{"+'"{0}":"{1}"'.format('number',code)+"}"
            message = Message(
                target = self.target,
                content = content,
                template_code = 'SMS_25465321')
            message.save()
            self.code = code
            self.message =  message
        super(VerificationCode, self).save(*args, **kwargs)

    class Meta:
        verbose_name = u'验证码'
        verbose_name_plural = u'验证码'
        get_latest_by = 'added'

