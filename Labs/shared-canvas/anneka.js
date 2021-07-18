import ctx, { size } from './main.js'

const x = 4 * size
const y = 2 * size

ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = 'mistyrose'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 1.6, 40, 0, Math.PI * 2)
ctx.fillStyle = 'tomato'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2.5, y + size / 1.4, 10, 0, Math.PI)
ctx.lineWidth = 3
ctx.strokeStyle = '#ffeeee'
ctx.stroke()

ctx.beginPath()
ctx.arc(x + size / 1.7, y + size / 1.4, 10, 0, Math.PI)
ctx.lineWidth = 3
ctx.strokeStyle = '#ffeeee'
ctx.stroke()

ctx.beginPath();
ctx.rect(470,228,30,60)
ctx.fillStyle = "tomato"
ctx.fill();

ctx.beginPath();
ctx.rect(515,228,30,60)
ctx.fillStyle = "tomato"
ctx.fill();

ctx.beginPath()
ctx.arc(x + size / 1.6, y + size / 1.8, 7, 0, Math.PI * 2)
ctx.fillStyle = '#ffeeee'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2.6, y + size / 1.8, 7, 0, Math.PI * 2)
ctx.fillStyle = '#ffeeee'
ctx.fill()

ctx.beginPath()
ctx.font = '18px Helvetica'
ctx.fillStyle = 'purple'
ctx.fillText('Pyon!', x + 8, y + 20)
