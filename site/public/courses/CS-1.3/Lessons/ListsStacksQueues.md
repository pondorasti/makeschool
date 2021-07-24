# Lists, Stacks & Queues

## Important Links
- [Slides](https://docs.google.com/presentation/d/1z51icU9gjESHtyzmBLC2-2thaeLhfQrLdoI9RWUU7WM/edit#slide=id.g8382c44d4e_0_0)
- [Code](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/tree/master/Code/stacks-and-queues)
- [Rubrics](https://drive.google.com/open?id=1QMm-cc0jieP-sLXOsXGxNPupz5FYYP0C)

<!--## Minute-by-Minute [OPTIONAL]

**NOTE: Fill in with the appropriate items**

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |-->

## Learning Objectives (5 min)

By this end of this lesson, students should be able to...

1. Explain the use cases for stacks and queues, and why they may use them over a list
1. Differentiate between arrays and dynamic arrays, and when to use each.

## Topics
- Compare [abstract data types] and [concrete data structures][data structures]
- Abstract data types: [list], [stack], [queue], [deque (double-ended queue)][deque]
- Concrete data structures: [array], [dynamic array (resizable array, vector)][dynamic array], [linked list]

## Resources
- Review Make School's [stack and queue slides]
- Watch Make School's [stack and queue video lecture]
- Read Vaidehi Joshi's [articles on stacks][BaseCS stack] and [queues][BaseCS queue] with beautiful drawings and excellent examples
- Watch HackerRank's [stack and queue video]
- Watch Harvard's [stack video] and [queue video]
- Play with VisuAlgo's [interactive stack and queue visualization][visualgo list]

## Challenges
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

## Stretch Challenges
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

## TT 
Stacks and Queues are abstract data types.  They can be implemented with an array or a linked list.  They share common methods like
- isEmpty
- isFull
- size

### Queue
- A queue is a like a line
    -enqueue : add to front of the List
    -dequeue: remove from end of the list
    -front: view the object at the front
    -FIFO : first in first out
- Real life examples:
    - Priority Queue: covered in CS 2.1

### Stack
- A stack is like a set of plates you add and remove from the top.
    - Push: add an object to the top
    - Pop: remove top items
    - Peek: view object on the top
    - LIFO:
- Real life examples:
    - Function Stack: Function calls go on the stack, popped when the function returns.
    - Stack trace: The call stack being displayed to your terminal.

    
## Activity - Stacks and Queues Worksheet - Overview  (15 min)

[Stacks and Queues Worksheet](https://docs.google.com/document/d/1zRnzN-QCKkejHTEBMzTQhdquY47Cu0JNbTNrliScVnw/edit?usp=sharing)

There are multiple ways we can implement abstract data types such as stacks and queues. Today we're going to go over four implementations each (eight total) for stacks and queues: two using a linked lists, and two using arrays

For each of the eight implementations, we will do the following:

1. Describe how we will implement the three key methods
    - `push`, `peek`, `pop` for stacks
    - `enqueue`, `front`, `dequeue` for queues
1. Provide the runtime for each operation
1. Decide which of the implementations is the best/worst for the abstract data type.
1. Update your code to match the better implementation

We'll fill out the worksheet one section at a time. Once you've completed a section, review with your partner, then go review with someone else in the class.

**The discussion goal** is to get as many opinions as possible on your implementation, and also to give feedback on as many different implementations as possible

**Reminder**: if runtime complexity is similar between implementations, think about **space complexity** when deciding what implementation to go with

- static (array) vs dynamic (linked list) memory space

### Tips

- Review your stacks and queues code from the previous challenge, see if you can find the good and bad decisions with each of the implementations you've already done. 
- Find out what decisions you made when building the functions for stacks and queues, and see if that will help with how you answer the worksheet

## Activity - Stacks and Queues Worksheet - Stack Portion  (30 min)

Take some time to fill in the stack portion of the worksheet. For the linked list section, you can assume we're using only singly linked lists

### Linked Lists

Draw a linked list with 3 nodes (top to bottom) such that top of stack is the head of the list

- Go through run times of each operation

Now draw the same list with the top of the stack at the tail of the list

- Go through the run times of each operation

### Arrays

Draw the array with the top of the stack at index 0
    - Draw array vertically, with the top cell being the top of the stack

**Tips:**

- Depending on the implementation, you may need to shift around items in the array for push and pop. This doesn't come at a "free" cost. Why?
- Arrays have constant time look up
- `Array.pop()` without an index will pop the `n-1` item


Now draw the array with the top of the stack at index n-1
    - Draw array vertically, with the bottom cell being the top of the stack

## TT - Amortization (10 min)

Think about **dynamic arrays** like tables at resturants:

- You have 5 people in your party, so you get seated at a table for 8
    - A dynamic array is similar: it has "extra seats" built in
- But what if you have a 9th person come? How do we append a new item at the end of the array if the array is full?
    - The resturant has to get a whole new 16 person table to accomodate everyone, and then everyone has to move over
    - Dynamic arrays are the same: they need to allocate a whole new, larger array to make this space, and then move all the items over to that larger array
- When the size needs to be increased, it takes `O(n)` time. But this is **a rare occurrence**
    -  This only happens when the array needs to double in size. Going back to the resturant, if you're at a table for 8, and a 9th person shows up, then you need to move to a 16 person table (`O(n)`), _but now you can add person 10-16 without having to change tables_ (`O(1)`)
- Therefore on average, adding items to the array still takes constant time, since the occasional times it takes `O(n)` is outwieghed by all of the times it usually takes `O(1)`
- However, we can't say it's `O(1)` due to the occasional `O(n)`, so we say it is **Amortized** constant time, denoated as `O(1)*` or `O(1) amortized` or `O(1) avg`.
    - Amortized means most of the time it's `O(1)`, but it is possible that it may take longer. This is rare enough though, that when we average it out, it's closer to constant time
 
## Break (10 min)

- An undo buffer (game, Photoshop, etc.) is an example of how you would use a stack!
- Fun example of this is [atom's scroll-through-time package](https://atom.io/packages/scroll-through-time)

## Activity - Stacks and Queues Worksheet - Queue portion (25 min)

- Same activity/directions as before, but now for queues!
- Reminder to talk to at least two other people and compare implementations


### Linked Lists

To draw the linked list, we reccomend the following steps:

- Draw the linked list going left to right
- Draw "head" and "tail" above the appropriate nodes 
- Then write "front" and "back" below the appropriate nodes

Just like before, first draw a queue using a linked list where the front of the queue is the tail of the list

Once you've solved that section, draw a queue using a linked list where the front of the queue is the head of the list

### Arrays

**Before you start:** Put an arrow next to the right of the chart on which implementation you think will be perform better.

First Draw an array (left to right) with index `0` on the leftmost side, index `n-1` on the rightmost side

- Put 4 elements in the array
- Label the leftmost element "back", and the rightmost element "front"

**Remember:** we _dequeue_ from the _front_ of the queue, and _enqueue_ from the _back_ of the queue

Fill out that section of the worksheet!

Once you're done, switch the "front" and "back" labels. The "front" of queue should now be at index `0`

**Tips:**

- Remember to check if something is _truly_ `O(1)` or if it's `O(1) avg`
- Sometimes there's no good choice for one implementation! i.e. sometimes it's clear to use a one data structure over the other


[abstract data types]: https://en.wikipedia.org/wiki/Abstract_data_type
[data structures]: https://en.wikipedia.org/wiki/Data_structure
[list]: https://en.wikipedia.org/wiki/List_(abstract_data_type)
[stack]: https://en.wikipedia.org/wiki/Stack_(abstract_data_type)
[queue]: https://en.wikipedia.org/wiki/Queue_(abstract_data_type)
[deque]: https://en.wikipedia.org/wiki/Double-ended_queue
[array]: https://en.wikipedia.org/wiki/Array_data_structure
[dynamic array]: https://en.wikipedia.org/wiki/Dynamic_array
[linked list]: https://en.wikipedia.org/wiki/Linked_list

[stack and queue slides]: ../Slides/StacksQueues.pdf
[stack and queue video lecture]: https://www.youtube.com/watch?v=AXWnk4gege4
[stack and queue video]: https://www.youtube.com/watch?v=wjI1WNcIntg
[stack video]: https://www.youtube.com/watch?v=9Tp8wHD66lw
[queue video]: https://www.youtube.com/watch?v=10jRKWI9s1k

[BaseCS stack]: https://medium.com/basecs/stacks-and-overflows-dbcf7854dc67
[BaseCS queue]: https://medium.com/basecs/to-queue-or-not-to-queue-2653bcde5b04
[visualgo list]: https://visualgo.net/list

[stack starter code]: ../Code/stack.py
[stack unit tests]: ../Code/stack_test.py
[queue starter code]: ../Code/queue.py
[queue unit tests]: ../Code/queue_test.py
