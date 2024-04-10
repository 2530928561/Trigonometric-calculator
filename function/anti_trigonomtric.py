from function.factorial import factorial
from function.power import power

PI=3.1415926535897932384626433832795028841971

n = 10

def my_arcsin(x, n):
    result = 0.0
    for i in range(n + 1):
        result += (factorial(2 * i) / (power(2, 2 * i) * factorial(i) * factorial(i) * (2 * i + 1))) * power(x, 2 * i + 1)
    return result

def my_arccos(x, n):
    return PI / 2 - my_arcsin(x, n)

def my_arctan(x, n):
    result = 0.0
    for i in range(n + 1):
        result += power(-1, i) * power(x, 2 * i + 1) / (2 * i + 1)
    return result
