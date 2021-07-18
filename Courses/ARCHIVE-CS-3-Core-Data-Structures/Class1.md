## Class 1: Number Bases

### Topics
- Number bases: [decimal], [binary], [hexadecimal]
- [Signed number representations]: signed magnitude, [ones' complement], [two's complement]

### Resources
- Review Make School's [slides on number bases][number bases slides]
- Read BetterExplained's [article on number systems and bases][number bases article]
- Read Vaidehi Joshi's [articles on binary][BaseCS binary] and [hexadecimal][BaseCS hexadecimal] with beautiful drawings and excellent examples
- Play with Dan Wolff's live-updating [base conversion calculator]
- Review Wikipedia's [comparison table] of signed number representations
- Print and make a [Flippy Do] binary converter following Code.org's [instructions][Flippy Do instructions]
- Watch Harvard's [hexadecimal video]
- Watch Corey Schafer's [understanding bases video]
- Watch Tech Quickie's [numbers and base systems video]

### Challenges
- Practice binary and hexadecimal conversions on [number bases worksheet]
- Implement base conversion functions for unsigned numbers using [starter code]:
    - Implement `decode` - decode digits in any base to a number
    - Implement `encode` - encode a number to digits in any base
    - Implement `convert` - convert digits in any base to digits in any base
    - Run `python bases.py number base1 base2` to test `convert` on `number`
        - Example: `python bases.py 42 10 2` should give the result `101010`
    - Run `pytest bases_test.py` to run the [unit tests] and fix any failures
- Write additional unit tests to ensure your conversion algorithms are robust

### Stretch Challenges
- Implement base conversion for fractional numbers using a [radix point] (try playing with the [base conversion calculator] to see how this works)
- Implement base conversion for negative binary numbers (using [two's complement])


[decimal]: https://en.wikipedia.org/wiki/Decimal
[binary]: https://en.wikipedia.org/wiki/Binary_number
[hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[signed number representations]: https://en.wikipedia.org/wiki/Signed_number_representations
[comparison table]: https://en.wikipedia.org/wiki/Signed_number_representations#Comparison_table
[ones' complement]: https://en.wikipedia.org/wiki/Ones%27_complement
[two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[radix point]: https://en.wikipedia.org/wiki/Radix_point

[number bases slides]: slides/NumberBases.pdf
[number bases worksheet]: slides/NumberBasesWorksheet.pdf
[number bases article]: https://betterexplained.com/articles/numbers-and-bases/
[BaseCS binary]: https://medium.com/basecs/bits-bytes-building-with-binary-13cb4289aafa
[BaseCS hexadecimal]: https://medium.com/basecs/hexs-and-other-magical-numbers-9785bc26b7ee

[base conversion calculator]: https://baseconvert.com/
[Flippy Do]: https://drive.google.com/file/d/0B6iNirqJ5EuVVTlla0RpR2RIa2s/view
[Flippy Do instructions]: https://docs.google.com/document/d/1QnD9khmPUz1az3ZLc5L8vavR6lU0uScspotRhORnHxE/edit
[hexadecimal video]: https://www.youtube.com/watch?v=nrFHGtGdOzA
[understanding bases video]: https://www.youtube.com/watch?v=ZL-LhaaMTTE
[numbers and base systems video]: https://www.youtube.com/watch?v=LpuPe81bc2w

[starter code]: source/bases.py
[unit tests]: source/bases_test.py
