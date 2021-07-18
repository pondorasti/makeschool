import ctx, { size } from './main.js'

const x = 1 * size
const y = 4 * size

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 30, 180, Math.PI)
ctx.lineWidth = 3
ctx.strokeStyle = '#003399'
ctx.stroke()

ctx.beginPath()
ctx.moveTo(x, y)
ctx.lineTo(x + 30, y + 60)
ctx.lineTo(x - 60, y + 60)
ctx.lineTo(x, y)
ctx.stroke()