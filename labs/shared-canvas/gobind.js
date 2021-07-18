import ctx, { size } from './main.js'

const x = 4 * size
const y = 3 * size

// Draw the Dark Mode icon
// First, draw a dark circle
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2)
ctx.fillStyle = '#333'
ctx.fill()

// Then overlay with a slightly smaller white semi-circle on the right
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 35, -Math.PI / 2, Math.PI / 2)
ctx.fillStyle = 'white'
ctx.fill()

// Then draw a small dark circle in the center
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 15, 0, Math.PI * 2)
ctx.fillStyle = '#333'
ctx.fill()

// Lastly, overlay with a small white semi-circle on the left of the center
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 15, Math.PI / 2, -Math.PI / 2)
ctx.fillStyle = 'white'
ctx.fill()
