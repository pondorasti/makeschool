# Promise 1

A Promise is an Object that represents work that will done in the future. This is similar to a callback. In fact a Promise makes use of callbacks!

A Promise can be in one of three states: 

- **pending** - in process
- **resolved** - work completed successfully
- **rejected** - work failed

When defining a Promise you provide one function as a parameter. **See line 1**. This function takes defines two parameters: `resolve`, and `reject`.

The body of the Promise does some work, this is the timeout lines 2 to 5. 

When the work is completed successfully call `resolve`. If the work failed call `reject`. Doing either of these completes the Promise. 

**On line 8**, you see `then()` being called with a callback function. This callback is executed when the Promise resolves. This is the argument assigned to `resolve`.

**On line 11**, you see `catch()` being called with a callback function. This callback is executed if the Promise is rejected. It is the value assigned to `reject`.

Here's what lines 8 to 11 would look like this without the callback. 

```
`p.then().catch()`
```

 

Run the sample code and wait for the message to appear in the console. Then try the problems below. 

**Problems to solve**

**1)** What happens when a promise is rejected? Test it by calling `reject()`

**2)** What happens when you call both `resolve` and `reject`? Test this.

**3)** Does the order matter you call resolve and reject matter? Test this. 

**4)** What happens if you call `resolve` or `reject` more than once? Test this out for yourself.

