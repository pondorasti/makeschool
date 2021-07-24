# FEW 2.3 - Lesson 3

<!-- > -->

# React and Forms

<!-- > -->

The first goal for this class is to use React with a public web API.

The second goal is to work with form elements and user input with React. React has a special pattern for this due to the way it handles the virtual DOM.

Last, the goal will be to look at conditional rendering techniques that can be implemented with React. 

<!-- > -->

## Learning Objectives 

- Implement the Controlled Component Pattern
  - Use forms and form data in React
- Build an app that works with a public API
- Build a system to handle network errors gracefully
- Use conditional rendering patterns in React

<!-- > -->

## Video

Follow this class in these video lessons:

- https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

The videos are labeled "lesson 03 x" which corresponds to the class lesson numbers. 

<!-- > -->

## Review

<!-- > -->

**Pop Quiz**

- What is map used for? 
- What does map return?
- What parameters does map take?

<!-- > -->

**Checking progress**

- Where are you at on product list?
- What do you need to do to wrap up this project?
- What are your blockers?

<!-- > -->

## React Hooks

<!-- > -->

Hooks are a new feature to React. Hooks allow you to use state with a function based component. 

Before Hooks state was only available to class based components. 

<!-- > -->

## Use useState 

<!-- > -->

Import `useState` from react

```JS
import { useState } from 'react'
```

<!-- > -->

Use `useState` to generate a state variable and setter function that that variable. 

```JS
function MyComponent() {
  const [count, setCount] = useState(0)
  ...
}
```

<small>`count` is the variable, and `setCount` is the setter. The initial value of `count` is 0. </small>

<!-- > -->

```JS
import React, { useState } from 'react';

function Example() {
  // Declare a new state variable, which we'll call "count"
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

<!-- > -->

### Controlled Component Pattern

<!-- > -->

The controlled component pattern is used to handle form input in React projects. 

<!-- > -->

```JS
function MyComponent() {
  const [name, setName] = useState('')
  return (
    <input 
      value={name}
      onChange={(e) => setName(e.target.value)}
    />
  )
}
```

<small>Here name stores the value displayed in the input.</small>

<!-- > -->

Here the component was creacted from a function but has access to state (`count`). 

To use state with hooks follow these steps

1. When using `useState` you'll need to import it first. 
1. Call `useState(initialValue)` with the initial value. 
1. Deconstruct with the array syntax to get the value, and setter function. 
    - In the axample above the value is `count`
    - The setter us `useCount`
1. To change the value of state call your setter with a new value: `setCount(99)`

It's convention to name your vairable and precede the setter with 'set'. 

### `const [count, setCount] = useState(0);` 🤔

What is this? You should already be familiar with deconstructions with Objects. Desconstruction can also be applied to Arrays. 

```JS 
const numbers = [1, 2, 3]
const [ one, two, three ] = numbers
```

With an object similar code might look like this: 

```JS 
const numbers = { one: 1, two: 2, three: 3 }
const { one, two, three } = numbers
```

With objects you must use the keys to assign the values. So the new variables created on line 2 number have the names `one`, `two`, and `three`. 

In the Array example on line 2 the new variables created can have any name and they are assigned value based of their index!

### Why hooks? 

React is based on **functional** react programming. At it's heart it's built from functional concepts. React isn't an Object Oriented library. The idea of having important parts of the system based on OOP code goes against it's underlying concetps. 

Classes take a extra syntax to generate and more complex to decipher and debug. Functions are more straighforward to troubleshoot. 

If you've ever been confused by `this` if you writing code that is only functions, removing classes, you won't have to workry about `this`.

Hooks don't add a ny breaking changes. Use them if like or not if you don't. 

You should expect to see Hooks in code samples online so it pays to understand them even if you don't use them. 

## Lifecycle methods and Hooks 

```JS
import React, { useState, useEffect } from 'react';

function Example() {
  const [count, setCount] = useState(0);

  // Similar to componentDidMount and componentDidUpdate:
  useEffect(() => {
    // Update the document title using the browser API
    document.title = `You clicked ${count} times`;
  });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

<!-- > -->

## Introduction 

<!-- > -->

The demo project is a simple web app that displays weather data. You'll need to make an account and get a valid API key. 

The project needs to accept user input for a zipcode. Text input and other form elements use a special pattern in React called the _Controlled Component Pattern_. 

<!-- > -->

## React State 

<!-- > -->

State represents a value a component stores internally.

<!-- > -->

When state changes a component renders 

<!-- > -->

## Getting Started

Follow the instructions to set up and run the demo project.

- Download or fork the [project](https://github.com/Product-College-Labs/react-api-project)
- Make an account with [OpenWeatherMap.org](https://home.openweathermap.org/)
    - Go to your profile page: API Keys
    - Generate and copy your API key
    - Add the following to the '.env' file: 

`REACT_APP_OPENWEATHERMAP_API_KEY=YOUR_API_KEY_HERE`

**Pro-tip!** 

- The Create React App starter project is set up to use `dotenv`, you don't need to add this package. 
- Any environment variables you define **must** begin with `REACT_APP_`. This prevents clashes with environment variables that you may not be aware of. 

Read more about [Adding Custom Environment Variables](https://facebook.github.io/create-react-app/docs/adding-custom-environment-variables)

Everything in the example project happens in App.js. There are many comments explaining what is going on, read these closely.

- `npm install`
- `npm start` or `yarn start`

## Input Pattern 

The project has a single input field. Find it in the `render` method of App.js. 

```JavaScript
<input 
  value={this.state.inputValue} 
  onChange={e => this.setState({ inputValue: e.target.value })}
  type="text" 
  pattern="(\d{5}([\-]\d{4})?)"
  placeholder="enter zip"
/>
```

This started as a simple input element. 

`<input type="text">`

The input should take a zip code so I set the placeholder to "enter zip" and used the pattern attribute and a little regex "magic" to limit input to zip code patterns. 

```JavaScript
<input 
    ...
  type="text" 
  pattern="(\d{5}([\-]\d{4})?)"
  placeholder="enter zip"
/>
```

The `value` and `onChange` attributes are used for the React input pattern.

```JavaScript
<input 
  value={this.state.inputValue} 
  onChange={e => this.setState({ inputValue: e.target.value })}
  ...
/>
```

The controlled component pattern stores the value entered on `this.state` and displays the value in the component via its value attribute. 

Imagine you are entering a zip code into a text input field. You type the first number of the zip code which is 9. The onChange method fires and assigns the value in the text field to state with: `this.setState({zip:e.target.value})`. When the component is rendered the value displayed is the value set on state `this.state.zip`.

This may seem a little strange, but it's important for two reasons. 

- React's virtual DOM may replace the input component at any time when the DOM is redrawn. This would lose values stored in real DOM elements. 
- It stores input values on `state` where they are easy to access when you need them without having to access the input and retrieve its value. 

- [Controlled Components](https://reactjs.org/docs/forms.html)

## Challenges 

Use `array.filter()` to solve some of the challenges. Filter is a method of Array that returns a new array that is a subset of the source array. Like map and reduce fitler takes a callback. The callback is passed each element from the source array and it determines if that item should be included in the output array by returning true or false if the item should not be included. 

## After Class

[Assignment 3](https://github.com/Make-School-Courses/FEW-2.3-Single-Page-Web-Applications/blob/master/Assignments/Assignment-02.md)

## Additional Resources

1. [Video Tutorials](https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx)
1. [JSON Formatter](https://jsonformatter.curiousconcept.com)
1. [React Forms](https://reactjs.org/docs/forms.html)
1. [JSX in depth](https://reactjs.org/docs/jsx-in-depth.html#comments)
1. [Conditional Rendering](https://reactjs.org/docs/conditional-rendering.html)
1. [Conditional Rendering in React](https://blog.logrocket.com/conditional-rendering-in-react-c6b0e5af381e)
1. [Custom environment variables](https://facebook.github.io/create-react-app/docs/adding-custom-environment-variables)
