# Trees & Binary Search Trees

## Important Links

- [Slides](https://docs.google.com/presentation/d/1tKLQIpPTL9OwZ_DWwlq0pg4Ftym50hDbW-vbgf5TN9k/edit#slide=id.g845aebbd8a_0_324)
- [Starter Code](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/tree/master/Code/trees)
- [Rubrics](https://drive.google.com/file/d/1QMm-cc0jieP-sLXOsXGxNPupz5FYYP0C/view)



## Learning Objectives (5 min)

By this end of this lesson, students should be able to...

1. Explain a basic tree data structure and what the use cases for one are
1. Implement a binary search tree

## Topics
- [Tree] data structure, [terminology]
- [Binary search tree], [operations]

## Resources
- Review Make School's [trees slides]
- Watch Make School's [trees video lecture]
- Read Interview Cake's articles on [logarithms and binary search][IC logarithms] and [binary tree properties][IC binary tree]
- Read Vaidehi Joshi's articles on [trees and their properties][BaseCS trees] and [binary search trees][BaseCS binary trees] with beautiful drawings
- Watch HackerRank's [trees and binary search tree video][HR trees video] (up to 3:00)
- Watch Harvards's [family trees and binary search tree video][Harvard trees video] and [stack frames video]
- Play with VisuAlgo's [interactive binary search tree visualization][visualgo bst]

## Challenges
- Implement `BinaryTreeNode` class with the following properties and instance methods using [binary tree starter code]:
    - `data` - the node's data element
    - `left` - the node's left child, or `None` (if it does not exist)
    - `right` - the node's right child, or `None` (if it does not exist)
    - `is_leaf` - check if the node is a leaf (an external node that has no children)
    - `is_branch` - check if the node is a branch (an internal node that has at least one child)
    - `height` - return the node's height (the number of edges on the longest downward path from the node to a descendant leaf node)
- Implement `BinarySearchTree` class (using `BinaryTreeNode` objects) with the following properties and instance methods using [binary tree starter code]:
    - `root` - the tree's root node, or `None` (if the tree is empty)
    - `size` - property that tracks the number of nodes in constant time
    - `is_empty` - check if the tree is empty (has no nodes)
    - `height` - return the tree's height (the number of edges on the longest downward path from the tree's root node to a descendant leaf node)
    - `contains(item)` - return a boolean indicating whether `item` is present in the tree
    - `search(item)` - return an item in the tree matching the given `item`, or `None` if not found
    - `insert(item)` - insert the given `item` in order into the tree
- To simplify the `contains`, `search`, and `insert` methods with code reuse, implement iterative and recursive tree search helper methods:
    - `_find_node_iterative(item)` - return the node containing `item` in the tree, or `None` if not found
    - `_find_node_recursive(item)` - return the node containing `item` in the tree, or `None` if not found
    - `_find_parent_node_iterative(item)` - return the parent of the node containing `item` (or the parent of where `item` would be if inserted) in the tree, or `None` if the tree is empty or has only a root node
    - `_find_parent_node_recursive(item)` - return the parent of the node containing `item` (or the parent of where `item` would be if inserted) in the tree, or `None` if the tree is empty or has only a root node
- Run `python binarytree.py` to test `BinarySearchTree` class instance methods on a small example
- Run `pytest binarytree_test.py` to run the [binary tree unit tests] and fix any failures
- Write additional unit tests for the `BinaryTreeNode` and `BinarySearchTree` classes
    - Add to existing test cases to ensure the `size` property is correct
    - Include test cases for the `height` instance method on both classes
- Annotate class instance methods with complexity analysis of running time

## Stretch Challenges
- Implement this additional `BinarySearchTree` class instance method:
    - `delete(item)` - remove `item` from the tree, if present, or else raise `ValueError` (*hint: break this down into cases based on how many children the node containing `item` has and implement helper methods for subtasks of the more complex cases*)
- Write additional unit tests for the `BinarySearchTree` class
    - Include several test cases for the `delete` instance method covering each case handled by the algorithm
- Implement binary search tree with singly linked list nodes (having only one link to another node) instead of binary tree nodes (having two links to other nodes)

## Trees & Binary Search Trees
- Plan your solution to this [Problem](https://docs.google.com/document/d/1Zubz61IgpVddClWwnyauiFwANXn_xOoLDuK5hMbZRjw/preview): A web application needs to redact some words.  Write a function that takes two arrays of words (strings), and returns a new array of words in the first array (the text) that are not in the second array (the redacted words).

### Tree Vocabulary

- Note: We will focus on binary search trees for the next several courses. In future classes we will look at many other trees and graphs.

- [Insert Tree Image from Slides]
- A *Tree* is a set of nodes and edges. Just like a linked list we have nodes and edges.  A tree is just a LinkedList with two pointers.
- A *Node* stores a data element.
- An *Edge*  connects two nodes and is like a link in a LinkedList.

### Examples of trees
 - [Insert diagram]
- *Parent* : a node with an edge to another node.
- *Child* : a node with an edge from another node.
- *Root* : the parent of all nodes.
- *Binary Tree* : tree in which each node has at most two children
-
### Tree Vocabulary
- Find the following attributes in the tree diagram.
[INSERT TREE DIAGRAM]
- root:unique topmost node of tree that can reach all other nodes
- parent -> child:
- descendant:node reachable from parent to child, grandchild, etc.
- ancestor: node reachable from child to parent, grandparent
- leaf / external node: node without any children
- branch / internal node: node with at least one child
- size: number of nodes in the tree
- height (tree): number of edges on longest downward path from root to leaf.
- height(node) number of edges on the longest downward path from node to leaf.
- depth(node) number of edges between the node and the root.
- level(node) 1+number of edges between the node and the root.
- complete tree : every level (except maybe the last) is completely filled and nodes on the last level are as far left as possible.   
- perfect tree: every level is completely filled.
- balanced tree: all leaves are at a minimum possible depth.  This matters a lot for runtime - better runtime on balanced trees.


### Binary Search Tree: always sorted, for each node left children are smaller, right children are larger.  No duplicate keys (usually)
 - [INSERT diagram of BST] - the root splits the tree into sub trees that also follow all the rules.
    - _Think about it_  Does the structure of the tree depend on the order that they are entered?
        - Without auto balancing, the root node is always the first item inserted.
 - BST is good for the following:
    - fast search, insertion, deletion - especially if it is balance.
    - sort as you go instead of all at once.
    - fairly simple implementation for good performance (when balanced)
    - only allocates memory as it's needed.  Doesn't have to reallocate memory

- Note: When discussing time and space complexity of algorithms, `log n` usually means `log base 2 n` ( but the 2 is sometimes left off).
    - Recall the binary logarithm formula is the power by which 2 must be raised by to obtain n. See [trees slides]


- Why is `log n` really fast?
    - Imagine a BST with `2^32` nodes = (4.29 billion). This is a REALLY big number but can be represented by a tree that is only 32 levels deep.  So a search will only visit a maximum of 32 nodes to find the node containing the data we're looking for (assuming perfectly balanced).

- Insertion - see [trees slides]

- Deletion - see [trees slides]


## Update Tracker (5 min)

Attendance, challenges, etc.

## Code Review (45 min)

- Those who have completed challenges, review
- Those who haven't work in pairs on the challenges
- After you review the `BinaryTreeNode` challenges, make sure to review the `contains` and `search` challenges for `BinarySearchTree`

**SUGGESTION** - this was really long, and had no come together moment, what was the point of this? what did they learn from this? Maybe have someone whiteboard their solution to one of the challenges?

## Break (5 min)

## Tree and Tree Traversals Worksheet - Part 1 (20 min)

**Goal:** how does this search work in english/pseudocode and not just in the constructs of code.

Close computers and fill out the [Trees and Tree Traversals worksheet](https://make.sc/trees-worksheet)

**TIPS**

- Read the instructions carefully: if it's underlined, that means it's _really important_
- Part 2 will be covered later, don't work on that right now
- Should not need helper functions, `search` requires only one pseudocode function
- `Search` should return the value found or `none` if it can't find the value

Once you've finished Part 1 of the worksheet, work in groups of 2-3 and discuss your work. Swap pseudocode with each other and see if it works.

After the discussion, talk with your partner/group about what changes would you need to make to your `search` pseudocode in order to _insert_ a new element into your tree?

## TT - Search/Insertion/Deletion for Trees/Binary Search Trees (20 min)

See [trees slides] from `SEARCH` through `TWO CHILDREN`

**Note:** It is possible to have duplicates in a tree, but make sure to have conventions for it (i.e. equal values always go to the left side)

Deletion has 3 distinct cases on how to approach it once you find the value you're searching for:

1. No children
1. One child
1. Two children

**No children:** cut it off from it's parent, and you're done

**One child:** You'll need to rearrange some pointers. For the node `n` that you're deleting, have its parent point to `n`'s child, which will cut out `n` from the tree

- similar to deleting in a linked list: we need to know the previous value, and then rewrite the links to avoid the value we're deleting

**Two children:** moving values to maintain balance/sorted order within the tree. This may even mean pulling up a new root from one of the child nodes in order to maintain balance and sorting

- Remember binary trees are always sorted: smaller on the left, larger on the right

Insertion and deletion both require first searching through the tree to find where to insert or delete the item. Discuss what the runtime is for search/insertion/deletion with a partner. Remember that all discussion and notes below are under the assumption that the tree is **balanced**

- Searching for an item: **`O(log n)`, where `n` is the number of nodes in the tree.** We're only looking through half the tree since we can always ignore the right or left sub-tree
- Height of tree is also `log n`. We can call height `h`
- `n = 2^(h+1) - 1 = 2^(h)`. At each level, you add twice as many nodes each time
- Insertion and deletion are also `O(log n)` if balanced. But what if it's not balanced?
- In a poorly balanced tree, runtime will trend towards `O(n)`


[tree]: https://en.wikipedia.org/wiki/Tree_(data_structure)
[terminology]: https://en.wikipedia.org/wiki/Tree_(data_structure)#Terminology_used_in_trees
[binary search tree]: https://en.wikipedia.org/wiki/Binary_search_tree
[operations]: https://en.wikipedia.org/wiki/Binary_search_tree#Operations

[trees slides]: ../Slides/Trees.pdf
[trees video lecture]: https://www.youtube.com/watch?v=Yr3y78d2KYI
[HR trees video]: https://www.youtube.com/watch?v=oSWTXtMglKE
[HR bst interview problem]: https://www.youtube.com/watch?v=i_Q0v_Ct5lY
[Harvard trees video]: https://www.youtube.com/watch?v=mFptHjTT3l8
[stack frames video]: https://www.youtube.com/watch?v=beqqGIdabrE

[IC logarithms]: https://www.interviewcake.com/article/python/logarithms
[IC binary tree]: https://www.interviewcake.com/concept/python/binary-tree
[BaseCS trees]: https://medium.com/basecs/how-to-not-be-stumped-by-trees-5f36208f68a7
[BaseCS binary trees]: https://medium.com/basecs/leaf-it-up-to-binary-trees-11001aaf746d
[Leandro TK trees]: https://medium.freecodecamp.org/all-you-need-to-know-about-tree-data-structures-bceacb85490c
[visualgo bst]: https://visualgo.net/bst

[binary tree starter code]: ../Code/binarytree.py
[binary tree unit tests]: ../Code/binarytree_test.py
