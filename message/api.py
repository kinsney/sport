from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseForbidden, Http404, HttpResponseNotFound,QueryDict
import logging
from message.alidayu import AlibabaAliqinFcSmsNumSendRequest

def send(message):
    try:
        req=AlibabaAliqinFcSmsNumSendRequest("23498261","fd8cb91cadf6d4857d048907e41cdf94",'https://eco.taobao.com/router/rest')
        req.extend="123456"
        req.sms_type="normal"
        req.sms_free_sign_name="骑客租车"
        req.sms_param= message.content
        req.rec_num= message.target
        req.sms_template_code= message.template_code
        resp = req.getResponse()
        message.result = resp
    except Exception:
        return HttpResponseForbidden()

