from urllib.request import urlopen
from urllib.parse import urlencode
from hashlib import md5
from time import time
from order.models import Order
from django.conf import settings
from django.core.urlresolvers import reverse
from datetime import datetime

__all__ = ['get_alipay_form', 'verify_alipay_notify']

ALIPAY_GATEWAY = 'https://mapi.alipay.com/gateway.do'
PARTNER_ID = '2088221603302393'
KEY = 'b220afj6x4k7f3xs1i6e1fk00osnkt6b'
def get_sign(params):
    sign = params.items()
    sign = sorted(sign)
    sign = ('%s=%s' % kv
        for kv in sign
        if len(kv[1]) > 0 and not kv[0] in ('sign', 'sign_type'))
    sign = '&'.join(sign)
    sign = sign.replace('\\', '')
    sign += KEY
    sign = sign.encode('utf-8')
    sign = md5(sign).hexdigest()

    return sign

def get_out_trade_no(order):
    return str(order.number) + '@qikezuche' + datetime.now().strftime('%Y%m%d%H%M%S')

def get_alipay_form(request, order):
    params = {
        "service": "create_direct_pay_by_user",
        "partner": PARTNER_ID,
        "_input_charset": "utf-8",
        "notify_url": settings.SITE_URL + '/order/payed',
        "out_trade_no": get_out_trade_no(order),
        "subject": order.get_title(),
        "payment_type": "1",
        "total_fee": str(order.rentMoney),
        "seller_id": PARTNER_ID,
        "sign_type": 'MD5'
    }

    sign = get_sign(params)

    params['sign'] = sign

    return {
        'action': ALIPAY_GATEWAY + '?_input_charset=utf-8',
        'params': params
    }

def get_alipay_url_params(request, order):
    params = {
        "service": "create_direct_pay_by_user",
        "partner": PARTNER_ID,
        "_input_charset": "utf-8",
        "notify_url": settings.SITE_URL + '/order/payed',
        "out_trade_no": get_out_trade_no(order),
        "subject": order.get_title(),
        "payment_type": "1",
        "total_fee": str(order.rentMoney),
        "seller_id": PARTNER_ID,
        "sign_type": 'MD5'
    }

    sign = get_sign(params)
    params['sign'] = sign
    return urlencode(params)

def verify_alipay_notify(params):
    if params['sign'] != get_sign(params):
        raise ValueError('Invalid Sign')

    verify_url = ALIPAY_GATEWAY + '?' + urlencode({
        'service': 'notify_verify',
        'partner': PARTNER_ID,
        'notify_id': params['notify_id']
    })
    verify = urlopen(verify_url).read().strip()
    if verify != 'true':
        raise ValueError('Invalid Notify')

    order = Order.objects.get(number=params['out_trade_no'].split('@')[0])
    order.payed = params['gmt_payment']
    order.rentMoney = params['total_fee']
    order.save()
