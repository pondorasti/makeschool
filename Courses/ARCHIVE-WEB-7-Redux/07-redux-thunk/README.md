# Redux Thunk

Readux Thunk solves the problem of handling asynchornous actions in Redux.
Redux Thunk is a middleware for Redux.

A middleware sits between action creators and reducers.

> In computer programming, a thunk is a subroutine that is created, often
> automatically, to assist a call to another subroutine. Thunks are primarily
> used to represent an additional calculation that a subroutine needs to
> execute, or to call a routine that does not support the usual calling
> mechanism. They have a variety of other applications to compiler code
> generation and in modular programming.

Action creators normally return an Action Object
describing the action. When you have an asynchronous action this becomes a
problem. You can't return an action with data because the data hasn't been
loaded yet.

A thunk handles this by passing a function to Redux in place of the
action object. This function receives the dispatch from Redux and will
an action when the async operation resolves.

## Fetch

Fetch is a newer JS method for handling network requests.

Fetch works with promises. You will call fetch with a path to a
network resource and fetch return a Promise.

## Promise

A promise is used to handle Asynchronous opperations. Use a promise
when an operation may complete some time in the future or might not
be completed at all.

A promise is a JS object. It will be in one of three states.

1. pending - the async operation has not completed
2. resolved - the async operation has completed successfully
3. rejected - the async operation failed

Promises provide a couple advantages over other network methods.

Promises significantly clean up the code required to make network
calls. They provide a clean and easy to read syntax.

Promises can be chained together. This allows multiplt network
operations to be handled with in series very easily.

Promises also handle errors very elegantly. An error from any
promise in the chain can be handled with a single error.

### Learn more about promises

Promises are similar to callbacks which you are probably
already familiar with. Try the challenges in these to
learn more about promises and callbacks.

- https://repl.it/LBJY/latest
- https://repl.it/LBJO/latest
- https://repl.it/LBJ2/latest
- https://repl.it/LBLr/latest

## Example with Redux Thunk

Using a Redux project you might implement Thunk like this.  

Thunk is a middleware for Redux. Add it via applyMiddleWare().

**App.js**

```javascript
...
import thunk from 'redux-thunk';
...
// Add thunk as middleware
const createStoreWithMiddleware = applyMiddleware(thunk)(createStore);
...
```

Normally an Action creator returns an Action which is Object with a type and other properties.
Thunk is invoked when we return a function instead of an Object from our Action Creator.

The function returned must take `dispatch` as a parameter. When your request resolves you will call
dispatch with your Action Object, and possibly any data you loaded as part of the request.

**actions/index.js**

```javascript
// This action handles loading the weather.
export const loadWeather = () => {
  // Returning a function tells the dispatcher this will be
  // an async action the dispatcher executes that function
  // and passes itself as an arg
  return (dispatch) => {
    // perform an async method here and call the dispatcher
    // with an action when it resolves
    fetch(appurl, { mode: 'cors' }).then((data) => {
      return data.json()
    }).then((weather) => {
      // After data is loaded call the action creator above
      // on dispatch with the data that was loaded.
      dispatch(updateWeather(weather))
    }).catch((err) => {
      console.log(err.message);
    })
  }
}

// This action will handle updating the store.
export const updateWeather = (obj) => {
  return {
    type: UPDATE_WEATHER,
    payload: obj
  }
}
```

## Challenges

- Implement an Async Action in your Redux project
- Modify the code above to use `async` and `await`

## Resources

- https://redux.js.org/advanced/async-actions
- https://en.wikipedia.org/wiki/Thunk
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
- https://www.promisejs.org
