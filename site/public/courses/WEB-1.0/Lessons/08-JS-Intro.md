<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Lesson 8 - JS Introduction

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

<!-- 

Success Skills - Prioritization

- Students should prioritize the inclass assignment 
- Studnet shsould prioritize their current homework 
- Write the steps needed to complete a task 
- Identify the most important things on the list
- Find the three most important/high value items on the list. 

 -->

## Warmup <!--5 min-->

What part of the website in [this video](https://drive.google.com/file/d/16z0okT3A1XZpxHP2b6iZYpc5e1eqZKc6/view?usp=sharing) is HTML, CSS, and JS?

List out all the aspects you can find for each, and we'll review as a class.

Check out these websites:

1. [Allbirds - NYT](https://www.nytimes.com/paidpost/allbirds/the-view-from-above.html)
1. [Green Chameleon](https://2018.craftedbygc.com/#enter)

Do you think you could do all this with just HTML and CSS alone?

<!-- > -->

## Learning Objectives <!--3 min-->

- Use JavaScript
  - variables 
  - functions 
- Use the Browser API
  - reference DOM elements 
  - events and listeners

<!-- > -->

### Why learn JavaScript?

JavaScript is probably the most important language in use today, and is a key part of providing action to our HTML and CSS. We can only get so far with those two languages, and we need JavaScript to take us from static to dynamic.

![birds](./images/birds.jpg)

JavaScript has a wide range of uses from web pages, to mobile applications, is embeded in hardware devices, and web servers. **You could build entire application ecosystems with only JavaScript.** 

It's a good time to learn JavaScript.

<!-- > -->

## Where do you write JavaScript? <!--5 min-->

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

## The JavaScript Language <!--40 min-->

There are many facets to the JavaScript (JS) language, many of which you have already seen in Python through CS 1.0! Just like Python, JS has a way to handle each of the following:

- variables and scope
- functions 
- flow control 
- objects 

We'll go over each of these and see how to write them in JS!

<!-- > -->

### Variables + Scope

JS allows us to define a variable 3 different ways:

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

- `var` is **function** scope: this variable can be referenced anywhere within the function that it is declared in.
- `let` is **block** scope: this variable can only be referenced within the block of code that it is declared in.
- `const` is block scope and **immutable**: same as `let`, except once it has been declared, the value cannot change.

Let's look at some examples to get a better picture!

<!-- > -->

**Block Scope**

```JS
function calculate() {
  let t = 0
  for (let i = 1; i < 10; i += 1) {
    t += i * i
  }
  console.log(t) // some number 285
  console.log(i) // ReferenceError: i is not defined
}
```

Here we see that `i` only exists within the _scope of the for loop_, or in other words, only within the scope of that specific _block of code!_. Since `t` was instantiated at the same scope as the `console.log` line, we can log its value.

**Question:** What would happen if we try to log `t` outside of the function definition?

<!-- > -->

**Function Scope**

```JS
function calculate() {
  var t = 0
  for (var i = 1; i < 10; i += 1) {
    t += i * i
  }
  console.log(t) // 285
  console.log(i) // 10
}
```

Here we see that we _can_ log `i` because it was instantiated with `var`, which allows _anything_ within the function's definition (the function's scope) to access it. It is no longer limited to the block of code!


<!-- v -->

### Try It Out

What do you expect the `console.log()` statements to print for the below functions? Write down your guesses, then test it out using [js console](https://jsconsole.com/)

```JS
function print_name_and_junk1(name) {
  var looopy = 0
  for (let i = 1; i < 10; i += 1) {
    loopy *= i + i
  }
  console.log(name)
  console.log(looopy)
  console.log(i)
}
print_name_and_junk1("Ian")

function print_name_and_junk2(name) {
  var looopy = 0
  while (var i = 1; i < 10; i += 1) {
    loopy *= i + i
  }
  console.log(name)
  console.log(looopy)
  console.log(i)
}
print_name_and_junk2("Dan")

function print_name(name) {
  console.log(name)
}
print_name("Dan")
console.log(name)
```

**Best practice:**

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

<!-- v -->

### Try It Out

Write the following functions and test that they work in [js console](https://jsconsole.com/):

1. Write a function that takes a number `n` as input and returns the sum of the numbers 1 to `n`
1. Modify the previous function such that only multiples of three or five are considered in the sum, e.g. 3, 5, 6, 9, 10, 12, 15 for `n=17`

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

<!-- v -->

### Try It Out

Write the following functions and test that they work in [js console](https://jsconsole.com/):

1. Write a function that takes a number `n` as input and returns "it is even" if the number is even, and "it is odd" if the number is odd
1. Write a function that given a number `n` and a string `word` as inputs, returns the `word` repeated `n` number of times

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

## Check for understanding <!--7 min-->

With a partner ask each other the following questions (each person answers 2 questions), then we'll discuss as a class

1. How do JavaScript and Python differ in terms of programming languages?
1. What's the difference between block and function scope?
1. If you wanted to get an element with an ID of "favorite-snack", what would that line of JS look like?
1. How would you get the value of an input element who has an ID of "correct-answer" in JS?

<!-- > -->

## 10 min Break

<!-- > -->

## Events and Listeners <!--10 min-->

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
// Grab the button using JS
const button = document.getElementById('submit-button')
// Add a listener to it that will call the buttonHandler function
// whenever someone clicks on the submit-button
button.addEventListener('click', buttonHandler)
function buttonHandler(event) {
  ...
}
```

<!-- > -->

`element.addEventListener()` takes two parameters: an event type and an event handler. 

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
// function is written inside the addEventListener function:
button.addEventListener('click', function(e) { ... })
```

Here we would say the function is _anonymous_ since it doesn't have a name. 

<!-- > -->

## Lab - Tip calculator <!--rest of class-->

Start working on Homework 7, [Tip Calculator](../Assignments/07-Tip-Calculator.md)

Be sure to use the resources below. 

<!-- > -->

## After Class

Continue to work on the [Tip Calculator](../Assignments/07-Tip-Calculator.md) assignment!

## Resources 

- https://javascript.info
- https://javascript.info/variables
- https://javascript.info/function-basics
- https://javascript.info/closure
- https://javascript.info/searching-elements-dom
- https://javascript.info/introduction-browser-events

