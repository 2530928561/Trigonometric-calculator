import os

from function.abs import my_abs

PI=3.1415926535897932384626433832795028841971

def input_angle(x):
    while x >= 360.0:
        x -= 360.0
    return x * PI / 180.0

# 下面为求sin(x)的值
def my_sin(x):
    x = input_angle(x)
    i = 1
    negation = 1 #取反
    sum_val = 0
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
    return TaylorExpansion


def my_cos(x):
    x = input_angle(x)
    x = (PI / 2) - x
    return my_sin(x)


def my_tan(x):
    x = input_angle(x)
    return my_sin(x) / my_cos(x)


def my_cot(x):
    x = input_angle(x)
    return 1 / my_tan(x)



