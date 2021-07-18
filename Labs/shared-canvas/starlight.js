import ctx, { size } from './main.js'

const x = size * 2
const y = 0

ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = 'rgb(44, 171, 42)'
ctx.fill()

ctx.beginPath()
ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2)
ctx.fillStyle = 'rgb(42, 148, 81)'
ctx.fill()

ctx.beginPath()
ctx.moveTo(x, y)
ctx.lineTo(x + 25, y + 75)
ctx.lineTo(x + 25, y + 25)
ctx.fillStyle = 'rgb(166, 230, 190)'
ctx.fill()

ctx.beginPath()
ctx.moveTo(x + size, y + size)
ctx.lineTo(x + size - 30, y + size - 60)
ctx.lineTo(x + size - 30, y + size - 10)
ctx.fillStyle = 'rgb(166, 230, 190)'
ctx.fill()

ctx.beginPath()
ctx.font = '24px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('65', x + size / 2, y + size / 2)

ctx.beginPath()
ctx.font = '18px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('BM', x + 2, y + size - 2)

ctx.beginPath()
ctx.font = '30px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('$$$', x + size / 6, y + 30)
