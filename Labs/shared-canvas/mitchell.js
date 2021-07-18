import ctx, { size } from './main.js'

ctx.restore() 

const x = 4 * size
const y = 3 * size

// draw a square
ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = '#ff0'
ctx.fill()

// draw a circle 
ctx.beginPath()
// draw a complete circle
ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2)
ctx.fillStyle = '#333'
ctx.fill()

// Stroke a path
ctx.beginPath()
// draw half a circle
ctx.arc(x + size / 2, y + size / 2, 30, 0, Math.PI)
ctx.lineWidth = 3
ctx.strokeStyle = '#ffeeee'
ctx.stroke()

// Draw some text
ctx.beginPath()
ctx.font = '18px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('Hello', x + 8, y + 20)

ctx.beginPath()
ctx.arc(x + size / 2, y + 45, 18, 0, Math.PI * 2)
ctx.fillStyle = '#fff'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + 48, 10, 0, Math.PI * 2)
ctx.fillStyle = '#333'
ctx.fill()

// Use the docs to figure out how to draw other things
// https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
