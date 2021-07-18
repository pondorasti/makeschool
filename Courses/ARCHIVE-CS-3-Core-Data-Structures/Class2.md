## Class 2: Recursion & Search Algorithms

### Topics
- Compare [iteration] and [recursion] with [factorial] function
- Search algorithms: [linear search] and [binary search]

### Resources
- Review Make School's [algorithm analysis slides]
- Read Vaidehi Joshi's [article on logarithms, binary search, and big O notation][BaseCS logarithms] with excellent, beautiful drawings
- Read Interview Cake's [article on logarithms and binary search][logarithms article]
- Read Interview Cake's [article on the idea behind big O notation][IC big O]
- Read Stack Overflow's [plain English explanations of big O notation][SO big O]
- Read Justin Abrams's [article on big O notation explained by a self-taught programmer][JA big O]
- Watch HackerRank's [recursive algorithms video], [binary search algorithm video], and [big O notation video]
- Watch Harvard's [old recursion video], [new recursion video], [stack frames video], [linear search video], [binary search video], [asymptotic notation video], and [computational complexity video]

### Challenges
- Implement iterative [factorial] function using [recursion starter code]:
    - Implement `factorial(n)` - the product of all integers 1 through `n`
    - Run `python recursion.py number` to test `factorial` on a number
        - Example: `python recursion.py 8` gives the result `factorial(8) => 40320`
    - Run `pytest recursion_test.py` to run the [recursion unit tests] and fix any failures
- Implement recursive linear and binary search algorithms using [search starter code]:
    - Implement `linear_search(array, item)` - the first index of `item` in `array`
    - Implement `binary_search(array, item)` - the index of `item` in sorted `array`
    - Run `pytest search_test.py` to run the [search unit tests] and fix any failures
- Annotate functions with complexity analysis of running time and space (memory)

### Stretch Challenges
- Implement recursive [permutation] and [combination] functions
- Make these functions efficient by avoiding repeated subproblems
- Write your own unit tests to ensure your algorithms are robust


[iteration]: https://en.wikipedia.org/wiki/Iteration
[recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[factorial]: https://en.wikipedia.org/wiki/Factorial
[linear search]: https://en.wikipedia.org/wiki/Linear_search
[binary search]: https://en.wikipedia.org/wiki/Binary_search_algorithm
[permutation]: https://en.wikipedia.org/wiki/Permutation
[combination]: https://en.wikipedia.org/wiki/Combination

[logarithms article]: slides/Logarithms.pdf
[algorithm analysis slides]: slides/AlgorithmAnalysis.pdf
[big O notation video]: https://www.youtube.com/watch?v=v4cd1O4zkGw
[asymptotic notation video]: https://www.youtube.com/watch?v=iOq5kSKqeR4
[computational complexity video]: https://www.youtube.com/watch?v=IM9sHGlYV5A

[recursive algorithms video]: https://www.youtube.com/watch?v=KEEKn7Me-ms
[old recursion video]: https://www.youtube.com/watch?v=t4MSwiqfLaY
[new recursion video]: https://www.youtube.com/watch?v=VrrnjYgDBEk
[stack frames video]: https://www.youtube.com/watch?v=beqqGIdabrE

[linear search video]: https://www.youtube.com/watch?v=vZWfKBdSgXI
[binary search video]: https://www.youtube.com/watch?v=5xlIPT1FRcA
[binary search algorithm video]: https://www.youtube.com/watch?v=P3YID7liBug

[BaseCS logarithms]: https://medium.com/basecs/looking-for-the-logic-behind-logarithms-9e79d7666dda
[IC logarithms]: https://www.interviewcake.com/article/python/logarithms
[IC big O]: https://www.interviewcake.com/article/python/big-o-notation-time-and-space-complexity
[SO big O]: https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation
[JA big O]: https://justin.abrah.ms/computer-science/big-o-notation-explained.html

[recursion starter code]: source/recursion.py
[recursion unit tests]: source/recursion_test.py
[search starter code]: source/search.py
[search unit tests]: source/search_test.py
