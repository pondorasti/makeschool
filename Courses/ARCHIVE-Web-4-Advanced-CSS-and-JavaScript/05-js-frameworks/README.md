# JS Frameworks 

With a few ideas and create JS code that is reusable and plays well with 
and can be added to any web project. 

- https://github.com/impress/impress.js/blob/master/js/impress.js

## What and why use a framework? 

In the browser all identifiers are global unless they are defined within
a block or a function. Block scope is relatively new (ES6), function scope is 
more widely used. 

When identifiers pollute the global name space the chance of a collision 
with a name used in another block of JavaScript is high and problems are 
hard to bedug. 

The traditional solution is to use an Immediately Invoked Function Express
or IIFE. 

- http://wesbos.com/es6-block-scope-iife/

```
(function() {
  // variables and code here run in the execution context 
  // of this function. 
  // All identifiers decalared here are scoped to this 
  // block. 
}())
```

