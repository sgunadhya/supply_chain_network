from collections import namedtuple
Info = namedtuple('Info',['start_inventory','end_inventory',
                          'start_receivable', 'end_receivable',
                          'start_payable', 'end_payable',
                          'cogs','sales'])

def dio(info):
    average_inventory = 0.5*(info.start_inventory + info.end_inventory)
    return (average_inventory/info.cogs)*365

def dpo(info):
    average_payable = 0.5*(info.start_payable + info.end_payable)
    return (average_payable/info.cogs)*365

def dso(info):
    average_receivable = 0.5*(info.start_receivable + info.end_receivable)
    return (average_receivable/info.sales)*365

def cash_to_cash(info):
    return dio(info) + dso(info) - dpo(info)

