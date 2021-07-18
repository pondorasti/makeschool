import ctx, { size } from './main.js'


const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

const size = 113;
const x = 0 * size;
const y = 0 * size;

ctx.beginPath();
ctx.scale(4, 4);
ctx.arc(30 + x, 21 + y, 10, 0, Math.PI * 2, false);
ctx.stroke();
ctx.fillStyle = "black";
ctx.strokeStyle = "white";
ctx.stroke();
ctx.fill();
ctx.closePath();

ctx.beginPath();
ctx.arc(30 + x, 21 + y, 10, 0, Math.PI * 2, false);
ctx.stroke();
ctx.fillStyle = "white";
ctx.closePath();

ctx.beginPath();
ctx.scale(0.5, 0.5);
ctx.arc(60 + x, 42 + y, 10, 0, Math.PI * 2, false);
ctx.fillStyle = "rgb(31, 31, 31)";
ctx.strokeStyle = "rgb(31, 31, 31)";
ctx.stroke();
ctx.fill();

ctx.beginPath();
ctx.scale(0.4, 0.4);
ctx.arc(150 + x, 105 + y, 10, 0, Math.PI * 2, false);
ctx.fillStyle = "red";
ctx.strokeStyle = "red";
ctx.stroke();
ctx.fill();

ctx.beginPath();
ctx.scale(0.2, 0.2);
ctx.arc(750 + x, 525 + y, 10, 0, Math.PI * 2, false);
ctx.fillStyle = "rgb(133, 9, 0)";
ctx.strokeStyle = "rgb(133, 9, 0)";
ctx.stroke();
ctx.fill();
