# Promise Finally

Sometime you'll want to run some code when a promise settles, that is the promise has resolved or rejected. You can use finally to do this. For Example: 

```JS
const p = new Promise(...)
p.then() // runs when the promise resolves
p.catch() // runs when the promise rejects
p.finally() // runs when the promise settles (either resolved or rejected)
```

Quick review: 