# Adapted from a Java code in the "Refactoring" book by Martin Fowler.
# Replace nested conditional with guard clases.
ADJ_FACTOR = 0.7
def get_adjusted_capital(capital, rate, duration, income):
    result = 0
    if (capital > 0):
        if (rate > 0 and duration > 0):
            result = (income / duration) * ADJ_FACTOR
    
    return result

adjusted_capital = get_adjusted_capital(50000, 4,10, 10000)
print(adjusted_capital)