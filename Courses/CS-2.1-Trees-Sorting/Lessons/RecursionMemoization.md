## Recursion & Memoization

### Topics
- Revisit [recursion] with [memoization]
  - [Fibonacci] sequence
  - [Change-making problem]
<!-- - [Dynamic programming] -->
<!-- - [Combinatorial optimization], [greedy algorithms] -->

### Resources
- Play with VisuAlgo's [interactive visualizations of recursion and memoization][VisuAlgo recursion]
<!-- - Read Nabil Khaja's [memoization and decorators article] with code samples -->
- Read WikiBooks's Algorithms book chapter on [memoization and dynamic programming][Wikibooks dp]
<!-- - Read about [greedy algorithms][Wikibooks greedy] on WikiBooks -->

### Challenges
- Implement the [fibonacci] function with memoization and dynamic programming using [recursion starter code]
  - Run `python recursion.py <int>` to test `fibonacci` function on a number argument
      - Example: `python recursion.py 10` gives the result `fibonacci(10) => 55`
  - Run `pytest recursion_test.py` to run the [recursion unit tests] and fix any failures
  - Annotate functions with complexity analysis of running time and space (memory)
  - Benchmark performance of plain recursion versus memoized recursion
- Solve [HackerRank's coin change problem] and commit your solution code to your repository

### Stretch Challenges
- Implement [permutation] and [combination] functions and optimize their performance using memoization
- Implement `@memoized` [decorator] function to easily memoize any recursive function

[recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[memoization]: https://en.wikipedia.org/wiki/Memoization
[dynamic programming]: https://en.wikipedia.org/wiki/Dynamic_programming
[combinatorial optimization]: https://en.wikipedia.org/wiki/Combinatorial_optimization
[greedy algorithms]: https://en.wikipedia.org/wiki/Greedy_algorithm

[factorial]: https://en.wikipedia.org/wiki/Factorial
[fibonacci]: https://en.wikipedia.org/wiki/Fibonacci_number
[permutation]: https://en.wikipedia.org/wiki/Permutation
[combination]: https://en.wikipedia.org/wiki/Combination

[change-making problem]: https://en.wikipedia.org/wiki/Change-making_problem
[HackerRank's coin change problem]: https://www.hackerrank.com/challenges/coin-change

[Wikibooks greedy]: https://en.wikibooks.org/wiki/Algorithms/Greedy_Algorithms
[Wikibooks dp]: https://en.wikibooks.org/wiki/Algorithms/Dynamic_Programming
[VisuAlgo recursion]: https://visualgo.net/recursion

[decorator]: https://wiki.python.org/moin/PythonDecorators
[memoization and decorators article]: https://medium.com/@nkhaja/memoization-and-decorators-with-python-32f607439f84

[recursion starter code]: ../Code/recursion.py
[recursion unit tests]: ../Code/recursion_test.py
