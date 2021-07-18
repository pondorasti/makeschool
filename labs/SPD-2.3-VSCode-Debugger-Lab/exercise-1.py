"""Exercise 1: Step Through Code"""

def calculate_average(list_of_nums):
    """Calculates the average of a list of numbers."""
    total = 0       ### Set a breakpoint here! ###
    for num in list_of_nums:
        total += num

    average = total / len(list_of_nums)
    return average

if __name__ == '__main__':
    # Call calculate_average
    mylist = [2, 7, 3, 5, 11, 9]
    result = calculate_average(mylist)
    print(result)

    # Call calculate_average a second time
    anotherlist = [-2, 5, -3]
    result2 = calculate_average(anotherlist)
    print(result2)