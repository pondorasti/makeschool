<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 4 - OOP and Classes

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](https://docs.google.com/presentation/d/1nheTZgY5fXrCbiw9hst0XGkr_fpnlAq44y7o5GrYvS4/edit?usp=sharing)

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ----------- |
| 0:05 | 0:05 | Admin |
| 0:05 | 0:10 | [Overview](#overview) |
| 0:05 | 0:15 | [Learning Objectives](#learning-objectives) |
| 0:15 | 0:05 | [Refactoring](#refactoring-code) |
| 0:30 | 0:15 | [OOP and JS](#oop) |
| 0:45 | 0:15 | [Defining Classes](#js-classes) |
| 0:55 | 0:10 | [BREAK](#break) |
| 1:55 | 0:60 | [Lab - OOP](#lab) |
| 2:10 | 0:15 | [Post Lab Q & A](#after-lab) |
| 2:35 | 0:15 | [Dependency Injection](#dependency-injection) |
| 2:45 | 0:10 | Review Homework |

<!-- > -->

## Overview

Class Objects and OOP. Use Object Oriented programming techniques to make your code modular and organized. 

You've written lots of code so far you've probably incurred some [technical debt](https://en.wikipedia.org/wiki/Technical_debt). It's time to pay this off by refactoring. 

<!-- > -->

## Learning Objectives

- Use Refactoring to improve code quality
- Build systems with Objects 
- Define classes 
- Use dependency injection

<!-- > -->

## Refactoring Code

The goal of [refactoring code](https://en.wikipedia.org/wiki/Code_refactoring) in short is to improve your existing code base and put it into a shape that will accept future updates. 

<!-- > -->

Refactoring is not about adding new features. Instead, you want to have the **same functionality** with an **improved codebase** underneath it. 

<!-- > -->

## Creating classes

The engineering team has decided to **OOP**ify the whole game. 

<!-- > -->

**You** are in charge of the **refactor**. 

<!-- > -->

You need to make this game **Object Oriented**.

<!-- > -->

You need to make a class for each of the game objects.

- **Ball**
- **Brick**
- **Paddle**
- **Score**
- **Lives**

<!-- > -->

Objects give you an **abstract way to think about and visualize your code**. 

<!-- > -->

You'll be making a **Class for each** of these. 

Define properties in each class with the values that the object needs to do it's job. 

<!-- > -->

For example, the Ball class might look like this: 

```JavaScript
class Ball {
  constructor(radius, color = "#0095DD") {
    this.radius = radius;
    this.color = color;
    this.x = 0;
    this.y = 0;
  }

  move() {
    this.x += this.dx
    this.y += this.dy
  }

  render(ctx) {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.closePath();
  }
}
```

<!-- > -->

Here `Ball` Class defines instances which will have four properties. Two of the properties, `radius`, and `color` are assigned when the Ball is initialized. `color` has a default value. 

- `color`: the color the ball will render as
- `radius`: the size of the ball measured as it's radius
- `x`: the position of the ball on the x-axis of a canvas
- `y`: the position of the ball on the y-axis of a canvas

<!-- > -->

### Making an instance

Make instance of a class like this: 

```JS 
const ball = new Ball(10)

console.log( ball.x ) // 0
console.log( ball.y ) // 0
console.log( ball.radius ) // 10
```

<!-- > -->

### What about drawing the ball?

Objects like: Ball, Brick, and Paddle own all of the properties they need to render themselves on canvas. 

It makes sense they should own their render method. 

<!-- > -->

These objects should have a `render()` method.

```JS 
class Ball {
  ...
  render(ctx) {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.closePath();
  }
}
```

**Important**: The render method should take the canvas context as a parameter. 

<!-- > -->

### What about this global references?

The canvas context `ctx` is a global variable in the original code. To reference a global variable in a class is bad practice. Imagine you needed to change the name of that variable, you'd have to make lots changes. What if you wanted to use this class in another project, that project would have to define a variable with the same name. 

A better way to handle this is to pass the *dependancy* into the class as a parameter. 

```JS 
...
const ctx = canvas.getContext('2d')

class Ball {
  ...
  render(ctx) { // pass ctx here! 
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.closePath();
  }
}
```

<!-- > -->

### Dependency Injection

Call this: *dependency injection* 

```JS 
...
const ctx = canvas.getContext('2d')

class Ball {
  ...
  render(ctx) {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.closePath();
  }
}
```

<!-- > -->

**Calling methods and passing dependencies.**

```JS 
...
const ctx = canvas.getContext('2d')
const ball = new Ball(...)
...

function draw() {
  ball.move()
  ball.render(ctx)
  ...
}
```

<!-- > -->

### Lab

Start working on [Assignment 3](../Assignments/Assignment-3-OOP.md)

<!-- > -->

## OOP

Whoa, who wrote this tutorial? It's lacking in OOP! It's your job to improve it by increasing OOPiness!

<!-- > -->

Making the code more Object Oriented won't make the code execute faster. It will make the code easier to work with, and easier to expand its systems and add new features in the future.

<!-- > -->

**What is an object?**

Objects are collections and namespaces. An object is a collection of properties (variables) and methods (functions). A namespace gives you one name to access items in the collection.

<!-- > -->

**Why make Objects?** 

It's easier to think of a ball Object than it is to think about: `x`, `y`, `ballRadius`, `dx`, `dy`, and `color` as the ball.

<!-- > -->

Grouping related variables together in an object will organize and encapsulate these variables. Grouping variables together to create a ball Object.

```JavaScript
const ball = {
  x: 240, 
  y: 290, 
  radius: 10, 
  dx: -2,
  dy: -2, 
  color: '#0095DD'
}
```

<!-- > -->

With the change above the location of the ball which was previously determined by `x` and `y` is now determined by `ball.x` and `ball.y`.

<!-- > -->

**Remove** the variables that are now stored with the ball object: 

```JS
...
let x = canvas.width / 2;
let y = canvas.height - 30;
let dx = 2;
let dy = -2;
const ballRadius = 10;
...
```

<!-- > -->

Find where these variables exist in your code and replace them with 

- `x` becomes `ball.x`
- `y` becomes `ball.y`
- `dx` becomes `ball.dx`
- `dy` becomes `ball.dy`
- `ballRadius` becomes `ball.radius`

<!-- > -->

For example the `drawBall()` function becomes: 

```JS
const drawBall = () => {
  ctx.beginPath();
  // Notice the changes here
  ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
  ctx.fillStyle = ball.color;
  ctx.fill();
  ctx.closePath();
}
```

<!-- > -->

**Discussion:** 

- With these changes is the code better? 
- What is different? 
- What possible benefits would these changes have?

<!-- > -->

With this arrangement, there is only a single global variable. This makes your code safer, there is less chance we might overwrite a variable by accident. 

**Encapsulation**

Properties that affect the ball are stored together. 

<!-- > -->

It also **makes the code easier to reason about**. We have one ball with some logical properties that belong to it. Rather than a pool of variables some of which control the appearance of the ball. 

<!-- > -->

It also makes the system easier to expand. If you need to make another ball you can make another object with the same properties or even duplicate an existing ball object. 

Adding new properties to the ball is easier. 

<!-- > -->

Objects with the same properties are also interchangeable. This allows for Polymorphism an advanced OOP topic. 

<!-- > -->

### JS Classes

While defining a ball with an object literal works. You can go a step further by making a template for the ball Object called a class.

```JavaScript
class Ball {
  constructor(x, y, radius = 10) {
    this.x = x
    this.y = y
    ...
  }

  move() {
    this.x += this.dx
    this.y += this.dy
  }
}

const ball = new Ball(200, 300)
```

<!-- > -->

An object created from a class is called an instance. 

```JS 
const ball = new Ball(100, 30)

console.log( ball.x ) // 100
```

<!-- > -->

**ES6 style classes** have some features that deserve discussion. 

- constructor 
- initialization
- parameters
- default parameters

(refer to the code samples above)

<!-- > -->

**Vocabulary** 

- **property** - a variable/value stored by a class 
    - `x`, `y`, `radius`, `dx`, `dy`, `color`
- **method** - a function stored in a class 
    - `move()`

<!-- > -->

### Classes

- [Review Classes in JS](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) 

<!-- > -->

## Break 

Take a ten-minute break and look at all of the objects in the world and name their properties.

<!-- > -->

# Lab

Spend the lab time working on solving the challenges here: 

[Assignment 3 OOP](Assignments/Assignment-3-OOP.md)

Take notes as you work for discussion after the lab. 

## After Lab 

We've removed a lot of global variables and grouped properties into objects. There are a couple of variables that are shared across some of the objects. You need a way to handle these situations. 

## Dependency Injection

Many of the game objects need to draw themselves. To do this, they need access to the canvas rendering context. This is a _dependency_. These classes should NOT rely on a global variable! The solution is to inject the _dependency_. 

```JavaScript
class Ball {
  constructor(radius, color = "#0095DD") {
    this.radius = radius;
    this.color = color;
    this.x = 0;
    this.y = 0;
  }
 
  render(ctx) {
    ...
  }
}
```

Here the render method takes `ctx` as a parameter. This class can now be used anywhere and is not dependent on a global variable. Instead, the value is passed from outside. 

An important technique you can make use of here is [Depedancy Injection](https://en.wikipedia.org/wiki/Dependency_injection). Skim this.

This is a powerful idea that is used often in software development. In a nutshell: 

> A dependency is an object that can be used by another object. Dependency Injection is the passing of a dependency to the dependent object that would use it.

Your goal for the current challenges is to create class objects for the Brick, Ball, Paddle, and Background. These classes will need to draw onto the canvas. The canvas context is a _dependancy_ for the Brick, Paddle, Ball, etc. These objects are dependent on a canvas context, they can't draw themselves without one!

While you could supply the canvas when you initialized an object that would create a more tightly coupled system. Passing the canvas to the object when it needs to draw itself is a more elegant solution. 

Revisit the `Ball` class. In the code snippet below I've added a `render()` method. This method takes the rendering context as a parameter. You could say the context is 'injected'.

```JavaScript
 class Ball {
  constructor(radius, color = "#0095DD") {
    this.radius = radius;
    this.color = color;
  }

  render(ctx) {
    ctx.beginPath();
    ctx.arc(x, y, this.radius, 0, Math.PI * 2);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.closePath();
  }
}
``` 

This is a Dependency Injection at work! Overall this is a very nice Class package you could make and render as many instances of this class as you might need, and render them on any canvas context. 


<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## After Class 

- [Assignment 3 OOP](../Assignments/Assignment-3-OOP.md)

<!-- > -->

## Additional Resources

1. Video Playlist walking through the entire assignment: https://www.youtube.com/playlist?list=PLoN_ejT35AEiSYr-OhYV-C6uWZgPLBMZM
