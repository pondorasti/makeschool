import ctx, { size } from './main.js'

const x = 1 * size
const y = 2 * size

function chaoDrawing(inputX,inputY){
    //My Drawing
    const xpos=inputX
    const ypos=inputY
    ctx.lineWidth = 3
    ctx.strokeStyle="white"

    //Block
    ctx.beginPath()
    ctx.rect(xpos, ypos, size, size)
    ctx.fillStyle="cornflowerblue"
    ctx.fill()

    //triangle1
    ctx.beginPath();
    ctx.moveTo(xpos+28.25, ypos+20);
    ctx.lineTo(xpos+56.5+10, ypos+20+50);
    ctx.lineTo(xpos+56.5-10, ypos+20+50);
    ctx.closePath();
    ctx.stroke();

    //triangle2
    ctx.beginPath();
    ctx.moveTo(xpos+56.5, ypos+20);
    ctx.lineTo(xpos+56.5+10, ypos+20+50);
    ctx.lineTo(xpos+56.5-10, ypos+20+50);
    ctx.closePath();
    ctx.stroke();

    //triangle3
    ctx.beginPath();
    ctx.moveTo(xpos+84.75, ypos+20);
    ctx.lineTo(xpos+56.5+10, ypos+20+50);
    ctx.lineTo(xpos+56.5-10, ypos+20+50);
    ctx.closePath();
    ctx.stroke();

    //Dome
    ctx.beginPath()
    ctx.arc(xpos+56.5, ypos+56.5+44, 30, 0,Math.PI,true)
    ctx.lineTo(xpos+88, ypos+56.5+44)
    ctx.lineWidth=3
    ctx.stroke()
}
chaoDrawing(3*113,4*113)