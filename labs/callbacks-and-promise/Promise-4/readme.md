# Promise 1.1

You write a promise! Your promise should return your favorite food!

Start with a new instance of Promise like this: 

```JS
const food = new Promise()
```

A Promise requires a single argument which is a callback. This callback should define two parameter variables: `resolve` and `reject`:

```JS
const food = new Promise((resolve, reject) => {

})
```

The parameters `resolve` and `reject` are both callback functions!

**Challenge 1** Resolve your promise with the name of your favorite food. Do this by calling the `resolve` with an argument. 

**Challenge 2** Resolve the `food` promise with that `.then()` syntax and print your favorite food to the console. 

