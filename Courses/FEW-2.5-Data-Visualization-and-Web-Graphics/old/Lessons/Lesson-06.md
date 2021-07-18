# FEW 2.5 Canvas Part 2, Circle Math

Drawing circles and caluclating coords in circles. 

## Why? 

Not sure but it's probably useful! Circle are cool, you'll see them everywhere, one day you'll have to draw one. Might as well learn how today! 

## Learning Objectives

- Use Math functions and simple trigonometry
	- `Math.PI`
	- `Math.sin(radians)` -1 to +1
	- `Math.cos(radians)` -1 to +1

## Intro

Sometimes you'll want to place things in a circle. Imagine the numbers around a clock. If you had to make this yourself you'd need to place each of the numbers equally spaced around a enter point. 

To do this use `Math.sin()` and `Math.cos()`. Each of these takes a value in radians and return a number between -1 and +1. Multiply the return value by the radius. 

A full circle is `Math.PI * 2`. 

Think about the clock. To get the position of each hour divide the circle by 12. 

`const step = Math.PI * 2 / 12`

Decide what the radius of your clock face is. Imagine it's 200px. 

```JS
const numbers = [1,2,3,4,5,6,7,8,9,10,11,12]
const step = Math.PI * 2 / numbers.length
const radius = 200
numbers.forEach((n, i) => {
	const x = Math.sin(step * i) * radius
	const y = Math.cos(step * i) * radius

	// draw number at x, y
})
```

The center of the clock face would be at 0, 0 with the numbers arranged in a 200 pixels radius circle around that point. Imagine the center of the clock in the upper left corner. 

You usuallt don't want to place everything in the upper left corner. To move the center of the clock face anywhere on the canvas you'll need to offset the x and y values. 

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

## After Class

- Continue working on visualization 3

## Additional Resources

- [Example code](../lesson-06.html)
- [Sine/Cosine](https://en.wikipedia.org/wiki/Sine)