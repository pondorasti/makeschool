## Prefix Trees (aka Tries)

### Topics
- [*M*-ary tree (aka *k*-way tree)][m-ary tree]
- [Prefix tree (aka trie, digital tree)][trie]
- [Radix tree (aka radix trie, compact prefix tree)][radix tree]

## Slides

Slides can be found [here](https://docs.google.com/presentation/d/1oWa6cfOwp9ZcBYPANbxouEZ13ksg2uBFQvkbWQ9wRpY/edit#slide=id.ga2a904a8c6_0_63)

### Resources
- Read Vaidehi Joshi's [BaseCS trie article] with beautiful drawings
- Read Julia Geist's [trie article] and [trie slides] with animations and code samples
- Play with USF's [interactive trie animations][USF trie]

### Challenges
- Implement `PrefixTreeNode` class with the following properties and instance methods using [prefix tree node starter code]:
    - `character` - character (string with length `1`) that this node represents
    - `children` - this node's children nodes (`list` or `dict` data structure, see notes about `CHILDREN_TYPE` property above `__init__` method)
    - `terminal` - marks if this node terminates a string in the prefix tree
    - `is_terminal()` - return `True` if this node terminates a string in the prefix tree
    - `num_children()` - return the number of children nodes this node has
    - `has_child(character)` - return `True` if this node has a child node that represents the given `character` amongst its children
    - `get_child(character)` - return this node's child node that represents the given `character` if it is amongst its children, or raise `ValueError` if not
    - `add_child(character, child_node)` - add the given `character` and `child_node` as a child of this node, or raise `ValueError` if given `character` is amongst this node's children
- Run `pytest prefixtreenode_test.py` to run the [prefix tree node unit tests] and fix any failures
- Implement `PrefixTree` class (using `PrefixTreeNode` objects) with the following properties and instance methods using [prefix tree starter code]:
    - `root` - this prefix tree's root node (always exists, even if the tree is empty)
    - `size` - tracks the number of strings in this prefix tree in constant time
    - `is_empty()` - return `True` if this prefix tree is empty (contains no strings)
    - `contains(string)` - return `True` if this prefix tree contains the given `string`
    - `insert(string)` - insert the given `string` into this prefix tree
    - `complete(prefix)` - return a `list` of all strings stored in this prefix tree that start with the given `prefix` string
    - `strings()` - return a `list` of all strings stored in this prefix tree
- To simplify the `contains`, `insert`, `complete`, and `strings` methods with code reuse, implement the following prefix tree search and traversal helper methods:
    - `_find_node(string)` - return a pair containing the deepest node in this prefix tree that matches the longest prefix of the given `string` and the node's depth.
    The depth returned is equal to the number of prefix characters matched. Search is done iteratively with a loop starting from the root node.
    - `_traverse(node, prefix, visit)` - traverse this prefix tree with recursive depth-first traversal.
    Start at the given `node` with the given `prefix` representing its path in this prefix tree and visit each node with the given `visit` function.
- Run `python prefixtree.py` to test `PrefixTree` class instance methods on a small example tongue-twister with similar words
- Run `pytest prefixtree_test.py` to run the [prefix tree unit tests] and fix any failures
- Write additional unit tests for the `PrefixTree` class to ensure operations are correct
- Annotate class instance methods with complexity analysis of running time

### Stretch Challenges
- Implement this additional `PrefixTree` class instance method:
    - `delete(string)` - remove `string` from this prefix tree, if present, or else raise `ValueError`
- Write additional unit tests for the `PrefixTree` class, including several test cases for the `delete` instance method to ensure each case the operation should handle is correct
- Implement a [radix tree (radix trie, compact prefix tree)][radix tree] - "a space-optimized trie (prefix tree) in which each node that is the only child is merged with its parent"


[m-ary tree]: https://en.wikipedia.org/wiki/M-ary_tree
[trie]: https://en.wikipedia.org/wiki/Trie
[radix tree]: https://en.wikipedia.org/wiki/Radix_tree

[trie slides]: https://docs.google.com/presentation/d/11LDrlureRaXyg6ZfjgJvdMZohLfk-0JYuB1RW2xVZDE/edit
[trie article]: https://medium.freecodecamp.org/trie-prefix-tree-algorithm-ee7ab3fe3413
[Julia trie article]: http://juliageist.com/blog/algorithms-and-data-structures/trie-prefix-tree/
[BaseCS trie article]: https://medium.com/basecs/trying-to-understand-tries-3ec6bede0014
[USF trie]: https://www.cs.usfca.edu/~galles/visualization/Trie.html

[prefix tree node starter code]: ../Code/prefixtreenode.py
[prefix tree node unit tests]: ../Code/prefixtreenode_test.py
[prefix tree starter code]: ../Code/prefixtree.py
[prefix tree unit tests]: ../Code/prefixtree_test.py
