"""
Exercise 4

PART 1: Gather Information
Gather information about the source of the error and paste your findings here. E.g.:
- What is the expected vs. the actual output?
- What error message (if any) is there?
- What line number is causing the error?
- What can you deduce about the cause of the error?


PART 2: State Assumptions
State your assumptions here or say them out loud to your partner ...
Make sure to be SPECIFIC about what each of your assumptions is!
HINT: It may help to draw a picture to clarify what your assumptions are.

Answer:
First Error: IndentationError: unindent does not match any outer indentation level. - Fix by aligning indentation of docstrings and code in function

Second Error: RecursionError: maximum recursion depth exceeded in comparison, infinite recursion, can be fixed in decrementing mid by 1 in the elif and incrementing mid by 1 else conditions:
    elif arr[mid] > element:
        return binary_search(arr, element, low, mid-1)

    else:
        return binary_search(arr, element, mid+1, high)
"""

def binary_search(arr, element, low=0, high=None):
    """Returns the index of the given element within the array by performing a binary search."""
    if high == None:
        high = len(arr) - 1

    if high < low:
        return -1

    mid = (high + low) // 2

    if arr[mid] == element:
        return mid

    elif arr[mid] > element:
        return binary_search(arr, element, low, mid-1)

    else:
        return binary_search(arr, element, mid+1, high)


if __name__ == '__main__':
    answer = binary_search([1, 2, 4, 5, 7], 7)
    print(answer)
