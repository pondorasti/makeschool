# Redux and React Redux

Redux is described as:

> a predictable state container for JavaScript apps

Redux is an implementation of Flux. Flux is an application architecture 
pattern that ustilizes a unidirectional data flow.

## The problem

Typically our apps use two way communication. This creates a complex mashup that 
invites problems as apps grow in complexity. 

![image-1.png](image-1.png)

## The solution

One way data flow.

Redux enforces a one way data flow. This creates reliable and reproducible 
results. Redux has four parts:

- action - action creators
- dispatcher - reducers
- store 
- views - React Components

![image-2.png](image-2.png)

## Views may generate actions 

When a view issues an action it flows through the system. 

![image-3.png](image-3.png)

## Actions 

An action is an Object with a type. 

![image-4.png](image-4.png)

## Action creators

Action creators are methods that generate actions. While these are not 
required, it is best practice. 

![image-5.png](image-5.png)

## Reducers 

Reducers make changes to state. A reducer is a function that takes in state 
and an action as parameters and returns **new state**. State is never modifed! 
Instead, **when state changes new state is created**. 

![image-6.png](image-6.png)

The store holds your application state. The only way to change state is to 
send actions to the dispatcher. 

Unlike MVC Redux uses a unidirectional data flow. A View may generate actions
it will **never interact with a data store directly**. 

Instead actions flow into the dispatch and are passed on to reducers which 
make the appropriate changes to state. Updated state flows into components
via props. 

## Store 

The store contains a JavaScript object with properties that represent the 
state of your application. These properties hold the data that your 
application takes as input and displays in views. 

![image-7.png](image-7.png)


## Views send action the store sends data to views

![image-8.png](image-8.png)

---

Take a closer look at each part of Redux

## Actions

Action initiate changes to state. An action is always a JavaScript Object with a 
property named `type`. An action object may also have other properties and 
values that determine how new state is to be created. Common practice is to 
have another property named `payload` that holds new values. 

### Action Type 

An action type is always a **string** that describes the purpose of the action. 

- LOGIN_USER
- GET_POSTS
- START_TIMER
- NEW_TIMER
- etc.

Best practice is to define these as constants with the action creator and 
import them where needed. 

## Action Creators

For best practice use functions that generate actions. Action creators always 
a return an Action. 

A nice feature of Action Creators is that you can keep them all in one place 
and easily inspect them to see what types of actions your app is using. 

Since the only way to change state is with an _action_ you are easily able to 
_see the internal API of your app_ in one 
place!

## Dispatcher

The dispatcher contains a list of Reducers that are responsible for making 
changes to state. Reducers take in an action and state, and return new state. 
When an action is sent to the dispatcher it is **run through all of the 
reducers**. 

### Reducers 

A reducer is a function that takes in some part of the application state along 
with an action, and returns new state. 

Reducers are also responsible for defining initial value for state.  

```js
export default function(state = defaultState, action) {
  switch (action.type) {
    case ADD_TIMER:
      return [...state, new Timer(action.payload.name)];

    case REMOVE_TIMER:
      const id = action.payload;
      const newState = state.filter((timer)=>{
        if (timer.id !== id) {
          return timer;
        }
      });

      return newState;
      
    default:
      return state;
  }
}
```

Imagine the example above the app state keeps an array of timers. The function 
acts as a reducer to add and remove a timer. 

---

# Example

This is a simple example to introduce Redux and React Redux. The goal is to 
illustrating the concepts above in clear simple terms. 

Redux has many parts and will be difficult to absorb the first time through. 
Don't worry about that. You can refer to your example files and these notes in the 
future. 

## Counter

What we are building: A simple counter. 

Our system will have a single value stored in our application state that can 
be incremented and decremented.

The counter will store a single value on state under the key `counter`. 

## Add dependancies 

Redux is an agnostic JS library and can be used with any JS system. 
React Redux provides some glue to make Redux work with React. 

- Start with a default project. You can use:
  1. `create-react-app my-app`

- Import Redux and React Redux
  1. `npm install --save redux`
  2. `npm install --save react-redux`
    
## Create an Action

Redux requires actions to change state. Our counter needs to send an action to increment
and decrement the count. 

- Add a folder for actions then create an action creator
    1. Create a folder named `actions`
    2. Add a new file `index.js` to the actions folder
    3. Write an action. The action needs to increment or decrement state. 
    
```
export const INCREMENT = 'INCREMENT';
export const DECREMENT = 'DECREMENT';

export const incrementCounter = () => {
  return {
    type: INCREMENT
  }
}

export const decrementCounter = () => {
  return {
    type: DECREMENT
  }
}
```

Besides defining two action creators, we've also defined the types for these 
actions as constants we can use elsewhere, this is best practice to avoid 
spelling errors and make changes easy. 

## Add a reducer

Redux uses reducers to handle changes in state. A reducer is passed a _piece_ 
of state associated with a key and an action, and returns new state for that 
key. 

- Add a folder for your reducers then create a reducer. 
    1. Create a new folder named `reducers`.
    2. Add a new file to the reducers folder named `counter-reducer.js`.
    3. Write your reducer. 
    
```
import { INCREMENT, DECREMENT } from '../actions';

export default counterReducer = (state = 0, action) => {
  switch (action.type) {
    case INCREMENT:
      return state += 1;
    case DECREMENT:
      return state -= 1;
    default:
      return state; 
  }
}
```

Here you imported the action types, and defined a reducer. When the counter state 
changes this reducer will handle it by adding 1, subtracting 1, or returning the 
current value. 

Notice the default value for the state parameter `state = 0`. _This is important
since a reducer is responsible for setting initial state!_

_It is important to return state when it hasn't been modified since the value 
returned from a reducer sets the new value of state._ Note the default option
in the switch statement returns state.

## Combine Reducers 

The reducer you wrote is not a part of Redux until we add it to the system here. 

- All reducers must be combined with Redux.combineReducers(). Keep this in it's 
own file. 
    1. Make a new file named `index.js` in reducers. 
    2. Write some code: 
    
```
import { combineReducers } from 'redux';
import counterReducer from './counter-reducer';

export default combineReducers({
  counter: counterReducer
});
```

Important! the key `counter` will be the key on the state object that holds 
the counter value. Adding more reducers here with other keys would add new 
keys on state. Imagine each key here as representing a new "piece" of state. 

## Setup the store and provider

The store holds your application state. The provider is conduit that makes 
the store available to React components. 

Best practice is to keep the store high up your component hierarchy since it 
will be inherited by descendants. 

- Open app.js and set up the provider here. 
    1. Modify the App component. 
    
```
...
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import reducers from '../reducers';

const App = () => {
  return (
    <Provider store={createStore(reducers)}>
      <View style={styles.container}>
        
      </View>
    </Provider>
  );
}
...
```

Here you imported Provider from `react-redux` and wrapped your `App` component in 
the Provider component. This makes the store available to all components in App.

Provider requires a store. You created the store with createStore() and passed 
in your combined reducers, which is the dispatcher. 

**This concludes the setup of Redux, and testing here should not generate an 
error.**

_The state of the app will **not** change_ since the counter component is not 
sending any actions or listening to state. 

### Counter Component 

Add a counter component: 

```
import React, { Component } from 'react';

class Counter extends Component {

  render() {
    return (
      <div>
        <h1>0</h1>
        <button onClick={() => {
          console.log("increments counter");
        }}>Up</button>
        <button onClick={() => {
          console.log("decrements counter");
        }}>Down</button>
      </div>
    );
  }
}

export default Counter;
```

This is a simple component that displays the count along with an Up and Down
buttons which will be repsonsible for increasing and decreasing the count. 

Add the counter component to your App component. It should go inside `<Provider>`

```
...
import Counter from './components/counter';
...
<Provider>
  <Counter />
</Provider>
...
```

## Turning Components into Containers

These steps create the counter _Component_ as a _Container_ that will display 
the value of counter, and increment and decrement the counter value by issuing 
actions. 

In React terminology a Container is a Component that works with a Redux Store.

- Import dependancies 
    1. Add the import to the top `counter.js`
    
```
import { connect } from 'react-redux';
import { incrementCounter, decrementCounter } from '../actions';
```

The first line gets a helper method from react-redux that will connect your 
component to the redux store. 

The second line gets both action creators from `actions/index.js`.

- Containers are not exported normally. We will need to perform a little magic on 
a component to turn it into a container before exporting. 
    1. Remove `export default Counter;` for the Counter class. 

- State will be provided to this component via `props`. To do this write a 
function that maps state to props. This process is facilitated by react-redux. 
    1. Add the following method outside of the counter Component.
    
```
const mapStateToProps = (state) => {
  return { counter: state.counter }
}
```

- Next connect this component to the store. 
    1. Use the ReactRedux.connect() method to wire this component to the provider. 
    
```
export default connect(mapStateToProps)(Counter);
```

- Last display the value of counter in the component. 
    1. Modify the Text that displays the counter to now display: 
    `this.props.counter`
    
`<h1>{this.props.counter}</h1>`

You should be able to test your work and see the default value of the counter
appear in the Text display. Pat yourself on the back. 

## Sending Actions 

The two buttons in the counter need to send INCREMENT or DECREMENT actions.

Do this by mapping your dispatch to props. Dispatch is the part of Redux 
that receives actions and holds reducers. 

- The ReactRedux.Connect() method works a lot of magic. Let's use it to 
connect our action creators to Redux. 
    1. Modify the call to connect(), add an object containing your action 
    creators as the second param. 
    
```
export default connect(mapStateToProps, {incrementCounter, decrementCounter})(Counter);
```

This is using the ES6 syntax to generate:

```
{incrementCounter:incrementCounter, decrementCounter:decrementCounter}
```

These action creators are now available to our component via props! That is you 
will be able to call the `incrementCounter` function from within your 
component like this:

`this.props.incrementCounter()`

This is how you call action creators and dispatch actions from your Components!

- The last step will be call the action creators from the buttons. You'll need to 
do this from the action creators that will show up on props!
    1. Modify the two buttons in the Counter Component.
    
```
<button onClick={() => {
  this.props.incrementCounter(); // Dispatches an action!
}}>Up</button>

<button onClick={() => {
  this.props.decrementCounter(); // Dispatches an action!
}}>Down</button>
```

Notice we are calling the actions creators but they are now attached to the 
props object through the magic of `connect`!

Test your work the counter should now count up and down. 

## Reflection

This may seem like a lot of work to create an app this simple. And you would be
right. On the other hand this would be a very solid counter implementation that 
would not suffer from side effects!

Adding more state to this app would follow the same pattern. 

- Define an action and action creator
- Define a reducer for that action
  - Remember a single reducer might handle all actions tht work with one piece of sate. 

Any Containers (components connected to redux) you create have access to state
through props.

With these ideas in mind expanding on this simple app would build a solid 
reliable system. 

Without using redux it's quite possible that expanding on this app might turn
into a tangled unreliable mess. 

## Challenges

After working through the example you probably still feel lost with Redux and 
React Redux. There is no way you will get this with one pass. 

**The best way to solidify the knowledge is practice.**

Try these challenges to reinforce the concepts. 

The challeges below will modify the current project at each step to take closer 
look at how the system works. 

## Add more counters

Add a few more copies of the Counter component. Then test and increment and 
decrement each counter. What happens? 

## Add a reset button 

Use this challenge to follow the Action creator reducer pattern through from 
beginning to end one more time. 

- These steps create a button that resets the count to 0. 
  1. in `actions.js` add a new const `RESET_COUNT`
  2. Add a new action creator that returns an object with a type of RESET_COUNT. 
  3. Import the RESET_COUNT type into `counter-reducer.js`
  4. In `counter-reducer.js` add a new case for `RESET_COUNT`. This case need only return 0
  which is the new value of state when a counter is reset. 
  5. In `counter.js` import the new action creator. 
  6. Add the action creator to the other action creators in connect(). This is the 
  second argument to the connect() method call.
  7. Add a button, give it a text of reset. Then call your new action creator 
  from `this.props`.

### payload 

Often an Action will require information that can not be "hard coded" into an 
action creator. You can pass values to an action action creator as parameters, 
values can be attached to the action object it issues. 

In this example you will add a button that will add 5, 10, or any amount to the 
count. 

- Create a button that will add any amount to the count. 
  1. Define a new type.
  2. Add a new action creator, it should take a parameter that will hold the 
  amount. 
  Add a second property to the action object returned by the creator. Call 
  it payload. The value should be the value passed into the action creator. 
  ```
  export const incrementBy = (n = 1) => {
    return {
      type: INCREMENT_BY,
      payload: n
    }
  }
  ``` 
  3. In `counter-reducer.js` add a new case that increments state with the 
  value of action.payload. Something like this: `return state += action.payload`
  4. In counter.js import the action creator. 
  5. Add the new action creator to connect method. 
  6. Last, add a new button that calls this new action creator and passes a value
  that will be added to the count.

## More challenges

Try these challenges. They require a little more effort. 

- Keep a list of counters. Imagine the counter component as one of many counters. 
Here are a few ideas.
  - Use an array as state. Imagine it as an array of integers. Each holding the 
  count value for a one counter.
  - Your reducer will need to return a copy of the array each time you make a
  change to one of the counters. 
    - Why? Arrays are stored as reference. Modifying the array is a side effect. 
    Reducers must work as pure functions returing a new value. 
  - Each counter will reside at a differnt index in the array. The increment 
  buttons will need to pass the index of their timer to the action creator. 
  The action creator will need to pass the index on to the reducer. 
  - Test your work by creating several counters. Be sure to create new 
  Counters in App. Each counter will need to know it's index.
    - App or another component can interate through the list of counter values 
    and create a Counter Component for each. 
- Make a component that shows the total of all counters. 
  - This won't require an action or a reducer! You can calculate the total in your 
  `mapStateToProps()` method. This method receives the entire application 
  state. You can use array.map() here and attach the value as a property on 
  the object this function returns.
- Make a component that displays the count graphically. Set the height or width of box
a div based on the value of the counter. 
- Add a label to each counter. 
  - This means your counters will have to be stored as objects with a label and 
  count value. You will have to retool your reducer and mapStateToProps to 
  handle this. 
- Add an input and a button that adds a new counter with the label entered from 
the input. 
- Add a delete button to each Counter that removes the Counter from the list. 

## Challenges summary 

- Add more Counters
- Add a reset button to the Counter 
- Counters can increment in values other than 1
- Keep a list of counters each with their own count
- New Component to show the total of all counters
- Display counter value graphically as a progress bar or other
- Each counter has a both a label and a count
- Able to add new counters 
- Able to delete existing counters

## Resources 

Watch this video: 

- Great Redux tutorial: http://devguides.io/redux/
- Rich Hickey: Simple made Easy and The Value of Values. These two videos provide 
good insight to what is happening in Redux. They don't talk about Redux 
directly they give great insight into the programming methodology that inspired
Flux/Redux.
  - https://www.infoq.com/presentations/Simple-Made-Easy
  - https://www.youtube.com/watch?v=-6BsiVyC1kM
- Dan Abramov (the author of Redux) explains Redux. These videos explain Redux, how it works
and why it functions the way it does. These video help explain some of the challenge questions. 
- https://egghead.io/courses/getting-started-with-redux
- Flux explained by Facebook engineers. This is a great look into the reasons for creating 
Flux. It also explains real workd problems Flux was used to solve. 
  - https://facebook.github.io/flux/

**Be prepared to discuss the ideas from these videos in class**
