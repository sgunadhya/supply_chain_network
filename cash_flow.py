from collections import namedtuple
from scipy.optimize import newton

Flow = namedtuple('Flow', ['period','positive', 'negative'])


def netflow(flow):
    return sum(flow.positive) - sum(flow.negative)

def present_value(flow, rate):
    return netflow(flow)/((1 + rate)**flow.period)

def net_present_value(rate,flows):
    return sum(present_value(flow, rate) for flow in flows)

def irr(flows):
    return newton(net_present_value, 0.1, args=(flows,))

def payback(flows):
    to_give = abs(sum(netflow(flow) for flow in flows[:-1]))/netflow(flows[-1])
    return flows[-1].period - 1 + to_give
