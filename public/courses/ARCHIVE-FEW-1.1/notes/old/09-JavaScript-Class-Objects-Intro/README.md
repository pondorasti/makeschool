# JavaScript Class Objects and Prototype

While JavaScript is an Object Oriented Programming Language
it handles Class Objects and Inheritance differently than other languages. Understanding JavaScript's unique inheritance model is key to fully understanding JavaScript.

In this lesson, you will take a look at how to create class objects with JavaScript and how to use `prototype`. 

## Learning Objectives

1. Define Classes that create Objects with JS
1. Use the Prototype chain to generate objects
1. Use ES6 class syntax to generate instances
1. Use Element reference to manipulate the DOM 

## Initial Exercise

Read this: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes

- What is `prototype`? 
  - Using Prototype

## In Class Example 

- Make an Object
  - Add properties 
  - Add methods
- Make a **class** with a function
  - Add properties 
  - Add methods 
    - Use prototype 
- Define a class ES6 style
  - Use the constructor 
  - Add properties 
  - Add methods

The examples below can be done on Repl.it [here](https://repl.it/classroom/invite/2ojb5qc)

## Example 0 - Objects and this

Understanding this in JS is important. This can often be confusing. 
We will with the basic concepts here. 

[Challenge 1](challenge-0)

## Example 1 - Objects and Prototype

The goal of this challenge is to define Class Objects in JS. 
This process uses prototype property. 

[Challenge 1](challenge-1)

## Example 2 - Classes 

JS provides a class syntax for creating objects. This syntax 
provides a new syntax for creating the same types of objects 
cr4eated with prototype!

The class syntax has a couple of differences. These are all just cosmetic. 
    
[Challenge 1](challenge-2)
    
## Example 3 - Challenge!

This example has an array of data. Your goal is to display it
all on the page. To keep things organized you'd like to make an Object to store each item in data.js. 

The data describes 1000 users. Should make an Object that describes a user. 

- [Challenge 1](challenge-3)

## Example 4 - Extending Cookie Clicker

The Cookie clicker project you have been working on is a good 
start, but you could take it to the next level using Classes!

This is an open-ended challenge. Take the ideas from this class and apply them to the cookie clicker game. 

Have you seen this [game](http://www.decisionproblem.com/paperclips/)? 

It takes the Cookie Clicker game concept to an extreme. Seriously, 
this game is crazy in how far it expands the concept. I suspect it uses a few objects...

Using Objects in the cookie clicker game can do a lot to improve the code. Try as many of these challenges as you care to.

What would using objects do to improve the Cookie Clicker tutorial? 

You may have noticed there was code that related to different areas:
Clicker, Grandmas, Facilities: but the code was all mixed together. The tutorial arranges the code in written structure, but you can't organize on a code level. 

You may have noticed that the names of variables and functions are all in the same place. They are all stored on the window/global object. 
This means everything has to have a unique name! This will become increasingly frustrating as your code base grows. You'll find that you want to reuse a name, or you'll begin to get confused by a 
myriad of names that are almost the same. 

An Identifier a name that you invent. These are the names that you wrote for variables and functions. 

MDN definition: [Identifier](https://developer.mozilla.org/en-US/docs/Glossary/Identifier)

Scope describes the part of programming where an Identifier is visible. In JavaScript, scope is usually a block but this can vary depending on how a variable is declared. 

MDN definition: [Scope](https://developer.mozilla.org/en-US/docs/Glossary/Scope)

How does this apply to the Cookie Clicker? 

All of the variables and functions in the Cookie Clicker tutorial are stored on the window/global object. In JavaScript, the window object is available every so we say it has a global context. We can also call this a namespace. In order for us to work within the same scope/namespace all identifiers must have a unique name. 
This causes problems as the program grows. 

One solution is to use an Object. Each Object acts as it's scope/namespace. 

Object-Oriented Programming or OOP is a system that allows you to create programs built around objects. Objects are collections of functions and variables. 

Variables that belong to an Object are called [Properties](https://developer.mozilla.org/en-US/docs/Glossary/property), and functions that belong to an Object are called [Methods](https://developer.mozilla.org/en-US/docs/Glossary/Method). 

If you thought about the Cookie Clicker as a collection of Objects
you could program it that way! Currently, the clicker is defined as
a variable to keep track of the count, an event listener that listens for clicks, and a function that handles clicks. Using OOP 
you could instead define a clicker Object that contained the count, the button and the listener. 
  
## After Class

- Complete the Cookie clicker tutorial
- Complete the reading below
- Apply the objects and classes concepts to the cookie clicker. 

## Additional Resources

1. https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes
1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString
1. https://hackernoon.com/prototypes-in-javascript-5bba2990e04b
