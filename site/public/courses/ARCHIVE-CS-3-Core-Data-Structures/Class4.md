## Class 4: Arrays & Linked Lists

### Topics
- Compare [abstract data types] and [concrete data structures][data structures]
- Abstract data types: [list]
- Concrete data structures: [array], [dynamic array (resizable array, vector)][dynamic array], [linked list]

### Resources
- Review Make School's [array and linked list slides]
- Watch Make School's [array and linked list video lecture]
- Read Vaidehi Joshi's [articles on linked lists, part 1: how they work][BaseCS linked list 1] and [part 2: complexity analysis and comparison to arrays][BaseCS linked list 2] with excellent, beautiful drawings
- Watch HackerRank's [linked list video]
- Watch Harvard's [array video], [singly linked list video], and [doubly linked list video]
- Play with VisuAlgo's [interactive linked list visualization][visualgo list]

### Challenges
- Add new features to `LinkedList` class using [linked list starter code]:
    - Add `size` property that tracks list length in constant running time
    - Implement `get_at_index(index)` - returns the item at `index` in the list
    - Implement `insert_at_index(index, item)` - inserts `item` at `index` (all items after `index` are moved down)
    - Implement `replace(old_item, new_item)` - replaces `old_item` in the list with `new_item` using the same node
    - Run `python linkedlist.py` to test `LinkedList` class instance methods on a small example
    - Run `pytest linkedlist_test.py` to run the [linked list unit tests] and fix any failures
- Annotate methods with complexity analysis of running time and space (memory)

### Stretch Challenges
- Implement `DoublyLinkedList` class with `BinaryNode` objects, which have both `next` and `previous` properties
- Write unit tests for to ensure the `DoublyLinkedList` class is robust
    - Include test cases for each class instance method and property
- Annotate methods with complexity analysis of running time and space (memory)


[abstract data types]: https://en.wikipedia.org/wiki/Abstract_data_type
[data structures]: https://en.wikipedia.org/wiki/Data_structure
[list]: https://en.wikipedia.org/wiki/List_(abstract_data_type)
[array]: https://en.wikipedia.org/wiki/Array_data_structure
[dynamic array]: https://en.wikipedia.org/wiki/Dynamic_array
[linked list]: https://en.wikipedia.org/wiki/Linked_list

[array and linked list slides]: slides/ArraysLinkedLists.pdf
[array and linked list video lecture]: https://www.youtube.com/watch?v=3WWuf4H61Nk
[linked list video]: https://www.youtube.com/watch?v=njTh_OwMljA
[array video]: https://www.youtube.com/watch?v=7EdaoE46BTI
[singly linked list video]: https://www.youtube.com/watch?v=ZoG2hOIoTnA
[doubly linked list video]: https://www.youtube.com/watch?v=HmAEzp1taIE

[BaseCS linked list 1]: https://medium.com/basecs/whats-a-linked-list-anyway-part-1-d8b7e6508b9d
[BaseCS linked list 2]: https://medium.com/basecs/whats-a-linked-list-anyway-part-2-131d96f71996
[visualgo list]: https://visualgo.net/list

[linked list starter code]: source/linkedlist.py
[linked list unit tests]: source/linkedlist_test.py
