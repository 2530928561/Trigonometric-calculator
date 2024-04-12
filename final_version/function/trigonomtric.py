import os

from function.abs import my_abs

PI=3.1415926535897932384626433832795028841971

def input_angle(x):
    while x >= 360.0:
        x -= 360.0
    return x * PI / 180.0

# 下面为求sin(x)的值
def my_sin(x):
    i = 1
    negation = 1 #取反
    # sum_val = 0  进入不了循环
    sum_val = -1
    index = x #指数
    Factorial = 1 #阶乘
    TaylorExpansion = x #泰勒展开式求和
    while my_abs(sum_val) > 1e-15:
        Factorial *= (i + 1) * (i + 2) #求阶乘
        index *= x * x #求x的次方
        negation = -negation #每次循环取反
        sum_val = index / Factorial * negation
        TaylorExpansion += sum_val
        i += 2

    if (TaylorExpansion > 3e-16 and TaylorExpansion < 4e-16):
        return 0.0

    return TaylorExpansion



def my_cos(x):
    x = PI /2.0 - x
    return my_sin(x)


def my_tan(x):
    cos_val = my_cos(x)
    if my_abs(cos_val) < 1e-15:
        return "未定义"  # 当余弦值接近零时，返回 "未定义" 避免除以零错误
    return my_sin(x) / cos_val



def my_cot(x):
    tan_val = my_tan(x)
    if tan_val == "未定义":  # 如果正切值为 "未定义"，则返回 "未定义" 避免除以零错误
        return 0
    return 1 / tan_val




