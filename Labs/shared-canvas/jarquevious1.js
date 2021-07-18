import ctx, { size } from './main.js'

// Jarquevious Drawing

//Rectangle
ctx.beginPath()
ctx.rect(200, 100, 250, 75)
ctx.fillStyle = 'Gray'
ctx.fill()

//Blue dot
ctx.beginPath()
ctx.arc(325 , 100 , 55, 0, Math.PI)
ctx.lineWidth = 3
ctx.strokeStyle = '#ffeeee'
ctx.fillStyle = 'blue'
ctx.fill();
            
            

// Jarquevious Name
ctx.beginPath()
ctx.font = ' 40px Monda'
ctx.fillStyle = 'white'
ctx.fillText('Jarquevious', 210, 150)
