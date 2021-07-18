## Divide-and-Conquer Recursion

### Topics
- [Divide-and-conquer]&nbsp;[recursion]: divide, conquer, combine
- Revisit [binary search] to see how it divides and conquers
- [Merge sort] and [merge algorithm]

### Slides

Slides can be found [here](https://docs.google.com/presentation/d/1LTda1-FQBugh9LWPZyp22YWyD_a7-Xq0MdjYzlQKqvU/edit#slide=id.ga51044badf_0_112)

### Resources
- Play with VisuAlgo's [interactive sorting visualizations][VisuAlgo sorting] including merge sort
- Play with USF's [interactive sorting animations][USF sorting] including merge sort
- Read Vaidehi Joshi's articles on [merge sort, part 1: how it works][BaseCS merge sort 1] and [part 2: logarithms and complexity analysis][BaseCS merge sort 2] with beautiful drawings and excellent analysis
- Watch Harvard's [merge sort video] and [sorting algorithms summary video]
- Watch HackerRank's [merge sort tutorial video] (*spoiler alert:* contains solution code)
- Watch Mike Bostock's [merge sort visualization] with array values encoded using angle
- Watch Toptal's [sorting animations] to see how algorithms compare based on input and read the discussion section
- Watch dancers perform [merge sort with German folk dance]
- Watch videos to observe patterns: [9 sorting algorithms], [15 sorting algorithms], [23 sorting algorithms]
- Review Make School's [algorithm analysis slides] for a running time comparison of merge sort and bubble sort

### Challenges
- Implement merge sort algorithm and merge helper function using [sorting starter code]:
    - Implement `merge(items1, items2)` that merges lists `items1` and `items2`, each assumed to already be in sorted order, and return a new list containing all items in sorted order
    - Implement `split_sort_merge(items)` that uses any *other* sorting algorithm to sort sublists (*non-recursively*)
        - Use the [divide-and-conquer] problem-solving strategy:
            1. Divide: split problem (input list) into subproblems (two sublists each of half size)
            2. Conquer: solve subproblems independently (sort sublists with any sorting algorithm)
            3. Combine: combine subproblem solutions together (merge sorted sublists into one list)
    - Implement `merge_sort(items)` that *recursively calls itself* to sort sublists during the conquer step
        - Remember to add a base case to avoid infinite recursion loops (*hint:* very small lists are always sorted)
- Run `python sorting.py` to test sorting algorithms on random samples of integers, for example:
    ```
    $ python sorting.py merge_sort 10 20
    Initial items: [3, 15, 4, 7, 20, 6, 18, 11, 9, 7]
    Sorting items with merge_sort(items)
    Sorted items:  [3, 4, 6, 7, 7, 9, 11, 15, 18, 20]
    ```
    - Experiment with different *list sizes* to find when iterative sorting algorithms are slow and merge sort is fast
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)
- Expand the [sorting unit tests] to ensure your integer sorting algorithms are robust
    - Write tests in a way that lets you add new sorting functions without needing to write more tests
    - Include a variety of test cases that cover several integer distributions, orderings, and edge cases
- Run `pytest sorting_test.py` to run the [sorting unit tests] and fix any failures

### Stretch Challenges
- Reduce the space complexity (memory usage) of merge sort by avoiding some list copying
- Implement [bucket sort] or [sample sort] for integers using divide-and-conquer recursion


[divide-and-conquer]: https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm
[recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[binary search]: https://en.wikipedia.org/wiki/Binary_search_algorithm
[merge algorithm]: https://en.wikipedia.org/wiki/Merge_algorithm
[merge sort]: https://en.wikipedia.org/wiki/Merge_sort
[bucket sort]: https://en.wikipedia.org/wiki/Bucket_sort
[sample sort]: https://en.wikipedia.org/wiki/Samplesort

[algorithm analysis slides]: slides/AlgorithmAnalysis.pdf
[VisuAlgo sorting]: https://visualgo.net/en/sorting
[USF sorting]: https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html
[sorting animations]: https://www.toptal.com/developers/sorting-algorithms/
[merge sort visualization]: http://bl.ocks.org/mbostock/1243323
[BaseCS merge sort 1]: https://medium.com/basecs/making-sense-of-merge-sort-part-1-49649a143478
[BaseCS merge sort 2]: https://medium.com/basecs/making-sense-of-merge-sort-part-2-be8706453209

[merge sort tutorial video]: https://www.youtube.com/watch?v=KF2j-9iSf4Q
[merge sort video]: https://www.youtube.com/watch?v=sWtYJv_YXbo
[sorting algorithms summary video]: https://www.youtube.com/watch?v=B6l7AJYgCOI
[3 sorting algorithms]: https://www.youtube.com/watch?v=jHPexHsDxwQ
[9 sorting algorithms]: https://www.youtube.com/watch?v=ZZuD6iUe3Pc
[15 sorting algorithms]: https://www.youtube.com/watch?v=kPRA0W1kECg
[23 sorting algorithms]: https://www.youtube.com/watch?v=rqI6KT6cOas
[merge sort with German folk dance]: https://www.youtube.com/watch?v=dENca26N6V4

[sorting starter code]: ../Code/sorting_recursive.py
[sorting unit tests]: ../Code/sorting_test.py
