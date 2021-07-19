# FEW 2.1 - Assignment 5 - Math Lib

## Description 

The goal of this assignment is to practice everything you learned so far in lessons 1 through 4 and practice those skills making another library! 

### Why this assignment?

Doing something once isn't enough. To claim mastery you need to put your skills to use everyday. You also need to revisit skills and put them to use in new places. 

Math and Numbers in JS can produce unexpected results sometimes. With this library you will dig into both and see how they work by writing a set of utilities.

## Project requirements

Create a new repo on GitHub to host your code.

The code you write should be a set of functions that solve the problems below. 

All of your code should be unit tested.

Add continuous Integration. Your repo should be connected to Travis CI and code coverage. 

The README in your repo should inlcude Badges that show the status and meta information about your repo. 

- Version 
- Size
- Build Passing
- Coverage 

Your README should also include some professional documentation. This will include a description of the library, and formatted code samples. 

### Challenges 

- **Challenge 1** GoldenRatio - Add a new **property** to Number that is the [Golden Ratio](https://en.wikipedia.org/wiki/Golden_ratio)
  - Example: `Number.goldenRatio // 1.61803398875`
  - Strategy: `Number.prototype = 1.61803398875`
  - Stretch: Calculate the golden ratio with math
- **Challenge 2** Number Methods: round, floor, ceil - These functions already exist on the Math Object, your job is to make a method on Number that does the same thing. Rather than `Math.round(x)` your method will work like this: `x.round()` or `(1.99).round()`. 
  - `round()` - `x = 9.99` - `x.round()` -> 10  
  - `floor()` - `x = 9.99` - `x.floor()` -> 9
  - `ceil()` - `x = 1.03` - `x.ceil()` -> 2
- **Challenge 3** `pad(x, y)` - pads Number with `x` 0s before, and `y` 0s after. 
  - Example: `34.801.pad(4,4)` -> 0034.8010 (notice the 0s added ont he left and right sides)
- **Challenge 4** `degToRad(n)` - I'm surprised this function is not included with JS.
  - Example: `degToRad(45)` -> `0.785`
  - Strategy: Write a function that takes a number and returns the results of this formula: `deg * (Math.PI / 180)`
  - Stretch Goal: Check for invalid input. If the value input is not a number or is not included the function should throw and error.  
- **Challenge 5** `radToDeg(deg)` - Covert radians to degrees.
  - Example: `radToDeg(0.785)` -> `44.977`
  - Strategy: Write a function that takes a number and returns calculation from this formula: `radians * (180 / Math.PI)`
  - Stretch Goal: Check for invalid input. If the value input is not a number or is not included the function should throw and error.  
- **Challenge 6** `toDollars(amount)` - Formatting money is a common task for software projects. A function could save you time in the future. The goal of this function is to take a numeric value and return a string beginning with a '$' and rounded to two decimal places. 
  - Example: `toDollars(3.9)` -> `$3.90` (Note: pads with a 0)
  - Strategy: The `Number.toFixed(n)` method will do most of the work for you!
  - Stretch Goals: Create a currency formatting function that simplifies the use of: [`Intl.NumberFormat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat)
    - `intFormat(amount, countryCode, style)`
  - Stretch Goal: Add the Money Class to your Library (from the in class exercise).
- **Challenge 7** `tax(rate)` - Returns the tax amount
- Example: `tax(rate)` - returns the amount with tax
- **Challenge 8** `interest(total, year, rate)` - Write a function that calculates the interest over time. 
  - Example: https://stackoverflow.com/questions/28325001/how-to-calculate-interest-javascript
- **Challenge 9** `mortage(principal, numberOfPayments, interestRate)`.
  - Example: https://stackoverflow.com/questions/17101442/how-to-calculate-mortgage-in-javascrip 
- **Challenge 10 - Stretch** `intToHex(int)` -> #332211 
  - Example: https://stackoverflow.com/questions/57803/how-to-convert-decimal-to-hexadecimal-in-javascript
- **Challenge 11 - Stretch** Random functions 
  - `random(n)` - returns an integer from 0 to n - 1
  - `randomRange(min, max)` - returns an integer from min to max.
  - `randomHexColor()` - Returns a random hex color
  - `randomRGBColor()` - Returns a random hex color

### Super Stretch Goal

If all of the above challenegs were too easy try this. The idea is create Class that represents a really big number. 

Funny thing is the largest number you can handle in JS is: `9007199254740991`, I've scored more points in some of my favorite video games. That's: 

> nine quadrillion seven trillion one hundred ninety-nine billion two hundred fifty-four million seven hundred forty thousand nine hundred ninety-one

Or `11111111111111111111111111111111111111111111111111111` in binary!

The smallest is: `-9007199254740991` by the way. These numbers are the `Number.MAX_SAFE_INTEGER` and `Number.MIN_SAFE_INTEGER`. They are the largest numbers that are safe for doing math operations. 

It's possible you may need to deal with numbers larger than this. Think about data science, science, space travel, and the best video games these all need really big numbers! 

How will you deal with super ginormous? You'll use a string. Strings can have an alomost unlimited number of characters. 

- BigInt - Is class that tracks extra large integer values. I hear these are great for Incremental games. BigInt holds a large number as a string. It provides methods that perform math operation. 
  - `new BigInt(value = 0)` - Initialize with a value or 0. 
  - `BigInt.add(x)` - adds x to the value. Since value is a String you need add the first digit to the first digit held in value and carry the one if the total is over 10. Do the same with the 10s and 100s etc. This is just like adding numbers with pencil and paper.
    - Q: Is this legit? A: Yes! There are a couple libraries that do this. Computers have a limit to how large a number they can handle. In most cases this is enough. For some uses you need larger numbers. 
  - `BigInt.subtract(x)` - Subtracts x from the value of BigInt. 
    - Advanced
      - `BigInt.multiply(x)` - Multiplies the BigInt value by x. 
      - `BigInt.divide(x)` - Divides the BigInt value by x. 

### Deliverable

Include a link to your new repo in the course [progress tracker](https://docs.google.com/spreadsheets/d/1o-43DQx161lJKnmALW6NxnERggGn4lP5GOgCjDXcZBo/edit#gid=1456006823).  

### Due date

Class 7 - Mon, April 20 

## Assessing the assignment

| Expectations | Does not meet              | Meets                 | Exceeds                          |
|:-------------|:---------------------------|:----------------------|:---------------------------------|
| Completion   | <100% of functions written | All functions written | Includes all stretch functions   |
| Quality      | code is sloppy and throws errors or shows linting errors |Well written few to no errors | Includes comments, and variable, parameter, and function names are self documenting  |
| Comprehension| Can't explain the code written | Can explain the code | Could write the code again from scratch |
| Tests        | <100% test coverage | 100% Test coverage | - |
| Best Practices | Does not use CI | Uses CI | - |
| Work ethic   | few massive commits | Commits outline progress | Clearly show progression of the work |