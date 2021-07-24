# ES6 Concepts 

ES6 is only partially supported in modern browsers, the language itself has not been fully 
released yet (as of June 2017). 

ES6 is the new version of JavaScript. There is lots of new syntax. ES6 adds many new 
features that make writing JavaScript more efficient. By learning ES6 now you will be 
expanding your knowledge, keeping our skills up to date, and writing code more efficiently.

## Class Competencies

By the of this class students should be able to:

- Construct functions with the "fat arrow" syntax. 
- Define and identify when to use var, let, and const
- Apply the array deconstructor 

## Schedule 

|    | Time    | Type       | Description                          |
|----|---------|------------|--------------------------------------|
| 1  | 5 min   | Intro      | Class introduction                   |
| 2  | 10 min  | Lecture    | ES6 concepts                         |
| 3  | 10 min  | Discuss    | Students form groups and discuss     |
| 4  | 30 min  | Present    | Groups present to class              |
| -  | 10 min  | Break      | Doodle for inspiration               |
| 5  | 10 min  | lecture    | Map, Filter, Reduce                  |
| 6  | 35 min  | Challenges | Students work on challenges in pairs |
| =  | 110 min | Total Time | -                                    |

### Overview 

Short lecture introduces ES6 concepts to class. Students group up with each group
taking one ES6 concept to present. After discussing with group each group presents 
to the class on topic. 

Break

After break students pair up and work on challenges. 

## Some new concepts in ES6

The following is a short synopsis of some of the changes and new syntax introduced 
with ES6.

### var, let, and const

A functional and syntactical change in ES6 allows variables to be defined with:

- `var` : Nothing new here define a variable. Declared in a function sets the scope of that variable to the function. 
- `let` : This is new, and the same as var except in terms of scope, `let` scopes variables to a block. A block begins with `{` and ends with `}`. 
- `const` : Defines a constant. Variables defined const can't be mutated. 

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var

### Fat Arrow functions () => {}

This is a new way to define the same old functions you are already familiar with. 
Fat Arrow functions give you a new concise way to define functions. 

Old function: 

```
function myFunc(param) {}
```

or 

```
var myFunc = function(param) {}
```

New "fat arrow" functions: 

```
myFunc = (param) => {}
```

*Fat arrow functions treat `this` differently than normal functions!*

- [For more info](http://exploringjs.com/es6/ch_arrow-functions.html#sec_traditional-functions-bad-non-methods)

### Array spread orperator ...

ES6 offers a new operator that makes it easier to work with iterables. 

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator

## Your goals

Read and examine the example code [here](./index.html). Then try the challenges to check your knowledge. 

- [Example 2 ES6 Syntax](./index.html)

### Challenges 

After reading the material here and looking at the example try these challenges. The challenges
here also appear in comments at the bottom of the example. 

- For each of these challenges use the ideas from this file. Use the "fat arrow functions" 
() => {} and the ES6 style class defintion.
- Define a class that describes weather data it should take three parameters:
temp, date (use new Date() to make a date object), and description (eg cloudy, rainy etc.)
- Make an array of three weather Objects each with some different values. 
- Use reduce to calculate the average temp for all objects. 
- Use Map to return an array of strings that contain a full description of the weather. 
For example: "03-23-2016 Cloudy 56 degrees" where the info comes from each of the weather objects. 

### Review and Reseach

- [Learn ES6 Harmony](http://learnharmony.org/#/?_k=1udm62)

