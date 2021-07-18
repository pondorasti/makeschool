# FEW 2.3 - Lesson 9

# Redux

This class will cover Redux which is an application state management tool. Application State represents the data that your app manages and displays. Often it is shared across multiple views and can be updated in complex ways. 

Redux is a JS library based on the Flux pattern that 

<!-- > -->

## Review: Redux

<!-- > -->

What do you remember about the first discussion of redux? 

<!-- > -->

What is an action? 

<!-- > -->

What is a reducer?

<!-- > -->

What is the store?

<!-- > -->

```JS
const export NEW_TODO = 'NEW_TODO'

export const newTodo = (item) => {
  // What goes here?
}
```

<!-- > -->

```JS
import { NEW_TODO } from '../actions'

function todoReducer(state = [], action) {
  // What goes here? 
}
```

<!-- > -->

## Learning Objectives

1. Define Reference and value types
2. Identify references and values in JavaScript
3. Use destructuring to create a shallow copy of objects and arrays

<!-- > -->

## The Final Project

Use this class to get started on your final project!

Your project should include the following: 

- Built-in React
- Uses Redux
- Uses the Controlled component pattern

### Define your application state

Since your project will use Redux you'll need to think about the store. Ask yourself these questions: 

- What data does your project need to store?
- How will the data be organized? 

The store is an object and each key holds a value. The value at each key is assigned by a reducer. 

The keys in the store can be objects, arrays, or other value types. Your project can use more than one reducer but each reducer is responsible for the value at a single key. 

Imagine your store has a list of posts. It might look like this: 

```JS
store = {
  posts: [...]
}
```

This might be defined a posts reducer: 

```JS
function postsReducer(state = [], action) {
  ... // remember this will always return an array! 
}
```

When you set up Redux with `combineReducers` you define the shape of the store: 

```JS
combineReducers({
  posts: postsReducer
})
```

Imagine you have to know which post someone is currently viewing. We need the index of this post. As it is now `postsReducer` can't support this since it has only an array. How would you solve this? 

There are two routes you can take: 

**Solution 1** Make `posts` into an object. 

```JS
function postsReducer(state = { selectedPost: 0, posts: [] }, action) {
  ... // Must return an object with keys: selectedPost, and posts 
}
```

**Solution 2** Add a second reducer! 

The current reducer stays the same. 

```JS
function postsReducer(state = [], action) {
  ... // remember this will always return an array! 
}
```

Then add a new reducer: 

```JS
function selectedPostReducer(state = 0, action) {
  ... // Always returns a number 
}
```

In this case you would add a second key to combine reducers: 

```JS
combineReducers({
  posts: postsReducer,
  selectedPost: selectedPostReducer
})
```

### Define the Application state for the app

What does it look like? What shape or form does this data take? Define your data now. Write an object that looks like the data your app needs to store. 

## Define Actions 

Actions determine the ways your application can make changes to the store. In a Redux application changes to the application, state can only be made with an action. 

- List all of the actions your application can take
- For each action think of what information might be required by that action. 

For example, with the example above, creating a new post might require a title and some text content. The action might be called: ADD_POST. Every action will have a corresponding function. In this case, the function would need to take the title and content as parameters. 

```JS
const ADD_POST = 'ADD_POST'

function addPost(title, content) {
  return {
    type: ADD_POST,
    payload: { content }
  }
}
```

Your reducers would be called with the current state value and the action object returned from `addPost` when the action is issued. 

### Define your actions

Think of all of the ways your application will change its state. Make an action for each state. 

## In Class Challenges 

- Create a new react project if you haven't already
- Add redux to your project
  - Import dependencies
  - Create an actions folder
  - Create a Reducers folder
- Define your actions
  - Define a name
  - Define the function
- Add reducers
  - Define a reducers
  - Combine your reducers

## After Class

The goal for today is to have a React Project with Redux. It doesn't have to be fully functional and may need changes, but it should have redux installed and functional. 

- Install Redux
- Add Actions
- Add Reducers
- Combine Reducers
- Create Store

Submit your work to grade scope. 

## Additional Resources

1. 

