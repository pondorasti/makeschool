# The Flower Garden Part I

This assignment will first guide you through drawing a virtual garden of flowers using functions with turtle graphics and Python. 

You will then be asked to make a drawing of your own and refactor it in to a class.

By completing this assignment you will practice these important programming skills:

- Writing functions
- Creating parameters
- Calling and using functions

# Drawing a flower

## First some basics

Let's begin by figuring out the commands to draw a flower that looks like this using turtle graphics. 

![Turtle graphics flower](Images/flower.png)

<insert picture>

We won't worry about functions for now and will just write all our commands in main.py.

### Turtle Graphic Basics

The code snippet below shows the basic of turtle graphics. There are several important commands

<code> import turtle as t </code>

this line of code tells Python that we want to use the turtle graphics library to draw. We can imagine that t represents a robot turtle with a pen in its mouth sitting on a piece of paper. As we give commands to move the turtle the pen will draw across the paper and draw things.

<code>t.pencolor()</code>

pencolor is a command that will change the color of the line being drawn. It takes a string argument that is the color. [Here is a list of valid color strings](http://cng.seas.rochester.edu/CNG/docs/x11color.html) you can use.

<code>t.pensize()</code>

pensize is a command that changes the thickness of the drawn line. It takes an integer argument specifying the thickness. 

<code>
t.forward() & t.backward() 

</code>

the forward and backward commands move the turtle forwards and backward in the direction the turtle is facing. They take integer arguments that specify the number of turtle steps to take. You can also think of these steps like pixels. 

Try changing the values in the code snippet below and see what happens!

<iframe src="https://trinket.io/embed/python/1e1764772e" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

Next let's learn how we can turn our turtle

<code> t.right() & t.left() </code>

these commands will turn the turtle so that its head is facing a different way. They take in a single integer argument that represents the number of degrees the turtle should turn. Recall that there are 360 degrees in the circle that the turtle can rotate. 

The code snippet below shows right and left in action. 

<iframe src="https://trinket.io/embed/python/3cd0a50cb8" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

Now that you've got all that down try drawing a square!

## Draw the stem

The stem can be drawn by changing the pencolor to "green",rotating the turtle to face down, and then telling the turtle to move forward and backward the same number of steps.

Try drawing the stem.

<iframe src="https://trinket.io/embed/python/fa9d7b6276" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

## Draw the petals

Now that we have our stem we need to draw the petals of our flower. Let's start with this code snippet. Here we have only some of the petals drawn. What numbers do we need to change num_petals and num_degrees to? 

Hint: 360 / num_petals = num_degrees


<iframe src="https://trinket.io/embed/python/3483f3b1dc" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

## Finally the Center

A flower needs a center piece. To easily draw a circle whose center is in the middle of the we can use the .dot() command

<code> t.dot() </code>

.dot() takes in a single integer argument which will specify the radius of the circle you want to make in turtle steps. 

Try changing the color of the pen to "orange" and then writing t.dot() with a number in the () after the commands to draw the petals.

<iframe src="https://trinket.io/embed/python/9f5aa60ce5" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

## What if we want to draw many flowers?

Now you should have something that looks like a nice flower drawn on your screen! This is great but what if we want a whole garden of flowers? Do we really want to copy paste all that code we just wrote over and over again, isn't there a better way?

The answer to our troubles can be found in writing functions. Functions allow use to define code once and then easily use it over and over again just by writing the function name and the parameters.

Let's start by putting our flower drawing code into a function and calling it.

First we will create a function called <code> draw_flower() </code> and then copy and paste our code to be indented under the function definition. We can now call our function multiple times but if we do that we can see that our turtle is going to try drawing in the same location and will be turned making a very strange flower at the end. 

<iframe src="https://trinket.io/embed/python/590141f1d4" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

One thing we can do is use <code> t.setheading(0) </code> at the start of our function. This will reset the turtle to its default drawing position.

<iframe src="https://trinket.io/embed/python/f0eb098507" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

This is still a little boring though, what if we want to draw the flower in a different location? To enable us to specify where we would like to draw the turtle we can think of the drawing space as a coordinate grid with x,y coordinates. Using the <code> goto() </code> command we can set the location of the turtle before we start drawing! (Note that we also have to call <code> penup() </code> before goto so that a line isn't drawn when the turtle moves)

To make our function more flexible let's pass the x,y coordinates in a parameters to our function. When we call the function we can tell the turtle to start drawing from different positions for each flower.

<iframe src="https://trinket.io/embed/python/e0846e8cdc" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

Now we have two flowers drawn in different places. But what if we want them to be different colors? Or sizes? Or have a different number of petals? All of these thing can be changed into parameters so that we can specify the values in the function call. In the code below we have changed the value specified to pencolor into a parameter so that we can use different colors when we call the function. 

<iframe src="https://trinket.io/embed/python/d847b95727" width="100%" height="356" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>


## Assignment

1. Change the pen size, number of petals, length of the petal, and length of the stem into paramters passed to the draw_flower() function. Draw three different flowers by using three function calls.

2. Draw an idea of your own and then make it into a function. An idea could be a drawing of a simple rectangle car with two wheels.

Turn in both your flower code and your custom drawing function in to gradescope for HW1. 


