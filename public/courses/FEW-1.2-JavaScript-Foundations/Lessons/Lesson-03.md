<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 3 - Code Structure

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](https://docs.google.com/presentation/d/1hHmOvX6HLqNt-8E94Rj-N_t7z-QUAVQ1rii_cQIIthw/edit?usp=sharing)

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ----------- |
| 0:05 | 0:05 | Overview |
| 0:05 | 0:10 | [Class Learning Objectives](#class-learning-objectives) |
| 0:05 | 0:15 | [Discuss Breakout tutorial](#discuss-breakout-tutorial) |
| 0:05 | 0:25 | [Arrays](#arrays) |
| 0:05 | 0:25 | [Loops](#loops) |
| 0:05 | 0:30 | [Functions](#functions) |
| 0:05 | 0:35 | [Objects](#objects) |
| 0:05 | 0:40 | [Conditional](#conditional) |
| 0:05 | 0:45 | [Name Space and Identifiers](#name-space-and-identifiers) |
| 0:05 | 0:50 | [Scope](#scope) |
| 0:10 | 1:00 | BREAK |
| 0:10 | 1:10 | [Expanding the game](#expanding-the-game) |
| 0:10 | 1:20 | [OOP](#oop) |
| 0:60 | 2:20 | [Challenges](#challenges) |

<!-- > -->

## Class Learning Objectives

1. Use for Loops 
1. Use Arrays
1. Use Objects
1. Use Conditional statements

<!-- > -->

# Discuss Breakout tutorial

Discuss these questions with someone else in class:

- How does the break out game work? (general overview)
 - Code flow what happens in what order?
- The application state is the data that describes the state of your application. 
 - How does break out define its application state?
 - The values stored by the game and how are they updated?

## How does Break Out work? 

The MDN break out code organizes its code in the following areas. 

It uses variable to hold values, constants are values that don't change, functions encapsulate blocks of code and some code that initializes the game. 

### Variables

These variables hold values that are used by the game to control and display game elements. 

- `bricks` - an **array** of objects `{ x, y, status }`
- `x`, `y` - These track the position of the ball
- `dx`, `dy` - **number** tracks the speed and direction of the ball. 
- `paddleX` - **number** tracks the position of the paddle. 
- `leftPressed`, `rightPressed` - **boolean** tracks when the arrow keys are pressed. 
- `score` - **number** holds the score
- `lives` - **number** holds lives 

### Constants 

Constants are fixed values used by the game that don't change. 

- `canvas` - a reference to the canvas used to get the canvas context
- `ctx` - canvas context needed for drawing on the canvas
- `ballRadius` - 
- `paddleHeight` - 
- `paddleWidth` - 
- `brickRowCount` - Number of rows of bricks
- `brickColumnCount` - Number columns of bricks
- `brickWidth` - 
- `brickHeight` - 
- `brickPadding` - 
- `brickOffsetTop` - space between the bricks and the top of the canvas
- `brickOffsetLeft` - Space between the bricks and the left of the canvas

### Functions 

- `drawScore()` - Draws the score
- `drawLives()` - Draws lives 
- `drawBricks()` - Draws bricks 
- `collisionDetection()` - looks for a collision between the ball and bricks
- `keyDownHandler()` - looks for right or left arrow pressed down
- `keyUpHandler()` - Looks for the left or right arrow key released. 
- `mouseMoveHandler()` - Looks for mouse move events and sets the paddle position. 
- `drawBall()` - Draws the ball 
- `drawPaddle()` - draws the paddle 
- `draw()` - Does a lot
 - clears the canvas
 - moves the ball 
 - looks for a collision between the ball and the edge of the canvas
 - Looks for a collision between the ball and the paddle
 - moves the paddle if the arrow keys are pressed 
 - calls all of the other functions: `drawBricks()`, `drawBall()`, `drawPaddle()`, `drawScore()`, `drawLives()`, `collisionDetection()`
 - Calls `requestAnimationFrame(draw)` which runs the draw function on the frame update. 

### Code just hanging out 

Some of the code is not in a function and is not a variable declaration and initialization. 

This code is run once when the page is loaded. You can think of it as initializing the program. 

- For loop initializes bricks array
- Adding event listeners
- Starting the game loop by calling `draw()`

<!-- > -->

### Breakout Flow

Discuss the flow of code. 

- Initialization
 - Define constants 
 - Define variables 
 - Define functions
 - Populate the bricks array 
 - Start the game
- Game Loop
 - Clear canvas
 - drawBricks()
 - drawBall()
 - drawPaddle()
 - drawScore()
 - drawLives()
 - collisionDetection()
 - Check ball position
 - Left and right side of the canvas?
 - Top of canvas?
 - bottom?
 - Hit Paddle?
 - Lose life
 - Game Over?
 - Move Ball
 - Check for keyboard input
 - Registers `draw()` to be called again when the screen refreshes. The program continues by repeating everything from Game Loop down.

<!-- > -->

## Challenges

Try these challenges to improve your understanding of the breakout code by improving the code.

### Challenge 1 - Organize Code 

Code works better and is easier to understand when it is organized.

- Arrange your code into these areas: 
 - constants 
 - variables 
 - functions 
 - initialization code

Use comments to mark each of the areas above. 

### Challenge 2 - Make Constants

Identify values that could be constants. These would be any value that you might want to change in the future. Making it a constant and defining it at the top will make it easy to find and change in the future. 

- color values are a good example. Move these into your constants section

What should you define as new constants? Anything that is a string, especially if it appears more than once. Here are some suggestions: 

- `const color = '#0095DD'`
- `const ARROW_RIGHT = 'ArrowRight'`
- `const ARROW_LEFT = 'ArrowLeft'`
- `const RIGHT = 'RIGHT'`
- `condst LEFT = 'LEFT'`

### Challenge 3 - Define new functions 

Storing your code in functions is a best practice. The tutorial code does an okay job but doesn't go far enough, you can improve on this! 

- Define an initialization function and move all of the initialization code here. 
- You'll need to call your initialization function to initialize the game. 

### Challenge 4 - Define new functions 

Functions are best when they do one thing. When a function does too much it's a sign of poor quality code. 

The `draw()` function does too much. Functions like `drawPaddle()`, `drawBall()`, `drawBricks()` are good they have one job that they do. Notice these functions are generally shorter. 

The draw function currently does all of this: 

- Clear canvas
- drawBricks()
- drawBall()
- drawPaddle()
- drawScore()
- drawLives()
- collisionDetection()
- Check ball position
  - Left and right side of canvas?
  - Top of canvas?
  - bottom?
  - Hit Paddle?
  - Lose life
  - Game Over?
- Move Ball
- Check for keyboard input
- Registers `draw()` to be called again when the screen refreshes.

Notice that one of the things the draw function is responsible for is calling other functions. 

Your job is to extract code from the draw function and create some new functions. Make the following functions using code you remove from draw then add a call to the new function inside draw. 

- `function moveBall()` - this function should move the ball by changing the x and y. 
- `function collisionCanvas()` - Checks for collision of the ball with the edges of the canvas. 
- `function collisionPaddle()` - Checks for collision with between the ball and the paddle.
- `function checkKeys()` - Moves the paddle if the left or right arrow is pressed. 

### Challenge 5 - Identify duplicate code

Identify Duplicate code. Any time you are doing the same operation more than once you should make a function. This will avoid errors in the future and make it easier to make changes and find problems.

- Look at the array where the bricks array is initialized. Each brick has an x and y of 0. Now, look at the `drawBricks` function. Here the x and y of each brick is calculated each time the bricks are drawn. Your goal is to initialize bricks with the correct x and y. Now just use the x and y of each in `drawBricks`.

### Challenge 6 - More Challenges 

- Change the color of the game elements. Use a different color for the ball, paddle, bricks, and background. 
- Colors the bricks so that each row is a different color
- Make the ball change color each time it hits a brick
- Change the number of rows and columns of bricks. For example, make 4 rows or 6 columns of bricks. 
- Make bricks 

### Challenge 7 - Draw something on the background

The game currently fills the canvas with a light gray then draws the game objects.

your goal with this challenge is to draw something interesting on the background. do this by creating a function that draws the background, call this new function from at the top of the draw function. 

### More Challenges

How would you solve these problems? Discuss these with someone else in the class. 

1. Each brick must display its own color?
2. Each brick is worth different point values?
3. The ball should move faster as the game progresses?
4. The ball needs to start at a random angle?
5. Imagine each time all the bricks are cleared a new row of bricks is added?
6. Imagine bricks take more than one hit to remove? 
7. One brick is special when hit it releases a second ball? 

## Wrap Up (5 min)

- Review

<!-- > -->

## Additional Resources

1. 


### Breakout Code with Comments

```JS
/* ***************************************************************

Challenge 1 - Make Constants
* Make these into constants defined at the top.

Challenge 2 - Identify duplicate code
** This block of code is repeated better to make a function for this.

Challenge 3 - Use Subroutines
*** This block of code would be better as a function.

Challenge 4 - Encapsulating code
**** Use objects to encapsulate code

***************************************************************** */

// **************************************************************
// DOM references
// **************************************************************

const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');

// **************************************************************
// Variables
// **************************************************************

// --------------------------------------------------------------
// Constants
// --------------------------------------------------------------

const ballRadius = 10;
const paddleHeight = 10;
const paddleWidth = 75;
const brickRowCount = 3;
const brickColumnCount = 5;
const brickWidth = 75;
const brickHeight = 20;
const brickPadding = 10;
const brickOffsetTop = 30;
const brickOffsetLeft = 30;

// --------------------------------------------------------------
// Variables
// --------------------------------------------------------------

// ** Initialize the position of the ball and paddle
// ** and set the ball speed and direction
// **** A Ball Object would be good.
let x = canvas.width / 2;
let y = canvas.height - 30;
// * This calculation could be better as a value
let paddleX = (canvas.width - paddleWidth) / 2;
let dx = 2;
let dy = -2;

let score = 0;
let lives = 3;

let rightPressed = false;
let leftPressed = false;

// --------------------------------------------------------------
// Setup Bricks Array
// --------------------------------------------------------------

const bricks = [];

// *** This would be better in a function
for (let c = 0; c < brickColumnCount; c += 1) {
 bricks[c] = [];
 for (let r = 0; r < brickRowCount; r += 1) {
 bricks[c][r] = {
 x: 0,
 y: 0,
 status: 1,
 };
 }
}

// **************************************************************
// Functions
// **************************************************************

function drawBall() {
 ctx.beginPath();
 // * Math.PI * 2 could be a constant
 ctx.arc(x, y, ballRadius, 0, Math.PI * 2);
 ctx.fillStyle = '#0095DD'; // * Could be good as a constant
 ctx.fill();
 ctx.closePath();
}

function drawPaddle() {
 ctx.beginPath();
 ctx.rect(paddleX, canvas.height - paddleHeight, paddleWidth, paddleHeight);
 ctx.fillStyle = '#0095DD'; // * Could be good as a constant
 ctx.fill();
 ctx.closePath();
}

function drawBricks() {
 for (let c = 0; c < brickColumnCount; c += 1) {
 for (let r = 0; r < brickRowCount; r += 1) {
 if (bricks[c][r].status === 1) {
 // **** This block should really be part of the brick initialization
 const brickX = (c * (brickWidth + brickPadding)) + brickOffsetLeft;
 const brickY = (r * (brickHeight + brickPadding)) + brickOffsetTop;
 bricks[c][r].x = brickX;
 bricks[c][r].y = brickY;

 ctx.beginPath();
 ctx.rect(brickX, brickY, brickWidth, brickHeight);
 ctx.fillStyle = '#0095DD'; // * Could be good as a constant
 ctx.fill();
 ctx.closePath();
 }
 }
 }
}

function collisionDetection() {
 for (let c = 0; c < brickColumnCount; c += 1) {
 for (let r = 0; r < brickRowCount; r += 1) {
 const b = bricks[c][r];
 if (b.status === 1) {
 if (x > b.x && x < b.x + brickWidth && y > b.y && y < b.y + brickHeight) {
 dy = -dy;
 b.status = 0;
 score += 1;
 if (score === brickRowCount * brickColumnCount) {
 // eslint-disable-next-line no-alert
 alert('YOU WIN, CONGRATULATIONS!'); // * Could be good as a constant
 document.location.reload();
 }
 }
 }
 }
 }
}

function drawScore() {
 ctx.font = '16px Arial'; // * Could be good as a constant
 ctx.fillStyle = '#0095DD'; // * Could be good as a constant
 ctx.fillText(`Score: ${score}`, 8, 20);
}

function drawLives() {
 ctx.font = '16px Arial'; // * Could be good as a constant
 ctx.fillStyle = '#0095DD'; // * Could be good as a constant
 // * canvas.width might be better as a constants
 ctx.fillText(`Lives: ${lives}`, canvas.width - 65, 20);
}

// --------------------------------------------------------------
// Game Loop
// --------------------------------------------------------------

function draw() {
 // Clear the canvas
 // * canvas.width, and canvas.height might be better as constants 
 ctx.clearRect(0, 0, canvas.width, canvas.height);
 // Call helper functions
 drawBricks();
 drawBall();
 drawPaddle();
 drawScore();
 drawLives();
 collisionDetection();

 // Bounce the ball off the left and right of the canvas
 if (x + dx > canvas.width - ballRadius || x + dx < ballRadius) {
 dx = -dx;
 }

 // Bounce the ball off the top, paddle, or hit the bottom of the canvas
 if (y + dy < ballRadius) {
 // hit the top
 dy = -dy;
 } else if (y + dy > canvas.height - ballRadius) {
 // hit the bottom
 if (x > paddleX && x < paddleX + paddleWidth) {
 // Hit the paddle
 dy = -dy;
 } else {
 // Lose a life
 lives -= 1;
 if (!lives) {
 // Game Over
 // eslint-disable-next-line no-alert
 alert('GAME OVER'); // * Could be good as a constant
 x = 200;
 y = 200;
 document.location.reload();
 } else {
 // Start the over you hit the bottom
 // ** Set the position of ball and paddle
 // ** And set the speed and direction of the ball
 x = canvas.width / 2;
 y = canvas.height - 30;
 dx = 2;
 dy = -2;
 paddleX = (canvas.width - paddleWidth) / 2;
 }
 }
 }

 // Move Ball
 // *** Better as a separate function
 x += dx;
 y += dy;

 // Check for arrow keys
 // *** Better as a function
 if (rightPressed && paddleX < canvas.width - paddleWidth) {
 paddleX += 7;
 } else if (leftPressed && paddleX > 0) {
 paddleX -= 7;
 }

 // Draw the screen again
 requestAnimationFrame(draw);
}

// --------------------------------------------------------------
// Event Listeners
// --------------------------------------------------------------

function keyDownHandler(e) {
 if (e.keyCode === 39) {
 rightPressed = true;
 } else if (e.keyCode === 37) {
 leftPressed = true;
 }
}

function keyUpHandler(e) {
 if (e.keyCode === 39) {
 rightPressed = false;
 } else if (e.keyCode === 37) {
 leftPressed = false;
 }
}

function mouseMoveHandler(e) {
 const relativeX = e.clientX - canvas.offsetLeft;
 if (relativeX > 0 && relativeX < canvas.width) {
 paddleX = relativeX - paddleWidth / 2;
 }
}

// **************************************************************
// Register Events
// **************************************************************

document.addEventListener('keydown', keyDownHandler, false);
document.addEventListener('keyup', keyUpHandler, false);
document.addEventListener('mousemove', mouseMoveHandler, false);


// **************************************************************
// Starts program entry point
// **************************************************************

draw();
```

