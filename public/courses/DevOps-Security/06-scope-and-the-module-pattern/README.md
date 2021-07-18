# Scope and the Module Pattern

## Introduction

## Objectives

- Define scope
- Use scope to organize variables
- Build a program structured around scope
- Define the features of the Module Pattern
- Create and use the Module Pattern
- Explain the difference between `var`, `let`, and `const`
- Compare and contrast global, local, and block scope

## Why learn the Module Pattern?

- All of the code you write should enclose it's variables and functions
  - Avoids name space collision
  - Plays well with other code
- Makes your code portable
- Node and ES6 
  - Better understand how Node works
    - Node applications use the Module Pattern
  - Better understand ES6 and React
    - require('module')
    - The `import` `from` syntax creates modules

## What's a Cookie Clicker? 

https://en.wikipedia.org/wiki/Cookie_Clicker

What about paperclips?

http://www.decisionproblem.com/paperclips/index2.html

## Scope

**Where a variable can be accessed**

In JS there are two kinds of scope: 

- function scope : visible inside of a function
- block scope : visible inside a block
  - a block is any structure using `{` and `}`
  this includes `if` statements, `for` loops, 
  `function` and just `{}`. 

- var : function scope
- let : block scope
- const : block scope (immutable!)

## Global Scope

In the browser this is the window
object. All variables not declared with scope
are scoped to the global scope. 

**Note**

Any variable declared anywhere without `var`, 
`let`, or `const` is global, and in the browser 
will be attached to the window object. 

**Note**

In node all code is organized into modules. 
Variables not declared in a function or a block
are scoped to the **module**. Read on to learn 
about modules. 

## Local Scope 

Local Scope refers to variables that are assigned
to a function or block. 

## Function Scope

Function scope refers to variables scoped 
to a function. 

## Inaccessible variables 

A variable in an outer scope that has the same 
name as a variable in an inner scope is 
inaccessible in the inner scope.  

## Lexical Scope or Closure

Variables in an inner scope have access to variables
in the scope of the outer function. This is called
Lexical Scope or Closure. 

Inner scopes have access to variables in outer 
scopes. This doesn't work backwards! Outer scopes
do not have access to variables in inner scopes. 

## IIFE

Immediately Invoked Function Expression. 
  
## Challenege

- Make a Cookie Clicker
  - Minimum clicker should have:
    - A button to generate clicks
    - A display to show the number of clicks
- Wrap it in an IIFE
- Move it into a file
- Import that file into your index.html 

## Resources 

- https://blog.risingstack.com/node-js-at-scale-module-system-commonjs-require/
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const
- http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html
- https://css-tricks.com/how-do-you-structure-javascript-the-module-pattern-edition/
- http://www.decisionproblem.com/paperclips/index2.html
- https://thenextweb.com/security/2018/05/14/electron-vulnerability-could-let-hackers-execute-their-own-code-on-your-computer/

|    |     |            |                                |
|----|-----|------------|--------------------------------|
| 10 |  10 | Lecture    | Electron Exploit!              |
| 10 |  20 | Intro      | Cookies, Clicks and Paperclips |
| 20 |  40 | Review     | JavaScript scope               |
| 10 |  50 | Pair       | Make a clicker                 |
| 10 |  60 | Lecture    | IIFE                           |
| 10 |  70 | Pair       | Wrap the clicker in a IIFE     |
| 10 |  80 | Lecture    | The Module Pattern             |
| 10 |  90 | Pair/Share | Read about the Module Pattern  |
| 20 | 110 | Pair       | Wrap the Clicker in a module   |

 