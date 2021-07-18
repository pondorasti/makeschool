## Class 8: Sets & Circular Buffers

### Topics
- Abstract data types: [set], [multiset (bag)][multiset]
- Concrete data structures: [hash table], [circular buffer (circular queue, ring buffer)][circular buffer]
- [Set operations]

### Resources
- Read Vaidehi Joshi's [article on sets and their use in databases][BaseCS sets] with beautiful drawings and excellent examples

### Challenges
- Implement `Set` class (abstract data type backed by data structure of your choice) with the following [set operations] as instance methods and properties:
    - `__init__(elements=None)` - initialize a new empty set structure, and add each element if a sequence is given
    - `size` - property that tracks the number of elements in constant time
    - `contains(element)` - return a boolean indicating whether `element` is in this set
    - `add(element)` - add `element` to this set, if not present already
    - `remove(element)` - remove `element` from this set, if present, or else raise `KeyError`
    - `union(other_set)` - return a new set that is the union of this set and `other_set`
    - `intersection(other_set)` - return a new set that is the intersection of this set and `other_set`
    - `difference(other_set)` - return a new set that is the difference of this set and `other_set`
    - `is_subset(other_set)` - return a boolean indicating whether `other_set` is a subset of this set
- Write unit tests to ensure the `Set` class is robust
    - Include test cases for each class instance method
- Annotate all instance methods with complexity analysis of running time and space (memory)
- Compare the behaviors of your `Set` class to those of the [Python `set` type] and [Swift `Set` type]

### Stretch Challenges
- Implement `CircularBuffer` class (backed by dynamic array) with the following instance methods and properties:
    - `__init__(max_size)` - initialize a new circular buffer that can store at most `max_size` items
    - `size` - property that tracks the number of items in the buffer
    - `is_empty` - check if the buffer is empty
    - `is_full` - check if the buffer is full
    - `enqueue(item)` - insert `item` at the back of the buffer
    - `front` - return the item at the front of the buffer
    - `dequeue` - remove and return the item at the front of the buffer
- Annotate `enqueue` and `dequeue` methods with running time complexity analysis
- Write unit tests to ensure the `CircularBuffer` class is robust
    - Include test cases for each class instance method and property
- Annotate `enqueue` and `dequeue` methods with running time complexity analysis


[set]: https://en.wikipedia.org/wiki/Set_(abstract_data_type)
[multiset]: https://en.wikipedia.org/wiki/Set_(abstract_data_type)#Multiset
[set operations]: https://en.wikipedia.org/wiki/Set_(abstract_data_type)#Operations
[hash table]: https://en.wikipedia.org/wiki/Hash_table
[circular buffer]: https://en.wikipedia.org/wiki/Circular_buffer

[BaseCS sets]: https://medium.com/basecs/set-theory-the-method-to-database-madness-5ec4b4f05d79
[Python `set` type]: https://docs.python.org/3/library/stdtypes.html#set
[Swift `Set` type]: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID484
