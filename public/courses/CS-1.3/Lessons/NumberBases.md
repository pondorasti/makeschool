# Number Bases

## Important Links
- [Number Bases Slides](https://docs.google.com/presentation/d/1-1DyXDG2XGJ4rh1YR5UA2aQfSiy7_HPC1wAjwqF8G9o/edit#slide=id.g827cbc5ae4_0_78)
- [Number Bases Coding Challenge Starter Code](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/tree/master/Code/number-bases)
- [Number Bases Coding Challenge Rubric](https://drive.google.com/file/d/1QMm-cc0jieP-sLXOsXGxNPupz5FYYP0C/view?usp=sharing)

SUBMIT YOUR CODING CHALLENGE ON GRADESCOPE BY THE DUE DATE

## Topics
- Number bases: [decimal], [binary], [hexadecimal]
- [Signed number representations]: signed magnitude, [ones' complement], [two's complement]

## Resources
- Review Make School's [slides on number bases][number bases slides]
- Read BetterExplained's [article on number systems and bases][number bases article]
- Read Vaidehi Joshi's [articles on binary][BaseCS binary] and [hexadecimal][BaseCS hexadecimal] with beautiful drawings and excellent examples
- Play with Dan Wolff's live-updating [base conversion calculator]
- Review Wikipedia's [comparison table] of signed number representations
- Print and make a [Flippy Do] binary converter following Code.org's [instructions][Flippy Do instructions]
- Watch Harvard's [hexadecimal video]
- Watch Corey Schafer's [understanding bases video]
- Watch Tech Quickie's [numbers and base systems video]
- For a non-computer activity to help with binary conversion, do this [CS Unplugged Binary Card Activity](https://classic.csunplugged.org/wp-content/uploads/2014/12/unplugged-01-binary_numbers.pdf) at home!

## Challenges
- Practice binary and hexadecimal conversions on [number bases worksheet]
- Implement base conversion functions for unsigned numbers using [starter code]:
    - Implement `decode` - decode digits in any base to a number
    - Implement `encode` - encode a number to digits in any base
    - Implement `convert` - convert digits in any base to digits in any base
    - Run `python bases.py number base1 base2` to test `convert` on `number`
        - Example: `python bases.py 42 10 2` should give the result `101010`
    - Run `pytest bases_test.py` to run the [unit tests] and fix any failures
- Write additional unit tests to ensure your conversion algorithms are robust

## Stretch Challenges
- Implement base conversion for fractional numbers using a [radix point] (try playing with the [base conversion calculator] to see how this works)
- Implement base conversion for negative binary numbers (using [two's complement])

<!--## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Factoid of the day                |
| 0:05        | 0:15      | Learning Outcomes/Course Overview                  |
| 0:20        | 0:10      | Flippy Do Worksheet       |
| 0:30        | 0:25      | TT: Base Ten vs Base Two                      |
| 0:55        | 0:15      | Integers and Bases Worksheet      |
| 1:10        | 0:25      | TT: Base 16                      |
| 1:35        | 0:15      | Integers and Bases Worksheet Pt 2      |
| 1:50        | 0:05      | Negative Numbers      |
| 1:55        | 0:05      | Wrap up      |
| TOTAL       | 2:00      |                           |-->

## Factoid of the day (5 min)

- Ask class what data structures they already know, distinguish between data structures and types
- Present the ["simplest programming language"](https://en.wikipedia.org/wiki/Brainfuck)

## Learning Outcomes/Course Overview (15 min)

### Learning Outcomes
By the end of this lesson, students should be able to...

1. Explain the difference between decimal, binary, and hexadecimal based numbers
1. Practice converting between decimal, binary, and hexadecimal
1. Differentiate between signed and unsigned numbers in binary

### Course Overview

- Provide a high level outline of what the course is going to be covering of the next 7 weeks
- Emphasize how the concepts used here can be used in a technical interviews
- Plaegerism is not tolerated for any assignment in this class. AT ALL.

## Flippy Do Worksheet (10 min)

Each person should fill out the [Flippy Do worksheet](https://drive.google.com/file/d/0B6iNirqJ5EuVVTlla0RpR2RIa2s/view), following the [guide on how to fill it out](https://docs.google.com/document/d/1QnD9khmPUz1az3ZLc5L8vavR6lU0uScspotRhORnHxE/edit)

## TT: Base Ten vs Base Two (25 min)

- Reminder that slides can be found in course repo

### Base Ten

- Review of what Base 10 (decimal) is, and how we use it.
- Everyone uses base 10 today
- There are ten digits.
- The size of the base are reflective of the amount of numbers in that base (0-9)
- Go over concept of **"carrying" or "rolling over"** (i.e. 9 rolls over to 10)

### Base Two

- How computers represent information
- Two digits: 0 and 1
- 1 rolls over to 10, 11 rolls over to 100
- 10 != ten, 10 == two or "one-zero"
- Like how we go from 99 to 100 in base ten, we go from 11 to 100
- Ask students to say how numbers one through ten would be represented in base two

#### Counting in Binary

- All even numbers end in 0
- All odd numbers end in 1
- That extra 1 in the final digit represents exactly that: the number one!

##### Whiteboard Demo

Go over example of powers of ten in base ten:

- i.e. 4236 is `4*1000+2*100+3*10+6*1`

Now relate to how in base two, we have the same concept, but with powers of two

- i.e. 1100 is twelve: `1*8+1*4+0*2+0*1`

Both base ten and two always start with base^0, which is why they're always equal to 1.

- 10^0 and 2^0 both equal 1

##### Binary to Decimal

- To convert, start from one end of the number and go through it, progressivly adding powers of two depending on if the **bit** is 0 or 1
- Brief history of language: digits --> binary digits --> bidgits --> bigits --> **bits**

## Integers and Bases Worksheet (15 min)

### Individual Work (10 min)
Each person should fill out the _first two sections_ of [number bases worksheet]

- Note that students should have 8 bits in your answer
- Use subscripts to notate what base a number is in
- Common practice to group binary numbers into 4 bits. Similar to how we use commas in base ten
- Hold on sign mangnitude section for now
- Visit [Base Convert](https://baseconvert.com/) to check your answers

### Peer Review (5 min)

- Compare/contrast answers with a neighbor, and how you each arrived to your solutions
- Discuss conversion strategies, and try to find a neighbor that used a different one than you did

## TT: Base 16 (25 min)

- **Hexidecimal** - base-16, more simply known as "hex"
- Common to represent a number as hex, even though computers use binary, because:
    -  There's a simple conversion betweeb base-2 and base-16
    -  They're easier to write out
- 16 digits: 0-9, A-F
    -  9 rolls over to A, F rolls over to 10
    -  99 rolles over to 9A, FF rolls over to 100
- A == 10, B == 11 ... F == 15
- **very important for frontend engineers!**
    - Used for colors
    - Used to represent symbols
- Note max value is always one less than the base (i.e. 15 for base-16)

### Base 64 interlude

Give brief history of how base 64 is used for the web, commonly used to pass information through URLs. We won't be using it in this class though

### Back to Base-16
- 10 will always be the base number in any base
    - 10 is two in binary, ten in base-10, and sixteen in base-16
- Hex is often prefixed `0x`, makes it easier to differentiate from a variable name in programming languages
- Subscript with 16 to also help differentiate
- Counting in Hex: 0-F, 10-1F, 20-2F, ... 90-9F, A0-AF, B0-Bf, etc.
- If listed in a grid, numberes change by 16 per row

### Hex to Binary

- Every hex digit is 4 binary digits (bits)
    - i.e. 0x05 = 0101
- Can take two hex numbers, and convert them to two 4-digit binary numbers and then combine them to get a valid binary number
    - i.e. 0x72 = 0111 0010
    - **can independently convert hex digits into binary!**
- **Can use this same idea to also go from binary to hex!**
- Processors can easily convert chunks of hex into binary because of this!

## Integers and Bases Worksheet Pt 2 (15 min)

Each person should fill out the hex section of the [number bases worksheet]

- Can work with a partner, but you'll need to understand this on your own to do the homework!
- Tip: write out some basic hex/binary conversions to use for help

## Negative Numbers (5 min, only if there is extra time)

Cover if time is available, only needed for stretch challenges.

There are a few different ways to represent negative numbers:

- **Signed Magnitude**: leftmost bit indicates sign: 0 is positive, 1 is negative
- Base-10 to Base-2 equivalents:
    - 72 <--> 0100 1000
    - -72 <--> 1100 1000
- **One's compliment**: flip all the bits to switch between positive and negative numbers
- Base-10 to Base-2 equivalents:
    - 72 <--> 0100 1000
    - -72 <--> 1011 0111
    - **One's compliment Addition**: Add the two numbers, and if there's a carry, do an _end-arround carry_ (add it back to the sum)
- **Two-s Compliment**: most way processors represnt negatives, to negate a two's compliment number, invert/flip all the bits and then add 1
    - other technique: starting from the right, find the first 1, invert all the bits to the left of that 1
- Base-10 to Base-2 equivalents:
    - 72 <--> 0100 1000
    - -72 <--> 1011 1000

## Wrap up (5 min)

1. Finish the worksheet except for the negative numbers section (that section is a stretch challenge)
1. Go over resources
1. Present overview of the coding challenges due next class.

## Code Review in Pairs (25 min)

- In groups of 2-3, go over solutions for the Decode and Encode coding challenges from last class
- A few students will be chosen after to go up and present their solutions

## Code Review Presentation (30 min)

- Chosen students present their solutions for Decode and Encode
- After presenting, the instructor goes over the solution in detail on a white board

**Tip:** Make a table to help walk through iterations of a for loop. This can help with mapping out predictions of what you expect the code to output.


[decimal]: https://en.wikipedia.org/wiki/Decimal
[binary]: https://en.wikipedia.org/wiki/Binary_number
[hexadecimal]: https://en.wikipedia.org/wiki/Hexadecimal
[signed number representations]: https://en.wikipedia.org/wiki/Signed_number_representations
[comparison table]: https://en.wikipedia.org/wiki/Signed_number_representations#Comparison_table
[ones' complement]: https://en.wikipedia.org/wiki/Ones%27_complement
[two's complement]: https://en.wikipedia.org/wiki/Two%27s_complement
[radix point]: https://en.wikipedia.org/wiki/Radix_point

[number bases slides]: ../Slides/NumberBases.pdf
[number bases worksheet]: ../Slides/NumberBasesWorksheet.pdf
[number bases article]: https://betterexplained.com/articles/numbers-and-bases/
[BaseCS binary]: https://medium.com/basecs/bits-bytes-building-with-binary-13cb4289aafa
[BaseCS hexadecimal]: https://medium.com/basecs/hexs-and-other-magical-numbers-9785bc26b7ee

[base conversion calculator]: https://baseconvert.com/
[Flippy Do]: https://drive.google.com/file/d/0B6iNirqJ5EuVVTlla0RpR2RIa2s/view
[Flippy Do instructions]: https://docs.google.com/document/d/1QnD9khmPUz1az3ZLc5L8vavR6lU0uScspotRhORnHxE/edit
[hexadecimal video]: https://www.youtube.com/watch?v=nrFHGtGdOzA
[understanding bases video]: https://www.youtube.com/watch?v=ZL-LhaaMTTE
[numbers and base systems video]: https://www.youtube.com/watch?v=LpuPe81bc2w

[starter code]: ../Code/bases.py
[unit tests]: ../Code/bases_test.py
