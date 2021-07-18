import ctx, { size } from './main.js'

const x = 2 * size
const y = 3 * size

ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = '#000'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 50, 0, Math.PI * 2)
ctx.fillStyle = '#fff'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 47, 0, Math.PI * 2)
ctx.fillStyle = '#000'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2)
ctx.fillStyle = '#fff'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 30, 0, Math.PI * 2)
ctx.fillStyle = '#000'
ctx.fill()

ctx.beginPath()
ctx.font = '32px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('Hi', x + 42, y + 67)

