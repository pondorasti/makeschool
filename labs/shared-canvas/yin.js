
import ctx, { size } from './main.js'

const canvas = document.querySelector('canvas')
const ctx = canvas.getContext('2d')

const size = 113
const x = 3 * size
const y = 0 * size

// draw a square
ctx.beginPath()
ctx.rect(x, y, size, size)
ctx.fillStyle = 'pink'
ctx.fill()



// draw a circle
ctx.beginPath()
// draw a complete circle
ctx.arc(x + size / 2, y + size / 2+10, 40, Math.PI,0)
ctx.fillStyle = '#333'
ctx.fill()

// Draw left Ear
ctx.beginPath()
ctx.moveTo(x+20, y+15)
ctx.lineTo(x+20,y+50)
ctx.lineTo(x+40,y+30)
ctx.fillStyle = '#333'
ctx.fill()

// Draw left Ear
ctx.beginPath()
ctx.moveTo(x+95,y+15)
ctx.lineTo(x+95,y+55)
ctx.lineTo(x+70,y+35)
ctx.fillStyle = '#333'
ctx.fill()

// Stroke a path
ctx.beginPath()

// draw half a circle
ctx.rect(x + 13, y + 60, 87, 20)
ctx.lineWidth = 3
ctx.fillStyle = '#333'
// ctx.strokeStyle = '#333'
ctx.fill()

// Draw some text
ctx.beginPath()
ctx.font = '18px Helvetica'
ctx.fillStyle = '#fff'
ctx.fillText('Meow', x+32, y + 55)
