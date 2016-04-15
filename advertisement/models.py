from django.db import models

# Create your models here.
class Advertisement(models.Model):
    POSITIONS = (
        ('carousel', '首页跑马灯'),
    )
    title = models.CharField(u'文本', max_length=64,blank=True)
    image = models.ImageField(u'图像',upload_to='advertisement/')
    link = models.URLField(u'链接')
    position = models.CharField(u'位置', max_length=32,
        choices=POSITIONS)
    show = models.BooleanField(u'显示', default=False)
    text = models.CharField(u'副文本',max_length=64,blank=True)
    order = models.SmallIntegerField(u'顺序', default=0)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = u'广告'
        verbose_name_plural = u'广告'
        ordering = ['order']
