<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Unit Testing

<small style="display:block;text-align:center">Unit Testing</small>

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](https://docs.google.com/presentation/d/1aBUDlkov4Bg3BHjALA3u6NQPDSsLvHNwgO-pzNvcl-4/edit?usp=sharing ':ignore')

### Video Lessons

- https://youtu.be/xXm_8DYjW6w
- https://youtu.be/04y5jPykoIY

<!-- > -->

## Overview

**Quality code** is test passing code. 

Unit testing is used to test **units of code**. 

Code that passes the test is **deemed quality** and fit for publication. 

Unit testing is a part of the **Agile Methodology**.

<!-- > -->

### Why use unit tests?

<!-- > -->

**Improves code quality** by exposing edge cases and finding bugs.

<!-- > -->

**Spots bugs earlier.** Using tests will bring bugs to light before you publish your app.

<!-- > -->

**Reduces defects** when integrating new features.

<!-- > -->

**Professionals use unit tests.** If you are planning to get a job with a company that employs more than a single developer, you will probably be writing unit tests at some point.

<!-- > -->

## Learning Objectives

By the end of this lesson you should by able to: 

1. Define unit testing
1. Identify what to test
1. Write Unit tests
1. Measure code coverage

<!-- > -->

## Unit Testing

<!-- > -->

**Q:** What is a unit test?

<!-- > -->

**A:** A unit test is a test of a software system, _usually a single function._ 

**Important! A unit test is most often testing the expected output of a function is correct for a given input.**

<!-- > -->

**Q:** How do you unit test?

<!-- > -->

**A:** Unit tests are run by software. 

In this class, we will use [Jest](https://jestjs.io).

<!-- > -->

**Q:** What is Jest?

<!-- > -->

**A:** [Jest](https://jestjs.io) is a JavaScript testing framework that was written by Facebook. It works with:

- JavaScript
- TypeScript
- Node
- React
- Vue
- Angular
- and more ...

<!-- > -->

**Q:** Why Jest?

<!-- > -->

**A:** It's it's straight forward to use and Jest works well with React. 

If you're building React apps Jest is a good choice. 

<!-- > -->

**Q:** How do you write a test?

<!-- > -->

**A:** Before writing a test you'll want to think about what you are testing and what the test will consider passing.

<!-- > -->

For example, you wrote a function that uppercases the first letter of a string. 

Your unit test might expect the following input and output:

<div><code>widget -> Widget</code></div>

<!-- > -->

## Testing example

<!-- > -->

**Heard of Fizz Buzz?** Everyone is writing this program but no one is writing tests! There are so many faulty FizzBuzz applications in the world we could have a major problem on our hands!

If you haven't heard of FizzBuzz take a quick read.

- https://en.wikipedia.org/wiki/Fizz_buzz
- https://www.tomdalling.com/blog/software-design/fizzbuzz-in-too-much-detail/
- https://wiki.c2.com/?FizzBuzzTest
- https://blog.codinghorror.com/why-cant-programmers-program/

<!-- > -->

Pair with someone **you haven't paired with before**.

The goal of this exercise is to write some tests with Jest that test the functions in the [Fizz Buzz sample code](https://github.com/Make-School-Labs/fizz-buzz-test).

**Download this repo now.** Download the repo as a zip file and unzip it.

<!-- > -->

### Getting Started Fizz Buzz

- Navigate the terminal to the directory
- `npm init -y` 

<!-- > -->

### Writing tests with Jest

Jest is a framework that you will use as a *dev dependency*. 

A dev dependency is one that is used for development but _not used in your source code_.

<!-- > -->

Add Jest:

- `npm install --save-dev jest`

`--save-dev` creates an entry under - `"devDependencies"` in your `package.json`. Look for this right now.

<!-- > -->

Now that jest is installed, you need a test command. Add this to `package.json`. Add/edit `package.json` to look like this:

```JSON
"scripts": {
  "test": "jest"
},
```

<!-- > -->

You'll run a test with:

`npm run test`

Try it now. You should see an error:

```
...
No tests found, exiting with code 1
...
```

You haven't written any tests yet so this makes sense.

<!-- > -->

Add a new directory named "tests".

- `mkdir tests`

Now add a new file `tests/test.js`. Your tests will be written here.  

- `touch tests/test.js`

<!-- > -->

When you run Jest it will look for any files with `test.js` in the name and run any test code found there. 

Jest logs the results of all tests to the console.

<!-- > -->

A test is run by calling:

```JavaScript
test(desc, callback)
```

You supply two parameters a *description string* and a *callback function*.

<!-- > -->

Open `test.js` and write a test:

```JavaScript
test('Sanity check', () => {

})
```

<!-- > -->

Run your test.

`npm run test`

You should see some output in the console.

```
...
 PASS  tests/test.js
  ✓ Sanity check (1ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
...
```

Looks like 1 test  passed out of a total of 1 test.

<!-- > -->

**What did you test?**

Nothing. The callback function will register an error **only** if any code executed inside it *throws an error*, otherwise the test is passing.

<!-- > -->

Add the following inside the callback.

```
test('Sanity check', () => {
  expect(2+2).toBe(5)
})
```

<!-- > -->

Run your test again. The test should *fail* this time.

```
...
Test Suites: 1 failed, 1 total
Tests:       1 failed, 1 total
...
```

### Assertions

`expect().toBe()` is an assertion. An assertion is you expressing the answer you are expecting to get. *Here you are saying you expect `2+2` to be `5`*. Expecting `2+2` to `5` is insane so the assertion fails.

<!-- > -->

Fix the test by changing `5` to `4` and run it again. This time the test passes since no error was thrown.

https://jestjs.io/docs/en/getting-started

<!-- > -->

## Testing Fizz Buzz

Your goal is to examine the source code and write some tests. The [Fizz Buzz sample code](https://github.com/Make-School-Labs/fizz-buzz-test) contains these functions. Each function takes some input and returns output. 

- `isFizzy()`
- `isBuzzy()`
- `fizzyBuzzy()`
- `fizzBuzz()`

<!-- > -->

When writing the tests for these functions ask yourself: 

What is the range of possible values am I expecting? 

What possible numbers do you think would be input? 

<small>What numebrs would you input if you were playing fizzbuzz?</small>

<!-- > -->

You'll need to import these methods into your `test.js`. The example code is set up for a Node. Use require at the top of the file:

`const fb = require('../fizzbuzz')`

All of the methods exported from `fizzbuzz.js` will be on the `fb` object. For example: 

`fb.fizzBuzz(16)`

<!-- > -->

The fizzbuzz package/module has 3 constants, and 4 methods. You should test them all!

Constants: 

- `FIZZ`
- `BUZZ`
- `FIZZBUZZ`

Methods: 

- `isFizzy(n: Number)`
- `isBuzzy(n: Number)`
- `fizzBuzzy(n: Number)`
- `fizzBuzz(n: Number)`

<!-- > -->

For example, the `isFizzy()` function takes a number and returns true if that number is divisible by 3. The test for this might look like:

```JavaScript
test('Test isFizzy', () => {
  expect(tests.isFizzy(1)).toBe(false)
  expect(tests.isFizzy(3)).toBe(true)
  expect(tests.isFizzy(4)).toBe(false)
  expect(tests.isFizzy(6)).toBe(true)
})
```

<!-- > -->

Use `expect(x).toBe(y)` to compare the value of x and y.

`expect(99).toBe(99)` passes

`expect(99).toBe(100)` throws an error


```JS 
function getAnswer() {
  return 42
}
...
expect(getAnswer()).tobe(42) // passes
```

<!-- > -->

### Testing basics 

**[`expect()`](https://jestjs.io/docs/en/expect)**

Use `expect()` to look at a value. Call one of these methods to check that value: 

- [`.toBe(value)`](https://jestjs.io/docs/en/expect#tobevalue) to compare primitive values
- [`.toEqual(value)`](https://jestjs.io/docs/en/expect#toequalvalue) to check equality of objects. This does a recursive "deep" check for equality. 
- [`.not`](https://jestjs.io/docs/en/expect#not) to check something is not the value you were expecting. 

See the link to the docs above for more information. 

<!-- > -->

## Activity

**Before writing any code.** Discuss with a partner what you are going to test. 

Describe the test you are going to write. Your partner should think of any edge cases or problems areas. Switch roles for each test you write.

Write tests for FizzBuzz. Write a test for each function.

<!-- > -->

Import fizzbuzz functions from `fizzbuzz.js` with require: 

`const fb = require('../fizzbuzz')`

From here you can all of any of the fizzbuzz methods on `fb` for example: 

- `fb.isFizzy(n)`
- `fb.isBuzzy(n)`
- `fb.fizzBuzz(n)`
- etc ...

<!-- > -->

Refer to the [Jest docs](https://jestjs.io/docs/en/getting-started.html) while you work. 

<!-- > -->

## Checking Coverage

How much of your code is covered by the test you wrote? Pretty good question huh?

Jest will automate this for you. 

`npx jest --coverage`

<!-- > -->

This should provide output similar to: 

```
----------|----------|----------|----------|----------|-------------------|
File      |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
----------|----------|----------|----------|----------|-------------------|
All files |    96.88 |      100 |       80 |    96.55 |                   |
 index.js |    96.88 |      100 |       80 |    96.55 |                70 |
----------|----------|----------|----------|----------|-------------------|
```

This tells you what % of code statements were covered by the tests. What % of code branches were covered, these are if else, switch cases etc. What % of functions were tested. What % of lines of code were tested, and line numbers for lines of code that were not tested. 

Check coverage and identify what has not been tested. 

<!-- > -->

### Debriefing the tests

Discuss these questions

- What did you test?
- What was easy to test?
- What was difficult to test?
- How many things did a test have to look at?
- Are you confident that your tests will catch errors that might arise with any possible input?

<!-- > -->

## Testing the string functions

To use your library in your tests you'll need to import it. Tests are run in the Node environment use `require()` to import them as a module.

`const lib = require('../index.js')`

Modify the line above to suit your situation. The name of the var can be anything. The path and name to point to your string lib relative to `test.js`.

<!-- > -->

Note! If your functions are global or they are added to the prototype of a global object you can just use something like:

`require('../index.js')`

<!-- > -->

Use the coverage command with Jest to test the coverage of your tests. 

<!-- > -->

### Homework

[Add Unit Tests](../assignments/assignment-03.md)

<!-- > -->

## Wrap Up

- Q: Why use unit tests? 
- Q: What makes a good test?
- Q: What is Jest?

<!-- > -->

## Additional Resources

1. https://github.com/Make-School-Labs/fizz-buzz-test
1. https://jestjs.io


<!-- > -->

## Minute-by-Minute 

| **Elapsed** | **Time** | **Activity** |
| ----------- | -------- | ------------ |
| 0:10 | 0:10 | [Overview](#overview) (Lecture) |
| 0:05 | 0:15 | [Learning Objectives](#learning-objectives) (Lecture) |
| 0:10 | 0:25 | [Unit Testing](#unit-testing) (Discussion) |
| 0:15 | 0:40 | [Testing Example](#testing-example) (Demo/setup) |
| 1:00 | 1:40 | [Testing Fizz Buzz](#testing-fizz-buzz) (Activity) |
| 0:10 | 1:50 | BREAK |
| 0:15 | 2:05 | Discuss Testing |
| 0:30 | 2:35 | Start Homework |
| 0:10 | 2:45 | Wrap up |