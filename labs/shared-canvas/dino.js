import ctx, { size } from './main.js'

const size = 113;
const x = 1 * size;
const y = 2 * size;

// draw my canvas square
ctx.beginPath();
ctx.rect(x,y,size,size);
ctx.fillStyle = '#ffbad2';
ctx.fill();

// draw a little guy's head inside the square
ctx.beginPath();
ctx.arc(x + size / 2, y + 30, 25, 0, Math.PI * 2);
ctx.fillStyle = '#664455';
ctx.fill();

// draw his shoulders
ctx.beginPath();
ctx.arc(x + size / 2, y + 85, 30, Math.PI, 0);
ctx.fill();

ctx.beginPath();
ctx.rect(x + size / 2 - 30,y + 85, 60, 28);
ctx.fill();

ctx.beginPath()
ctx.font = '24px Helvetica';
ctx.fillStyle = '#eef';
ctx.fillText('Name', x + size / 2 - 33, y + size - 10);
