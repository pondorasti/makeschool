# Class - Breakout - Inheritance

## Description 

Digging deeper into OOP we find classes can inherit properties and methods from a super class. This assignment gives you the opportunity to apply this concept to Break Out.

### Why this assignment?

OOP is an important piece of programming and software development. You need to practice with this to further your understanding of this subject.

## Project requirements

Coplete the challenges below and commit them to your Break Out project. 

### Challenges 

**Challenge 1:** Create a Sprite Subclass

Notice that many of the game objects (ball, paddle, brick etc.) share similar properties:

- `x`
- `y`
- `width`
- `height`
- `color`

Some of the classes share similar methods: 

- `render(ctx)` - This method should take a canvas context as a parameter and draw a rectangle at x and y with the width, height and color.

some of these classes might be easier to work with if they had access to some helper methods. 

- `moveTo(x, y)` - The moveTo() method sets the absolute position of a sprite. It should set the the object's this.x and this.y to x and y parameters. 
- `moveBy(x, y)` - The moveBy() method should translate the Spite by the amount of the x and y parameters. It should add x to this.x and do the same to this.y. 


When classes share the same properties or methods and the implementation is the same that's a prime candiadate for creating a super class!

The Sprite class is an example of a super class that the game objects can inherit from. Sprite has properties that set it's position, size, and color, and a render method that draws itself as a rectangle.

In the case of Break Out these classes all share the x, y, moveTo, and moveBy methods.

- Ball 
- Brick 
- Paddle
- Lives
- Score

Create a new class Sprite which will implement the properties and methods: 

- x
- y
- moveTo
- moveBy

```JavaScript
class Sprite {
  constructor(x, y, width, height, color='red') {
    this.x = x
    this.y = y
    this.width = width
    this.height = height
    this.color = color
  }

  moveTo(x, y) {
    this.x = x
    this.y = y
  }

  moveBy(dx, dy) {
    this.x += dx
    this.y += dy
  }

  render(ctx) {
    ctx.beginPath()
    ctx.rect(this.x, this.y, this.width, this.height)
    ctx.fillStyle = this.color
    ctx.fill()
  }
}
```

When you initialize a Sprite you'll supply arguments for each of it's parameters in order: 

```JS
const box = new Sprite(10, 20, 30, 40, 'blue')
```

The box created above might look like: `{ x: 10, y: 20, width: 30, height: 40, color: 'blue' ... }`.

Any of the objects that draw themselves on the canvas can extend the sprite class and share the properties and methods defined by Sprite. 

**Challenge 2: Class Ball** create classes that extend the Sprite class. 

The goal of this challenge is to define a Ball Class that extends Sprite. The Ball class will add three new properties: `dx`, `dy`, and `radius`. It will also override the `render()` method. 

```JavaScript
class Ball extends Sprite {
  constructor(x, y, radius, color) {
    super(x, y, radius * 2, radius * 2, color) // Must pass params to super when extending a class! 

    this.radius = radius;
    this.dx = 2
    this.dy = -2
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

To use the Ball class you might: 

```JS
const ball = new Ball(100, 300, 10, 'orange')
```

The above creates a ball with: `{ x: 100, y: 300, width: 20, height: 20, radius: 10, color: 'orange' ... }`

**You must call `super()` and pass all parameters to the superclass.**

**What's an Override?** The Ball Overrides the `render()` of it's super class by implementing it's own render method.

**Challenge 3: Class Brick** create a class for a Brick. 

The Brick is a Sprite, it draws as a rectangle. So the Brick is mostly a sprite. It has one new property that sprites don't have: status. 

```JS
class Brick extends Sprite {
  // Todo:
  // add the constructor
    // call super
    // define this.status = 1
}
```

To use the Brick class you'll call it with x, y, width, and height. 

```JS
// make a new instance of a brick
const someBrick = new Brick(15, 30, 75, 20, 'fuchsia')
// render a brick
someBrick.render(ctx)
```

This should make a brick object with these properties: `{ x: 15, y: 30, width: 75, height: 20, color: 'fuchsia', status: true }`

Brick only adds the status property but it inherits the properties an methods of Sprite. 

**Challenge 4: Class GameLabel** create a class to display score and lives. 

The Score and Lives are mostly the same. They display text at a position on the screen. A GamLabel can extend Sprite to inherit the x, y properties, and the moveTo() and moveBy() methods. 

Here is a stub for the label class. You should fill in the constructor (don't forget to call super!) You should also fill in the override for the render method. 

Notice you're pass `text` as the second parameter. This will be the text that Label displays. 

```JS
class GameLabel extends Sprite {
  constructor(x, y, text, font='16px Helvetica', color = 'red', align = 'left') {
    // call super with properties as you would initialize sprite
    // define the new properties here on this: this.text and this.font

  }

  render(ctx) {
    // Add the code here to draw your text label
    // set the font: with ctx.font = this.font
    // Align the text with ctx.textAlign = this.align
    // ...
  }
}
```

You should be able to work with the GameLabel like this:

```JS
// make an instance of GameLabel
const scoreLabel = new GameLabel(10, 30, 'Score: 0')
// set the text property: 
scoreLabel.text = 'Score: 100'
// Update the score on the canvas
scoreLabel.render(ctx)
```

**Challenge 5: Bricks class** make a class that manages the bricks

This class will hold the array of bricks. It's also responsible for creating the array of bricks. 

Here is a stub for the Bricks class. Notice this class doesn't extend another class! It does import the Brick class since it's going to be creating instances of Brick. 

```JS
class Bricks {
  constructor(rows = 3, cols = 5) {
    this.rows = rows
    this.cols = cols
    this.bricks = []
    this.setup()
  }

  setup() {
    for (let c = 0; c < this.cols; c += 1) {
      this.bricks[c] = [];
      for (let r = 0; r < this.rows; r += 1) {
        const brick = new Brick()
        brick.x = (c * (brick.width + 10)) + 30;
        brick.y = (r * (brick.height + 10)) + 30;
        this.bricks[c][r] = brick;
      }
    }
  }

  render(ctx) {
    for (let c = 0; c < this.cols; c += 1) {
      for (let r = 0; r < this.rows; r += 1) {
        if (this.bricks[c][r].status === 1) {
          this.bricks[c][r].render(ctx);
        }
      }
    }
  }
}
```

**Stretch Challenge** 

**Stretch Challenge 1: Divide code into modules** 

Move each class into it's own js file and export that class as the default export. 


 Import these modules where they are used. For example: 

 ```JS
 // Sprite.js
 class Sprite { ... }

 export default Sprite
 ```

 ```JS
 // Ball.js
 import Sprite from './Sprite.js'

 class Ball extends Sprite { ... }

 export default Ball
 ```

 **Stretch Challenge 2: improve data structure**

The bricks are in a two dimensional array. This sounds like a good idea but adds it more problems than it solves. A single array would be a better solution. 

How would a single array track rows and columns? 

if you know the number of rows and columns the total number of bricks is: 

```JS
const totalBricks = rows * cols
```

If you're looping over 

### Deliverable

Submit your work on [GradeScope](https://www.gradescope.com/courses/202953). 

## Assessing the assignment

Use this rubric to measure the success of your work against the expectations of the assignment. You should be striving for an average score of 1 or greater.

| Aspect | Does not meet (0) | Meets (1) | Exceeds (2) |
|:-------------|:--------------|:-----|:---------|
| **Completion** | Did not complete all challenges | Completed all challenges | Completed challenegs and stretch challenges |
| **Code Quality** | Code shows linter errors | Code is profesional quality as confirmed by the linter | Code has comments and uses well named self documenting identifier names |
| **Work Ethic** | Less than 3 commits | 3+ commits | Used a branch for the changes made for these challenges |

## Assessing your knowledge

Use this rubric to assess how your understanding of the learning objectives. You should be striving for an average score of 1 or greater

| Expectations | Does not meet (0) | Meets (1) | Exceeds (2) |
|:-------------|:--------------|:-----|:---------|
| **OOP theory** | Can't explain the OOP in JS | Can explain OOP in JS | Can provide use cases and hypothetical examples for OOP in JS |
| **OOP Practice** | Can't create classes and sub classes without the documentation | Can create classes and sub classes without the documentation | Can use `super()` to call methods ont he super class, or override those methods when needed |


```JS
// Define an Object
const ball = { x: 23, y: 112, radius: 10, color: 'red' }
// Access properties
const paddle = { x: 23, y: 112, color: 'blue', minX: 0, maxX: 400 }
const brick = { x: 23, y: 112, color: 'orange', status: 1 }

class Sprite {
  constructor(x, y, color) {
    this.x = x
    this.y = y
    this.color = color
  }

  moveTo(x, y) {
    this.x = x
    this.y = y
  }
}

const sprite = new Sprite(123, 234, 'fuchsia')
{x:12, y:23, color: 'fuchsia'}

class Ball extends Sprite {
  constructor(x, y, color, radius) {
    super(x, y, color)
    this.radius = radius
  }
}

const ball = new Ball(12, 23, 'orange', 10)
ball.moveTo(55,77)

{x: 1, y: 3, color: 'green'}
{x:40, y: 34, color: 'red', radius: 10}
```