from django import template
register = template.Library()
@register.filter(name='equipment')
def equipment(value):
    if value:
        mapping ={
            'lock':'车锁',
            'helmet':'头盔',
            'glove':'手套',
            'phoneHolder':'手机支架',
            'kettleHolder':'水壶支架',
            'bag':'梁包',
            'backseat':'后座',
            'stopwatch':'码表',
            'flashlight':'手电',
            'backlight':'尾灯',
            'compass':'指南针'
        }
        values = value.split(',')
        result = []
        for value in values:
             result.append(mapping[value])
        return ','.join(result)
    else :
        return value


