# Tree Traversals

## Important Linkes

- [Slides](https://docs.google.com/presentation/d/1tKLQIpPTL9OwZ_DWwlq0pg4Ftym50hDbW-vbgf5TN9k/edit#slide=id.g76f7c9c761_0_148)

## Learning Objectives

By this end of this lesson, students should be able to...

1. Differentiate between depth-first search (DFS) and breadth-first search (BFS)
1. Explain the various types of traversals for DFS and BFS
1. Implement traversal methods on a binary search tree

## Topics
- [Tree traversal]
    - [Depth-first search]: pre-order, post-order, in-order traversal
    - [Breadth-first search]: level-order traversal

## Resources
- Review Make School's [tree traversal slides]
- Watch Make School's [tree traversal video lecture]
- Read Interview Cake's articles on [depth-first search][IC DFS], [breadth-first search][IC BFS], and [binary tree properties][IC binary tree]
- Read Vaidehi Joshi's articles on [depth-first search][BaseCS DFS] and [breadth-first search][BaseCS BFS] with beautiful drawings and excellent analysis
- Watch HackerRank's [trees and binary search tree video][HR trees video] (traversals start at 3:00)
- Watch Harvards's [family trees and binary search tree video][Harvard trees video] and [stack frames video]
- Play with VisuAlgo's [interactive binary search tree visualization][visualgo bst]

## Challenges
- Implement tree traversal methods on the `BinarySearchTree` class using [binary tree starter code]:
    - `_traverse_in_order_recursive` - traverse the tree with recursive in-order traversal (DFS)
    - `_traverse_pre_order_recursive` - traverse the tree with recursive pre-order traversal (DFS)
    - `_traverse_post_order_recursive` - traverse the tree with recursive post-order traversal (DFS)
    - `_traverse_level_order_iterative` - traverse the tree with iterative level-order traversal (BFS)
- Annotate tree traversal methods with complexity analysis of running time and space (memory)
- Run `python binarytree.py` to test `BinarySearchTree` traversal methods on a small example
- Run `pytest binarytree_test.py` to run the [binary tree unit tests] and fix any failures

## Stretch Challenges
- Implement iterative tree traversal methods on the `BinarySearchTree` class (*without using recursion*):
    - `_traverse_in_order_iterative` - traverse the tree with iterative in-order traversal (DFS)
    - `_traverse_pre_order_iterative` - traverse the tree with iterative pre-order traversal (DFS)
    - `_traverse_post_order_iterative` - traverse the tree with iterative post-order traversal (DFS)
- Annotate tree traversal methods with complexity analysis of running time and space (memory)
- Implement `TreeMap` class ([map/dictionary][map] abstract data type implemented with [binary search tree] data structure) with the following properties and instance methods:
    - `__init__` - initialize a new empty tree map structure
    - `size` - property that tracks the number of tree map entries in constant time
    - `keys` - return a list of all keys in the tree map
    - `values` - return a list of all values in the tree map
    - `items` - return a list of all entries (key-value pairs) in the tree map
    - `contains(key)` - return a boolean indicating whether `key` is in the tree map
    - `get(key)` - return the value associated with `key` in the tree map, or raise `KeyError` if not found
    - `set(key, value)` - insert `key` (or update, if already present) with associated `value` in the tree map
    - `delete(key)` - delete `key` and associated value from the tree map, or raise `KeyError` if not found
- Write unit tests to ensure the `TreeMap` class is robust (*hint: these should be very similar to the hash table unit tests*)
    - Include test cases for each class instance method
- Annotate class instance methods with complexity analysis of running time and space (memory)
- Compare the behaviors of your `TreeMap` class to those of the `HashTable` class and the [Python `dict` type]

## TT - Tree Traversals (20 min)

![tree-traversals](./assets/tree-traversals.png)

See [tree traversal slides]

- What if you wanted to have a tree give all of its elements, instead of just one in particular?
- The goal of a traversal is to **visit** each node once and only once. Whatever action you do on a visit is arbitrary.
- You can **traverese either left or right** down sub-trees of a tree
- For convention, we always traverse from left to right
- There are two main ways to traverse: **Depth-first search (DFS) or Breadth-first search (BFS)**
    - DFS visits a child and then descendents - you drill down one side of the tree, gradually making your way from left to right
    - BFS vists across levels - vist all siblings before going deeper into the tree

### DFS

Within DFS we can visit nodes in three different ways:

1. **In-order**
1. **Pre-order**
1. **Post-order**

#### In-order

Make sure everything in the left sub-tree is visited first before the parent, then visit the parent, then visit everything in the right sub-tree. Walk through the traversal on the slides for details

#### Worksheet Part 2

Do the first row of the worksheet for DFS in-order

#### Pre-Order
Same as in-order, but visit first before exploring the left sub-tree. Visit node, explore the left-sub tree as far as you can, visiting each node you get to, and then do the same for the right sub-tree. Walk through the traversal on the slides for details

#### Worksheet Part 2

Fill in second row of the worksheet

#### Post-order

Traverse left sub-tree as far as you can, then the right-subtree as far as you can, and then finally visit the node when you can't traverse further. Walk through the traversal on the slides for details

#### Worksheet Part 2

Fill in third row of the worksheet

### BFS

- Vist from the root down to the leaves, left to right, one horizontal layer/level at a time
- Use a queue that we `enqueue` and `dequeue` to explore nodes

### Worksheet Part 2

Fill in fourth row of the worksheet

## Code Review (80 min)

### Work in groups (30 min)

We’ll begin class today by **code reviewing the binary search tree traversals** (in-order, pre-order, post-order, and level-order).

- Please **update the progress tracker**
-  _Then_ **form groups of 2-3 people** (ideally, with 2 who have implemented the traversals so you can compare solutions)

### Review in front of class (50 min)

We first learned about tree traversals last wednesday. Walk through these traversals using the diagram on the whiteboard to talk through your code

**TIPS**:

- Leaf nodes do have left/right pointers, but there aren't any nodes at the other end of those pointers
- Any time a funciton is called, the entire function body is executed, and then we jump back out to where it the function was originally called, and the code continues to execute from there
- **Function Call Stack:** - a stack built into every programming language with function calls, allows us to write simpler recursive code since the language is keeping track of everything for us

#### In-order traversal - recursive

- Time complexity: `O(n)`, where `n` is the number of nodes
    - We visit each node exactly once, which takes `O(n)`
    - Each line of code will be called once per node
    - Each traversal is called `n` times, and visit is called `n` times, which give us `O(3n) = O(n)`
- Space complexity: `O(log n)` (if balanced) or `O(n)` (if unbalanced), where `n` is the number of nodes
    - If a tree is balanced, we know the height of the tree is `O(log n)`
    - The maximum number of functions on the function call stack is exactly the height of the tree, therefore we know that _the maximum space we would need would be the height of the tree_
    - If the tree is NOT balanced, height could be ~`n` (i.e. if the tree is all leaning to one side)


#### Level-order traversal - iterative

- Time complexity: `O(n)`, where `n` is the number of nodes
    - Need to visit all nodes in the tree once, which takes `O(n)`
    - For every node, you're going to visit it once, and enqueue its left/right child once.
        - This is true for leaves as well
- Space complexity: `O(n)`, where `n` is the number of nodes
    - The largest that the queue ever gets is when you've enqued the bottom-most level
    - Each node has at most 2 children
    - Depth of root node is 0 (2^0 nodes)
    - Depth of next level is 1 (2^1 nodes), one after that is 2 (2^2 nodes), etc.
    - Once you're at the bottom most layer, you'll have the heighest number of nodes at that level (2^h), where `h` is the height of the tree
    - We know `h = log(n)` with log base 2.
    - The last level has `(n+1)/2` nodes in a perfectly balanced tree. Since the bottomost will always contain the most, we know this is the largest space we will need, and can simplify  `O((n+1)/2)` to `O(n)`


## Break (10 min)

## Abstract Data Types vs Concrete Data Structures Wrapup (20 min)

### Abstract Data Types

- Collection
    - List
        - Stack
        - Queue
        - Deque
- Map/Dictionary
- Set
    - Multiset
- Priority Queue
    - Queue with VIP list, can cut the line


### Concrete Data Structures

- Linear Structures
    - Array
    - Linked List
- Non-linear structures
    - Hash Table
    - Tree
        - Binary Search Tree
        - Prefix tree/trie
    - Heap
    - Graphs

## Applications of Trees

- Directory/file structures
- Tree can be used to implement a map/dictionary
- Graphics engines
- Phylogenetic trees (biology/bio-tech)
- Parse trees (language you speak)
    - how voice assistants work
    - how calculators work
- If you build your own programming language!
- Image compression
- Quadtrees
- Octrees - used to find spatial data

Trees are everywhere, they may just be invisible :)

## Wrapup

Finish all challenges before we kick off the Call Routing project next class!



[tree traversal]: https://en.wikipedia.org/wiki/Tree_traversal
[depth-first search]: https://en.wikipedia.org/wiki/Depth-first_search
[breadth-first search]: https://en.wikipedia.org/wiki/Breadth-first_search
[binary search tree]: https://en.wikipedia.org/wiki/Binary_search_tree
[map]: https://en.wikipedia.org/wiki/Associative_array
[Python `dict` type]: https://docs.python.org/3/library/stdtypes.html#dict

[tree traversal slides]: ../Slides/TreeTraversals.pdf
[tree traversal video lecture]: https://www.youtube.com/watch?v=Qd8dKFaRu9I
[HR trees video]: https://www.youtube.com/watch?v=oSWTXtMglKE
[HR bst interview problem]: https://www.youtube.com/watch?v=i_Q0v_Ct5lY
[Harvard trees video]: https://www.youtube.com/watch?v=mFptHjTT3l8
[stack frames video]: https://www.youtube.com/watch?v=beqqGIdabrE

[IC BFS]: https://www.interviewcake.com/concept/python/bfs
[IC DFS]: https://www.interviewcake.com/concept/python/dfs
[IC binary tree]: https://www.interviewcake.com/concept/python/binary-tree
[BaseCS DFS]: https://medium.com/basecs/demystifying-depth-first-search-a7c14cccf056
[BaseCS BFS]: https://medium.com/basecs/breaking-down-breadth-first-search-cebe696709d9
[visualgo bst]: https://visualgo.net/bst

[binary tree starter code]: ../Code/binarytree.py
[binary tree unit tests]: ../Code/binarytree_test.py
