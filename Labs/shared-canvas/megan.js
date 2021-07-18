import ctx, { size } from './main.js'

const x = 1 * size
const y = 0 * size

// draw a square
ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = 'cyan'
ctx.fill()

// draw bread
ctx.beginPath()
ctx.rect(x + 18, y + 33, size - 36, size - 40)
ctx.fillStyle = '#8B4513'
ctx.fill()
ctx.strokeStyle = '#000'
ctx.stroke()

// draw bread
ctx.beginPath()
ctx.arc(x + size / 2, y + 48, size / 2 - 15, Math.PI-0.4, Math.PI * 2+0.4)
ctx.fillStyle = '#8B4513'
ctx.fill()
ctx.strokeStyle = '#000'
ctx.stroke()

// draw egg white
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2+3, 30, 0, Math.PI * 2)
ctx.fillStyle = '#fff'
ctx.fill()

// draw egg yolk
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2+3, 10, 0, Math.PI * 2)
ctx.fillStyle = '#DAA520'
ctx.fill()

// draw egg shiny
ctx.beginPath()
ctx.arc(x + size / 2 - 3, y + size / 2, 4, Math.PI / 2, -Math.PI / 2)
ctx.fillStyle = '#fff'
ctx.fill()

// Draw some text
ctx.beginPath()
ctx.font = '24px Helvetica'
ctx.fillStyle = 'blue'
ctx.fillText('Nice to', x + 20, y + 30)

// Draw some text
ctx.beginPath()
ctx.font = '24px Helvetica'
ctx.fillStyle = 'blue'
ctx.fillText('eat you', x + 20, size + y - 5)

// Use the docs to figure out how to draw other things
// https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
