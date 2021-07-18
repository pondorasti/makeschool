import ctx, { size } from "./main.js"

const x_cao = 1 * size
const y_cao = 2 * size

// draw a square
ctx.beginPath()
ctx.rect(x_cao, y_cao, size, size)
ctx.fillStyle = 'wheat'
ctx.fill()

for (var i = 0; i < 5; i++) {
    ctx.beginPath()
    ctx.rect(x_cao +(i*10), y_cao+ (i *10), (size/2)+i, (size/2)+i)
    ctx.fillStyle = `#00FF0${i*12}`
    ctx.fill()
}

ctx.beginPath()
ctx.arc(x_cao + size - 30, y_cao + size/2 , 10, 0, Math.PI * 2)
ctx.fillStyle = 'orange'
ctx.fill()

ctx.beginPath()
ctx.arc(x_cao + size - 60, y_cao + size/2 , 10, 0, Math.PI * 2)
ctx.fillStyle = 'orange'
ctx.fill()

ctx.beginPath()
ctx.moveTo(x_cao+57, y_cao+85)
ctx.lineTo(x_cao+85, y_cao+85)
ctx.strokeStyle = 'orange'
ctx.stroke()
