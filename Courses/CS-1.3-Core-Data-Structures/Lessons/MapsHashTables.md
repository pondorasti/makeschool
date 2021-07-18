# Maps & Hash Tables

## Important Links

- [Slides](https://docs.google.com/presentation/d/1lewBrWphOUW_j7NLp0OmaA2tEDDigEdX1hlJEsk-Ezw/edit#slide=id.p)
- [Starter Code](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/tree/master/Code/hash-table)
- [Rubrics](https://drive.google.com/file/d/1QMm-cc0jieP-sLXOsXGxNPupz5FYYP0C/view)


## Learning Objectives (5 min)

By this end of this lesson, students should be able to...

1. Explain the use cases for maps and hash tables and how they're related
1. Practice implementing various hash tables features
1. Describe various components of a hash table such as the hash function, collision resolution, load factor, and dynamize resizing

## Topics
- Abstract data types: [map (dictionary, associative array)][map]
- Concrete data structures: [hash table]
- [Hash functions], [collision resolution], [load factor], [dynamic resizing]

<!--## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:10      | Turn in Challenges So Far                |
| 0:10        | 0:15      | Activity - Stacks and Queues Worksheet - Overview  |
| 0:25        | 0:30      | Activity - Stacks and Queues Worksheet - Stack Portion       |
| 0:55        | 0:10      | TT - Amortization                     |
| 1:05        | 0:10      | BREAK      |
| 1:15        | 0:25      | Activity - Stacks and Queues Worksheet - Queue Portion      |
| 1:40        | 0:10      | Wrap Up - Abstract Types vs Concrete Data Structures      |
| TOTAL       | 1:50      |                           |
-->

## Resources
- Review Make School's [hash table slides]
- Watch Make School's [hash table video lecture]
- Read Vaidehi Joshi's [articles on hash tables][BaseCS hash tables] and [hash functions][BaseCS hash functions] with beautiful drawings and excellent examples
- Watch HackerRank's [hash table video]
- Watch Harvard's [old hash table video] and [new hash table video]
- Play with VisuAlgo's [interactive hash table visualization][visualgo hash table]

## Challenges
- Add new features to improve `HashTable` class using [hash table starter code]:
    - Add `size` property that tracks the number of hash table entries in constant time
    - Implement `load_factor` - return the [load factor], the ratio of number of entries to buckets
    - Implement `_resize` - perform [dynamic resizing] when `load_factor` exceeds `0.75` after an insertion (`set` is called with a new `key`) and rehash all key-value entries
    - Run `python hashtable.py` to test `HashTable` class instance methods on a small example
    - Run `pytest hashtable_test.py` to run the [hash table unit tests] and fix any failures
- Annotate methods with complexity analysis of running time and space (memory)

## Stretch Challenges
- Implement an alternative hash table [collision resolution] strategy instead of [separate chaining] (popular variants include [linear probing], [quadratic probing], and [double hashing])
- Write additional test cases to expand the [hash table unit tests] to ensure your collision resolution strategy is robust

## Turn In Challenges So Far (10 min)

- Turn in CS 1.3 coding challenges for review, feedback, and grading!
- Deadline is end of day tomorrow (Thursday)
- Grading will start on Friday


## Abstract Types vs Concrete Data Structures (10 min)

![abstract-vs-concrete](./assets/abstract_concrete_comparision.png)

Make sure worksheet is filled out, with bad implementations crossed out

### Abstract Data Types

- Similar to an API: they specify what operations you _can_ do. They're the "rules of the game"
- They do _not_ say how to implement it implemented
- A **List** is an ordered sequence of items
- **Stacks and queues** are special kinds of lists with special rules

### Concrete Data Structure

- These are _how you implement_ abstract data types
- Similar to your backend: like deciding whether to build your server in node, python, go, etc.
- Things you can draw, and describe how they're allocated in memory
    - array (contiguous memory with indexes)
        - static (fixed size)
        - dynamic (resizable)
    - linked list
        - singly
        - doubly

### Maps and Hashtables

#### Maps
- **Map** is another abstract data type
    - Same as a **dictionary** (swift, python), or an **associative array** (php, CS literature)
    - Does _not_ have an order to it. **It is an _unordered_ collection of _key/value pairs_**
    - A phonebook is an example of this: a person's name is the key, the value is the phone number
    - Generally, curly braces are used to denote these
    - Remember, this says _nothing_ about how it is organized, it just describes what the data in it looks like (key/value pairs)

#### Hashtable

![hashtable-implementation](./assets/hashtable_implementation.png)

- A **Hashtable** is a concrete data structure used to implement a map/dictionary. Python uses this to implement its dictionaries.
- Small Side Note: you could implement a map with an array or linked list, but it wouldn't be as efficient
- A Hashtable is made up of the following parts:
    -  **hash function** - takes a key (`k`) and gives you a number (`n`)
        -  `h(k)` --> `n`
    -  **array** - a piece of contiguous memory that has indexes, which allow us to retrieve buckets in in constant time
    -  **linked list** -  each bucket in the array is a linked list of many elements. These could be empty
        -  Note: not all hashtables will use linked lists. Our implementation does use it though

#### Load Factor

-  The **load factor** (`L`) of a hashtable is the average length of each bucket = `(# entries in the hashtable)/(# of buckets)` = `n/b`
    - As the load factor gets higher, the buckets get longer. This is bad because it _increases the time it takes to iterate over buckets_, which negatively affects performance
- While the number of entries in the hashtable is not in our control (that's decided by the user; how many people they want in their phone book), the _number of buckets is in our control_.
- If we increase the number of buckets, we can get to a lower `L`, therefore dropping number of operations and _increasing performance_

#### Drawing Example

Draw a hashtable with 3 buckets and put 5 items in it

- The more buckets we have, the more space we have to store things
- Where does a new element land? Through **rehashing**: rearranging where items go to make sure they're in the appropriate spot in the **resized** hashtable
    - Remember the resturant tables example. The hashtable will need to be resized occasionally as you add more items
    - Rehash will give you a new index for items
    - More buckets means more memory!

## Activity - Drawing a Hashtable  (35 min)

### Part 1 (20 minutes)
Grab individual whiteboards and markers

Draw a hash table with the entries below, showing how it's organized in memory.

- There must be `b=5` buckets and each bucket is a linked list
- Use ../Slides/diagrams from the previous class to help you

| **Key** | **Hash**  | **Value**   |
| ----------- | --------- | ------- |
| red         | 760       | 1       |
| green       | 394       | 4       |
| orange      | 893       | 2       |
| violet      | 491       | 7       |
| yellow      | 622       | 3       |
| blue        | 468       | 5       |
| indigo      | 186       | 6       |

Finish on your own, then share and discuss with your neighbors. Talk to as many people as you can!

**TIP:** The reason there are 5 buckets is that it allows you to take a shortcut when you try to calculate the index of where that key/value pair should land: you only need to look at the last digit, as that's the only one that matters when you `mod` by 5

- example: `8 mod 5 = 3`
- Remember that `mod` means you divide and keep the remainder (i.e. `8/5` has a remainder of 3)

### Part 2 (15 min)

Now calculate the **load factor** of this hash table.

- Is it beyond the threshold (`0.75`) that triggers a resize?
- If so, perform a resize by doubling the number of buckets and reshashing all key-value entries
- Draw a new diagram showing how the key-value entries are now organized in buckets

Once you're finished, discuss with your neighbors. Make sure to discuss if the load factor is bigger, how will it affect performance?

## Code Review (45 min)

### Review with Peers (15 min)

1. Go to the Hashtable class and review the `load factor` method
1. Review the `resize` method, then see where it's called
    - **Note:** We use `_` to denote private methods in Python

### Student Presentation (30 min)

Student presents their answer to the challenges

**Tips/Highlights from the presentation**

- Look at other areas of the starter code to give you hints (i.e. how something may be called or initialized)
- `init` is called when you create a new object, but isn't _only_ called then. Be sure to comment though, since you're using `init` in a non-traditional way
- Look for opportunities to reuse code you've already written
- Runtime analysis
    - the `.items` method of the hashtable class takes `b` time, since it iterates over all buckets
        - `.extend` method is to arrays like `+` is to strings. This takes `l2` time since we're appending each item in the second list to the first list
            - note that if you extend an array with an empty array, it's the same as doing nothing
        - `.append` happens in constant time
        - therefore takes `O(n)` time, where `n` is the number of items in the hashtable
    - `init` depends on `new_size`, which takes `2b` --> `O(b)` time and space
    - Final step is a `for` loop that runs the length of `current_entries` --> `n` --> `O(n)`, and we know `.set` is constant time
    - **`O(b) + O(n) + O(n)` --> `O(2n + b)` --> `O(n + b)` --> `O(b)` (with assumption of resize)**


[map]: https://en.wikipedia.org/wiki/Associative_array
[hash table]: https://en.wikipedia.org/wiki/Hash_table
[hash functions]: https://en.wikipedia.org/wiki/Hash_function
[load factor]: https://en.wikipedia.org/wiki/Hash_table#Key_statistics
[dynamic resizing]: https://en.wikipedia.org/wiki/Hash_table#Dynamic_resizing
[collision resolution]: https://en.wikipedia.org/wiki/Hash_table#Collision_resolution
[separate chaining]: https://en.wikipedia.org/wiki/Hash_table#Separate_chaining
[linear probing]: https://en.wikipedia.org/wiki/Linear_probing
[quadratic probing]: https://en.wikipedia.org/wiki/Quadratic_probing
[double hashing]: https://en.wikipedia.org/wiki/Double_hashing

[hash table slides]: ../Slides/HashTables.pdf
[hash table video lecture]: https://www.youtube.com/watch?v=nLWXJ6IDKmQ
[hash table video]: https://www.youtube.com/watch?v=shs0KM3wKv8
[old hash table video]: https://www.youtube.com/watch?v=h2d9b_nEzoA
[new hash table video]: https://www.youtube.com/watch?v=tjtFkT97Xmc

[BaseCS hash tables]: https://medium.com/basecs/taking-hash-tables-off-the-shelf-139cbf4752f0
[BaseCS hash functions]: https://medium.com/basecs/hashing-out-hash-functions-ea5dd8beb4dd
[visualgo hash table]: https://visualgo.net/hashtable

[hash table starter code]: ../Code/hashtable.py
[hash table unit tests]: ../Code/hashtable_test.py
