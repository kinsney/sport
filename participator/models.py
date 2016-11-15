from django.db import models
from django.contrib.auth.models import User
from participator.validators import IdCardValidator

# Create your models here.
class Province(models.Model):
    name = models.CharField(u'名称',max_length=16, primary_key=True)
    order = models.PositiveSmallIntegerField(u'顺序', default=0)
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'省级行政区'
        verbose_name_plural = u'省级行政区'
        ordering = ('order',)

class City(models.Model):
    province = models.ForeignKey(Province, verbose_name=u'所属省级行政区')
    name = models.CharField(u'名称', max_length=16, primary_key=True)
    order = models.PositiveSmallIntegerField(u'顺序', default=0)
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'市级行政区'
        verbose_name_plural = u'市级行政区'
        ordering = ('order',)

class University(models.Model):
    city = models.ForeignKey(City, verbose_name=u'所属市级行政区')
    name = models.CharField(u'名称', max_length=32, primary_key=True)
    order = models.PositiveSmallIntegerField(u'顺序', default=0)

    def __str__(self):
        return self.name
    class Meta:
        verbose_name = u'学校'
        verbose_name_plural = u'学校'
        ordering = ('order',)

def enrols():
    from datetime import date
    this_year = date.today().year
    for i in range(8):
        yield (str(this_year - i),str(this_year - i))

class ParticipatorManager(models.Manager):
    def of_user(self,user):
        if not hasattr(user,'participator'):
            user.participator = self.model(user=user)
            user.participator.save()
            user.save()
        return user.participator

class Participator(models.Model):
    ENROLS = tuple(enrols())
    GENDER = (
        (None, '男女通用'),
        (True, '男'),
        (False, '女')
    )
    user = models.OneToOneField(User, verbose_name=u'用户', primary_key=True)
    nickname = models.CharField(u'昵称', max_length=16,default=u'骑客')
    email = models.CharField(u'邮箱',max_length=30,null=True,blank=True)
    realname = models.CharField(u'真实姓名', max_length=16, blank=True)
    male = models.NullBooleanField(u'性别', choices=GENDER, help_text=u'是为男，否为女', default=None)
    PersonId = models.CharField(u'身份证号', max_length=18, validators=[IdCardValidator()], blank=True)
    studentId = models.CharField(u'学号', max_length=18, blank=True)
    school = models.ForeignKey(University, verbose_name='所属学校', null=True, blank=True,)
    status = models.CharField(u'用户状态',choices=(
        ('verified',u'通过审核'),
        ('verifing',u'等待审核'),
        ('notYet',u'尚未认证'),
        ('failed',u'未通过审核')),max_length=10,default='notYet')
    checked_email = models.NullBooleanField(u'已验证邮箱', default=None)
    level = models.PositiveSmallIntegerField(u'信用等级', choices=(
        (0,'无星'),
        (1,'一星'),
        (2,'两星'),
        (3,'三星'),
        (4,'四星'),
        (5,'五星')),default=0)
    memo = models.TextField('备注', blank=True)
    objects = ParticipatorManager()

    def __str__(self):
        return u'%s(%s %s)' % (self.nickname, self.get_address(), self.user.username)

    def get_address(self):
        if self.school:
            return u'%s %s %s' % (
                self.school.city.province,
                self.school.city,
                self.school,
            )
        else:
            return ''

    def set_status(self,status):
        '''设置用户状态'''
        if self.status == status:
            return
        self.status = status
        self.save()

    class Meta:
        verbose_name = u'扩展用户'
        verbose_name_plural = u'扩展用户'

    def user_directory_path(instance,filename):
        return 'user/{0}/{1}'.format(instance.user.username,filename)
    avatar = models.ImageField(u'头像',max_length=128,upload_to=user_directory_path, blank=True)

class VerifyCategory(models.Model):
    title = models.CharField(u'标题', max_length=16, primary_key=True)
    hint = models.ImageField(u'提示图片',blank=True)
    def __str__(self):
        return self.title

    class Meta:
        verbose_name = u'验证附件类别'
        verbose_name_plural = u'验证附件类别'

class VerifyAttachment(models.Model):
    title = models.ForeignKey(VerifyCategory, verbose_name=u'类别')
    owner = models.ForeignKey(Participator,verbose_name=u'所属用户')
    def user_directory_path(instance,filename):
        return 'user/{0}/{1}'.format(instance.owner.user.username,filename)
    attachment = models.FileField(u'附件',upload_to=user_directory_path,blank=True)
    def __str__(self):
        return u'%s 的 %s' % (self.owner, self.title)

    class Meta:
        verbose_name = u'验证附件'
        verbose_name_plural = u'验证附件'
        permissions = (
            ('view_owner_attachment', u'查看验证文件'),
        )
