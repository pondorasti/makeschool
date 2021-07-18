## Class 14: Recursive Sorting Algorithms

### Topics
- [Tree sort] using [search tree] data structure
- [Quick sort] and partition algorithm
    - How to [choose a pivot]: first, last, middle, median-of-three, and random
    - Partitioning schemes: [Lomuto], [Hoare], and [three-way]
- [In-place] algorithms
- [Recursive] algorithm analysis with tree diagrams, [recurrence relations], and [master theorem]

### Resources
- Play with VisuAlgo's [interactive sorting visualizations][VisuAlgo sorting] including quick sort
- Play with USF's [interactive sorting animations][USF sorting] including quick sort
- Read Vaidehi Joshi's articles on [quick sort, part 1: how it works][BaseCS quick sort 1] and [part 2: choosing a pivot and complexity analysis][BaseCS quick sort 2] with beautiful drawings and excellent analysis
- Read Sebastian's answer to this [quick sort partitioning] question on Computer Science Stack Exchange
- Review Make School's [recursive algorithm analysis slides]
- Watch Zutopedia's [quick sort vs bubble sort robot video], [merge sort vs quick sort robot video]
- Watch Harvard's [quick sort video] or Computerphile's [quick sort cards video]
- Watch HackerRank's [quick sort tutorial video] (*spoiler alert:* contains solution code)
- Watch Mike Bostock's [quick sort visualization] with array values encoded using angle
- Play with Carlo Zapponi's [sorting visualizations artwork] including three-way quick sort
- Watch Toptal's [sorting animations] to see how algorithms compare based on input and read the discussion section
- Watch dancers perform [quick sort with Hungarian folk dance]
- Watch videos to observe patterns: [9 sorting algorithms], [15 sorting algorithms], [23 sorting algorithms]
- Read XKCD's [ineffective sorts] comic and see where the attempt to implement quick sort went wrong

### Challenges
- Implement quick sort algorithm and partition helper function using [sorting starter code]:
    - Implement `partition(items, low, high)` that chooses a pivot and returns index `p` after [in-place] partitioning `items` in range `[low...high]` by moving items less than pivot into range `[low...p-1]`, items greater than pivot into range `[p+1...high]`, and pivot into index `p`
        - [Choose a pivot] in any way: first, last, middle, median-of-three, or random
        - Use any partitioning scheme: [Lomuto], [Hoare], or [three-way]
    - Implement `quick_sort(items, low, high)` that sorts `items` [in-place] by using `partition` algorithm on `items` in range `[low...high]` and *recursively calls itself* on sublist ranges
        - Use the [divide-and-conquer] problem-solving strategy:
            1. Divide: split problem into subproblems (partition input list into sublist ranges)
            2. Conquer: solve subproblems independently (sort sublist ranges recursively with quick sort)
            3. Combine: combine subproblem solutions together (if partition is [in-place], list is already sorted, but if not then concatenate sorted sublists)
        - Remember to add a base case to avoid infinite recursion loops (*hint:* very small list ranges are always sorted)
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)
- Run `python sorting.py` to test quick sort algorithm on random samples of integers, for example:
    ```
    $ python sorting.py quick_sort 10 20
    Initial items: [3, 15, 4, 7, 20, 6, 18, 11, 9, 7]
    Sorting items with quick_sort(items)
    Sorted items:  [3, 4, 6, 7, 7, 9, 11, 15, 18, 20]
    ```
    - Experiment with different list sizes to find when iterative sorting algorithms are slow and quick sort is fast
    - Compare the runtime of quick sort to merge sort on large list sizes with a variety of integer distributions
- Run `pytest sorting_test.py` to run the [sorting unit tests] and fix any failures

### Stretch Challenges
- Try other techniques to [choose a pivot] and other partitioning schemes
- Implement [sample sort] using a multi-way partition algorithm and compare it to quick sort
- Implement [stable][stability] quick sort with a separate *stable* partition algorithm, then compare its time and space complexity (with algorithm analysis or performance benchmarking) to unstable quick sort
- Implement [slow sort] (just for fun)


[tree sort]: https://en.wikipedia.org/wiki/Tree_sort
[search tree]: https://en.wikipedia.org/wiki/Search_tree

[quick sort]: https://en.wikipedia.org/wiki/Quicksort
[choose a pivot]: https://en.wikipedia.org/wiki/Quicksort#Choice_of_pivot
[Lomuto]: https://en.wikipedia.org/wiki/Quicksort#Lomuto_partition_scheme
[Hoare]: https://en.wikipedia.org/wiki/Quicksort#Hoare_partition_scheme
[three-way]: https://en.wikipedia.org/wiki/Dutch_national_flag_problem

[in-place]: https://en.wikipedia.org/wiki/In-place_algorithm
[stability]: https://en.wikipedia.org/wiki/Sorting_algorithm#Stability
[sample sort]: https://en.wikipedia.org/wiki/Samplesort
[slow sort]: https://en.wikipedia.org/wiki/Slowsort

[divide-and-conquer]: https://en.wikipedia.org/wiki/Divide_and_conquer_algorithm
[recursive]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[recurrence relations]: https://en.wikipedia.org/wiki/Recurrence_relation
[master theorem]: https://en.wikipedia.org/wiki/Master_theorem

[recursive algorithm analysis slides]: slides/AlgorithmAnalysisRecursive.pdf
[VisuAlgo sorting]: https://visualgo.net/en/sorting
[USF sorting]: https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html
[sorting animations]: https://www.toptal.com/developers/sorting-algorithms/
[sorting visualizations artwork]: http://sorting.at/
[quick sort visualization]: https://bl.ocks.org/mbostock/1582075
[quick sort partitioning]: https://cs.stackexchange.com/questions/11458/quicksort-partitioning-hoare-vs-lomuto
[BaseCS quick sort 1]: https://medium.com/basecs/pivoting-to-understand-quicksort-part-1-75178dfb9313
[BaseCS quick sort 2]: https://medium.com/basecs/pivoting-to-understand-quicksort-part-2-30161aefe1d3

[quick sort vs bubble sort robot video]: https://www.youtube.com/watch?v=aXXWXz5rF64
[merge sort vs quick sort robot video]: https://www.youtube.com/watch?v=es2T6KY45cA
[quick sort tutorial video]: https://www.youtube.com/watch?v=SLauY6PpjW4
[quick sort video]: https://www.youtube.com/watch?v=aQiWF4E8flQ
[quick sort cards video]: https://www.youtube.com/watch?v=XE4VP_8Y0BU
[3 sorting algorithms]: https://www.youtube.com/watch?v=jHPexHsDxwQ
[9 sorting algorithms]: https://www.youtube.com/watch?v=ZZuD6iUe3Pc
[15 sorting algorithms]: https://www.youtube.com/watch?v=kPRA0W1kECg
[23 sorting algorithms]: https://www.youtube.com/watch?v=rqI6KT6cOas
[quick sort with Hungarian folk dance]: https://www.youtube.com/watch?v=3San3uKKHgg
[ineffective sorts]: https://xkcd.com/1185/

[sorting starter code]: source/sorting.py
[sorting unit tests]: source/sorting_test.py
