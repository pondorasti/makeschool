# Debugging Steps

## TODO
Using the steps detailed below, complete the exercises:
- [ ] Find Largest Difference [find_largest_diff.py](find_largest_diff.py)
- [ ] Contains 3 Consecutive Numbers [consecutive_numbers.py](consecutive_numbers.py)
- [ ] Insertion Sort [insertion_sort.py](insertion-sort.py)
- [ ] Binary Search [binary_search.py](binary_search.py)

## Part 1: Gather Information

For each of the exercises, run the code and based on the output, **gather as much information as you can** about the potential source(s) of error. 

Consider the following:
- What is the expected vs. the actual output?
- What error message (if any) is there?
- What line number is causing the error?
- What can you deduce about the cause of the error?

**You don't actually need to find and fix the error yet!** We'll do that in the next step.

## Part 2: State Assumptions

- Next, read over the code line-by-line with a partner. 
- For each line of code, **state any assumptions you have** about how the code behaves. 
  - E.g. "the `i` variable is set to the index of the next element." 
- For each assumption, **add a print statement** to the code to verify that your assumption is accurate. 
  - E.g. you can print out the `i` variable and check its value(s) against what you expect.

## Example 
Review the process in the example below

### Part 1: Gather Information
- Running **[debug_steps_example.py](debug_steps_example.py)**, we get this output:
   ```
    Traceback (most recent call last):
      File "debug_steps_example.py", line 14, in <module>
        answer = find_largest_number([3, 2, 1, 5, 4])
      File "debug_steps_example.py", line 7, in find_largest_number
        if list_of_nums[i] > largest_num:
    IndexError: list index out of range
    ```

- According to the stack trace, there is an `IndexError` on `line 7`. 
- That must mean that the variable `i` is outside of the bounds of the list. 
- So, we need to find out why `i` has a value that's `greater than or equal to` the `length` of the list.

### Part 2: State Assumptions

- Line 1:
    ```python
    def find_largest_number(list_of_nums):
        largest_num = list_of_nums[0] # the first thing we do is set largest_num to the first element of the list. 
        # Is that actually what happens? 
        # Let's insert a print statement and find out... 

        print(largest_num) # Yep, `largest_num` gets set to `3`

        for i in list_of_nums:
            if list_of_nums[i] > largest_num:
                largest_num = list_of_nums[i]
        return largest_num
    ```

- Line 2:
    ```python
    def find_largest_number(list_of_nums):
        largest_num = list_of_nums[0]  

        for i in list_of_nums: # Next, we loop through `list_of_nums` and set its index to the variable i. 
            # Wait, is that actually true? Let's insert a print statement and find out...
            print(i) # Nope! i is actually set to the _value_ at each index. I should change this variable into something clearer..
            if list_of_nums[i] > largest_num:
                largest_num = list_of_nums[i]
        return largest_num
    ```

- Line 3:
    ```python
    def find_largest_number(list_of_nums):
        largest_num = list_of_nums[0]  

        for num in list_of_nums: 
            # after changing the variable i to num, 
            # it is more clear that the function should have been comparing num to largest_num
            # instead of using the value as the index
            if num > largest_num:
                largest_num = num
        return largest_num
    ```
- Continue on until you've verified that you found the cause of the bug and fixed it
