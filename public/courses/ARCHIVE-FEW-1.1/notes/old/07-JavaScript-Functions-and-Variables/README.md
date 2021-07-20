# JavaScript Functions and Variables 

JavaScript is the language of the browser. Use it to create complex user interactions, manage data, and add logic and complex functionality to your web pages. 

JavaScript has many of the features found in other languages and some features unique to itself. 

## Learning Objectives

1. Use JavaScript in a web page
1. Identify where JavaScript can be used within an HTML document
1. Define functions with JavaScript 
1. Define Variables with JavaScript
1. Use/Invoke functions

## Introduction

The original purpose of JavaScript was to script browsers. 

With JavaScript, you can control almost all of the features and functions of the browser. 
Browser set some limits to ensure security. 

Originally JavaScript was developed by Netscape for their browser and called **LiveScript**. The name was soon changed to 
**JavaScript** because **Java** was a new and popular language and 
**Netscape** thought this would be good for marketing.

While Java and JavaScript share the first 4 letters they are completely unrelated otherwise. 

## Where is JavaScript used?

Everywhere. Seriously. JavaScript is used to: 

- Build web pages
  - Manipulate the DOM
  - Add interactivity
  - Create web apps 
- Script the server
  - Node JS is a server that is scripted with JS
  - Handle server API requests
- Embedded systems
  - Use JavaScript to program hardware devices
- Native applications
  - Script native applications 
  - Build native applications
  
JavaScript could be the most important programming language in use today. JavaScript was the most popular language in Stack Overflow's developer 2017 survey. 

> Any application that can be written in JavaScript will eventually be written in JavaScript. - Jeff Atwood

## Where can you write JavaScript? 

JavaScript is plain text. It can be written in files with 
the `.js` extension or written into `.html` files.

Use the script tag to include JavaScript within an HTML document. 

```
<script>
  // Some JavaScript here...
  const message = 'hello world';
</Script>
```

Or link to a JavaScript in a .js file like this: 

```
<script src="main.js"></script>
```

In `main.js` you would write JavaScript without the script tag. 

```
// Some JavaScript
const foo = 'bar';
```

Try this out for yourself in [Example 1](example-1)

## What can 

JavaScript has all of the features of standard programming 
languages:

- variables
- loops
- conditionals
- arrays
- objects

It also has inheritence but uses a model that is different from other languages. 

## Why learn JavaScript? 

- You'll probably run into it at some point and you'll want to understand it. 
- It could also become a job. There are many jobs that ask for JavaScript. 
- You can use it to build everything from frontend to backend, and native apps. 

## Initial Exercise

- A quick introduction to scripting the browser
  - Where does JavaScript live?
  - [example 1](example-1)
  
- Common pitfalls and debugging 
  - Scripts load in order
  - Using the console
  - [example 2](example-2)

## Overview 

- Working with HTML Elements and JavaScript
  - Accessing an element via its id name 
    - `document.getElementById()`
  - Using JavaScript to manipulate the DOM
    - `innerHTML`
    - `value`
  - Handle click events with JS
    - `onclick`
  - Set the content of an element with JS
  - [Example 3](example-3)
  
- Functions and variables with JavaScript
  - `const`, `let`, and `var` (in that order!)

## In Class Activity I

- Challenge: Make a tip calculator
  - Start with the [Example 4](example-4)
- Start the Cookie [Click Tutorial](https://www.makeschool.com/academy/track/cookie-clicker-clone)

## After Class

- Create the calculator Challenges 1 - 3
  - See the images in the [Example 4 folder](example-4)
  - Style your work to look like the images
- Stretch challenge Challenge 4. 

## Additional Resources

- https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById
- https://developer.mozilla.org/en-US/docs/Web/API/Element
- https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onclick
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed
