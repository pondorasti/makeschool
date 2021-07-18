# Homework 3: Graph Applications

In this assignment, you'll continue to practice graph traversals using the algorithms we've studied so far.

You will need to complete **3 out of 4** of the problems in order to earn full credit. Scoring for this assignment is as follows:

| Criteria | Possible |
| :------: | :------: |
| Problem #1 | `15` |
| Problem #2 | `15` |
| Problem #3 | `15` |
| **TOTAL** | **`45`** |

## Instructions

Create a **new** folder for this assignment - you will be submitting it separately from your code for Homework 1 and 2.

Initialize a Git repository in your project folder, create a repository on [GitHub](https://github.com), and commit and push your work.

Create a file called `challenges.py` which will store your solution code.

## Problem 1: Number of Islands

Write a function, `numIslands`, which takes in a 2D grid map of `1`s (land) and `0`s (water). Your function should return the number of distinct islands in the grid. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

**Example 1:**

```
Input:
11110
11010
11000
00000

Output: 1
```

**Example 2:**

```
Input:
11000
11000
00100
00011

Output: 3
```

Your algorithm should utilize a Breadth-first Search or Depth-first Search approach. You may utilize a helper `Graph` class if you wish.

```py
def numIslands(grid):
    """Take in a grid of 1s (land) and 0s (water) and return the number of islands."""
    pass

# Test Cases
map1 = [
    [1, 1, 1, 1, 0],
    [1, 1, 0, 1, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0]
]
assert numIslands(map1) == 1

map2 = [
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 1, 1]
]
assert numIslands(map2) == 3
```

Text and examples from: LeetCode [Number of Islands](https://leetcode.com/problems/number-of-islands/)


## Problem 2: Rotting Oranges

Write a function, `timeToRot`, which takes in a grid of numbers, each of which is one of the following three values:

- A `0` represents an empty spot;
- A `1` represents a fresh orange;
- A `2` represents a rotten orange.

Every minute, any fresh orange that is adjacent (up, down, left, right) to a rotten orange becomes rotten.

Your function should return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1 instead.

**Example 1:**

```
Input:
2 1 1
1 1 0
0 1 1
Output: 4
```

**Example 2:**

```
Input: 
2 1 1
0 1 1
1 0 1
Output: -1
Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
```

**Example 3:**

```
Input:
0 2
Output: 0
Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
```

Your algorithm should utilize a Breadth-first Search approach. You may utilize a helper `Graph` class if you wish.

```py
def timeToRot(grid):
    """
    Take in a grid of numbers, where 0 is an empty space, 1 is a fresh orange, and 2 is a rotten
    orange. Each minute, a rotten orange contaminates its 4-directional neighbors. Return the number
    of minutes until all oranges rot.
    """
    pass

# Test Cases
oranges1 = [
    [2,1,1],
    [1,1,0],
    [0,1,1]
]
assert timeToRot(oranges1) == 4

oranges2 = [
    [2,1,1],
    [0,1,1],
    [1,0,1]
]
assert timeToRot(oranges2) == -1

oranges3 = [
    [0,2]
]
assert timeToRot(oranges3) == 0
```

Text and examples from: LeetCode [Rotten Oranges](https://leetcode.com/problems/rotting-oranges/)

## Problem 3: Class Scheduling

There are a total of `n` courses you have to take, labeled from `0` to `n-1`.

Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: `[0,1]`

Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.

**Example 1:**

```
Input: 2, [[1,0]] 
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
course 0. So the correct course order is [0,1].
```

**Example 2:**

```
Input: 4, [ [1,0], [2,0], [3,1], [3,2] ]
Output: [0,1,2,3] or [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both     
courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0. 
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
```

Your code should utilize a Topological Sort algorithm. You may utilize a helper `Graph` class if you wish.

```py
def courseOrder(numCourses, prerequisites):
    """Return a course schedule according to the prerequisites provided."""
    pass

# Test Cases
courses1 = [ [1,0] ]
assert courseOrder(2, courses1) == [0, 1]

courses2 = [ [1,0], [2,0], [3,1], [3,2] ]
possibleSchedules = [ [0, 1, 2, 3], [0, 2, 1, 3] ]
assert courseOrder(4, courses2) in possibleSchedules
```

Text and examples from: LeetCode [Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)

## Problem 4: Word Ladder

Write a function that takes in two words (`beginWord` and `endWord`), and a dictionary's word list. A word can be _transformed_ into another word if 1), they differ by only one letter, and 2) the new word exists in the dictionary. 

Return the length of shortest transformation sequence from `beginWord` to `endWord`.

**Example 1:**

```
Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

Output: 5

Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.
```

Your code should utilize a Breadth-first Search approach. You may utilize a helper `Graph` class if you wish.

```py
def wordLadderLength(beginWord, endWord, wordList):
    """Return the length of the shortest word chain from beginWord to endWord, using words from wordList."""
    pass

# Test Cases
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log","cog"]

assert wordLadderLength(beginWord, endWord, wordList) == 5
```

## Submission

Submit your code repository using [Gradescope](https://gradescope.com).

## Resources

1. [Breadth-first Search](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)
1. [Depth-first Search](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)
1. [Topological Sorting](https://www.geeksforgeeks.org/topological-sorting/)