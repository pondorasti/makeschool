# Fizz Buzz Unit Tests

Fizz Buzz starter code for FEW 2.1

The goal of this project is to write unit tests for Fizz Buzz using Jest.

## Background

The contents of this repo contain an implementation of the Fizz Buzz program. You may have heard of Fizz Buzz before. This program counts to any value. Along the way it counts values that are multiples of 3 as `fizz` and values that are multiples of 5 as `buzz`. When a number is a multiple of 3 and 5 it counts this as a `fizzbuzz`. 

Call `fizzbuzz(count)` function inlcude a count and the function returns an object with the the counts of fizz, buzz, and fizzbuzz. 

Typical output might look like:  

`{ count: 100, fizz: 27, buzz: 14, fizzBuzz: 6 }`

The program has been broken down into several functions and a couple constants. 

You can test the code with node by running: 

`node index.js`

`index.js` contains a simple program that uses fizzbuzz functions.

## Getting started 

- Download or Clone this repo
- Navigate the terminal to the project directory
- `npm init -y`
- `npm install --save-dev jest`
- `mkdir tests`
- `touch tests/test.js`

Edit `package.json`: 

```json
"scripts": {
  "test": "jest"
}
```

Write your tests in `tests/test.js`. 

A typcial test with Jest looks like: 

```JavaScript
test('Sanity check', () => {

})
```

Run your tests with: 

`npm run test`

The example test above would be "passing" since it does not throw an error. 

Add an assertion: 

```JavaScript
test('Sanity check', () => {
  expect(2+2).toBe(5)
})
```

Run the test. Here the test fails since 2+2 != 5. 

Fix the math and run the test again. This time the test should pass. 

## Testing fizzbuzz

To test the fizzbuzz you'll need to import it into `tests/test.js`. Using a node.js environment you can use: 

`const fb = require('../fizzbuzz')`

From here you can access any of the methods and properties exported from `fizzbuzz.js`. 

`fb.fizzbuzz(16)`

or 

`fb.isFizzy(4)`

### What to test?

The `fizzbuzz.js` lib is made up of three constants, and four functions. You should write a test for each of these. 

Read the documentation closely and not the parameters and return values. Unit testing is all about inputs and outputs. Your tests should prove the output for a given input. 

## Challenges 

**Challenge 1** - Write a test for each of the constants. These should test be equal to the their string namesakes. 

**Challenge 2** - Test the `isFizzy(n)` function. This takes a number and returns true if the number is divisible by 3. Prove this with a unit test!

**Challenge 3** - Test the `isBuzzy(n)` function. This function takes n as a parameter and returns true if the number is divisible by 5. Prove this with a unit test. 

**Challenge 4** - Test the `fizzyBuzzy(n)` function. This function takes the parameter n and returns a string, 'fizz' if `n` is divisble by 3, 'buzz' if `n` is divisble by 5, and `fizzbuzz` if divisible by both 3 and 5. 

Note! in this case the string values should match the constant values `FIZZ`, `BUZZ` and `FIZZBUZZ`.

**Challenge 5** - Test the `fizzBuzz(count)` function. This function takes a Number `count` and returns an Object with details about the fizzy and buzziness of the `count`. 

You should test all of the properties in returned object. 

**Stretch Challenge 6** - Refactor the fizz buzz code. Take a look at make any changes you think would make the code more effiecient. Use your unit tests to make sure the code still works as expected. 

**Stretch Challenge 7** - Parameterize the `fizzbuzz()` function. Currently the function looks for multiples of 3 and 5. The code here would be more useful if we could look for multiples of any two values. Imagine fizz for multiples of 2 and buzz for multiples of 7. 

The fizzbuzz functio might look like this: 

`fizzBuzz(count, fizzOn = 3, buzzOn = 5)`

Use you unit tests to make sure the code is still working as you make changes. 

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




