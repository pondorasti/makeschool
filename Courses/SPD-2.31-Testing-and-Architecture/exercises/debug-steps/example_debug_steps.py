def find_largest_number(list_of_nums):
    """
    Use this as an example of how to work through the steps in the lesson.
    """
    largest_num = list_of_nums[0]

    for num in list_of_nums:

        if num > largest_num:
            largest_num = num
    return largest_num


if __name__ == '__main__':
    print('### Example ###')
    answer = find_largest_number([3, 2, 1, 5, 4])
    print(answer) # should print 5
