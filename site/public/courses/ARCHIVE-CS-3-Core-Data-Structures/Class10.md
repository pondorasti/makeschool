## Class 10: Tree Traversals

### Topics
- [Tree traversal]
    - [Depth-first search]: pre-order, post-order, in-order traversal
    - [Breadth-first search]: level-order traversal

### Resources
- Review Make School's [tree traversal slides]
- Watch Make School's [tree traversal video lecture]
- Read Interview Cake's articles on [depth-first search][IC DFS], [breadth-first search][IC BFS], and [binary tree properties][IC binary tree]
- Read Vaidehi Joshi's articles on [depth-first search][BaseCS DFS] and [breadth-first search][BaseCS BFS] with beautiful drawings and excellent analysis
- Watch HackerRank's [trees and binary search tree video][HR trees video] (traversals start at 3:00)
- Watch Harvards's [family trees and binary search tree video][Harvard trees video] and [stack frames video]
- Play with VisuAlgo's [interactive binary search tree visualization][visualgo bst]

### Challenges
- Implement tree traversal methods on the `BinarySearchTree` class using [binary tree starter code]:
    - `_traverse_in_order_recursive` - traverse the tree with recursive in-order traversal (DFS)
    - `_traverse_pre_order_recursive` - traverse the tree with recursive pre-order traversal (DFS)
    - `_traverse_post_order_recursive` - traverse the tree with recursive post-order traversal (DFS)
    - `_traverse_level_order_iterative` - traverse the tree with iterative level-order traversal (BFS)
- Annotate tree traversal methods with complexity analysis of running time and space (memory)
- Run `python binarytree.py` to test `BinarySearchTree` traversal methods on a small example
- Run `pytest binarytree_test.py` to run the [binary tree unit tests] and fix any failures

### Stretch Challenges
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


[tree traversal]: https://en.wikipedia.org/wiki/Tree_traversal
[depth-first search]: https://en.wikipedia.org/wiki/Depth-first_search
[breadth-first search]: https://en.wikipedia.org/wiki/Breadth-first_search
[binary search tree]: https://en.wikipedia.org/wiki/Binary_search_tree
[map]: https://en.wikipedia.org/wiki/Associative_array
[Python `dict` type]: https://docs.python.org/3/library/stdtypes.html#dict

[tree traversal slides]: slides/TreeTraversals.pdf
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

[binary tree starter code]: source/binarytree.py
[binary tree unit tests]: source/binarytree_test.py
