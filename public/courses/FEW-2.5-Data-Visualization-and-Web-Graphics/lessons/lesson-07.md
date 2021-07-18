
# FEW 2.5 - Lesson 7

<!-- Put a link to the slides so that students can find them -->
<!-- 
➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-6.html ':ignore') -->

<!-- > -->

## Overview

This class will be a workshop to work on and finish up the audio visualizer project and study the Math of Circles. 

### Why?

Circles are used all the time in visualizations (pie chart, scatter plot, dot plot, cluster analysis, etc.) and it's important to know how to draw them in order to properly convey your analysis.

Plus they're cool!

<!-- > -->

## Learning Objectives

- Use Math functions and trigonometry
- Draw images with circles and code

<!-- > -->

## Intro

Sometimes you'll want to place things in a circle. Imagine the numbers around a clock. If you had to make this yourself you'd need to place each of the numbers equally spaced around a center point.

Imagine you know where the center of the circle is and imagine that it is x 0 and y 0. To place the 12 it would be 0 x and y - the radius of the circle. For the 3, 6, and 9 you could follow a similar pattern. 

When it's time to place the 1, 2, 4, and other numbers it's hard to caluclate the their x and y. 

There are a few Math functions that can help with this.

You are probably used to looking at a circle as 360 degrees. In trigonmetry we look at a circle radians. There are  Pi radians in a circle. Or you could think of 2 Pi as 360 in degrees.

`Math.sin()` and `Math.cos()` can be used to map an x and y value from radians. Each of these functions takes a value in radians and return a number between -1 and +1. Multiply the return value by the radius to get the x and y around the center.

Think about the clock. To get the position of each hour divide the circle by 12.

`const step = Math.PI * 2 / 12`

<!-- v -->

Decide what the radius of your clock face is. Imagine it's 200px.

```JS
const numbers = [3,4,5,6,7,8,9,10,11,12,1,2]
const step = Math.PI * 2 / numbers.length
const radius = 200
numbers.forEach((n, i) => {
	const x = Math.sin(step * i) * radius
	const y = Math.cos(step * i) * radius

	// draw number at x, y
})
```

The center of the clock face would be at 0, 0 with the numbers arranged in a 200 pixels radius circle around that point. Imagine the center of the clock in the upper left corner.

You usually don't want to place everything in the upper left corner. To move the center of the clock face anywhere on the canvas you'll need to offset the x and y values.

<!-- v -->

```JS
const numbers = [1,2,3,4,5,6,7,8,9,10,11,12]
const step = Math.PI * 2 / numbers.length
const radius = 200
const offsetX = 300
const offsetY = 250
numbers.forEach((n, i) => {
	const x = Math.sin(step * i) * radius + offsetX
	const y = Math.cos(step * i) * radius + offsetY

	// draw number at x, y
})
```

Just add the offset to the x and y. In this case the center of the clock face is at 300, 250 on the canvas.



<!-- ## Playing with Circles

Check out the [Example code](../lesson-06.html) linked here and see how you can manipulate the circles!  -->

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

Take 10 minute break

<!-- > -->

## Lab

Continue working on the audio visualizer project. 

Use the lab to time complete the challenges and stretch challenges. 

<!-- > -->

## After class

- Continue working on - [Audio Visualization](assignments/assignment-3.md) Due Feb. 17. Submit on GradeScope.

<!-- > -->

## Additional Resources

- [Example code](../lesson-06.html)
- [Sine/Cosine](https://en.wikipedia.org/wiki/Sine)

<!-- > -->

## Minute-by-Minute

<!-- 
| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         | 
-->
