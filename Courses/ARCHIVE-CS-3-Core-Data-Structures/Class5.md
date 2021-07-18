## Class 5: Lists, Stacks & Queues

### Topics
- Compare [abstract data types] and [concrete data structures][data structures]
- Abstract data types: [list], [stack], [queue], [deque (double-ended queue)][deque]
- Concrete data structures: [array], [dynamic array (resizable array, vector)][dynamic array], [linked list]

### Resources
- Review Make School's [stack and queue slides]
- Watch Make School's [stack and queue video lecture]
- Read Vaidehi Joshi's [articles on stacks][BaseCS stack] and [queues][BaseCS queue] with beautiful drawings and excellent examples
- Watch HackerRank's [stack and queue video]
- Watch Harvard's [stack video] and [queue video]
- Play with VisuAlgo's [interactive stack and queue visualization][visualgo list]

### Challenges
- Implement `LinkedStack` class (stack with linked list) and `ArrayStack` class (stack with dynamic array) using [stack starter code]:
    - Implement `is_empty` - check if the stack is empty
    - Implement `length` - return the number of items in the stack
    - Implement `push(item)` - insert `item` on the top of the stack
    - Implement `peek` - return the item on the top of the stack
    - Implement `pop` - remove and return the item on the top of the stack
    - Run `pytest stack_test.py` to run the [stack unit tests] and fix any failures
- Annotate `push` and `pop` methods with running time complexity analysis
- Implement `LinkedQueue` class (queue with linked list) and `ArrayQueue` class (queue with dynamic array) using [queue starter code]:
    - Implement `is_empty` - check if the queue is empty
    - Implement `length` - return the number of items in the queue
    - Implement `enqueue(item)` - insert `item` at the back of the queue
    - Implement `front` - return the item at the front of the queue
    - Implement `dequeue` - remove and return the item at the front of the queue
    - Run `pytest queue_test.py` to run the [queue unit tests] and fix any failures
- Annotate `enqueue` and `dequeue` methods with running time complexity analysis

### Stretch Challenges
- Implement `Deque` class (double-ended queue) with doubly linked list or dynamic array (your choice):
    - Implement `is_empty` - check if the deque is empty
    - Implement `length` - return the number of items in the deque
    - Implement `push_front(item)` - insert `item` at the front of the deque
    - Implement `push_back(item)` - insert `item` at the back of the deque
    - Implement `front` - return the item at the front of the deque
    - Implement `back` - return the item at the back of the deque
    - Implement `pop_front` - remove and return the item at the front of the deque
    - Implement `pop_back` - remove and return the item at the back of the deque
- Write unit tests for to ensure the `Deque` class is robust
    - Include test cases for each class instance method
- Annotate `push_front`, `push_back`, `pop_front`, and `pop_back` methods with running time complexity analysis


[abstract data types]: https://en.wikipedia.org/wiki/Abstract_data_type
[data structures]: https://en.wikipedia.org/wiki/Data_structure
[list]: https://en.wikipedia.org/wiki/List_(abstract_data_type)
[stack]: https://en.wikipedia.org/wiki/Stack_(abstract_data_type)
[queue]: https://en.wikipedia.org/wiki/Queue_(abstract_data_type)
[deque]: https://en.wikipedia.org/wiki/Double-ended_queue
[array]: https://en.wikipedia.org/wiki/Array_data_structure
[dynamic array]: https://en.wikipedia.org/wiki/Dynamic_array
[linked list]: https://en.wikipedia.org/wiki/Linked_list

[stack and queue slides]: slides/StacksQueues.pdf
[stack and queue video lecture]: https://www.youtube.com/watch?v=AXWnk4gege4
[stack and queue video]: https://www.youtube.com/watch?v=wjI1WNcIntg
[stack video]: https://www.youtube.com/watch?v=9Tp8wHD66lw
[queue video]: https://www.youtube.com/watch?v=10jRKWI9s1k

[BaseCS stack]: https://medium.com/basecs/stacks-and-overflows-dbcf7854dc67
[BaseCS queue]: https://medium.com/basecs/to-queue-or-not-to-queue-2653bcde5b04
[visualgo list]: https://visualgo.net/list

[stack starter code]: source/stack.py
[stack unit tests]: source/stack_test.py
[queue starter code]: source/queue.py
[queue unit tests]: source/queue_test.py
