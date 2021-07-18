import ctx, { size } from './main.js'

const x = 5 * size
const y = 3 * size

ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = 'tomato'
ctx.fill()