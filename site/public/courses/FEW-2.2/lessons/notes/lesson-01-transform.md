# FEW 2.2 - Advanced CSS - Drawing with CSS

This introduction will review CSS concepts and introduce transform.  

## Why you should know this?

Great question! Having the ability to place an element anywhere on the screen is useful, there are many applications, and opens up the range of the things you can make. When these ideas are applied to animations it opens even more options. 

While you might not be concerned with drawing and making pictures, it's quite possible someone will come to you with a visual idea and want you to recreate it. These are the tools you need. 

Let's be honest your CSS skills are rusty you just need some practice!

## Lesson Slides 

https://docs.google.com/presentation/d/1PrmtOPuSov0XPkSCYwM24rHeZ4GPFM1IWDQeyv5wH6U/edit?usp=sharing

## Learning Objectives

1. Transforming elements with CSS
  - Rotate
  - Translate
  - Skew
  - Scale
1. Using CSS to draw basic shapes 
  - Rectangles 
  - Circles 
  - Triangles
1. Use and define CSS selectors to select anything on the DOM
1. Apply styles to elements with selectors 
1. Use styles to control the appearance of everything! 

## Quick review your knowledge of CSS

CSS is the presentation layer. It defines the appearance of the structure layer (HTML).

You'll use selectors to target elements. 

Quick review your selectors! Pair up, using a single computer work through as many of the problems here as you can in 10mins.  https://flukeout.github.io

Q: How far did you get? 
Q: What did you learn?

## Can you draw with CSS? 

Sure you can! But it's not easy. Of course limitation opens creativity!

<blockquote>
  <p><q>Limitations breed creativity.<br>
  Limitations breed freedom.<q></p>
  <cite>- Taylor Gahm</cite>
</blockquote>

<blockquote>
  <p><q>The enemy of art is the absence of limitations.<q></p>
  <cite>- Orson Welles</cite>
</blockquote>

<blockquote>
  <p><q>Creativity is intelligence having fun.<q></p>
  <cite>- ?</cite>
</blockquote>

### Ideas

With CSS you can draw basic shapes like rectangles and circles. Each shape can have a fill and a border. 

To make a circle round the corners of a square using `border-radius`. 

The `border-radius` can be applied to each of the four corners separately. You can use this to create leaf and drop shapes. 

You can create more complex drawings by combining shapes. 

With CSS you can draw a few shapes using: 

- width
- height
- border
- background-color
- border-radius

Position and transform elements using: 

- position: absolute and relative
- transform: translate, rotate, scale, skew 

Use `position: relative` on the parent element. This will define the coordinate context for descendants that are position relative. 

Use `position: absolute` on elements when you want to place an element at an exact location. 

Use `transform` to apply a CSS transform to an element. There are several transforms: 

- translate(x, y) - moves/positions an element 
- rotate(angle) - rotates an element (units are `deg` or `rad`)
- scale(mult) - scales an element
- skew(angle) - skews an element (units are `deg` or `rad`)

**Transforms should be combined on a single line!** The transform property should only appear once but it can have as many values assigned as needed. For example:

`transform: translate(100px, 30px) rotate(45deg) scale(1.5) skew(-30deg)`

Here the element these rules apply to would be moved 100px to the right, 30px down, rotated 45deg clockwise, scale 150%, and skewed -30 degrees. 

`transform: translate(100px, 30px)` - moves this element 100px to the right and 30px down

`transform: translate(-50px, 0)` - moves this element 50px to the left

### Cartesian Coordinates 

Cartesian coordinates are like graph paper. The x position is measured along the horizontal axis and the y position is measured along the vertical axis.

x = 0 and y = 0 would place an element in the upper left corner. **Where that upper left corner is depends on which element has `position: relative`.** When using position absolute it's the relative ancestor that defines the coordinate space. 

## Drawing Shapes

What can you draw?

Pair up with someone you haven't paired with before. Look at the examples below and identify the shapes used to make the drawing. Discuss a strategy to create that shape. 

- https://css-tricks.com/the-shapes-of-css/
- https://blog.prototypr.io/how-i-started-drawing-css-images-3fd878675c89

### Border Radius

Use border radius to round the corners of elements. You can round all the corners or choose the corners and round each seprately. 

`border-radius: 50%` makes a circle if the height and width are equal

`border-radius: 12px` all corners have a radius of 12px

`border-bottom-left-radius: 50%` rounds the bottom left corner. 

Alternately you can round set the radius for each of the four corners on the same line: 

`border-radius: 12px 23px 34px 45px` here the upper left corner is 12px, the upper right is 23px, lower right is 34px, and the lower left is 45px. Remember this by starting in the upper left and moving clockwise. 

### Borders

To apply a border you need to include the width and style. 

`border: 1px solid` creates a 1px wide solid border (uses the font color since no color was included)

You can also the color:

`border: 1px solid red` the border is red. 

You can apply a border to each of the four sides of an element: 

`border-left: 3px solid green` sets the border on the left to 3px solid and green. 

## CSS Transform

People make the the most amazing drawings with only CSS. The goal is to get back into CSS and learn a few new features. 

- CSS Transform https://developer.mozilla.org/en-US/docs/Web/CSS/transform
  - rotate()
  - scale()
  - skew()
  - translate()

## Quick draw a logo for your new product! 

Use a whiteboard and draw a logo. **Keep it simple with basic shapes**. 

- Circles 
- Squares 
- Triangles

If you're not sure what to draw try one of these: 

- tree
- face
- home 
- bee 
- leaf 
- candle 

Simplify your logo as much as possible. Erase it and draw it again.

Draw your logo with Codepen. Vote on best pen. Use these properties: 

- Position 
  - absolute
- width, height
- background-color
- border, border-radius
- transform
  - rotate
  - scale
  - skew 
  - transform

Post your pen to Class Slack. Rate the logos with emojis. The winning logo receives a prize. 

## Advanced

If all of that was too easy try using CSS Clipping path.

https://bennettfeely.com/clippy/

## Logos with CSS

It's surprosing what you can create with pure CSS. 

https://freefrontend.com/css-logos/

Take a look at these. Realize that they are all built around basic shapes and use features like border-radius, opacity, and transform creatively.

## Homework 

The goal of this assignment is to create a drawing with only CSS. See the assignment description linked below for more details. 

[CSS Drawing](../Assignments/assignment-1-css-drawing.md)

## Wrap Up (5 min)

- What's a selector?
- What's your favorite selector? 
- What's the weirdest selector? 

## Additional Resources

- https://medium.com/coding-artist/a-beginners-guide-to-pure-css-images-ef9a5d069dd2
- https://a.singlediv.com
- https://medium.com/coding-artist/how-pure-css-images-helped-me-understand-react-components-3ad7b05051b0

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |
