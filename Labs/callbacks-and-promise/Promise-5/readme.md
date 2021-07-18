# Promise 1.2 

You usually won't be making a Promise from scratch instead you'll more often be returning a Promise from a function! 

Your goal is to write a function that returns a Promise. Your function should take the time of day as a string, and the promise it returns should resolve to your favorite food for that time. 

For example: 

```JS
whatToEat('breakfast').then(food => console.log(food)) // toast
whatToEat('lunch').then(food => console.log(food))     // noodles
whatToEat('dinner').then(food => console.log(food))    // curry
```

Write a function that returns a Promise. Your function should take the time of day as an argument. 

Something like this: 

```JS
function whatToEat(timeOfDay) {
  return new Promise()
}
```

If the `timeOfDay` is 'breakfast', 'lunch', or 'dinner' resolve the promise with your favorite food for that time. 

If the `timeOfDay` is anything else reject the promise with the 'message' I'm not hungry right now.  