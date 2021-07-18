const kash = canvas.getContext('2d')


kash.beginPath()
kash.lineWidth = "16";
kash.strokeStyle = "green";
kash.rect(111, 3, 120, 93, 13);
kash.stroke();
kash.shadowBlur = 20;
kash.shadowColor = "blue";
kash.fill()