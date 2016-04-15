from django.core.validators import RegexValidator

class MobileValidator(RegexValidator):
    def __init__(self, message=u'请输入合法的中国大陆手机号', code=None):
        RegexValidator.__init__(self, regex='^1[0-9]{10}$',
            message=message, code=code)
