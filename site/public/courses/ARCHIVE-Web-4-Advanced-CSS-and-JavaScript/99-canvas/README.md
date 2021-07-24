# Canvas 

Canvas an element that represents a collection of pixels. 
Like the `img` element with the difference that the pixels 
contained in a canvas and can be modified via JavaScript. 

Use the canvas to draw dynamic bitmap images into a web page. 

Why not use HTML elements? You'd want to use HTML elements for
most things on the web but some circumstance might need a 
different approach. 

- For games canvas could provide better performance. Traversing 
the DOM is slower than blasting pixels into a bitmap. 
Remmber all of those DOM elements need to be converted to pixels
at some point. 
- Some effects might be hard to produce with DOM elements. For 
example many of the Google Doodles use canvas. 

## How do you work with canvas?

First make a canvas element. Include a width and height.

`<canvas width="400" height="300"></canvas>`

Use JavaScript to get a reference to the drawing context. 

`const ctx = document.querySelector('canvas').getContext('2d')`

The drawing context contains the pixels displayed in canvas. 
You can draw on the context and it appears in the canvas. 

Things drawn on the context are part of the entire context 
they are not separate objects. 

### What's a graphic context?

A graphic context is an object that contains all of the 
properties and methods required to draw in place. Imagine 
the drawing context as a place where the drawing happens. 
Each canvas will have only one context. 

When drawing you will configure the canvas before each 
drawing operation. For example to draw a box containing 
text you might: 

- clear the context to erase any previous drawing
- Draw rectangle 
  - set the fillStyle to determine the fill color 
  - use the rectFill method to fill with the current color
- Draw Text
  - set the font 
  - set the fillStyle to define a new fill color
  - use fillText to draw the text with the current fill style

Since the text was drawn second it was draw on top. 

The first step was to clear the context. Without this step
the rectanble and text would have been drawn on top of any
existing image in the conext. 

```
var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");

// clear

ctx.fillStyle = 'rgba(200, 0, 0, 0.4)'
ctx.fillRect(20, 20, 200, 60)

ctx.font = "30px Verdana";
ctx.fillStyle = 'rgba(20, 0, 0, 1)';
ctx.fillText("Hello World", 10, 90);
```

A context draws on a single context. As you draw you'll need
to take into account the state of the canvas and the state of 
the context before executing each drawing opperation. 

THe order of drawing also matters. Subsequent drawing
opperations draw on top of current image on the canvas. 

### What can you Draw?

You can draw shapes and paths with stroke and fill. You can 
fill with solid colors and gradients. You can also draw 
images into a canvas. 

- Circles
- Rectangles 
- Lines
- Text
- Strokes and Fills
- Gradients
- Shadows
- Paths 
- More...

Drawing anything follows the pattern of setting the style 
on the drawing context then invoking a drawing method. 

```
ctx.fillStyle = 'rgb(200,0,0)'; // The fill style
ctx.fillRect(10, 10, 55, 50);   // Draw a rectangle 
```

The first line sets the state of the context. Drawing 
will be executed in that state. Calling method that creates 
a fill will produce a red fill `rgb(200, 0, 0)` is red.

The second line fills a rectagular area starting from x of 10
and y of 10 with a width of 55 and a height 50 
`fillRect(10, 10, 55, 50)`.

## Try it

- Create a canvas
- Get the context in JavaScript
- Set the fill style 
- Draw a rectangle

**try these**

- Draw 10 rectangles 
- Set a random color for each

## Drawing methods and properties

Take a look at the list of properties and methods 
of the drawing context. 

### Styles 

- lineWidth
- lineCap
- lineJoin
- miterLimit
- getLineDash()
- setLineDash()
- lineDashOffset

### Text styles 

- font
- textAlign
- textBaseline
- direction
- fillStyle
- strokeStyle

### Drawing methods 

- strokeRect()
- fillRect()
- clearRect()

- fillText()
- strokeText()
- measureText()

### Gradient and Patterns 

- createLinearGradient()
- createRadialGradient()
- createPattern()

### Shadows

- shadowBlur
- shadowColor
- shadowOffsetX
- shadowOffsetY

### Paths 

In the case of paths you need draw a path on the context 
then stroke or fill the path. 

- beginPath()
- closePath()
- moveTo()
- lineTo()
- bezierCurveTo()
- quadraticCurveTo()
- arc()
- arcTo()
- ellipse()
- rect()

### Draw path

- fill()
- stroke()
- drawFocusIfNeeded()
- scrollPathIntoView()
- clip()
- isPointInPath()
- isPointInStroke()

## Making Objects that render themselves



- https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_usage

