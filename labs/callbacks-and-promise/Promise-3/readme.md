# **Chaining Promises** 

The `greet` function takes a string and returns a Promise that resolves to a string begining with "hello".

Try this: 

```JS
greet('Your Name')
.then(str => console.log(str))
```

If the input value is not a string `greet` rejects with an error message. Try this: 

```JS
greet(5)
.then(str => console.log(str))
.catch(err => console.log(err))
```

This should display an error. 

The `uppercaser` function takes a string and returns a promise that resolves to a string. It rejects if the input is not a string. 

Try this: 

```JS
uppercaser(5)
.then(str => console.log(str))
.catch(err => console.log(err))
```

Try it with a string also. 

## Chaining Promises

Promises can be chanined together. Imagine you had to greet someone and uppercase the greeting. 

Try this: 

```JS
greet('Your name')
.then(str => uppercaser(str)) // returns a promise!
.then(str => console.log(str))
.catch(err => console.log(err))
```

Notice the first `.then()` returns a promise that is handled with a `.then()` on the line below. The output of the first promise is passinto `uppercaser`.

Notice there is only one `.catch()` at the end. 

**Challenge!** Get `greet` to fail by passing providing a non-string argument.

**Challenge!** Get `uppercaser` to fail by passing a non-string.

Note! In both cases the promise skips to the single catch block at the end! 

Rule: You can chain functions that return a promise. When chaning promises if any promise along the way rejects all of the promsies reject!
