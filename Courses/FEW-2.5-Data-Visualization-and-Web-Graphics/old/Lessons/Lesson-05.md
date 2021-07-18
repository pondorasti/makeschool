# FEW 2.5 Working with Canvas

This session will work with canvas. HTML offers some interesting possibilities but also has some limitations. Canvas gives you the power to draw with pixels directly to the screen. 

## Why? 

Canvas is the only way to draw something. Anytime you are working with images and image generation canvas will be behind it all. 

## Learning Objectives 

- Use canvas to create images 
    - Use data to draw a rectangle of any size and any position
    - Use data to draw circles anywhere on the screen
    - Use data to draw arcs anywhere with any radius
- Use trigonometry concepts to describe circles and arcs
- Using GitHub Pages

## Your work on GitHub Pages 

Use GitHub Pages to host your work. Each of your visualizations should exist on GitHub Pages. 

Follow the guide [here](https://pages.github.com) to setup your GitHub Pages. 

Add a link to your GitHub Pages repo in the project tracker. 

Here are some [example visualizations](https://github.com/soggybag/data-visualizations) on GitHub Pages. 

## Canvas Intro

What is canvas? Canvas is a rectangular area filled with pixels. The canvas object has methods that allow you to access the pixel data and draw images. 

See the sample code for these concepts here: [lesson-05.html](../lesson-05.html).

### Drawing things with canvas

context - All of the drawing methods are accessed through the context. The context is a single shared object that acts like a toolbox. 

coords - Canvas is mapped out in a grid that starts from the upper left corner. Grid coordinates are measured in pixels. 

The horizontal axis is x

The vertical axis is y

Usually, functions will ask for an x and y value to position something. 

paths - Using the drawing tools you will often be creating paths. Paths are not visible until you stroke and or fill them with pixels.

Usually you will begin a new path, draw a path, stroke and fill the path, then close the path. In code that might look like: 

```JS 
ctx.beginPath()    // Start a new path
ctx.moveTo(50, 350) // move to a starting point
ctx.lineTo(550, 50) // draw a line to this point
ctx.lineWidth = 13 // set the width of a stroke
ctx.strokeStyle = 'red' // set the color of the stroke
ctx.stroke() // draw the stroke
```

reactangles - You can draw rectangles with `moveTo()` and `lineTo()` the `rect()` function is a short cut. 

```JS 
ctx.beginPath()    // Begin a path
ctx.rect(200, 120, 100, 140) // draw a rectangle
ctx.fillStyle = 'red' // set the fill style
ctx.fill() // fill the rectangle
```

strokes and fills - When you want to see a path on the screen you'll need to stroke or fill it. To do this set the `fillStyle`, and or `strokeStyle` to the color, and the `lineWidth`, then call `fill()` or `stroke()`

Arcs and circles - Use the `arc()` method to draw arcs and circles. 

`arc(centerX, centerY, radius, startingAngle, endingAngle)`

The signature describes how the method draws. The first two parameters are like planting the point of a compass at a location, set the radius and starting and ending angle. 

The angle is in radians!

## Quick note about radians

Circles are measured in radians. A complete circle is 2 * PI. Half a circle would be PI. 

![Radians](../images/radians.png)

If you want to draw an arc that represents a value follow this guide:

- Normalize your value (convert it to a range of 0 - 1 by dividing by the largest value in the set)
- Decide on the range of the arc.
    - If you want 100% to be a full circle multiply by Math.PI * 2
    - If you want 100% to be a half circle multiply by Math.PI
- Decide on the starting angle. The default will start drawing from 0 in the diagram above and follow the arrow. Find the starting position in the diagram and add that value to both the starting angle and ending angle.

![Radians](../images/radians-2.png)

![Radians](../images/radians-3.png)

## Blocks 

A block is a block of code. Often you define these as part of a function, if statements, and loops. The block is defined with `{}`.

```JS
function() { ...block... }

if () { ...block... }
        
for () { ...block... }
```

You can also define standalone blocks that are not part of `statement`. 

```JS
{ ...block... }
```

Why? Scope! Variables defined with `const` or `let` are block scoped!

```JS
{
    let i = 0
    const step = 600 / 12
    ...
}

console.log(i) // undefined
```

In the example above `i` and `step` would only be available inside the `{ block }`

## Sets 

A set is like an array but may only contain unique values. Sets are more efficient than arrays and may add a slight performance boost in some cases. 

```JS
// Create a new set
const mySet = new Set() // or new Set([1,2,3])
// Add elements 
mySet.add(1)
mySet.add(2)
mySet.add(3)
mySet.add(1)
console.log(mySet) // Set(3) [1, 2, 3]
// Count the set -> mySet.length 0
console.log(mySet.size) // 3
// Iterate over the set 
mySet.forEach((val, key) => {
    console.log(val) // 1, 2, 3
})
// Check if an value exists 
console.log(mySet.has(1)) // true
console.log(mySet.has(5)) // false
// Remove an element from the set
mySet.delete(2) // returns true 
console.log(mySet.has(2))    // false
```

The examples in the code sample for this class uses Set. 

## After Class 

- Start working on this week's [visualization](../Assignments/visualization-3.md). 

## Resources 

- [Set](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/prototype)
    - [Set.size](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/size)
    - [Set.add()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/add)
    - [Set.delete()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/delete)
    - [Set.has()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/has)
- [Canvas](https://developer.mozilla.org/en-US/docs/Glossary/Canvas)
    - [ctx.arc()](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/arc)
    - [ctx.lineWidth](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth)
    - [ctx.fillStyle](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle)
    - [ctx.strokeStyle](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeStyle)
    - [arc.lineTo()](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineTo)
    - [ctx.moveTo()](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/moveTo)
    - [ctx.rec()](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/rect)
