"""
Example Program

Use this as an example of how to work through the steps in the lesson.
"""

# PART 1: Gather Information
#
# Here is the stack trace we get from running the program:
# Traceback (most recent call last):
#   File "main.py", line 23, in <module>
#     answer = find_largest_number([3, 2, 1, 5, 4])
#   File "main.py", line 18, in find_largest_number
#     if list_of_nums[i] > largest_num:
# IndexError: list index out of range
# 
# According to the stack trace, there is an IndexError on line 18. That must mean that the variable 
# i is outside of the bounds of the list. That means we need to find out why i has a value that's
# greater than or equal to the length of the list.


# PART 2: State Assumptions

# "The first thing we do is set largest_num to the first element of the list. Is that actually what 
# happens? Let's insert a print statement and find out... Yep, largest_num gets set to 3."
#
# "Next, we loop over each number in list_of_nums and set its index to the variable i. Is that 
# actually true? Let's insert a print statement and find out... Nope, i is actually set to the 
# _value_ at each index. OK, that must be what is causing the bug."
#
# ... continue on until you've verified that you found the cause of the bug and fixed it ...

def find_largest_number(list_of_nums):
    largest_num = list_of_nums[0]
    for i in list_of_nums:
        if list_of_nums[i] > largest_num:
            largest_num = list_of_nums[i]
    return largest_num


if __name__ == '__main__':
    print('### Example ###')
    answer = find_largest_number([3, 2, 1, 5, 4])
    print(answer) # should print 5