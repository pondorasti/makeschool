## Iterative Sorting Algorithms

### Slides

You can see the slides [here](https://docs.google.com/presentation/d/1zDfRhO0aYyPbsbDqSgTgFLJ5vDyg788JWwdqA3eZBJs/edit#slide=id.p)

### Topics
- Algorithm to check if items in a list are in sorted order
- Counting how many [inversions] there are in a list
- Classic iterative [sorting algorithms]: [bubble sort], [selection sort], [insertion sort] 

### Resources
- Play with VisuAlgo's [interactive sorting visualizations][VisuAlgo sorting] including bubble, selection, and insertion sort
- Play with USF's [interactive sorting animations][USF sorting] including bubble, selection, insertion, and Shell sort
- Read Vaidehi Joshi's articles: [an overview of sorting][BaseCS sorting], [bubble sort][BaseCS bubble sort], [selection sort][BaseCS selection sort], and [insertion sort][BaseCS insertion sort] with beautiful drawings and excellent analysis
- Watch Zutopedia's [insertion sort vs bubble sort robot video]
- Watch Harvard's [bubble sort video], [selection sort video], and [insertion sort video]
- Watch HackerRank's [bubble sort tutorial video] (*spoiler alert:* contains solution code)
- Watch Toptal's [sorting animations] to see how algorithms compare based on input and read the discussion section
- Watch dancers perform [bubble sort with Hungarian folk dance], [selection sort with Gypsy folk dance], and [insertion sort with Romanian folk dance]
- Watch videos to observe patterns: [9 sorting algorithms], [15 sorting algorithms], [23 sorting algorithms]
- Read Interview Cake's [triangular series article] for more background on counting inversions and pairs

### Challenges
- Implement these classic iterative sorting functions using [sorting starter code]:
    - `is_sorted(items)` - return a boolean indicating whether all `items` are in ascending order
    - `bubble_sort(items)` - swap adjacent items that are out of order, repeat until all `items` are sorted
    - `selection_sort(items)` - find minimum item in unsorted `items`, swap it with first unsorted item, repeat until all `items` are sorted
    - `insertion_sort(items)` - take first unsorted item, insert it in sorted order in front of `items`, repeat until all `items` are sorted
- Run `python sorting.py` to test sorting algorithms on a small random sample:
    ```
    $ python sorting.py bubble_sort 10 20
    Initial items: [3, 15, 4, 7, 20, 6, 18, 11, 9, 7]
    Sorting items with bubble_sort(items)
    Sorted items:  [3, 4, 6, 7, 7, 9, 11, 15, 18, 20]
    ```
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)
- Write a thorough suite of [sorting unit tests] to ensure your sorting algorithms are robust
    - Write tests in a way that lets you add new sorting functions without needing to write more tests
    - Include a variety of test cases that cover many different input types, orderings, distributions, and edge cases
- Run `pytest sorting_test.py` to run the [sorting unit tests] and fix any failures

### Stretch Challenges
- Extend sorting algorithms with an `order` parameter to specify ascending or descending order
- Extend sorting algorithms with a `key` parameter to specify a function to call on each item when making comparisons (read about Python's [`sorted` function] and how to use [`key` functions] for more information)
- Implement an [insertion sort] variation using [binary search] to find the position to insert each item
- Implement improved iterative sorting algorithms: [cocktail shaker sort], [library sort], or [Shell sort]
- Annotate functions with complexity analysis of running time (operations) and space (memory usage)


[inversions]: https://en.wikipedia.org/wiki/Inversion_(discrete_mathematics)
[sorting algorithms]: https://en.wikipedia.org/wiki/Sorting_algorithm
[comparison sorting]: https://en.wikipedia.org/wiki/Comparison_sort
[bubble sort]: https://en.wikipedia.org/wiki/Bubble_sort
[selection sort]: https://en.wikipedia.org/wiki/Selection_sort
[insertion sort]: https://en.wikipedia.org/wiki/Insertion_sort

[cocktail shaker sort]: https://en.wikipedia.org/wiki/Cocktail_shaker_sort
[library sort]: https://en.wikipedia.org/wiki/Library_sort
[Shell sort]: https://en.wikipedia.org/wiki/Shellsort
[binary search]: https://en.wikipedia.org/wiki/Binary_search_algorithm
[`sorted` function]: https://docs.python.org/3/library/functions.html#sorted
[`key` functions]: https://docs.python.org/3/howto/sorting.html#key-functions

[VisuAlgo sorting]: https://visualgo.net/en/sorting
[USF sorting]: https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html
[triangular series article]: https://www.interviewcake.com/concept/python/triangular-series
[sorting animations]: https://www.toptal.com/developers/sorting-algorithms/
[BaseCS sorting]: https://medium.com/basecs/sorting-out-the-basics-behind-sorting-algorithms-b0a032873add
[BaseCS bubble sort]: https://medium.com/basecs/bubbling-up-with-bubble-sorts-3df5ac88e592
[BaseCS selection sort]: https://medium.com/basecs/exponentially-easy-selection-sort-d7a34292b049
[BaseCS insertion sort]: https://medium.com/basecs/inching-towards-insertion-sort-9799274430da

[bubble sort tutorial video]: https://www.youtube.com/watch?v=6Gv8vg0kcHc
[bubble sort video]: https://www.youtube.com/watch?v=Ui97-_n5xjo
[selection sort video]: https://www.youtube.com/watch?v=lx9G71uLXIg
[insertion sort video]: https://www.youtube.com/watch?v=TwGb6ohsvUU
[insertion sort vs bubble sort robot video]: https://www.youtube.com/watch?v=TZRWRjq2CAg
[3 sorting algorithms]: https://www.youtube.com/watch?v=jHPexHsDxwQ
[9 sorting algorithms]: https://www.youtube.com/watch?v=ZZuD6iUe3Pc
[15 sorting algorithms]: https://www.youtube.com/watch?v=kPRA0W1kECg
[23 sorting algorithms]: https://www.youtube.com/watch?v=rqI6KT6cOas
[sorting algorithms with folk dances]: https://www.youtube.com/playlist?list=PLOmdoKois7_FK-ySGwHBkltzB11snW7KQ
[bubble sort with Hungarian folk dance]: https://www.youtube.com/watch?v=semGJAJ7i74
[selection sort with Gypsy folk dance]: https://www.youtube.com/watch?v=0-W8OEwLebQ
[insertion sort with Romanian folk dance]: https://www.youtube.com/watch?v=EdIKIf9mHk0

[sorting starter code]: https://github.com/Make-School-Courses/CS-2.1-Trees-Sorting/blob/master/Code/sorting_iterative.py
[sorting unit tests]: https://github.com/Make-School-Courses/CS-2.1-Trees-Sorting/blob/master/Code/sorting_test.py
