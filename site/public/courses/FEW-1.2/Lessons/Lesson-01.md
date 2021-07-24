<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 1 - JavaScript Basics

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](../Slides/Lesson-01.html#/)

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ------------ |
| 0:05 | 0:05 | [Class Learning Objectives](#class-learning-objectives) |
| 0:05 | 0:10 | [Projects](#projects) |
| 0:50 | 0:15 | [Start Break out](#start-break-out-tutorial) |
| 1:40 | 0:50 | [Lab: Break Out Tutorial](#lab) |
| 1:50 | 0:10 | [Break](#break) |
| 2:20 | 0:30 | Review progress on Tutorial |
| 2:40 | 0:10 | Review Homework |
| 2:45 | 0:05 | Review objectives |

<!-- > -->

## Class Learning Objectives

The goal of this class is to improve and develop your JavaScript skill, knowledge, and to further develop your skills in software development. 

By the end of the class you should be able to:

- Use functions and variables to create front end applications
- Write For loops in JavaScript
- Write if statements in JavaScript
- Use Canvas to draw bitmap graphics
- Describe program flow

<!-- > -->

### Your Goals

These are the two goals that will bring you success. 

- Building Portfolio Projects
- Master Learning Objectives

<!-- > -->

Portfolio projects are what get you noticed. Your portfolio is often the reason people get invited to job interviews.

One of your goals this term will be to build two portfolio projects.

<!-- > -->

### What are Learning Objectives? 

Learning objectives are the concepts and ideas that you need to know to claim mastery of a subject.

Learning Objectives are often skills that are related to success at job interviews and on the job.

<!-- > -->

When you understand a learning objective you will be able to explain it and put it into practice. 

<!-- > -->

**There will be learning objectives for each class.** You should test your knowledge by explaining the concepts to someone else and implement the learning objectives in code when the learning objectives are code. Some objectives are larger overarching concepts, in these cases, you should identify the learning objective in your code, your project as a whole, or in the larger software ecosystem or the world at large. 

<!-- > -->

**If you are having trouble understanding a learning objective you need to take action.** Discuss the topic with another student, talk with a TA, bring questions to class, talk to an instructor during lab or office hours. 

<!-- > -->

## Projects 

The goal is to produce something that shows your skills. 

- **Breakout** - This is a JavaScript implementation of the arcade game Breakout 
- **React Fundamentals Tutorial** - This tutorial will get you started with React
- **Custom/Contractor Project with React** - This will be a web site built with React and is open to your ideas and input.

<!-- > -->

## Start Breakout tutorial

The Breakout tutorial is a great JS practice project. It makes use of many of the core concepts found in every programming language. 

- **Variables** - values stored and used by the program
- **Functions** - code blocks used and reused by the program 
- **Flow control** - controlling when which blocks of code are run and how often
 - **loops** - repeats blocks of code 
 - **if else** statements - makes decisions about which blocks should be run
- **Arrays** - stores lists of things/values accessible by index
- **Objects** - stores things/values accessed by key

Today in class your job is to start on the tutorial and identify the things on this list

<!-- > -->

These things are core to programming in general. Learn these things here and you can apply them anywhere (in many languages). 

After completing the tutorial you will improve the code applying modern techniques and best practices. This will include:

- Using ES6 JS ideas and syntax
- Linting to professional standards 
- Using build systems and bundling

<!-- > -->

### Contractor/Custom project 

The Custom/Constractor project will be built with React. Here you will put all of the things from the first project into something that is built using the one of the most common and popular libraries in use today.

<!-- > -->

## Break Out

- What is Breakout?
- How does the tutorial game work? 
 - draws all of the game elements with canvas
 - What are cartesian coordinates? 

<!-- > -->

- Draw Break game with Sketch
 - How big is the desktop: 1440 x 1024
 - How big is the game: 480 x 320
 - Draw game elements
 - bricks: 75 x 20
 - rows: 3
 - columns: 5
 - ball: 10 radius
 - paddle: 75 x 10

**Exercise 1:** Open sketch and draw Breakout 

<!-- > -->

## Canvas 

Canvas is a JS API that allows you to draw bitmapped graphics. Use it to create special effects and games. Bitmapped graphics draw faster and allow for pixel-level control of an image.

Canvas is a tag: 

```html
<canvas id="myCanvas"></canvas>
```

<!-- > -->

Think of canvas as the `<img>` tag with the ability to draw on it. 

Like the `<img>` tag you should give `<canvas>` width and height. 

```html
<canvas id="myCanvas" width="400" height="300"></canvas>
```

<!-- > -->

To draw on canvas you need to get a canvas context.

```js
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
```

`ctx` is the convas context. You'll call on methods of this object to draw on the canvas. 

- **Q:** What's a method?
- **Q:** What's an Object?

<!-- > -->

Draw on your canvas using the canvas API. The tutorial uses a few of the APIs methods.

Drawing with canvas generally follows these steps: 

- begin a new path
- draw a shape with one of the drawing methods
- set the fill style 
- set the stroke style 
- fill and stroke your path

Here are a few examples...

<!-- > -->

**Draw a rectangle**

```js 
ctx.beginPath() // begins a new path
ctx.rect(x, y, width, height) // draws a rectangular path
ctx.fillStyle = "#0095DD" // sets the fill color
ctx.closePath() // closes the path
ctx.fill() // fills the current path
```

- **Q:** How big is the rectangle? 
- **Q:** Where is it in the canvas?
- **Try it:** (in theory) draw a rectangle in sketch and get the coordinates and size. 

<!-- > -->

**Draw a circle**

```js
ctx.beginPath()
ctx.arc(x, y, radius, startAngle, endAngle)
ctx.fillStyle = "#0095DD"
ctx.fill()
ctx.closePath()
```

- **Q:** How big is the circle? 
- **Q:** Where is the circle? 
- **Try it:** (in theory) look at your sketch and find the ball. Get it's radius and coordinates. 

<!-- > -->

**Clear Rectangle**

```js
ctx.clearRect(x, y, width, height)
```

- **Q:** What area of the screen is being cleared? 

<!-- > -->

Million Dollar Homepage! Canvas Practice.

https://github.com/soggybag/canvas-practice

<!-- > -->

## Break

Take a 10-minute break and measure the world in pixels. 

<!-- > -->

## Lab 60 mins

Your goal is to complete the tutorial: https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript

This tutorial is 10 pages. At the end of every page is the completed source code. If you run into any problems you can check your code against the source.

While you work look for the things on this list:

- **Variables** - values stored and used by the program
- **Functions** - code blocks used and reused by the program 
- **Flow control** - controlling when which blocks of code are run and how often
 - **loops** - repeats blocks of code 
 - **if else** statements - makes decisions about which blocks should be run
- **Arrays** - stores lists of things/values accessible by index
- **Objects** - stores things/values accessed by key

Today in class your job is to start on the tutorial and identify the things on this list

The code in the tutorial is very naive. You will be updating the code to modern standards in the next assignment.

**Come back to class at: ...**

<!-- > -->

## Review Breakout

- Show progress
- Review Objectives
- Questions 

<!-- > -->

## Homework: Breakout Tutorial 

Follow the instructions [here](../Assignments/Assignment-1-Break-Out.md)

<!-- > -->

## Additional Resources

1. [Types and Values ](https://eloquentjavascript.net/01_values.html)
1. [Variables](https://eloquentjavascript.net/02_program_structure.html#h_lnOC+GBEtu)
1. [Defining functions](https://eloquentjavascript.net/03_functions.html)
1. [Scope](https://eloquentjavascript.net/03_functions.html#h_XqQR5FlX+8)
1. [Arrays and Objects](https://eloquentjavascript.net/04_data.html)
1. [If else](https://eloquentjavascript.net/02_program_structure.html#h_wpz5oi2dy7)
1. [For loops](https://eloquentjavascript.net/02_program_structure.html#h_oupMC+5FKN)
1. [Canvas](https://eloquentjavascript.net/17_canvas.html)



