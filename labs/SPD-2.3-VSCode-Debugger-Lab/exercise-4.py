"""Exercise 4: Use the Call Stack"""

def fibonacci(n):
    """Calculates the fibonacci number of n."""
    # Base case
    if n <= 0:
        return 0
    elif n == 1:
        return 1

    # Recursive case
    return fibonacci(n-1) + fibonacci(n-2)


if __name__ == '__main__':
    result = fibonacci(6)
    print(result)