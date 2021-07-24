<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 2 - JavaScript Professional Best Practice

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](https://docs.google.com/presentation/d/1rPysF_OH56K4KWP5-coqoreRpVyDm8iYPXsOwhM9ods/edit?usp=sharing)

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ----------- |
| 0:05 | 0:05 | Roll |
| 0:10 | 0:05 | [Class Learning Objectives](#class-learning-objectives) (Lecture) |
| 0:20 | 0:10 | [Code Quality](#code-quality) (Discussion) |
| 0:40 | 0:20 | [ESLint - Setup](#eslint) (Lab) |
| 1:40 | 0:60 | [ESLint - Lab](#lab) (Lab) |
| 1:50 | 0:10 | Break |
| 2:00 | 0:10 | [JS Best Practice](#js-est-practice) |
| 2:40 | 0:40 | Code Review/Lab Time |
| 2:45 | 0:05 | [Homework](#homework) |

<!-- > -->

## Class Learning Objectives

- Describe linting
- Use ESLint
- Evaulate your work against profesional standards

<!-- > -->

## Overview

This class will look at the JS you wrote in the tutorial and improve and upgrade it to modern and professional standards.

<!-- > -->

## Code Quality 

Pair up and discuss code quality. Answer these questions:

- What is code quality?
- What does high quality code look like?
- How do you write better quality code?

<!-- > -->

- Consistent style 
    - Reads well to Everyone on your team 
    - Uses consistent syntax 
        - `{}` or `new Object()`
- Uses up to date best practices
    - e.g. `const` > `let` > `var`
    - Uses deconstruction
    - Uses template strings over concatenation
    - Uses += instead of ++

<!-- > -->

### Why is this important?

You should be using the most up to date JS in your work. Its expected in the professional environment. 

Improves the quality of your work by reducing errors and making your code easier to understand. 

You will be using the Airbnb JS style guide. This guide was developed at Airbnb and is used by their engineering team. It defines the coding style expected from Airbnb engineers.

**Using this style guide is profesional best practice, it will make you code better, and make you write higher quality code.**

<!-- > -->

## Linting

<!-- > -->

**Lint** was the name of a program that flagged suspicious non portable constructs in C code that were likely to cause bugs. The term is now applied generically to tools that flag suspicious code and inconsistent style in any language.

<!-- > -->

### ESLint

**ESLint** is a tool that "lints" your JavaScript. It has many options and is widely used. 

You will set up ESLint with a Style guide used by profesionals. 

**ESlint has two parts:**

1. A plugin/extension for your code editor
1. A package with options specific to your project

<!-- > -->

**Install eslint in your project**

https://eslint.org/docs/user-guide/getting-started

<!-- > -->

**Setup npm**

```
npm init -y
```


**Install ESLint**

```
npm install eslint -g
```

**Setup a config file**

```
npx eslint --init
```

Use the answers below as you follow the setup process. 

<!-- > -->

Choose these options:

- To check syntax, find problems, and enforce code style
- None of these
- None of these
- TypeScript No
- Browser
- Use a popular style guide
- Airbnb: https://github.com/airbnb/javascript 
- JavaScript
- Would you like to install them now with npm? Yes

<!-- > -->

**Install ESLint in your code editor**

You'll need to install ESLint in your code editor. Go to Packages/Plugins/Extensions and search for ESLint and install. 

<!-- > -->

### Lint your code

(If you haven't already)

**Move your code into a JS file**

The linter will only lint files with the `.js` file extension. Move your code into it a separate JS file `index.js`. 

Then link that to your project. In index.html use: 

`<script src="index.js"></script>`

<!-- > -->

**Start Linting**

Take a look at `index.js`. There should be some red lines highlighting sections of your code. These are linting errors. 

Move the cursor over these and you'll see notes from the linter telling you how your code doesn't meet the requirements of the style guide. 

Your job id to figure these out and solve the problems. Your deeper and more important goal job is to do your best to understand why professionals would ask for these changes. 

<!-- > -->

Take a look at the errors you see and answer these questions: 

- What changes is the linter asking for? 
- Why these changes?

<!-- > -->

## JS Best Practice

You can read about the Airbnb style guide here: 

https://github.com/airbnb/javascript#types

Take a look at the style guide. Pair and discuss.

<!-- > -->

### JS - Const, Let and Var


Bad 

```JS
var score = 0
```

Goode 

```JS
let score = 0
```

Why? `const` and `let` are block-scoped and are not hoisted. This makes your code more predictable.

`const` defines a value that can not be reassigned. Knowing a value will not be reassigned makes code more efficient. It also adds safety to your program. 

<!-- > -->

### JS - Functions and Hoisting

JavaScript is processed in two steps. In the first step, the JavaScript engine examines code and processes it. In the second step, the code is executed. 

One of the processed that happens in the first step is Hoisting. Hoisting effectively moves some elements to the top of their scope. Things that are affected by hoisting are:

- variables declared with var
- functions declarations

https://repl.it/classroom/invite/kHcWR5n

<!-- > -->

### JS - Template Strings 

Best Practice use template literals over the + for concatenation. 

Bad!

```JS 
const name = 'joe'
console.log('hello' + name) // concatenate with +
```

Good

```JS
const name = 'joe'
console.log(`hello ${name}`) // concatenate with template literal
```

<!-- > -->

### What's wrong with "" + ?

The + is used for addition and for concatenation. This makes it ambiguous sometiems to developers and to JavaScript engine.

```JS
const str = "Score:" + score + 10  // Score:1010
```

This is a common source of problems in JS

<!-- > -->

## Lab

- Install ESlint 
- Install the Aitbnb styleguide
- Make a new branch for changes
- Solve all of the linter errors
- Consult with your peers if you can't solve an error
- Take notes for unsolved errors
- Try the stretch challenges 

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## BREAK

<!-- > -->

## After Lab

List linter suggestions on the board. Split into groups of 4 to discuss these. Each group decides why these suggestions were included in the style guide. 

- What changes did the linter ask for? 
- Why do you think these changes? 
- What were the problems that couldn't be solved?

<!-- > -->

## Homework

- [Assignment 2 ESLint.md](Assignments/Assignment-2-EsLint.md)

<!-- > -->

## Additional Resources

1. https://eslint.org/docs/user-guide/getting-started
1. https://www.youtube.com/watch?v=SydnKbGc7W8
1. [Assignment 2 ESLint.md](Assignments/Assignment-2-EsLint.md)

