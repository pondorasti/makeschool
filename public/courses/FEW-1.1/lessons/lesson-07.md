<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Lesson 7 - JS Introduction

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

## JavaScript

You need to learn some JavaScript! This class will be an introduction to the JavaScript langauge and programming for the web browser. 

<!-- > -->

### Why JavaScript?

JavaScript is probably the most important language in use today. JavaScript has a wide range of uses from web pages, to mobile applications, is embeded in hardware devices, and web servers. **You could build entire application ecosystems with only JavaScript.** 

It's a good time to learn JavaScript.

<!-- > -->

## Objectives 

- Use JavaScript
  - variables 
  - functions 
- Use the Browser API
  - reference DOM elements 
  - events and listeners

<!-- > -->

## JavaScript

<!-- > -->

## Where do you write JavaScript?

Written in a tag

Written in JS files

<!-- > -->

```HTML
<script>
  // This tage could be embedded in a Web Page
  function countToFive() {
    for (let i = 1; i < 6; i += i) {
      console.log(i)
    }
  }
</script>
```

<!-- > -->

```HTML
<script src="main.js"></script>
```

```JS
// This written in main.js
function countToFive() {
  for (let i = 1; i < 6; i += i) {
    console.log(i)
  }
}
```

<!-- > -->

## The JavaScript Language

- variables 
- functions 
- flow control 
- objects 

<!-- > -->

### Variables

Define a variable with:

- var 
- const 
- let 

<!-- > -->

```js 
var x = 199
let name = 'Hello'
const pi = 3.14
```

<!-- > -->

What's the difference? 

- `var` is function scope
- `let` is block scope
- `const` is block scope and immutable

<!-- > -->

**Block Scope**

```JS
function calculate() {
  let t = 0
  for (let i = 1; i < 10; i += 1>) {
    t += i * i
  }
  console.log(t) // some number 285
  console.log(i) // ReferenceError: i is not defined
}
```

<!-- > -->

**Function Scope**

```JS
function calculate() {
  var t = 0
  for (var i = 1; i < 10; i += 1>) {
    t += i * i
  }
  console.log(t) // 285
  console.log(i) // 10
}
```

<!-- > -->

Best practice: 

Use `const` when a value won't change and `let` when it will. Don't use `var`. 

<!-- > -->

### functions 

<!-- > -->

define a function

```JS 
function calculateArea(length, width) {
  const area = length * width
  return area
}
```

Execute a function:

```js 
const area = calculateArea(10, 3) // 30
```

<!-- > -->

### Flow control 

Flow control is how your program makes decisions. This includes things like if else statements and loops. 

<!-- > -->

#### if else 

```js 
if (area > 50) {
  console.log('More than 50')
} else {
  console.log('Less than 50)
}
```

<!-- > -->

#### for loop 

```JS 
for (let i = 0; i < 10; i += 1) {
  console.log(i)
}
```

<!-- > -->

### types 

Any value in JavaScript will be one of these types: 

- Number
- String 
- Object

<!-- > -->

### Numbers

Numbers are what you expect numbers.

- 0 
- 1
- 3.1456
- -0.988

<!-- > -->

### Strings

A String is any number of characters between quotation marks. 

- 'Hello World'
- "Foo Bar"
- ''

<!-- > -->

### Concatenate String 

Concatenation is the processs of combining Strings and numbers into a single string. For example: 

```JS
const name = 'Burger'
const price = 2.99
const nameAndPrice = `${name} $${price}`
console.log(nameAndPrice) // Burger $2.99
```

<!-- > -->

### Getting a Reference

Elements created in the DOM are objects. They have methods and properties. You'll need a reference to an element if you need to:

- change the text it displays
- get the value currently displayed
- change it's style 

<!-- > -->

To get a reference to an element you'll need to find it in the DOM. An easy method is using an id. ids are unique there should only be one element with a given id!

Use: 

```js
<div id="display-hello">Foo Bar</div>
...
const displayHello = document.getElementById('display-hello')
```

<!-- > -->

### Display text with innerHTML

Setting the innerHTML of an element replaces everything between the tags with something new. 

```JS 
displayHello.innerHTML = 'Hello World'
```

<!-- > -->

### Working with Inputs

DOM elements are not all the same. Different types of elements have different proeprties. `<input>` elements for example allow user input and store the input value in a value property. 

```JS
<input id="input-name">
const inputName = document.getElementById('input-name')
console.log( inputName.value ) // shows the value if input
```

<!-- > -->

## Events and Listeners 

Events are things that happen in the program. They are things like: 

- text input
- clicking the mouse
- interacting with the keyboard
- and more...

<!-- > -->

Add a listener to "listen" for an event type and define a handler to handle the event when it occurs.

```JS
<button id="submit-button">Submit</button>
...
const button = document.getElementById('submit-button')
button.addEventListener('click', buttonHandler)
function buttonHandler(event) {
  ...
}
```

<!-- > -->

element.addEventListener() takes two parameters: an event type and an event handler. 

An event type is a string. Some event types are: 

- 'click'
- 'change'
- 'keydown'

<!-- > -->

A handler is a function that takes an event as a parameter. 

In JavaScript functions are also values you could rewrite the code above like this: 

```JS
<button id="submit-button">Submit</button>
...
const button = document.getElementById('submit-button')
button.addEventListener('click', function(e) { ... })
```

Here we would way the function is anonymous since it doesn't have a name. 

<!-- > -->

## Lab - Tip calculator

Start working on Assignment [Assignment 7](../assignments/assignment-07.md)

Be sure to use the resources below. 

<!-- > -->

## After Class

[Assignment 7](../assignments/assignment-07.md)

## Resources 

- https://javascript.info
- https://javascript.info/variables
- https://javascript.info/function-basics
- https://javascript.info/closure
- https://javascript.info/searching-elements-dom
- https://javascript.info/introduction-browser-events

