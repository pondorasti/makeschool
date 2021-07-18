## Class 17: Sorting Algorithms Comparison

### Topics
- [Hybrid] sorting algorithms: [intro sort], [Tim sort]
- Ideal sorting algorithm features: [stable], [in-place], [adaptive]

#### [Comparison Sorting] Algorithm Complexity

| Algorithm        | Best Time        | Average Time     | Worst Time       | Space    | Features                   |
| ---------------- | ---------------- | ---------------- | ---------------- | -------- | -------------------------- |
| [Bubble sort]    | Ω(n)             | Θ(n<sup>2</sup>) | O(n<sup>2</sup>) | O(1)     | stable, in-place, adaptive |
| [Selection sort] | Ω(n<sup>2</sup>) | Θ(n<sup>2</sup>) | O(n<sup>2</sup>) | O(1)     | stable, in-place           |
| [Insertion sort] | Ω(n)             | Θ(n<sup>2</sup>) | O(n<sup>2</sup>) | O(1)     | stable, in-place, adaptive |
| [Tree sort]      | Ω(n⋅log n)       | Θ(n⋅log n)       | O(n<sup>2</sup>) | O(n)     |                            |
| [Quick sort]     | Ω(n⋅log n)       | Θ(n⋅log n)       | O(n<sup>2</sup>) | O(log n) | in-place                   |
| [Merge sort]     | Ω(n⋅log n)       | Θ(n⋅log n)       | O(n⋅log n)       | O(n)     | stable                     |
| [Heap sort]      | Ω(n⋅log n)       | Θ(n⋅log n)       | O(n⋅log n)       | O(1)     | in-place                   |
| [Intro sort]     | Ω(n⋅log n)       | Θ(n⋅log n)       | O(n⋅log n)       | O(log n) | in-place, hybrid           |
| [Tim sort]       | Ω(n)             | Θ(n⋅log n)       | O(n⋅log n)       | O(n)     | stable, adaptive, hybrid   |

#### [Integer Sorting] Algorithm Complexity

| Algorithm       | Best Time | Average Time | Worst Time       | Space  |
| --------------- | --------- | ------------ | ---------------- | ------ |
| [Counting sort] | Ω(n+k)    | Θ(n+k)       | O(n+k)           | O(k)   |
| [Bucket sort]   | Ω(n+k)    | Θ(n+k)       | O(n<sup>2</sup>) | O(n)   |
| [Radix sort]    | Ω(n⋅k)    | Θ(n⋅k)       | O(n⋅k)           | O(n+k) |

### Resources
- Read BetterExplained's [sorting algorithms article] that discusses similarities, differences, and patterns
- Play with VisuAlgo's [interactive sorting visualizations][VisuAlgo sorting] including bubble, selection, insertion, merge, quick, counting, and radix sort
- Play with USF's [interactive sorting animations][USF sorting] including bubble, selection, insertion, merge, quick, Shell,  sort
- Read Vaidehi Joshi's [overview of sorting article][BaseCS sorting] with beautiful drawings and excellent analysis
- Play with Carlo Zapponi's [sorting visualizations artwork] including three-way quick sort
- Review Eric Rowell's [Big O cheat sheet] for a comparison of sorting algorithm time and space complexity
- Watch Toptal's [sorting animations] to compare algorithms based on input conditions (order and distribution)
    - Read the discussion section on properties of an ideal sorting algorithm and the conclusion stated
- Watch Morolin's [sorting algorithms visualized] and compared with animated rainbow GIF loops
- Play with Casper Beyer's [Tone of Sorting] sound auralizer and read his [article about how and why he built it][Tone of Sorting article]
- Watch dancers perform [sorting algorithms with folk dances] including bubble sort, selection sort, insertion sort, Shell sort, merge sort, and quick sort
- Watch videos to observe patterns: [9 sorting algorithms], [15 sorting algorithms], [23 sorting algorithms]
- Watch University of Toronto's "[Sorting Out Sorting]" 30-minute film from 1981
- Download Timo Bingmann's [The Sound of Sorting] software to hear and visualize sorting algorithms
- Read Tim Peters's (a Python core language developer) [proposal for a new sorting algorithm][Tim sort proposal] now known as *Tim sort* – he effectively argued its advantages over the existing sorting algorithm and compared performance with benchmarks

### Project
- [Sorting algorithms project] with real-world data on Make School's Online Academy


[sorting algorithm]: https://en.wikipedia.org/wiki/Sorting_algorithm
[stable]: https://en.wikipedia.org/wiki/Sorting_algorithm#Stability
[in-place]: https://en.wikipedia.org/wiki/In-place_algorithm
[adaptive]: https://en.wikipedia.org/wiki/Adaptive_sort
[hybrid]: https://en.wikipedia.org/wiki/Hybrid_algorithm

[comparison sorting]: https://en.wikipedia.org/wiki/Comparison_sort
[bubble sort]: https://en.wikipedia.org/wiki/Bubble_sort
[selection sort]: https://en.wikipedia.org/wiki/Selection_sort
[insertion sort]: https://en.wikipedia.org/wiki/Insertion_sort

[tree sort]: https://en.wikipedia.org/wiki/Tree_sort
[quick sort]: https://en.wikipedia.org/wiki/Quicksort
[merge sort]: https://en.wikipedia.org/wiki/Merge_sort
[heap sort]: https://en.wikipedia.org/wiki/Heapsort
[intro sort]: https://en.wikipedia.org/wiki/Introsort
[Tim sort]: https://en.wikipedia.org/wiki/Timsort
[Tim sort proposal]: https://mail.python.org/pipermail/python-dev/2002-July/026837.html

[integer sorting]: https://en.wikipedia.org/wiki/Integer_sorting
[counting sort]: https://en.wikipedia.org/wiki/Counting_sort
[bucket sort]: https://en.wikipedia.org/wiki/Bucket_sort
[radix sort]: https://en.wikipedia.org/wiki/Radix_sort

[sorting algorithms article]: https://betterexplained.com/articles/sorting-algorithms/
[VisuAlgo sorting]: https://visualgo.net/en/sorting
[USF sorting]: https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html
[Big O cheat sheet]: http://bigocheatsheet.com/
[sorting animations]: https://www.toptal.com/developers/sorting-algorithms/
[sorting visualizations artwork]: http://sorting.at/
[sorting algorithms visualized]: https://imgur.com/gallery/voutF
[BaseCS sorting]: https://medium.com/basecs/sorting-out-the-basics-behind-sorting-algorithms-b0a032873add
[The Sound of Sorting]: http://panthema.net/2013/sound-of-sorting/
[Tone of Sorting]: https://caspervonb.github.io/toneofsorting/
[Tone of Sorting article]: https://medium.com/@caspervonb/how-i-visualized-the-sorting-algorithms-and-brought-them-to-life-with-sound-ce7c5c6cb6ef

[Sorting Out Sorting]: https://www.youtube.com/watch?v=SJwEwA5gOkM
[3 sorting algorithms]: https://www.youtube.com/watch?v=jHPexHsDxwQ
[9 sorting algorithms]: https://www.youtube.com/watch?v=ZZuD6iUe3Pc
[15 sorting algorithms]: https://www.youtube.com/watch?v=kPRA0W1kECg
[23 sorting algorithms]: https://www.youtube.com/watch?v=rqI6KT6cOas
[sorting algorithms with folk dances]: https://www.youtube.com/playlist?list=PLOmdoKois7_FK-ySGwHBkltzB11snW7KQ

[sorting algorithms project]: http://make.sc/oa-sorting-algorithms
