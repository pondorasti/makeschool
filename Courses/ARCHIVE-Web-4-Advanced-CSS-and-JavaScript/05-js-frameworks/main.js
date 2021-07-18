const main = document.querySelector('#main')
const boxes = []

for (let i = 0; i < 160; i++) {
  const x = Math.random() * 500
  const y = Math.random() * 500
  const box = Box(x, y)
  main.appendChild(box.el)
  box.update()
  boxes.push(box)
}


function onFrame() {
  boxes.forEach(function (box) {
    box.move()
  })

  requestAnimationFrame(onFrame)
}

requestAnimationFrame(onFrame)

//  console.log(new Box())
//  
//  const Other = {}
//  Other.move = function() {
//    this.y += 10
//    this.update()
//  }
//  
//  Other.update = Box.prototype.update
//  
//  Box.prototype = other
