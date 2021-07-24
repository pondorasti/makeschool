## Class 7: Maps & Hash Tables

### Topics
- Abstract data types: [map (dictionary, associative array)][map]
- Concrete data structures: [hash table]
- [Hash functions], [collision resolution], [load factor], [dynamic resizing]

### Resources
- Review Make School's [hash table slides]
- Watch Make School's [hash table video lecture]
- Read Vaidehi Joshi's [articles on hash tables][BaseCS hash tables] and [hash functions][BaseCS hash functions] with beautiful drawings and excellent examples
- Watch HackerRank's [hash table video]
- Watch Harvard's [old hash table video] and [new hash table video]
- Play with VisuAlgo's [interactive hash table visualization][visualgo hash table]

### Challenges
- Add new features to improve `HashTable` class using [hash table starter code]:
    - Add `size` property that tracks the number of hash table entries in constant time
    - Implement `load_factor` - return the [load factor], the ratio of number of entries to buckets
    - Implement `_resize` - perform [dynamic resizing] when `load_factor` exceeds `0.75` after an insertion (`set` is called with a new `key`) and rehash all key-value entries
    - Run `python hashtable.py` to test `HashTable` class instance methods on a small example
    - Run `pytest hashtable_test.py` to run the [hash table unit tests] and fix any failures
- Annotate methods with complexity analysis of running time and space (memory)

### Stretch Challenges
- Implement an alternative hash table [collision resolution] strategy instead of [separate chaining] (popular variants include [linear probing], [quadratic probing], and [double hashing])
- Write additional test cases to expand the [hash table unit tests] to ensure your collision resolution strategy is robust


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

[hash table slides]: slides/HashTables.pdf
[hash table video lecture]: https://www.youtube.com/watch?v=nLWXJ6IDKmQ
[hash table video]: https://www.youtube.com/watch?v=shs0KM3wKv8
[old hash table video]: https://www.youtube.com/watch?v=h2d9b_nEzoA
[new hash table video]: https://www.youtube.com/watch?v=tjtFkT97Xmc

[BaseCS hash tables]: https://medium.com/basecs/taking-hash-tables-off-the-shelf-139cbf4752f0
[BaseCS hash functions]: https://medium.com/basecs/hashing-out-hash-functions-ea5dd8beb4dd
[visualgo hash table]: https://visualgo.net/hashtable

[hash table starter code]: source/hashtable.py
[hash table unit tests]: source/hashtable_test.py
