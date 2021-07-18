// box.js -----------------------------
(function () {
  function Box(x, y, rot, hue) {
    this.dx = Math.random() * 20
    this.dr = Math.random() * 10
    this.dh = Math.random() * 30

    this.x = x || 0
    this.y = y || 0

    this.rot = rot || 0

    this.hue = hue || Math.random() * 360

    this.el = document.createElement('div')
    this.el.style.width = '60px'
    this.el.style.height = '60px'
    this.el.style.borderStyle = 'solid'
    this.el.style.borderWidth = '2px'
    this.el.style.borderColor = `hsl(${this.hue}, 100%, 50%)`
    this.el.style.position = 'absolute'
  }

  Box.prototype.update = function () {
    this.el.style.borderColor =
      `hsl(${this.hue % 360}, 100%, 50%)`
    this.el.style.transform =
      `translateX(${this.x}px) 
         translateY(${this.y}px)
         rotate(${this.rot % 360}deg)`
    // `translateX(${this.x}px) translateY(${this.y}px)`
    // 'translateX('+this.x+'px) translateY('+this.y+'px)'
  }

  Box.prototype.move = function () {
    this.x += this.dx
    if (this.x > 500) {
      this.x = 0
    }
    this.rot += this.dr
    this.hue += this.dh
    this.update()
  }

  window.Box = function (x, y, rot, hue) {
    return new Box(x, y, rot, hue)
  }
}());
