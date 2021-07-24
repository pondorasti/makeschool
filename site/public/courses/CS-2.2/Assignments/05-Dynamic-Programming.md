# Homework 5: Dynamic Programming

In this assignment, you'll practice implementing **dynamic programming algorithms**.

| Criteria | Possible |
| :------: | :------: |
| Longest Common Subsequence: Iterative | `10` |
| Knapsack: Recursive | `10` |
| Knapsack: Iterative | `10` |
| Edit Distance: Recursive | `10` |
| Edit Distance: Iterative | `10` |
| **TOTAL** | **`50`** |

## Instructions

Clone the [starter code](https://github.com/Make-School-Labs/CS-2.2-Dynamic-Programming-Starter) and fill out the functions in `challenges.py`.

## Longest Common Subsequence _(10 Points)_

Take a look at the code for the **recursive** version of the **LCS** problem:

```py
class Memoize:
    """Memoize a function by caching its result for each input."""
    def __init__(self, fn):
        self.fn = fn
        self.memo = {}

    def __call__(self, *args):
        if args not in self.memo:
            self.memo[args] = self.fn(*args)
        return self.memo[args]


@Memoize
def lcs(strA, strB):
    """Determine the length of the Longest Common Subsequence of 2 strings."""
    if len(strA) == 0 or len(strB) == 0:
        return 0
    elif strA[-1] == strB[-1]: # if the last characters match
        return 1 + lcs(strA[:-1], strB[:-1])
    else: # if the last characters don't match
        return max(lcs(strA[:-1], strB), lcs(strA, strB[:-1]))
```

**NOTE**: The `Memoize` class is optional here, but will **significantly** speed up the runtime of the `lcs` function, as described in class.

Now, **write the iterative version of the LCS function** using a **Dynamic Programming (DP) table**. If you're having trouble, watch [this video](https://www.youtube.com/watch?v=ASoaQq66foQ) to refresh your memory on the algorithm & intuition.

**TIP**: Make sure to pay careful attention to your array indices - off-by-one errors are common here! It may help to choose an example (as in the video), plot it out on paper, then use that to determine the array indices to use at each point in the algorithm.

```py
def lcs_dp(strA, strB):
    """Determine the length of the Longest Common Subsequence of 2 strings."""
    rows = len(strA) + 1
    cols = len(strB) + 1

    dp_table = [[0 for j in range(cols)] for i in range(rows)]

    # TODO: Fill in the table using a nested for loop.

    return dp_table[rows-1][cols-1]
```

After you finish, try testing your code to verify that it works:

```
$ python3 test_challenges.py
```

**STRETCH CHALLENGE**: Write another function to return the _contents_ of the Longest Common Subsequence, not just its length.

## Knapsack Problem _(20 Points)_

Complete the code for the Knapsack Problem, both the recursive version & DP (iterative) version.

**TIP**: Pay careful attention to the inputs here: Each item in `items` is a tuple of `(name, weight, value)`, e.g. the tuple `('elephant', 500, 2000)` would refer to an elephant which weighs 500 pounds and is worth $2000.

```py
def knapsack(items, capacity):
    """Return the maximum value that can be stored in the knapsack using the
    items given."""
    pass

def knapsack_dp(items, capacity):
    """Return the maximum value that can be stored in the knapsack using the
    items given."""
    rows = len(items) + 1
    cols = capacity + 1
    dp_table = [[0 for j in range(cols)] for i in range(rows)]

    # TODO: Fill in the table using a nested for loop.

    return dp_table[rows-1][cols-1]
```

After you finish, try testing your code to verify that it works:

```
$ python3 test_challenges.py
```

**STRETCH CHALLENGE**: Write another function to return the _contents_ of the Knapsack solution (e.g. a list of all item names included), not just its total value.

## Edit Distance _(20 Points)_

The **Edit Distance** between 2 strings is the number of **edits** it takes to get from one string to the other, where an **edit** is defined as either an **insertion** (add a character), a **deletion** (remove a character), or a **replacement** (replace one character with another).

Watch [this video](https://www.youtube.com/watch?v=MiqoA-yF-0M) on the Edit Distance problem and its DP solution.

Complete the code for the Edit Distance, both the recursive version & DP (iterative) version.

```py
def edit_distance(str1, str2):
    """Compute the Edit Distance between 2 strings."""
    pass

def edit_distance_dp(str1, str2):
    """Compute the Edit Distance between 2 strings."""
    rows = len(str1) + 1
    cols = len(str2) + 1
    dp_table = [[0 for j in range(cols)] for i in range(rows)]

    # TODO: Fill in the table using a nested for loop.

    return dp_table[rows-1][cols-1]
```

After you finish, try testing your code to verify that it works:

```
$ python3 test_challenges.py
```

## Submission

Submit your code repository using [Gradescope](https://gradescope.com).

## Resources

1. [Dynamic Programming](https://www.geeksforgeeks.org/dynamic-programming/)
1. [Longest Common Subsequence](https://www.geeksforgeeks.org/longest-common-subsequence-dp-4/)
1. [Knapsack](https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/)
1. [Edit Distance](https://www.geeksforgeeks.org/edit-distance-dp-5/)