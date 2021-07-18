# PyGame Example: Snake!

## Setup Instructions

Install Pygame with the following command in your Terminal:

```
pip3 install pygame
```

To check that it was correctly installed, you can run the Python interpreter with `python3`, then run:

```
>>> import pygame
```

## Part 1: Answer Questions

With your group, answer the following questions about the Pygame code for the Snake game. To answer the questions, you may need to run the game to try it out, look at the code, or both.

1. What happens if the snake's head goes off of the screen (to the left, right, top, or bottom)? Verify your hypothesis by looking at the code for the `Snake` class's `move()` method.
1. What happens if you try to make a 180 degree turn - that is, if the snake is going to the right and you press the left arrow key? Verify your hypothesis by looking at the code for the `Snake` class's `move()` method.
1. What happens when the snake's head collides with the `Food` object? How does the game know that it needs to add another square to the snake's body? Verify your hypothesis by looking at the code for the main game loop as well as the `Snake` class's `move()` method.

## Part 2: Challenges

With your group, choose a Driver, a Navigator, and Observer. The Driver should share their screen and modify the starter code; the Navigator should give instructions on what to modify; and the Observer should give feedback or contribute ideas. After you complete each of the challenges, rotate roles.

**Challenge 1: Increase the Difficulty**

You got some customer feedback that your game is too easy! It's time to increase the difficulty. **Modify the code** so that if the snake's head touches any of the edges of the screen (top, bottom, left, right), the game resets and the points are reduced to 0.

**Challenge 2: Add Colors**

In Pygame, we can represent colors using an `(r, g, b)` tuple containing the color's red, green, and blue values. For example, a light green might have the RGB values of `(153, 255, 153)`, and a mauve color might have the RGB values of `(153, 0, 76)`. For more examples of RGB colors, check out [this resource](https://www.rapidtables.com/web/color/RGB_Color.html).

Now, let's make things more interesting by adding some new colors. **Add a helper function to the code, `generate_random_color()`**, which returns a tuple of 3 random integers between 0 and 255, inclusive, using the `random.randint()` method. Then, use the method to set the `Food`'s color to a random value, both when it is created and when its position is reset.

**Challenge 3: Increase the Speed**

Our customers are saying that the game is still too easy! Let's add a feature that will really trip them up. Right now, the framerate is set to 10 FPS, meaning the screen is re-drawn 10 times every second. Change the code so that every time the snake collides with a food, the framerate increases by 1 - i.e. the further you progress, the harder the game becomes!

## Resources

If you'd like more information on how to re-create Snake in Pygame, check out the following links:

1. [How to build SNAKE in Python](https://www.youtube.com/watch?v=9bBgyOkoBQ0) - the code from this video was adapted to create this lesson
1. [Learning pygame by creating Snake](https://www.youtube.com/watch?v=QFvqStqPCRU) - this walkthrough is longer, but shows how to incorporate images, sound effects, & more
1. [Pygame Documentation](https://www.pygame.org/docs/)

You may also want to search YouTube to see if there are any tutorials that are specific to the type of game you want to build - e.g. a platformer, top-down, etc.