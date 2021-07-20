"""
Exercise 2

PART 1: Gather Information
Gather information about the source of the error and paste your findings here. E.g.:
- What is the expected vs. the actual output?
- What error message (if any) is there?
- What line number is causing the error?
- What can you deduce about the cause of the error?

PART 2: State Assumptions
State your assumptions here or say them out loud to your partner ...
Make sure to be SPECIFIC about what each of your assumptions is!

Answer:
No error message, but answer 2 returns False when it should return True.  The else statement within the for loop is causing the condition to return False before checking the rest of the list, removing it will fix the issue
"""


def contains_3_consecutive(list_of_nums):
    """Return True if the list contains 3 consecutive numbers each increasing by 1."""
    for i in range(len(list_of_nums) - 2):
        if (list_of_nums[i+1] == list_of_nums[i] + 1 and
            list_of_nums[i+2] == list_of_nums[i] + 2):
            return True

    return False

if __name__ == '__main__':
    print('### Problem 2 ###')
    answer1 = contains_3_consecutive([1, 2, 4])
    print(answer1) # should print False

    answer2 = contains_3_consecutive([4, 1, 2, 3])
    print(answer2) # should print True
