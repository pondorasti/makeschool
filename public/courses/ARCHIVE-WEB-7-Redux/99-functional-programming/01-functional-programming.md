# Functional programming 

This is a short introduction to functional programming. Functional programming 
is a different style of programming that workes well with JavaScript and has 
direct application to React and Redux. 

## Imperative/Procedural programming 

In this style of programming you write statements, subroutines, or procedures 
that change the state of your program. 

You have probably written a lot of procedural code already. Usually this ends 
up looking like a list of instructions in pseudo code it might look like this: 

- get y
- set x to a new value
- compare x and y
  - if x is greater do something
  


## Functional Programming 

Identify abstraction and write a function that handles it. 
Use existing functions to build more complex abstractions. 
pass functions to other functions to build even more complex abstractions. 

Write a function that does something simple. 
Write functions that call other functions. 

## Pure functions 

Pure functions are functions without side effects. 
Pure functions accept input as arguments and return
values while doing nothing else. Anything that is not an input or
an output is a side effect. 

`const sine = (x) => Math.sin(x);` is a pure function it takes in x and returns the sine of x. Nothing else happens. 

`const cube(x) => x * x * x;` is a pure function. It takes in x and reutrns the cube of x. 

## First Class Functions

First class functions are functions that can be treated as values. 
You can use a first class function anywhere you coud use a value. 
You can assign them to variables. Pass them as parameters to 
a function and return them from a function. They can be stored in 
arrays or objects. 

### Higher order functions 

Higher order functions are functions that take functions as input 
and return functions as output. 

## Composing functions 

Pure functions can be composed. 

`const sineCubed = (x) => cube(sine(x));` This takes in x and passes the value into sine() the
result is then passed into cube. 


- https://www.youtube.com/watch?v=ZhuHCtR3xq8


