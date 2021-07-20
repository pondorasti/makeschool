## Priority Queues & Heaps

### Topics
- [Priority queue] abstract data type, implementations: unsorted list, sorted list, [bucket queue]
- [Heap] data structure, [binary heap] representations: binary tree, array
- [Heap sort], compare to [selection sort], [insertion sort] and [tree sort]

### Resources
- Review Make School's [priority queue and heap slides][heap slides]
- Watch Make School's [heap video lecture]
- Watch HackerRank's [heap video]
- Watch this cute robot [heap sort animation video]
- Play with VisuAlgo's [interactive heap visualization][VisuAlgo heap]
- Read Vaidehi Joshi's [article on heaps and heap sort][BaseCS heaps] with beautiful drawings
- Read CMU's lecture notes on [binary heaps and priority queues][CMU heaps]
- Read about how [sorting algorithms can be generalized with different priority queue implementations][priority queue sorting]

### Challenges
- Implement `BinaryMinHeap` class using dynamic array with the following instance methods using [binary heap starter code]:
    - `is_empty` - check if the heap is empty
    - `size` - return the number of items in the heap
    - `insert(item)` - insert `item` into this heap
    - `get_min` - return the minimum item at the root of the heap
    - `delete_min` - remove and return the minimum item at the root of the heap
    - `replace_min(item)` - remove and return the minimum item, and insert `item` into this heap
    - `_bubble_up(index)` - ensure the heap ordering property is true above `index`, swapping out of order items
    - `_bubble_down(index)` - ensure the heap ordering property is true below `index`, swapping out of order items
- Run `python binaryheap.py` to test `BinaryMinHeap` class instance methods on a small example
- Run `pytest binaryheap_test.py` to run the [binary heap unit tests] and fix any failures
- Implement `heap_sort` algorithm with binary heap (Hint: this is *super* easy)
- Implement `PriorityQueue` class using binary heap with the following instance methods using [priority queue starter code]:
    - `is_empty` - check if the priority queue is empty
    - `length` - return the number of items in the priority queue
    - `enqueue(item, priority)` - insert `item` into the priority queue in order according to `priority`
    - `front` - return the item at the front of the priority queue without removing it, or None
    - `dequeue` - remove and return the item at the front of the priority queue, or raise ValueError
    - `push_pop(item, priority)` - remove and return the item at the front of this priority queue, and insert `item` in order according to `priority`
- Annotate methods with complexity analysis of running time and space (memory)

### Stretch Challenges
- Implement stack with priority queue (Hint: this is simple if you use priority values cleverly)
- Implement double-ended priority queue with binary search tree (allow access to min and max item)
- Create a generic `BinaryHeap` class with an initialization option to choose min or max heap order


[priority queue]: https://en.wikipedia.org/wiki/Priority_queue
[bucket queue]: https://en.wikipedia.org/wiki/Bucket_queue
[heap]: https://en.wikipedia.org/wiki/Heap_(data_structure)
[binary heap]: https://en.wikipedia.org/wiki/Binary_heap
[heap sort]: https://en.wikipedia.org/wiki/Heapsort
[selection sort]: https://en.wikipedia.org/wiki/Selection_sort
[insertion sort]: https://en.wikipedia.org/wiki/Insertion_sort
[tree sort]: https://en.wikipedia.org/wiki/Tree_sort
[priority queue sorting]: https://en.wikipedia.org/wiki/Priority_queue#Equivalence_of_priority_queues_and_sorting_algorithms

[heap slides]: ../Slides/Heaps.pdf
[heap video lecture]: https://www.youtube.com/watch?v=eBGgEEXnbuk
[heap video]: https://www.youtube.com/watch?v=t0Cq6tVNRBA
[heap sort animation video]: https://www.youtube.com/watch?v=H5kAcmGOn4Q
[BaseCS heaps]: https://medium.com/basecs/heapify-all-the-things-with-heap-sort-55ee1c93af82
[CMU heaps]: http://www.cs.cmu.edu/~adamchik/15-121/lectures/Binary%20Heaps/heaps.html
[VisuAlgo heap]: https://visualgo.net/heap

[binary heap starter code]: ../Code/binaryheap.py
[binary heap unit tests]: ../Code/binaryheap_test.py
[priority queue starter code]: ../Code/priorityqueue.py
