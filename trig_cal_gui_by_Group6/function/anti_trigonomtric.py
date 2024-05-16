import os
import sys

PI=3.1415926535897932384626433832795028841971

n = 10

def my_arcsin(x):
    result = 0.0
    for i in range(n + 1):
        result += (factorial(2 * i) / (power(2, 2 * i) * factorial(i) * factorial(i) * (2 * i + 1))) * power(x, 2 * i + 1)
    return result

def my_arccos(x):
    return PI / 2 - my_arcsin(x)

def my_arctan(x):
    result = 0.0
    for i in range(n + 1):
        result += power(-1, i) * power(x, 2 * i + 1) / (2 * i + 1)
    return result

def power(x, n):
    if n == 0:
        return 1.0
    elif n < 0:
        return 1.0 / power(x, -n)
    else:
        return x * power(x, n - 1)
  
def factorial(n):
    if n <= 1:
        return 1.0
    else:
        return n * factorial(n - 1)