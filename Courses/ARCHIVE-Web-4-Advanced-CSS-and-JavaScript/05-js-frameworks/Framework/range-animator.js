// Creates an object that takes in value via update. 

/**  

Create a new "Range Animator" (needs a better name) with

CALL RA(el, start, end, enter, leave)

el - DOM element
start - starting value
end - ending value
enter - callback, invoked when value is between start and end
leave - callback, invokd when value is less than start or greater than end

*/

(function(global, $) {
  // 
  var RangeAnimator = function(el, start, end, enter, leave) {
    return new RangeAnimator.init(el, start, end, enter, leave)
  }
  
  function minMax(value, min, max) {
    return Math.min(Math.max(value, min), max)
  }
  
  // Define methods on a prototype obj
  RangeAnimator.prototype = {
    // For any value n fade in from start to end
    update: function(n) {
      const currentZone = this.value > this.start && this.value < this.end
      this.value = n
      const newZone = this.value > this.start && this.value < this.end
      if (currentZone && !newZone) {
        // leaves zone
        this.leave()
      } else if (!currentZone && newZone) {
        // enters zone 
        this.enter()
      }
    }, 
    reset: function() {
      
    }
  }
  
  // Define an initializer pass the element, start and end values
  RangeAnimator.init = function(el, start, end, enter, leave) {
    var self = this
    
    this.value = 0
    this.el = el
    this.start = start || 0
    this.end = end || 0
    this.enter = enter || function() {}
    this.leave = leave || function() {}
  }
  
  // 
  RangeAnimator.init.prototype = RangeAnimator.prototype
  
  // Get the factory function from the global object with any of these names. 
  global.RangeAnimator = global.RA = RangeAnimator
  
}(window, jQuery))














