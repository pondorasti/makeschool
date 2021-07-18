# Class - Breakout - OOP

## Description 

The Game was originally written using a simple but limiting approach. Your goal with this assignment is to improve the quality of the code used in the game by using Object Oriented Programming (OOP) techniques. 

### Why this assignment?

You've used OOP in your CS classes. It's time to apply them in JS in new ways to this project. OOP is a big part of programming you need more practice master it. 

## Project requirements

Try the challenges below. These challenges refactor the original code into a more flexible code base by creating Objects and classes. 

### Deliverable

This will be another new branch in your GitHub repo. 

**Why all these branches?** Using branches here will give you more practice with GitHub. Structuring your project in this way will show your ability with GitHub. It will show your progress and illustrate the changes you made to the original code. 

### Due date

Class 5 - Tue, February 4

## OOP Challenges

Your job is to refactor your work. You'll be making a class object to replace the existing code. Along the way, you should also clean up your code, fixing formatting, indentation, and add comments.
 
**Challenge 1**: Define a class for `Ball`. This class is responsible for the ball object it should track its position and speed. The ball should have a method to draw it on the canvas and a method to update its position. 

- Properties 
    - `radius`
    - `color`
    - `x`
    - `y`
    - `dx`
    - `dy`
- Methods
    - `render(ctx)`
    - `move()`

**Challenge 2**: Define a class for `Brick`. This class should be responsible for a brick. It should keep track of the width, height, color, status, and location of a brick. It should also have a method to draw the brick on the canvas.

- Properties 
    - `x`
    - `y` 
    - `status`
    - `color`
    - `width`
    - `height`
- Methods 
    - `render(ctx)`

**Challenge 3**: Define a class for `Paddle`. This class is responsible for the paddle. It should track the paddle's position, it's color and size. 

- Properties 
    - `x`
    - `y` 
    - `color`
    - `width`
    - `height`
- Methods 
    - `render(ctx)`

**Challenge 4**: Define a class for `Background`. This class is responsible for drawing the background. It should know the color of the background and include a method to draw the background. 

- Properties
    - `color`
    - `?`
- Methods 
    - `render(ctx)`

**Challenge 5**: Define a class for `Score`. The score class is responsible for drawing the score and keeping track of the numeric value of the score. It should also track the position of the score on the screen. It needs a method to draw the score on the canvas.

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

**Challenge 6**: Define a class for `Lives`. Lives class should have a method to draw the lives text on the canvas. It should keep track of the number of lives, along with its position on the canvas, color, and font. 

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
 
**The goal is not to add new features.** In the end, you should have a better code that works the same. You're paying off technical debt and refactoring to make a better codebase.

## Stretch Challenges 

This OOP thing is fun! I can tell you want more! Here are a few more things you can try. 

**Stretch Challenge 1**: Make a `Game` Class. The Game itself can be an object that creates and owns all of the other objects. The game can hold all of the global properties, and methods. 

- Properties
    - `ball` - an instance of `Ball`
    - `bricks` - an array of `Bricks`
    - `score` - an instacne of `Score`
    - `lives` - an instance of `Lives`
    - `ctx` - a refernce to the canvas context
    - `width` - the width of the canvas
    - `height` - the height of the canvas
- Methods
    - `draw()` 
    - `collisionDetection()`
    - `keyDownHandler()`
    - `keyUpHandler()`
    - `mouseMoveHandler()`

 **Stretch Challenge 2**: Improved alert message. 

**Challenge**: Improve Alert messages.

**Problem**: That Alert box is annoying. It also stops everything until you click it. The Alert box should not be used by applications unless they issuing system type warnings. 

**Solution**: Make a custom overlay that displays a message. There are two approaches you can take
 
- Use a DOM element
    - Make a div that you will hide and show when you win or lose the game. 
    - Use tricky CSS wizardry (absolute position) to place the div over the canvas.
    - Use JavaScript to handle button clicks. 
- Draw the dialog box on canvas (not for the faint of heart)
    - Make a class that renders a dialog box
    - Listen for clicks on canvas check if a click is within the area of a button

 **Improve collisions**: 

 Currently the game checks for a collision of the ball with a brick or paddle by checking to see if the center of the ball is within the rectangular area of a brick or paddle. 

 (There is a different system used with the edges of the screen)

 This system of collision dete ction is easy to implement but has some imperfections. The ball will pass half way into any object before a collision is detected. 

**Solution**: There are a few ways to handle this. A step up from the current system would be to consider the ball as a rectangle with 4 points, one at each corner. Your code check each corner to find if it is within the rectangle of a brick or the paddle. 

### Deliverable

Submit your work on [GradeScope](https://www.gradescope.com/courses/202953). 

## Assess your work

| expectations | Does not meet (0) | Meets (1) | Exceeds (2) |
|:--------------|:---------------------------|:-------------------------|:---------------------|
| **Completed** | Did not complete the challenges | Completed all challenges | Completed stretch challenges |
| **Functionality** | Does not function or throws errors | Game functions as it did before the refactor | New features improve the functionality of the game |
| **Code quality** | Does not meet industry best practices | Meets industry best practice (confirmed by the linter) | Code is well organized and well commented, variables and functions make the code self documenting. |
| **Work Ethic** | less than 3 commits | New changes are in a branch, and more than 3 commits | Commits are descriptive and well documented | 

## Assessing your knowledge

Use this rubric to assess how your understanding of the learning objectives. You should be striving for an average score of 1 or greater

| Expectations | Does not meet (0) | Meets (1) | Exceeds (2) |
|:-------------|:-----|:-----|:-----|
| **OOP** | Can not describe OOP | Can describe OOP | can provide use cases for OOP |
| **Class** | Can not define a class without the documentation | Can define a class without the documentation | Can create classes with ease and plan for their use |
| **Instances** | Can't make an instance from a class without the docs | Can make an instance of a class with referencing the documentation | - |
| **Properties** | Can't describe what a property is | Can describe what a property is | Could define new classes with properties of any type |
| **Methods** | Can't describe what a method is | Can describe what a property is | Could define new classes with properties of any type |
| **dependency injection** | Can't describe dependency injection | Can describe dependency injection | Can identify dependency injection in the examples |

