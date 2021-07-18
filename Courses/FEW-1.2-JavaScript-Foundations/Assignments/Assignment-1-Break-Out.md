# Class - Breakout 

## Description 

Learn JavaScript by building the classic arcade Break Out. You will use vanilla JS writing all of the code yourself.

### Why this assignment?

This assignment includes a wide range of all features of the JavaScript language. Including functions, variables, arrays, objects, and if-else, and loops. 

**Understanding the concepts used in this project will take you a long way to being able to understand and answer technical questions at interviews.**

Besides basic JS included in the tutorial, you will update everything to modern JavaScript syntax and restructure the code using OOP techniques. 

Last you'll implement a build system and apply modern coding best practice to the project. 

## Project requirements

The start of this project is to complete the tutorial here: 

https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript

Follow these steps: 

- Create a new GitHub repo
- Follow the tutorial here: https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript
- Create a commit at the end of each step of the tutorial
 - There are 10 steps to the tutorial you should have a commit for each step. 
- After completing the tutorial try the stretch challenges below. 

### Deliverable

Submit your work on [GradeScope](https://www.gradescope.com/courses/202953). 

## Assessing the assignment

Use this rubric to measure the success of your work against the expectations of the assignment. You should be striving for an average score of 1 or greater.

| Aspect | Does not meet (0) | Meets (1) | Exceeds (2) |
|:-------------|:--------------|:-----|:---------|
| **Completion** | The tutorial is not been completed | Tutorial completed (all 10 steps) | You have tried the stretch challenges |
| **Functionality** | The game is not functioning or partially functional | The game is functional | You have successfully implemented some or all of the stretch challenges |
| **Work Ethic** | < 3 commits. | Commits show consistent work| commits show full 3 hours of work |

## Assessing your knowledge

Use this rubric to assess how your understanding of the learning objectives. You should be striving for an average score of 1 or greater

| Expectations | Does not meet (0) | Meets (1) | Exceeds (2) |
|:-------------|:--------------|:-----|:---------|
| **Writing JS** | Can not write simple programs with JS without a tutorial | Can write simple programs in JS without tutorial | Could write a JS tutorial that teaches simple programming concepts |
| **Code Flow** | Can not evaluate and explain the flow of code in the tutorial | Can explain and follow the flow of code in the tutorial program | Could make improvements, evaluate, and optimize the flow of code in the tutorial program |
| **Variables** | Could not define variables without reference | Can define and use variables without a reference | Could easily define variables of any type without reference |
| **Functions** | Could not write a function without reference | Can write functions from memory | Could use functions to organize code in any new program |
| **Loops** | Could not write a loop without reference | Can write a for loop without reference | Could write a loop that iterates from any starting value to any ending value without reference |
|**Arrays** | Could not define and use an array without reference | Can define and use arrays without a reference | Could plan new programs that work with arrays |
|**Objects** | Could not define and use objects without reference | Can define and use objects without a reference | Could plan new programs that work with objects |

### Stretch Challenges 

**Change the colors**

Everything is currently blue and gray. Choose some new colors to customize the game. Change the colors of these elements: 

- Bricks
- Ball
- Paddle
- Background

**Make each row a different color**

A single color is not very interesting. Make each row a different color. Bricks are managed with a two-dimensional array. 

The code draws all of the bricks with each call to `draw()`, this method calls the `drawBricks()`. You'll need to solve this here. In this method, the variables `c` and `r` hold the number of the column and row for each brick. Change the color by changing the `cxt.fillStyle`. 

See the image below: 

![Colored Rows](images/Break-Out-Bricks-Colors-Rows.png)

**Make each column a different color**

You changed the rows try changing the columns to different colors. 

![Colored Columns](images/Break-Out-Bricks-Colors-Columns.png)

**Alternate colors of bricks**

Alternate the colors of the bricks. 

![Break-Out-Bricks-Colors-Alternate.png](images/Break-Out-Bricks-Colors-Alternate.png)

**Make more rows**

The game might be more fun if there were more bricks. Add more bricks in each row. To do this you'll need to change the number of bricks along with the width of each brick. 

Make sure the space between the bricks stays the same. 

![More bricks](images/Break-Out-Bricks-sizes.png)

**Make more rows and columns**

![Break-Bricks-More.png](images/Break-Bricks-More.png)

**Offset rows**

![Offset rows](images/Break-Out-Bricks-sizes-2.png)

**Different sized bricks**

![Differnt sizes](images/Break-Out-Bricks-sizes-3.png)

**Make colored bricks worth points**

Make each row of bricks worth a different number of points. The first row is worth 10. The second row is worth 100 and the top row is worth 100 for each brick.

**Custom Background** Write a function to draw the background for the game. Currently the `draw()` function clears the canvas on it's first line with: 

`ctx.clearRect(0, 0, canvas.width, canvas.height);`JS

Add a function called `drawBackground()`. Call this on the first line of `draw()`. 

Try these challenges: 

- Fill the background with a color other than the default color. Do this by drawing a rectangle that starts at x 0, y 0 with a width and height that match your canvas. Do all of this in the `drawBackground()` function. 


