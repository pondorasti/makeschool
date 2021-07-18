import ctx, { size } from './main.js'

const x = 2 * size
const y = 0 * size

// Ender Man by Matthew Wei
// Draw a square
ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = '#000000'
ctx.fill()

// Draw Eye One
ctx.beginPath()
ctx.rect(226, 50, 42.375, 14.125)
ctx.fillStyle = '#FF00FF'
ctx.fill()

// Draw Eye Two
ctx.beginPath()
ctx.rect(296.625, 50, 42.375, 14.125)
ctx.fillStyle = '#FF00FF'
ctx.fill()

// Draw Pupil One
ctx.beginPath()
ctx.rect(240.125, 50, 14.125, 14.125)
ctx.fillStyle = 'purple'
ctx.fill()

// Draw Pupil One
ctx.beginPath()
ctx.rect(310.75, 50, 14.125, 14.125)
ctx.fillStyle = 'purple'
ctx.fill()
