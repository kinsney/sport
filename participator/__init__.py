def quantize(price):
    from decimal import Decimal, ROUND_UP
    return Decimal(price).quantize(Decimal('0.01'), rounding=ROUND_UP)
