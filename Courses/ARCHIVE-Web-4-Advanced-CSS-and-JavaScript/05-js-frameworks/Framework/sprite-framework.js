/* 

The code below creates a factory function on 
the window object that generates "Sprite".

A Sprite is an Object that positions a a DOM
element at an x, y, and y coordinate. 

The code below is organized in a portable 
block that is easily incorporated into other 
projects. 

*/

// Define an anonymouse self executing function. 
// This encapsulates all of the code here. 

(function(global) {
  // Define a class/function
  var Sprite = function(el, x, y, z, rx, ry, rz) {
    return new Sprite.init(el, x, y, z, rx, ry, rz)
  }
  
  // Define methods on prototype obj
  Sprite.prototype = {
    // move
    move: function(x, y, z, rx, ry, rz) {
      this.x = x || 0
      this.y = y || 0
      this.z = z || 0
      this.rx = rx || 0
      this.ry = ry || 0
      this.rz = rz || 0
      return this // *** If the methods return 'this' they can be chained!
    },
    rotate: function(rx, ry, rz) {
      this.rx = rx
      this.ry = ry
      this.rz = rz
      return this
    },
    // Update
    update: function() {
      this.el.style.transform = `
        translateX(${this.x}px) 
        translateY(${this.y}px) 
        translateZ(${this.z}px)
        rotateX(${this.rx}deg)
        rotateY(${this.ry}deg)
        rotateZ(${this.rz}deg)`;
      return this // *** If the methods return 'this' they can be chained!
    }
  }
  
  // Define an initializer function
  Sprite.init = function(el, x, y, z, rx, ry, rz) {
    this.el = el
    
    this.x = x || 0
    this.y = y || 0
    this.z = z || 0
    this.rx = rx || 0
    this.ry = ry || 0
    this.rz = rz || 0
    
    this.el.style.position = 'absolute'
    this.el.style.display = 'block'
    this.el.style.width = '60px'
    this.el.style.height = '60px'
    this.el.style.backgroundColor = 'red'
    this.update()
  }
  
  // Set the prototype of init
  Sprite.init.prototype = Sprite.prototype
  
  // Attach factory method to global object 
  global.Sprite = global.$prite = Sprite
  
}(window)); // Pass in window as the global object



// This test library illustrates the concept
// of creating a factory module in JS. 

// In JavaScript, any function can return a new object. 
// When it’s not a constructor function or class, it’s 
// called a factory function.




(function() {
  // Define a class object 
  const Test = function(a) {
    this.a = a || 'a'
  }
  // Add methods to the prototype
  Test.prototype.what = function() {
    console.log(this.a)
    return this
  }
  // Attach a factory method to window
  window.Test = function(a) {
    // This method returns new Test objects
    return new Test(a)
  } 
}());



(function() {
  var Thing = function(it) {
    this.it = it 
  }
  
  Thing.prototype.mult = function() {
    this.it = this.it * 2
    return this
  }
  
  Thing.prototype.party = function() {
    this.it = Math.sqrt(this.it)
    return this
  }
  
  window.Thing = function(it2) {
    return new Thing(it2)
  }
})();




// Module pattern 
(function() {
  var thing = Thing(2)
  console.log(thing)
  thing.mult().mult().mult()
  console.log(thing)
  thing.mult()
  thing.party()
  thing.mult()
})()







