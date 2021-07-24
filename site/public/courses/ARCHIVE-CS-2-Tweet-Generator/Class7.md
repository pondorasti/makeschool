## Class 7: Arrays & Linked Lists

### Activities
- Draw diagram of your Markov chain mental model and related data structures
- Compare and contrast diagram representations and code organization with partners
- Review how to build a Markov chain from text and generate sentences from it
- Lecture and discussion following [array and linked list slides]
- Act out how dynamic array and linked list data structures and algorithms work

### Objectives
After completing this class session and the associated tutorial challenges, students will be able to ...
- Diagram abstract concepts implemented with nested data structures
- Describe and diagram how arrays and linked lists are stored in memory
- Describe how dynamic arrays automatically resize when more space is needed
- Compare advantages and disadvantages of dynamic arrays with linked lists
- Implement essential linked list class instance methods using node objects

### Resources
- Review Make School's [array and linked list slides]
- Watch Make School's [array and linked list video lecture]
- Watch HackerRank's [linked list video]
- Watch Harvard's [array video], [singly linked list video], and [doubly linked list video]
- Play with VisuAlgo's [interactive linked list visualization][VisuAlgo list]
- Read Wikipedia's [dynamic array article] and [linked list article]

### Challenges
These challenges are the baseline required to complete the project and course.
Be sure to complete these before next class session and before starting on the stretch challenges below.
- [Page 8: Linked List]
    - Implement `LinkedList` class using [linked list starter code] with these instance methods:
        - `length()` - return the length of the linked list by traversing its nodes
        - `append(item)` - insert `item` at the tail of the linked list
        - `prepend(item)` - insert `item` at the head of the linked list
        - `find(quality)` - return an item from the linked list satisfying the `quality` function
        - `delete(item)` - remove `item` from the linked list, or raise `ValueError` if not found
    - Run `python linkedlist.py` to test `LinkedList` class instance methods on a small example
    - Run `pytest linkedlist_test.py` to run the [linked list unit tests] and fix any failures

### Stretch Challenges
These challenges are more difficult and help you push your skills and understanding to the next level.
- [Page 8: Linked List]
    - Implement `replace(old_item, new_item)` - replaces `old_item` in the list with `new_item` without creating a new node
    - Want to make the `LinkedList` class more convenient to use? Add methods so that it can be used as an [iterable container], such as in a `for` loop
    - Consider an alternative approach to calculate the `length` of the linked list that doesn't require node traversal and implement it, then benchmark its running time against the first approach on short lists and long lists
    - Read about the [doubly linked list] structure and implement it in your own `DoublyLinkedList` class. What advantages and disadvantages does this structure have over a [singly linked list][linked list article]?


[array and linked list slides]:slides/ArraysLinkedLists.pdf
[array and linked list video lecture]: https://www.youtube.com/watch?v=3WWuf4H61Nk
[linked list video]: https://www.youtube.com/watch?v=njTh_OwMljA
[array video]: https://www.youtube.com/watch?v=7EdaoE46BTI
[singly linked list video]: https://www.youtube.com/watch?v=ZoG2hOIoTnA
[doubly linked list video]: https://www.youtube.com/watch?v=HmAEzp1taIE
[dynamic array article]: https://en.wikipedia.org/wiki/Dynamic_array
[linked list article]: https://en.wikipedia.org/wiki/Linked_list
[doubly linked list]: https://en.wikipedia.org/wiki/Doubly_linked_list
[VisuAlgo list]: https://visualgo.net/list

[Page 8: Linked List]: https://www.makeschool.com/academy/tutorial/tweet-generator-data-structures-probability-with-python/linked-list
[iterable container]: https://docs.python.org/3/library/stdtypes.html#typeiter

[linked list starter code]: source/linkedlist.py
[linked list unit tests]: source/linkedlist_test.py
