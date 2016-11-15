# from django import template
# from order.models import Order
# from order.api import get_alipay_form, get_alipay_url_params,get_refund_form
# import logging
# logger = logging.getLogger("django")
# register = template.Library()

# @register.tag('pay')
# def pay(parser, token):
#     order = parser.compile_filter(token.split_contents()[1])
#     button = parser.parse(('endpay',))
#     parser.delete_first_token()
#     return PayForm(order, button)

# @register.tag('payurl')
# def payurl(parser, token):
#     order = parser.compile_filter(token.split_contents()[1])
#     parser.delete_first_token()
#     return PayUrl(order)

# class PayForm(template.Node):
#     def __init__(self, order, button):
#         self.order = order
#         self.button = button

#     def render(self, context):
#         form = get_alipay_form(context['request'], self.order.resolve(context, True))
#         output = ['<form class="repay" action="{0}" target="_blank">'.format(form['action'])]
#         for param in form['params'].items():
#             output.append('<input type="hidden" name="%s" value="%s">' % param)
#         output.append(self.button.render(context))
#         output.append('</form>')
#         return ''.join(output)

# class PayUrl(template.Node):
#     def __init__(self, order):
#         self.order = order
#     def render(self, context):
#         param = get_alipay_url_params(context[u'request'], self.order.resolve(context, True))
#         return ''.join(param)

# @register.tag('refund')
# def refund(parser, token):
#     order = parser.compile_filter(token.split_contents()[1])
#     button = parser.parse(('endrefund',))
#     parser.delete_first_token()
#     return refundForm(order, button)

# class refundForm(template.Node):
#     def __init__(self, order, button):
#         self.order = order
#         self.button = button
#     def render(self, context):
#         form = get_refund_form(context['request'], self.order.resolve(context, True))
#         output = ['<form class="repay" action="{0}" target="_blank">'.format(form['action'])]
#         for param in form['params'].items():
#             output.append('<input type="hidden" name="%s" value="%s">' % param)
#         output.append(self.button.render(context))
#         output.append('</form>')
#         return ''.join(output)
