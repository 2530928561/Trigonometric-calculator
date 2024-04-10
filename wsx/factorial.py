def factorial(n):
    if n <= 1:
        return 1.0
    else:
        return n * factorial(n - 1)