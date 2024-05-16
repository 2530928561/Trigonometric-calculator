def power(x, n):
    if n == 0:
        return 1.0
    elif n < 0:
        return 1.0 / power(x, -n)
    else:
        return x * power(x, n - 1)