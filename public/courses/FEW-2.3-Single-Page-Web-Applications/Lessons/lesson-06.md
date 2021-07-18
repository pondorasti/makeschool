# FEW 2.3 - Lesson 6


## Learning Objectives

1. Describe function and callbacks
1. Differentiate parameters and arguments
1. Use callbacks to solve problems
1. Describge promise in JS 

<!-- > -->

## Video

Follow this class in these video lessons:

- https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

The videos are labeled "lesson 06 x" which corresponds to the class lesson numbers. 

# Functions 

A function is a block of code that your program can use as often as needed. In JavaScript we can write a function in one of a three ways: 

```JS
function double() {
    // ... code block
}

const flip = function() {
    // ... code block
}

const split = () => {
    // ... code block
}
```

Call or invoke a function to run the code stored in it's block. To call a function write it's name followed by the `()`: 

```JS
double() // doubles
flip()   // flips
split()  // splits
```

In JavaScript a function is also a value. You can assign a function to a variable and invoke it by putting the `()` after the variable name: 

```JS
let storesAFunction = double // no () here!
storesAFunction() // doubles!

storesAFunction = flip
storesAFunction() // flips

storesAFunction = split
storesAFunction() // splits
```

Important! when assigning a function you won't add the `()` after it's name! 

Functions take input as arguments, which are stored in parameters.

```JS
function double(n) {
    return n * 2
}

double(7) 
```

Above the double function defines a parameter `n`. When the function is invoked an argument of `7` is supplied.

Note! **parameter** is the variable that holds the **argument** which is the value.

# Problems on GitHub

The problems below have been consolidated in this GitHub repo: 

https://github.com/Make-School-Labs/callbacks-and-promise

- Fork or clone this repo
- Solve the problems
- Submit your work to GradeScope

# Callbacks are used everywhere in JavaScript. 

A callback is a *function* that you pass to another function as an *argument*. One example of this is `Array.forEach()`. 

```JS
const arr = [1,2,3,4]

// Define a function to double your numbers and...
function double(n) {
    console.log(n * 2)
}
// ... use it as the argument to forEach
arr.forEach(double)

// Or, use an anonymous inline function
arr.forEach(function (n) {
    console.log(n * 2)
})

// You could use an arrow function
arr.forEach((n) => {
    console.log(n * 2)
})

// The arrow function could be shortened
arr.forEach(n => console.log(n * 2))

```

When you use `theArray.forEach( callback )` it runs the `callback` function once for each item in `theArray` and passes that item as an argument to the `callback`. In the examples above `n` is the parameter and values in `arr` would be the arguments. 

**Challenge:** https://replit.com/join/uwwawdef-mitchellhudson

# setTimeout and callbacks

`setTimeOut(callback, ms)` is a function that takes two parameters. The first is a callback, the second is a number in milliseconds. When the number of milliseconds has elapsed after calling `setTimeout` the callback is executed. 

**Challenge:** https://replit.com/join/tuudswte-mitchellhudson

# Promise 

A Promise is an Object that represents work that will done in the future.

A Promise can be in one of three states: 

- **Pending** - work is in process 
- **Resolved** - work is completed successfully
- **Rejected** - work has failed

Here is an example of a Promise: 

```JS
const p = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('>>> Success! <<<');
    // reject("--- Oops ---");
  }, 4000);
});

p.then((message) => {
  console.log('Promise resolved successfully!');
  console.log(message);
}).catch((err) => {
  console.log('Promise rejected');
  console.log(err);
});
```

When defining a Promise you provide one function as an argument. **See line 1**. This function takes two parameters: `resolve`, and `reject`.

The body of the Promise does some work, this is the timeout lines 2 to 5. 

When the work is completed successfully call `resolve`. If the work failed call `reject`. Doing either of these completes the Promise.

**On line 8**, you see `then()` being called with a callback function. This callback is executed when the Promise resolves. 

The `message` parameter holds the value returned from the promise. It was passed to `resolve()` as the argument.

**On line 11**, you see `catch()` being called with a callback function. This callback is executed if the Promise is rejected. 

The `err` parameter holds the value passed as the argument to `reject`.

Here's what lines 8 to 11 would look like this without the callback. 

```js
p.then().catch()
```

Adding the callback functions the code looks liek this: 

```JS
p.then( () => {} ).catch( () => {} )
```

Adding some lines make this easier to read: 

```JS
p.then( () => {
    // 
} ).catch( () => {
    // 
} )
```

**Challenges:** https://replit.com/join/yjjdcwzk-mitchellhudson

Try this challenge problem: 

**Challenge problem:** https://replit.com/join/ifntjrpw-mitchellhudson

# Chaining Promises

Promises can be chained. Chaining happens when a promise resolves to another promise. 

When a function returns a Promise you handle it like this: 

`promise.then().catch()`

In some cases a Promise will return another Promise. In this case you can call `then()` on the return value.

```JS
method(a => a).then(b => b).then(c => c).then()
```

Here the `method()` returns a Promise. The callback to this Promise returns another Promise. That Promise also returns a Promise.  

You could store each return value in a variable: 

```JS
const p1 = method(a => a)
const p2 = p1.then(b => b)
const p3 = p2.then(c => c)
const p4 = p3.then()
```

If any promise in the chain is rejected it will call `catch()` at the end of the chain. It might look like this: 

```JS
p.then(...).then(...).then(...).catch()
```

(the callbacks have been omitted)

**Challenge Problems:** https://replit.com/join/xkshtdaq-mitchellhudson

# Promise All

In some cases you will want to make multiple Async calls and need to wait for them **all** to resolve before you can handle the results. `Promise.all()` does this!

`Promise.all()` takes an array of Promises. It resolves to a single `then()` and `catch()`. It resolves all of the values as an array to the callback argument supplied to `then()`. 

```JS 
const arr = [promise1, promise, promise3]
Promise.all(arr).then((values) => values)
// [value1, value2, value3]
```

**Challenge Problems:** https://replit.com/join/ixzvheyv-mitchellhudson

## After Class 

The problems below have been consolidated in this GitHub repo: 

https://github.com/Make-School-Labs/callbacks-and-promise

- Fork or clone this repo
- Solve the problems
- Submit your work to GradeScope

## ReSources 

- https://javascript.info/promise-basics
- https://javascript.info/async-await