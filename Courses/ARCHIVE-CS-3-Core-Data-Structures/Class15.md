## Class 15: Integer Sorting Algorithms

### Topics
- Contrast [comparison sorting] with [integer sorting]
- Integer sorting algorithms: [pigeonhole sort], [counting sort], [bucket sort], [radix sort]

### Resources
- Play with VisuAlgo's [interactive sorting visualizations][VisuAlgo sorting] including [counting sort][VisuAlgo counting sort] and [radix sort][VisuAlgo radix sort]
- Play with USF's interactive sorting animations including [counting sort][USF counting sort], [bucket sort][USF bucket sort], and [radix sort][USF radix sort]
- Read Interview Cake's [counting sort article] (*spoiler alert:* contains solution code)
- Read Vaidehi Joshi's articles on [counting sort][BaseCS counting sort] and [radix sort][BaseCS radix sort] with beautiful drawings and excellent analysis
- Watch Barack Obama's answer to a [Google interview question][Obama sorting question] on how to sort one million 32-bit integers

### Challenges
- Implement integer sorting algorithms using [sorting starter code]:
    - `counting_sort(numbers)` - sort `numbers` (integers) by counting occurrences of each number, then looping over counts and copying that many numbers into output list.
    - `bucket_sort(numbers, num_buckets)` - sort `numbers` by distributing into buckets representing subranges, sorting each bucket, and combining contents of all buckets in sorted order
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)
- Run `python sorting.py` to test sorting algorithms on a small random sample:
    ```
    $ python sorting.py counting_sort 15 5
    Initial items: [2, 3, 1, 5, 5, 2, 5, 5, 1, 4, 1, 5, 2, 3, 1]
    Sorting items with counting_sort(items)
    Sorted items:  [1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 5, 5]

    $ python sorting.py counting_sort 20 10
    Initial items: [1, 6, 2, 2, 5, 8, 9, 7, 8, 9, 10, 10, 8, 10, 3, 3, 8, 2, 5, 7]
    Sorting items with counting_sort(items)
    Sorted items:  [1, 2, 2, 2, 3, 3, 5, 5, 6, 7, 7, 8, 8, 8, 8, 9, 9, 10, 10, 10]
    ```
    - Experiment with different list sizes, orderings, integer ranges, and distributions to find when integer sorting algorithms are faster than other sorting algorithms
- Expand the [sorting unit tests] to ensure your integer sorting algorithms are robust
    - Write tests in a way that lets you add new sorting functions without needing to write more tests
    - Include a variety of test cases that cover several integer distributions, orderings, and edge cases
- Run `pytest sorting_test.py::IntegerSortTest` to run *only* the integer [sorting unit tests] and fix any failures

### Stretch Challenges
- Extend [counting sort] algorithm to handle sorting floating-point numbers, characters, or strings
- Implement [radix sort] for 32-bit integers (most or least significant digit or bit)
- Extend [bucket sort] or [radix sort] algorithm to handle sorting strings in [lexicographical order]
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)


[comparison sorting]: https://en.wikipedia.org/wiki/Comparison_sort
[integer sorting]: https://en.wikipedia.org/wiki/Integer_sorting
[pigeonhole sort]: https://en.wikipedia.org/wiki/Pigeonhole_sort
[counting sort]: https://en.wikipedia.org/wiki/Counting_sort
[bucket sort]: https://en.wikipedia.org/wiki/Bucket_sort
[radix sort]: https://en.wikipedia.org/wiki/Radix_sort
[lexicographical order]: https://en.wikipedia.org/wiki/Lexicographical_order

[VisuAlgo sorting]: https://visualgo.net/en/sorting
[VisuAlgo counting sort]: https://visualgo.net/en/sorting?slide=14
[VisuAlgo radix sort]: https://visualgo.net/en/sorting?slide=15
[USF bucket sort]: https://www.cs.usfca.edu/~galles/visualization/BucketSort.html
[USF counting sort]: https://www.cs.usfca.edu/~galles/visualization/CountingSort.html
[USF radix sort]: https://www.cs.usfca.edu/~galles/visualization/RadixSort.html
[counting sort article]: https://www.interviewcake.com/concept/python/counting-sort
[BaseCS counting sort]: https://medium.com/basecs/counting-linearly-with-counting-sort-cd8516ae09b3
[BaseCS radix sort]: https://medium.com/basecs/getting-to-the-root-of-sorting-with-radix-sort-f8e9240d4224
[Obama sorting question]: https://www.youtube.com/watch?v=k4RRi_ntQc8

[sorting starter code]: source/sorting.py
[sorting unit tests]: source/sorting_test.py
