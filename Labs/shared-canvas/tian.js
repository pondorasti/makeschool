import ctx, {size} from './mian.js'

const size = 113;

console.log('???');

export default ctx;
export { size };

// drawing
const tianDraw = () => {
  ctx.fillStyle = 'purple';
  ctx.fill();

  ctx.beginPath();
  ctx.arc(175, 175, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(112, 75);
  ctx.arc(175, 175, 25, 0, Math.PI, false); // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(160, 155, 5, 0, Math.PI * 2, true); // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(190, 165, 15, 0, Math.PI * 2, true); // Right eye
  ctx.stroke();
};

export default tianDraw;
