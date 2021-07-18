# String Algorithms

## Important Links

- [Slides](https://docs.google.com/presentation/d/1KE-qfPeadgs8Ogq9Eb2-AcFd8XGjm1Ge2rpdBQN741U/edit#slide=id.g831eb0c475_0_108)
- [Starter Code](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/tree/master/Code/palindromes-and-strings)
- [Rubrics](https://drive.google.com/file/d/1QMm-cc0jieP-sLXOsXGxNPupz5FYYP0C/view)

## Topics
- [Palindromes]: strings that read the same forwards and backwards, ignoring punctuation, whitespace, and letter casing
- [String searching]: find occurrences of a pattern in a longer string of text
- [Permutation]: arrangement of all items in a set into a sequence or order
- [Anagrams]: permutations of words or phrases that produce another word
- [Unit testing]: testing code in isolation using repeatable test cases with known results

## Learning Outcomes

By this end of this lesson, students should be able to...

1. Explain various string algorithms such as searching and permutation
1. Practice writing unit tests for their code

## Resources
- Read Stack Overflow's answers to the question "[What is unit testing?]"
- Read The Hitchhiker's Guide to Python's tutorial on [testing your code]
- Consult documentation for Python's [`unittest` module] and [`pytest` tool]
- Play around with Wordsmith's [Internet Anagram Server]
- Watch HackerRank's [anagram problem solution video]

## Challenges
- Implement palindrome checking functions using [palindromes starter code]:
    - Implement `is_palindrome_iterative` - iterative version of `is_palindrome`
    - Implement `is_palindrome_recursive` - recursive version of `is_palindrome`
    - Run `python palindromes.py string1 string2 ... stringN` to test `is_palindrome`, for example:
        ```
        $ python palindromes.py ABC noon RaceCar 'Taco, Cat'
        FAIL: 'ABC' is not a palindrome
        PASS: 'noon' is a palindrome
        PASS: 'RaceCar' is a palindrome
        PASS: 'Taco, Cat' is a palindrome
        ```
    - Run `pytest palindromes_test.py` to run the [palindromes unit tests] and fix any failures
- Implement string searching functions (try both iterative and recursive versions) using [strings starter code]:
    - Implement `contains(text, pattern)` - a boolean indicating whether `pattern` occurs in `text`
    - Implement `find_index(text, pattern)` - the starting index of the first occurrence of `pattern` in `text`
    - Implement `find_all_indexes(text, pattern)` - a list of starting indexes of all occurrences of `pattern` in `text`
    - Run `python strings.py text pattern` to test string searching algorithms, for example:
        ```
        $ python strings.py 'abra cadabra' 'abra'
        contains('abra cadabra', 'abra') => True
        find_index('abra cadabra', 'abra') => 0
        find_all_indexes('abra cadabra', 'abra') => [0, 8]
        ```
    - Run `pytest strings_test.py` to run the [strings unit tests] and fix any failures
- Write additional test cases to expand the [strings unit tests] to ensure your string searching algorithms are robust
    - Include several test cases that are both positive (examples) and negative (counterexamples)
- Refactor functions to increase code reuse and avoid duplication ([DRY principle])
- Annotate functions with complexity analysis of running time and space (memory)

## Stretch Challenges
- Implement permutation generating functions (try both iterative and recursive versions)
- Implement anagram generating functions (try both iterative and recursive versions)
    - *Hint:* Use the Unix dictionary words list located at: `/usr/share/dict/words`

<!--## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:03      | Progress Tracker                |
| 0:03        | 0:02      | Factoid of the Day                  |
| 0:05        | 1:20      | Code Review + Presentations       |
| 1:25        | 0:10      | TT - Algorithm Analysis                     |
| 1:35        | 0:10      | Break      |
| 1:45        | 0:05      | Wrap up      |
| TOTAL       | 1:50      |                           |-->

## Progress Tracker (3 min)

- Fill out attendance, challenges completed, etc.
- Turn in Binary/Integers worksheet up at the front of class

## Factoid of the Day (2 min)

[Binary Coins from Thingiverse](https://www.thingiverse.com/thing:3512086) that represent powers of two


## Palindromes (15 min)
- Discuss Palindrome Notes with a partner.  Compare iterative and recursive solutions.

## Code Review + Presentations (80 min)
### Student Code Review Presentation (Palindrome) (20 min)
Iterative Solution Highlights:
- Find left and right bound then compare left to right
    - if not same done
    - if all same - return true
- Run through a small example on the board of a translator method to translate string to comparable string.
`"Taco? Cat!" ->"Taco Cat" -> "TacoCat" -> "tacocat"`
-  Example of loop: draw an arrow pointing to comparisons t to t, a to a, c to c, o (middle)
- look at < vs <= to show both work in this case
- unit tests of even and odd length words test boundary cases.

#### Complexity (5 min)
- What is the complexity of the iterative solution?
    - Only have to look at 1/2 the string, not every character. n/2 iterations `O(n^2)`
- Separate preamble (translator creation) from input (string) dependent code.  Thus not calling a method every time when not needed.
- Optimize by `.lower` on letter inside the conditional.
    - does this work with order of operations? (yes values are computed before compared)

### Student Code Review Presentation (Palindrome - Recursive) (15 min)
Recursive Solution Highlights:
- set left and right values
- translate to a comparable string by recursively moving if it is not in LETTERS (set of ascii values)

**Tips:**
- Build example on the whiteboard showing how right and left move until they get to a letter and then do a compare.
- Show the recursive stack unwinding on the whiteboard

### Break (10 min)

### Pair Code Review  (30 min)
- Review your findIndex method with a partner.

### Student Code Review Presentation (findIndex) (20 min)
- Create a diagram of how it works in code comments for future reference and on the whiteboard

EX: Check if "nas" is in "bananas"
- letters of "bananas" for the labels of the columns
- letters of "nas" labels of rows
- loop through letters in bananas to check if "nas" is in "bananas"
- if so will have one check per row under corresponding col of "bananas"

```
    INITIAL MATRIX
    [| |b|a|n|a|n|a|s|]
    [|n| | | | | | | |]
    [|a| | | | | | | |]
    [|s| | | | | | | |]

    MATRIX AFTER ALGORITHM
    [| |b|a|n|a|n|a|s|]
    [|n|X|X|O|X|O| | |]
    [|a| | | |O| |O| |]
    [|s| | | | |X| |O|]
```

#### Complexity

- Algorithm analysis - area of the rectangle (length of text * length of pattern) : O(nm)

## Break (10 min)

## Wrap Up (5 min)

Go over what the challenges for next class, and allow for clarifying questions


[unit testing]: https://en.wikipedia.org/wiki/Unit_testing
[`unittest` module]: https://docs.python.org/3/library/unittest.html
[`pytest` tool]: http://docs.pytest.org/en/latest/
[what is unit testing?]: http://stackoverflow.com/questions/1383/what-is-unit-testing
[testing your code]: http://docs.python-guide.org/en/latest/writing/tests/
[DRY principle]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself

[string searching]: https://en.wikipedia.org/wiki/String_searching_algorithm
[palindromes]: https://en.wikipedia.org/wiki/Palindrome
[permutation]: https://en.wikipedia.org/wiki/Permutation
[anagrams]: https://en.wikipedia.org/wiki/Anagram
[Internet Anagram Server]: http://www.wordsmith.org/anagram/
[anagram problem solution video]: https://www.youtube.com/watch?v=3MwRGPPB4tw

[palindromes starter code]: ../Code/palindromes.py
[palindromes unit tests]: ../Code/palindromes_test.py
[strings starter code]: ../Code/strings.py
[strings unit tests]: ../Code/strings_test.py
