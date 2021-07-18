// This timer runs for ever!
//(function() {
//  var clicks = 0;
//  var timer = setInterval(() => {
//    clicks += 1;
//    console.log(clicks);
//  }, 1000);
//})();








// IIFE

(function() {
  
  var a = 99;
  let b = 88;
  
  // some code 
  
})()
















// Module
// Module Export Pattern
const timerThing = (function() {
  // Private variables
  var clicks = 0;
  var timer;
  var isRunning = false;
  var el; 
  
  // Private methods
  
  
  // Public methods and properties
  const stop = () => {
    isRunning = false;
    clearInterval(timer)
  }
  
  const start = () => {
    isRunning = true;
    timer = setInterval(() => {
      clicks += 1;
      if (el) {
        el.innerHTML = clicks;
      }
    }, 1000);
  }
  
  const toggle = () => {
    isRunning ? stop() : start();
  }
  
  const setElement = (element) => {
    el = element;
  }
  
  const running = () => {
    return isRunning;
  }
  
   var module = {
     start,
     stop,
     toggle,
     setElement,
     running
   };
  
  return module;
})()









// Module
// The global import pattern
//(function(lib) {
//  // Pass a library or object into this module
//}(timerThing))


// Module 
// Module Export 
var theModule = (function() {
  // Declare private vars functions
  
  // Attach public vars and functions to module
  var module = {}
  
  // return the module
  return module
}())

// Module 
// Augmented Module
var theModule = (function(module) {
  // Declare private vars functions
  
  // Attach public vars and functions to module
  
  // return the module
  return module
}(module || {}))

