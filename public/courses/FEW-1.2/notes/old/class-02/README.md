# FEW 1.2 - Class 2

## Loops and Conditionals

Break out loops and conditionals

## Objectives 

- Write loops with JavaScript
- Use loops to repeat programming tasks
- Define colors with JavaScript
- Use conditional statements to make decisions in code
- Solve problems with loops and conditional statements
- Use canvas
    - Clearing canvas
    - Drawing circles on `canvas`
    - drawing rectangles on `canvas`

## Fun with loops 

Write a for loop

What are you doing? 

Write an array?

Loop through the array. 

What are you doing? 

Write a function

What are you doing? 

Combine the two! 

What if each item in the array was another array? 

Write a 2d array

Visualize rows and columns

Fill even numbered rows with 'A' and odd rows with 'B'


Fill event numbered cols with 'A' and odd cols with 'B'

Alternate 

## How does Break Out use loops and arrays? 

Loops are a tool to repeat a task a number of times. 
Use them to automate repetitive code. 

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration
- https://eloquentjavascript.net/02_program_structure.html

## Conditionals 

If else statements, switch statements, and ternary operators allow your programs to make decisions. 

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else
- https://eloquentjavascript.net/02_program_structure.html

## Break Out Loops and Conditionals challenges 

The game is going over great with investors. The UI/UX teams have been working furiously, they have many ideas for engineering to implement, lucky you!

Feedback from extensive user testing has revealed that people would find the game more interesting and engaging if there were more colors. You have to admit they may have a point, right?

- **Challenge 1**
  - Change the colors. 
    - The colors appear as strings in the `drawBall()`, `drawPaddle()`, and `drawBricks()` functions. 
    - Find these, and choose your own colors. 
    - Make all the colors different.
    - Change the background color. 

The new colors are good but someone had a brilliant idea, and it might really be brilliant, to make make the bricks alternate in color. 

<figure>
  <figcaption> 
    Bricks Default Color 
  </figcaption>
  <img src='images/Break-Out-Bricks.png' />
</figure> 

To do this you will need to use some conditional logic within the function that draws the bricks. The `drawBricks()` function uses two loops to draw bricks along columns and rows. 

There are a couple of variables here that could be useful you in your quest for colors!

`c` is the column number. It's used to set the x or horizontal position of a brick. This variable counts from 0 to `brickColumnCount`. 

`r` is the row number. It's used to set the `y` or vertical position of the brick. This variable counts from 0 to `brickRowCount`. 

To determine the colors you'll need to have a plan. First, you'll need to decide on the colors you want to use. The colors are stored as strings but the value can be any color that you could use with CSS. Here are a few options: 

**Color Types:**

- [Named Color](https://www.w3schools.com/tags/ref_colornames.asp): 
  - `'red'`, `'green'`, `'brown'`, `'orange'`, `'cadetblue'`
- [Hex Color](https://www.w3schools.com/colors/colors_hexadecimal.asp): 
  - `'#ff0000'`, `'#ff00ff'`, `'#ddd'`, `'#12ddaa77'`
- [RGB Color](https://www.w3schools.com/colors/colors_rgb.asp):
  - `'rgb(255, 0, 0)'`, `'rgb(123, 87, 255)'`
- [RGBA Color](https://www.w3schools.com/css/css3_colors.asp):
  - `'rgba(255, 0, 0, 0.5)'`, `'rgba(123, 87, 255, 0.76)'`
- [HSL Color](https://www.w3schools.com/colors/colors_hsl.asp):
  - `'hsl(205, 100%, 50%)'`, `'hsl(115, 59%, 50%)'`
- [HSLA Color](https://www.w3schools.com/css/css3_colors.asp):
  - `'hsla(0, 100%, 30%, 0.3)'`, `'hsla(115, 59%, 50%, 0.83)'`

**Tip!** HSL colors separate the Hue from the other color components. Because of this use, HSL can easily create rainbows, that is a sequence of colors that change hue, or tints and shades of a color, colors that get lighter or darker but stay in the same hue. Using HSL it's easier to programmatically transform one color into another or create a sequence.  

Hue has a range of 0 to 360. Think of color as a circle and hue moves around the circle starting with red, moving through all of the colors of the rainbow and ending on red. 

**Strategies**

Since the color values used are strings you can generate a string with variables. 

```JavaScript
for (let hue = 0; hue < 360; hue += 20) {
  const hslStr = `hsl(${hue}, 100%, 50%)`;
  ...
}
```

You could also store a list of colors in an array. This would be good if you decide on the colors you want to use in advance. 

`['red', 'green', 'blue']` or `['#f0f', '#ff0', '#0ff']`

- **Challenge 2**
  - Make the bricks different colors
    1. Make each row of bricks a different
    2. Make each column s different color
    3. Make the bricks alternate in color
    4. Make each brick a different random color
    5. Make more rows and columns (you may need to increase the size of the canvas)
    
    
<figure>
  <figcaption> 
    Challenge 1.1: Bricks colored by row 
  </figcaption>
  <img src='images/Break-Out-Bricks-Colors-Rows.png' />
</figure>

<figure>
  <figcaption> 
    Challenge 1.2: Bricks colored by column
  </figcaption>
  <img src='images/Break-Out-Bricks-Colors-Columns.png' />
</figure>

<figure>
  <figcaption> 
    Challenge 1.3: Bricks Alternate color
  </figcaption>
  <img src='images/Break-Out-Bricks-Colors-Alternate.png' />
</figure>

<figure>
  <figcaption> 
    Challenge 1.4: Bricks random colors
  </figcaption>
  <img src='images/Break-Out-Bricks-Random.png' />
</figure>

<figure>
  <figcaption> 
    Challenge 1.5: More bricks
  </figcaption>
  <img src='images/Break-Bricks-More.png' />
</figure>

You're doing well. So well, you've been assigned to the _experimental squad_. You've been given the go-ahead to implement new and experimental features. These are dangerous and often have deeper implications that leave regular people scratching their heads asking "but, why would you want to do that?"

- **Stretch Challenges**
  1. Make the bricks different sizes
    - You can give each brick object width and or height. You'll have to be more careful about the layout. 
  2. Stagger the rows so that the first row is a little further to the left and the next row is a little further to the right. You can probably handle this all in `drawBricks()`.
  3. Make each row use different sized bricks. You can store the width and height of a brick as a property of each object in the bricks Array. You'll need to take in to account the width and height of each brick in `drawBricks()`. 
  
<figure>
  <figcaption> 
    Stretch 1.1: Bricks resized
  </figcaption>
  <img src='images/Break-Out-Bricks-sizes.png' />
</figure>

<figure>
  <figcaption> 
    Stretch 1.2: Bricks staggered
  </figcaption>
  <img src='images/Break-Out-Bricks-sizes-2.png' />
</figure>

<figure>
  <figcaption> 
    Stretch 1.2: Bricks staggered
  </figcaption>
  <img src='images/Break-Out-Bricks-sizes-3.png' />
</figure>

### Why solve these challenges? 

These challenges are similar to questions asked at technical interviews solving these problems is great preparation for the future! 

These problems also stretch your knowledge of JavaScript and give you an opportunity to practice your craft! The tutorial includes arrays and objects which are core features of the language and the basis for advanced topics. The tutorial will push your knowledge with more advanced topics like multidimensional arrays and complex conditional statements. 

## Breakout Tutorial Challenges 

| -            | Does not meet expectations | Meets expectations       | Exceeds expectations |
|:-------------|:------------------|:-------------------------|:---------------------|
| **Completed** | Did not complete | Completed the tutorial   | Modified the tutorial and improved on the existing code |
| **Functional** | Is not functional | Base tutorial functional | Modified the existing code adding improvements, uses `const` and `let` over `var` where appropriate |
| **Code quality** | Indentation is bad, white space is inconsistent | Uses consistent indentation and spacing | Well written and well commented, code is well organized with variables at the top, and functions arranged logically |
| **Work Ethic** | Did not commit when working on project | Initial commit at class and commit while working | Commits show 3 hours and clearly document process | 

