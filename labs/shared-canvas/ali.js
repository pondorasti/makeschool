import ctx, {size} from "./main.js"

const x = 4 * size;
const y = 0 * size;

// Square
ctx.beginPath();
ctx.rect(x, y, size, size);
ctx.closePath();
ctx.fillStyle = "#393e46";
ctx.fill();
// Inner circle
ctx.beginPath();
ctx.arc(x + size / 2, y + size / 2, 40, 0, Math.PI * 2);
ctx.closePath();
ctx.fillStyle = "#eeeeee";
ctx.fill();
// Outer circle
ctx.beginPath();
ctx.arc(x + size / 2, y + size / 2, 54, 0, Math.PI * 2);
ctx.lineWidth = 3;
ctx.strokeStyle = "#32e0c4";
ctx.stroke();
ctx.closePath();
// Text
ctx.beginPath();
ctx.font = "18px Helvetica";
ctx.fillStyle = "#393e46";
ctx.fillText("I'm (4,0)!", x + size / 5, y + size / 1.85);
ctx.closePath();
