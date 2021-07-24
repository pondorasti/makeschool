// Make a Framework

// This self executing function takes two params 
// the global object and jQuery
(function(global, $) {
  // Define a function that represents the framework
  var FW = function(el, x, y, size) {
    // Calling this function creates and returns a new 
    // instance of this class function. 
    return new FW.init(el, x, y, size)
  }
  
  // Define methods on the prototype of the framework function
  FW.prototype = {
    
    // These methods are shared by all instances of this object
    // The methods here move the object with css trandform. 
    // calling move sets the x and y
    // calling rotate sets the rotation
    // You must call update to display the transformation!
    // The methods are all chainable.
    
    color: function(c) {
      this.el.style.backgroundColor = c
      return this
    },
    
    move: function(x, y) {
      this.x = x
      this.y = y
      return this
    },
    
    rotate: function(n) {
      this.rotation = n
      return this
    },
    
    update: function() {
      var transform = `translate3d(${this.x}px, ${this.y}px, 0) rotate3d(0, 0, 1, ${this.rotation}deg)`
      this.el.style.transform = transform
      return this
    }
  }
  
  // Define an initializer for the framework
  FW.init = function(el, x, y, size) {
    var self = this;
    self.el = el || 'default el'
    self.x = x || 'default x'
    self.y = y || 'default y'
    self.rotation = 0
    self.size = size || 'default size'
    
    // self.el.style.position = 'absolute'
    self.el.style.width = self.size
    self.el.style.height = self.size
    self.el.style.left = self.x
    self.el.style.top = self.y
  }
  
  // Set the prototyp of the initializer function to use the prototype 
  // of the framework function
  FW.init.prototype = FW.prototype
  
  // Assign the framework to the global object so it can be used outside 
  // this function. 
  global.FW = global.f$ = FW
  
})(window, jQuery);






