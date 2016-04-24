from django import template
from order.models import Order
from order.api import get_alipay_form, get_alipay_url_params

register = template.Library()

@register.tag('pay')
def pay(parser, token):
    order = parser.compile_filter(token.split_contents()[1])
    button = parser.parse(('endpay',))
    parser.delete_first_token()
    return PayForm(order, button)

@register.tag('payurl')
def payurl(parser, token):
    order = parser.compile_filter(token.split_contents()[1])
    parser.delete_first_token()
    return PayUrl(order)

class PayForm(template.Node):
    def __init__(self, order, button):
        self.order = order
        self.button = button

    def render(self, context):
        form = get_alipay_form(context['request'], self.order.resolve(context, True))
        output = ['<form class="repay" action="{0}" target="_blank">'.format(form['action'])]
        for param in form['params'].items():
            output.append('<input type="hidden" name="{0}" value="{1}">'.format(param))
        output.append(self.button.render(context))
        output.append('</form>')
        return ''.join(output)

class PayUrl(template.Node):
    def __init__(self, order):
        self.order = order
    def render(self, context):
        param = get_alipay_url_params(context[u'request'], self.order.resolve(context, True))
        return ''.join(param)
