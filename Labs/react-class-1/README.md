# React Class 1

This sample React app has a few example components that outline some of the basic concepts of creating React Components. 

## Getting Started

This project was bootstrapped with [Create React App](create-react-app-notes.md). Install and run by following these instructions: 

1. Down this project from GitHub
1. Open a terminal and navigate to the project folder
1. Install with `npm install`
1. Run with `npm start`

The project should open in a browser window at `http://localhost:3000`

## Concepts covered 

- Components 
  - Simple/Stateless
  - Stateful  
  - Props
  - State 
  - Component lifecycle methods 
  - Nesting Components 

## Challenges 

**Challenge 1**: 

Take a look  at App.js. Ask yourself these questions?

1. Is this a simple/Stateless component or stateful component?
1. Would it work as a stateless component? 

App is a stateful component but it doesn't define state! It could be simplified into a stateless component. 

**Challenge 2**: 

Nesting components is important. It's how React projects are built! Reusing components makes your code DRY, it allows you to work faster, and makes it easier to reason about your code. 

Make a new component that contains two nested components a Title and Button. **Make this a stateful component**. 

State is an important feature for some components. If a component needs internal logic and values to manage how it is displayed you will want to make a stateful component. 

Name your component: OpenClosed

**Challenge 3**: 

Add State to the OpenClosed component. You need a property that says whether component is open or closed. 

Remember state is an object and the values you work with should saved as properties on that object. 

`this.state = { isOpen: false }`

**Challenge 4**: 

Use properties on state to determine what your Component displays. 

Make the Title in your OpenClosed component display "OPEN" when `this.state.isOpen` is `true` and "CLOSED" when it is `false`. 

**Challenge 5**: 

Changing state causes components to render. You'll never need to call the `render()` method directly. The syatem will always call render when something changes. In other words changing state or props will trigger a render. 

Never set state directly: `this.state.someProp = 'new value'`. Instead always change state by calling setState() with an obnject that has the properties and new values. For example: `this.setState({ someProp: 'new value'})`. 

Setup an onClick that changes the isOpen property on state. From false to true. 

