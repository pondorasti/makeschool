"""Exercise 2: Step Over, Step Into, Step Out"""

def calculate_sum(list_of_nums):
    """Calculates the sum of a list of numbers."""
    total = 0
    for num in list_of_nums:
        total += num

    return total

def calculate_average(list_of_nums):
    """Calculates the average of a list of numbers."""
    average = calculate_sum(list_of_nums) / len(list_of_nums)
    return average

if __name__ == '__main__':
    # Call calculate_average
    mylist = [2, 7, 3, 5, 11, 9]
    result = calculate_average(mylist)
    print(result)