# [Algorithm Analysis](https://docs.google.com/presentation/d/1bZ1jGmCobX7qia3qRGe4wIq7aLx6F9lOQsAxnE63Nv4/edit#slide=id.p)

## Linked List Activities
- Complete [linked list worksheet]
    - When finished, compare your answers to [linked list worksheet solutions]
- Draw diagram of how a linked list data structure is stored in memory
- Compare and contrast diagram representations with partners
- Code review implementations of linked list class instance methods
- Read and discuss [article on algorithm analysis and big O notation][IC big O]

## Hash Table Activities
- Complete [hash table worksheet]
    - When finished, compare your answers to [hash table worksheet solutions]
- Draw diagram of how a hash table data structure is stored in memory
- Compare and contrast diagram representations with partners
- Complete [hash table time complexity worksheet]
    - Watch [video of hash table time complexity worksheet review]
- Form teams and collaboratively draw more complete hash table diagrams
- Review merits of each diagram's faithfulness to actual memory organization
- Code review implementations of hash table class instance methods

## Objectives
After completing this class session and the associated tutorial challenges, students will be able to ...
- Describe and diagram in detail how a hash table uses arrays and linked lists to store key-value entries
- Explain how to add a new key-value entry to a hash table and how to get the value associated with a given key
- Identify key ingredients used to build a hash table: hash function, indexed array of buckets, and linked lists to store multiple key-value entries per bucket
- Perform basic analysis of algorithm time complexity with big O notation

## Resources
- Review Make School's [algorithm analysis slides]
- Read Interview Cake's [article on the idea behind big O notation][IC big O]
- Read Stack Overflow's [plain English explanations of big O notation][SO big O]
- Read Justin Abrams's [article on big O notation explained by a self-taught programmer][JA big O]
- Watch HackerRank's [big O notation video]
- Watch Harvard's [asymptotic notation video] and [computational complexity video]
- Play with VisuAlgo's [interactive linked list][VisuAlgo list] and [hash table visualizations][VisuAlgo hash table]

## Challenges
These challenges are the baseline required to complete the project and course.
Be sure to complete these before next class session and before starting on the stretch challenges below.

### Linked List Challenges
- Annotate these `LinkedList` class instance methods with time complexity analysis:
    - `length()`
    - `append(item)`
    - `prepend(item)`
    - `find(quality)`
    - `delete(item)`
    - See the `items()` instance method for an example annotation

### Hash Table Challenges
- Annotate these `HashTable` class instance methods with time complexity analysis:
    - `length()`
    - `items()`
    - `contains(key)`
    - `get(key)`
    - `set(key, value)`
    - `delete(key)`

## Stretch Challenges
These challenges are more difficult and help you push your skills and understanding to the next level.
- [Page 10: Performance Analysis]
    - Benchmark the running time performance of your `LinkedList` and `HashTable` data structures with varying size using the [`timeit` module]
    - Benchmark the built-in `list` and `dict` types and compare to your `LinkedList` and `HashTable` classes


[linked list worksheet]: https://make.sc/linked-list-worksheet
[linked list worksheet solutions]: https://make.sc/linked-list-worksheet-solutions
[hash table worksheet]: https://make.sc/hash-table-worksheet
[hash table worksheet solutions]: https://make.sc/hash-table-worksheet-solutions
[hash table time complexity worksheet]: https://make.sc/hash-table-time-complexity-worksheet
[video of hash table time complexity worksheet review]: https://www.youtube.com/watch?v=Ka3hvRoUxnY
[algorithm analysis slides]: https://github.com/Make-School-Courses/CS-1.2-Intro-Data-Structures/blob/master/Slides/AlgorithmAnalysis.pdf
[big O notation video]: https://www.youtube.com/watch?v=v4cd1O4zkGw
[asymptotic notation video]: https://www.youtube.com/watch?v=iOq5kSKqeR4
[computational complexity video]: https://www.youtube.com/watch?v=IM9sHGlYV5A
[IC big O]: https://www.interviewcake.com/article/python/big-o-notation-time-and-space-complexity
[SO big O]: https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation
[JA big O]: https://justin.abrah.ms/computer-science/big-o-notation-explained.html
[VisuAlgo list]: https://visualgo.net/list
[VisuAlgo hash table]: https://visualgo.net/hashtable

[`time` module]: https://docs.python.org/3/library/time.html
[`timeit` module]: https://docs.python.org/3/library/timeit.html

[Page 10: Performance Analysis]: https://www.makeschool.com/academy/tutorial/tweet-generator-data-structures-probability-with-python/performance-analysis

[linked list source code]: https://github.com/Make-School-Courses/CS-1.2-Intro-Data-Structures/blob/master/Code/linkedlist.py
[hash table source code]: https://github.com/Make-School-Courses/CS-1.2-Intro-Data-Structures/blob/master/Code/hashtable.py
