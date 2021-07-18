# Lab 

The goal for this lab is solving the challenges from class 2. 

The challenges from class 2 are listed here. 

- Add a reset button to the Counter
- Counters can increment in values other than 1
- Add more Counters
- Keep a list of counters each with their own count
- New Component to show the total of all counters
- Display counter value graphically as a progress bar or other
- Each counter has a both a label and a count
- Able to add new counters 
- Able to delete existing counters

## Starting Components

The solution ideas here can be applied to any components that you 
might create. For reference I have provided some sample components. 

### Counter

The Counter is responsible for getting the Count from the store and 
displaying the count. It is also responsible for incrementing and 
decrementing the count. 

```
import React, { Component } from 'react';
import { connect } from 'react-redux'
import {
  newCounter,
  incrementCounter,
  decrementCounter
} from '../actions'

class Counter extends Component {

  render() {
    return (
      <div>

        <h1>{this.props.count}</h1>

        <button onClick={(e) => {
          this.props.incrementCounter()
        }}>Up</button>

        <button onClick={(e) => {
          this.props.decrementCounter()
        }}>Down</button>

      </div>
    );
  }
}

const mapStateToProps = (state) => {
  return { count: state.counters }
}

const mapDispatchToProps = () => {
  return {            // mapDispatchToProps
    incrementCounter, // store.dispatch(incrementCounter(0))
    decrementCounter  // store.dispatch(decrementCounter(0))
  }
}

// export default connect(mapStateToProps, mapDispatchToProps)(Counter);
export default connect(mapStateToProps, mapDispatchToProps())(Counter)
```

### App

App is the root component. This is responsible for displaying Counters
and initializing the Redux store and creating the Provider.

Provider is a top level component responsible for passing the store 
down to it's children. 

```
...
import { createStore } from 'redux'
import { Provider } from 'react-redux'
...
import Counter from './components/counter'
...
class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <div className="App">
          <Counter />
        </div>
      </Provider>
    );
  }
}
...
```

## Solutions 

### Add a reset button to the Counter 

Reset should set the count back to 0. This effects the store. 
Anything that effects the store needs to happen through an 
action. 

Start at actions.js

Define a a new action type and an action creator. 

```
...
export const RESET_COUNTER = "RESET_COUNTER"
...
export const resetCounter = () => {
  return {
    type: RESET_COUNTER
  }
}
```

Next, you will need to handle this action in your reducer. 

Modify the reducer to recognize the RESET_COUNTER type and 
include a switch case that handle this action. 

```
import {
  INCREMENT,
  DECREMENT,
  RESET_COUNTER
} from '../actions';

const counterReducer = (state = 0, action) => { 
  switch (action.type) {
    ...
    case RESET_COUNTER:
      return 0
      break
    ...
  }
}
...
```

Last, add the action to the Counter component. 
You'll need to add the new action creator to mapDispatchToProps
and create a button that calls this action inside the component. 

```
...
  incrementCounter,
  decrementCounter,
  resetCounter      // Add new action creator
} from '../actions' 

class Counter extends Component {

  render() {
    return (
      <div>
        ...
        <button onClick={(e) => {
          this.props.resetCounter()
        }}>Reset</button>

      </div>
    );
  }
}
...
const mapDispatchToProps = () => {
  return {            // mapDispatchToProps
    incrementCounter, 
    decrementCounter,
    resetCounter      // Add resetCounter to dispatch props
  }
}
...
```

### Counters can increment in values other than 1

The idea here is to allow for Counters that can increment in values other 
than 1.

To do this you will need to pass a value to the reducer. This will require 
we either create a new action type, something like INCREMENT_BY, or modify
the INCREMENT action to take parameter. 

```
...
case INCREMENT:
  return action.payload ? action.payload : 1
  break
...
```

### Add more Counters

Adding more counters can be as simple as duplicating a Counter. 
In the sample code the Counter is created in App. To make more 
Counters we can add more here. 

```
...
class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <div className="App">
          <Counter />
          <Counter />
          <Counter />
          <Counter />
        </div>
      </Provider>
    );
  }
}
...
```

At this point all counters show the same value. Because their 
count value comes from the same place in the store!

To make counters that each hold their own count will require 
modifying the store to hold an array of counts. 

Actions will need to include an index to the count that is
affected. 

Reducers are responsible for defining the initial value for 
state. This will have to set state to an empty array or an 
array with one value. 

Counters will need to know the index of the count they display. 
While you can make a system where Counter holds it's index, 
a better solution might be to create a component that takes 
in the count array and displays an array of Child components. 
This solution means you would make the Counter a simple 
component that has count from state passed down from it's 
parent. 



```js
// actions/index.js
// increment and decrement both take index as an argument
// and pass this on the payload. 
...
export const incrementCounter = (index) => {
  return {
    type: INCREMENT,
    payload: index
  }
}

export const decrementCounter = (index) => {
  return {
    type: DECREMENT,
    payload: index
  }
}

...
```

```js
// reducers/counter-reducer.js
...
// Set the intial 
const counterReducer = (state = [0], action) => {
  switch (action.type) {
    ...
    // NOTE! you must return a new object as state. 
    // You can't modify the array you must return a new array!
    // Using map to increment the count at the index in payload. 
    // is a good approach.
    case INCREMENT:
      return state.map((count, index) => {
        return action.payload === index ? count += 1 : count;
      })
      break
      
    case DECREMENT:
      return state.map((count, index) => {
        return action.payload === index ? count -= 1 : count;
      })
      break
   ...
  }
}
...
```

```js
// ./components.counter.js
// Important! we will be removing the react-redux things
import React, { Component } from 'react';

class Counter extends Component {
  
  render() {
    return (
      <div>

        <h1>{this.props.count}</h1>

        <button onClick={(e) => {
          this.props.incrementCounter()
        }}>Up</button>

        <button onClick={(e) => {
          this.props.decrementCounter()
        }}>Down</button>

      </div>
    );
  }
}

export default Counter
```



- Keep a list of counters each with their own count
- New Component to show the total of all counters
- Display counter value graphically as a progress bar or other
- Each counter has a both a label and a count
- Able to add new counters 
- Able to delete existing counters