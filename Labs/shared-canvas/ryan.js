import ctx, { size } from './main.js'

const x = 2 * size
const y = 4 * size


ctx.beginPath()
ctx.arc(x + size / 2 , y + size / 2, 50, 0,  Math.PI * 2)
ctx.fillStyle = 'black'
ctx.fill()

ctx.beginPath()
ctx.rect(247, 473, 70, 70, 7)
ctx.fillStyle = 'purple'
ctx.fill()
            
ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 25, 5, Math.PI)
ctx.lineWidth = 5
ctx.strokeStyle = 'black'
ctx.stroke()
