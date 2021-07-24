# FEW 1.2 - Class 3

## Class Objects

Class Objects and OOP. Use Object Oriented programming techniques to make your code modular and organized. 

You've written lots of code so far you've probably incurred some [technical debt](https://en.wikipedia.org/wiki/Technical_debt). It's time to pay this off by refactoring. 

## Objectives 

- Use Refactoring to improve code quality
- Build systems with Objects 
- Define classes 
- Use dependency injection

## Refactoring 

The goal of [refactoring code](https://en.wikipedia.org/wiki/Code_refactoring) in short is to improve your existing code base and put it into a shape that will accept future updates. 

Refactoring is not about adding new features. Instead, we want to have the **same functionality** with an **improved codebase** underneath it. 

What should you refactor? In this section, you will be creating Class objects to represent elements used by the game. Along the way you can also do the following: 

- Improve variable declarations. Replace `var` with `const` and `let`
- Add comments
- Improve formatting and indentation
- Making procedural code Object Oriented
- Improve anything else you might think of that needs improvement

## OOP

Whoa, who wrote this tutorial? It's lacking in OOP! It's your job to improve it by increasing OOPiness!

Making the code more Object Oriented won't make the code execute faster. It will make the code easier to work with, and easier to expand its systems and add new features. It will make code that is much safer and more likely to run without error. 

**What is an object?**

Objects are collections and namespaces. An object is a collection of properties (variables) and methods (functions). A namespace gives you one name to access items in the collection. 

**Why make Objects?** 

It's easier to think of a ball Object than it is to think about: `x`, `y`, `ballRadius`, `dx`, `dy` as the ball.

Grouping related variables together in an object will organize and encapsulate these variables. Grouping variables together to create a ball Object.

```JavaScript
const ball = {
    x: 200, 
    y: 300, 
    radius: 10, 
    dx: -2,
    dy: -2 
}
```

With this arrangement, there is only a single global variable. Which makes our code safer, there is less chance we might overwrite a variable by accident. 

It also makes the code easier to reason about. We have one ball with some logical properties that be long to it. Rather than a pool of variables some of which control the appearance of the ball. 

It also makes the system easier to expand. If you need to make another ball you can make another object with the same properties or even duplicate an existing ball object. If a ball needs a new property this is easy to do. 

Objects with the same properties are also interchangeable. 

**Encapsulation and Polymorphism**

While defining a ball with an object literal works. You can go a step further by making a template for the ball Object called a class.

```JavaScript
class Ball {
    constructor(x, y, radius = 10) {
        this.x = x
        this.y = y
        this.radius = radius
        this.dx = -2
        this.dy = -2
    }
}

const ball = new Ball(200, 300)
```

An object created from a class is called an instance. 

ES6 style classes have some features that deserve discussion. 

- constructor 
- initialization
- parameters
- default parameters

### Classes

- [Review Classes in JS](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes) 

## Creating classes

The engineering team has decided to **OOPify** the whole game. You're in charge of the _refactor_. You need to make this game _Object Oriented_. 

_You're in charge of making a class for each of the game objects._

- Ball
- Brick
- Paddle
- Score
- Lives 

These are objects in the game, you can see these objects on the screen and the game manipulates these objects as you play the game. Objects give you an abstract way to think about and visualize your code. 

You'll be making a Class for each of these. Each should hold the variables that describe or control that object as properties within the class.

For example, the Ball class might look like this: 

```JavaScript
 class Ball {
  constructor(radius, color = "#0095DD") {
    this.radius = radius;
    this.color = color;
    this.x = 0;
    this.y = 0;
  }
}
```

Here `Ball` Class defines instances which will have four properties. Two of the properties, `radius`, and `color` are assigned when the Ball is initialized. `color` has a default value. 

- `color`: the color the ball will render as
- `radius`: the size of the ball measured as it's radius
- `x`: the position of the ball on the x-axis of a canvas
- `y`: the position of the ball on the y-axis of a canvas

## Dependency Injection

Many of the game objects need to draw themselves. In order to do this, they need access to the canvas rendering context. This is a _dependency_. These classes should NOT rely on a global variable! The solution is to inject the _dependency_. 

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

> A dependency is an object that can be used by another object. Injection is the passing of a dependency to the dependent object that would use it.

Your goal for the current challenges is to create class objects for the Brick, Ball, Paddle, and Background. These classes will need to draw onto the canvas. The canvas context is a _dependancy_ for the Brick, Paddle, Ball etc. These objects are dependent on a canvas context, they can't draw themselves without one!

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

This is Dependency Injection at work! Overall this is a very nice Class package you could make and render as many instances of this class as you might need, and render them on any canvas context. 

## OOP Challenges

Your job is to refactor your work. You'll be making a class object to replace the existing code. Along the way, you should also clean up your code, fixing formatting, indentation, and add comments.

- **Challenge 1**: Define Classes for Game Objects
  1. Define a class for `Ball`
    - Properties 
      - `radius`
      - `color`
      - `x`
      - `y`
    - Methods
      - `render(ctx)`
            - `move()`
  2. Define a class for `Brick`
    - Properties 
      - `x`
      - `y` 
      - `status`
      - `color`
      - `width`
      - `height`
    - Methods 
      - `render(ctx)`
  3. Define a class for `Paddle`
    - Properties 
      - `x`
      - `y` 
      - `color`
      - `width`
      - `height`
    - Methods 
      - `render(ctx)`
  4. Define a class for `Background`
    - Properties (The Background Object is responsible for rendering the background image. The properties are up to you, and might be as simple as a color)
      - ?
    - Methods 
      - `render(ctx)`
  5. Define a class for `Score`
    - Properties 
      - `x`
      - `y` 
      - `color`
      - `score`
      - `font`
    - Methods 
      - `render(ctx)`
            - `update(points)`
            - `reset()`
  6. Define a class for `Lives`
    - Properties 
      - `x`
      - `y` 
      - `color`
      - `lives`
      - `font`
    - Methods 
      - `render(ctx)`
            - `loseLife()`
            - `reset()`
   
The goal is not to add new features. In the end, you should have a better code that works the same. You're paying off technical debt and refactoring to make a better code base. 
    
## Stretch Challenges 

This OOP thing is fun! I can tell you want more! Here are a few more things you can try. 

1. Make a `Game` Class. The Game itself can be an object that creates and owns all of the other objects. The game can hold all of the global properties, and methods. 
  - Properties
    - `ball`
    - `bricks`
    - `score`
    - `lives`
    - `ctx`
    - `width`
    - `height`
  - Methods
    - `move()`
    - `draw()`
    - `collisionDetection()`
    - `keyDownHandler()`
    - `keyUpHandler()`
    - `mouseMoveHandler()`

2. Use inheritance

The Ball, Birck, and Paddle all use x and y properties. Classes can have a super/parent class. Superclasses provide base functionality. Child classes can extend another class to inherit this functionality. 

In this project, the Brick, Ball, and Paddle all have the same properties: x and `y`. You can create a base class with thee properties and extend this class to create the Ball, Paddle, and Brick. 

Start with this: 

```JavaScript
class Sprite {
 constructor(x = 0, y = 0) {
  this.x = x;
  this.y = y;
 }
```

Extend this class like this: 

```JavaScript
class Ball extends Sprite {
 constructor(radius, x, y) {
  // Must pass params to super when extending a class! 
  super(x, y) 
  this.radius = radius;
 }

 render() {
  ...
 }
}
```

The Ball class extends `Sprite`. You must call `super()` and pass all parameters to the superclass. Notice Ball implements the `render()` method. 

Think about any other properties that are shared across all of the Objects, you can move these properties into `Sprite`. In this way, you will only have to edit or work with these in one place. In this example all `Sprite`s will have an `x` and `y` property, and a `Ball` will have `x`, `y`, and `radius`. 

If there is a default implementation for a method that is used by most child classes you can implement this in the parent. When a child class implements a method that exists in the parent this is called _overriding_. When you _override_ a method you are using the child's method over (in place of) the parent's method. 

## Further Challenges 

If you have completed all of the challenges you try the challenges here or can design your own challenges. 

This section has some further challenges you can try if you need more work. 

**Challenge**: Improve the Alert messages

**Problem**: That Alert box is really annoying. It also stops everything until you click it. The Alert box should not be used by applications unless they issuing system type alerts. 

**Solution**: Make a custom overlay that displays a message. There are two approaches you can take
  
- Use a DOM element
  - Make a div that you will hide and show when you win or lose the game. 
  - Use tricky CSS wizardry (absolute position) to place the div over the canvas.
  - Use JavaScript to handle button clicks. 
- Draw the dialog box on canvas (not for the faint of heart)
  - Make a class that renders a dialog box
  - Listen for clicks on canvas check if a click is within the area of a button

**Lint your code!**

Want to improve your code craft? Use the Linter! Install ESLint and lint your code. 

## Assess your work

| -             | Does not meet expectations | Meets expectations       | Exceeds expectations |
|:--------------|:---------------------------|:-------------------------|:---------------------|
| **Completed** | Did not complete           | Created classes for Ball, Brick, Paddle, Score, Lives | Created a Game class collects all of the other objects. Used extends to create a base class that is extended by other classes. |
| **Refactor** | Doe not function or throws errors | Game functions as before the refactor | Adds new features not seen in the original tutorial, and or improves on the systems from the original tutorial |
| **Code quality** | Indentation and white spece are inconsistent, naming is unintuitive | Uses consistent indentation and spacing. Naming makes the code self documenting | code is well organized, well commented, and orgasnized. You have checked your code with the linter. |
| **Work Ethic** | Did not commit when working on project | Initial commit at class and commit while working | Commits show 3 hours work and clearly document process | 

## Additional Resources 

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
- https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object-oriented_JS

