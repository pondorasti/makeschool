# FEW 2.3 Single Page Applications Study Guide 

## What is the for? 

To pass this class you must complete the class assignments and the final assessment. 

This document outlines what you should study to be prepared for the final assessment. 

## What you should know

### Reference vs value

You should be able to copy an object. Know when you are making a copy and when you are working with a reference. 

Can you explain the code below? 

```js
const a = [] // define an array. a is a reference
const b = a  // b is a reference to the same array

a === b true // a and b are equivalent because they point to the same reference

b.push(1) // adding an element to b 

a === b // a and b are still equivalent. 
// The line above modifies the array a and b point to 
// a [1] | b [1]

// Define an object
const obj = { a: 1, b: 2, c: 3 }
// Use the spread operator to copy the object
const obj2 = { ...obj, a:11 } // { a: 11, b: 2, c: 3 } 
```

### Map, Filter, Reduce

You should be able to use map filter and reduce to perform basic operations like the following examples:

- convert an array of numbers into an array formatted prices
- create an array containing only the prices over 5.00
- Get the total of all prices in a list

You should know that map, filter, and reduce are Array methods, and that they return a new array rather than modify the existing source array.

### JS Modules: import, export, and default 

You should be able to use export to share functions, variables, and classes with other modules in your program. 

You should know how to import elements into a module from npm or from a file you defined. 

You should know the difference between `export` and `export default` and how to import an exported element or a default export. 

### Bootstrapping a React Project

You should be able to get a boilerplate React project up and running. 

The easiest way to do this is with: `npx create-react-app <name-of-app>`

### Write JSX 

JSX is an extension of the JavaScript language that allows us to write code using an XML syntax. It looks a lot like HTML. 

You should be familiar with the basic rules of syntax that belong to JSX. 

You should be able to do the following things with JSX: 

- Define a block that renders as HTML: `<Title><h1>Hello</h1></Title>`
- Set props on an element: `<DateButton label="Wednesday" />`
- Use a variable or expression in a JSX block: `<Title key={post.id}>{post.title}</Title>`

### Components 

You should be able to write components and get them to display without error in your React Projects. 

Components are written as Class objects that extend React.Component or as functions

A Class-based component can define state. Class-based components must define a render method that returns JSX.

#### Props and State 

Props and state are features of components. 

Props allow you to pass data into a component to configure that component. Props come from outside of a component. 

State is defined within a component and a component changes its state. 

Changes to props or state cause a component to render.

### Controlled Component (form input pattern)

The controlled component pattern refers to the pattern used in React to handle form elements and form input. You should be able to set up a component that accepts user input in an `<input />` element and display the value in the element and stores the value on the state. 

Can you understand the code below? 

```JSX
import { useState } from 'react'

function DogNameInput() {
	const [dogName, setDogName] = useState('')
	const [dogCount, setDogCount] = useState(0)
	const [dogArray, setDogArray] = useState([])
	
	return (
		<div>
			<h1>{`Dog Name: ${dogName} Count: ${dogCount}`}</h1>

		<h1>{dogArray.map((dog, i) => {
			return <span key={`${dog}-${i}`}>{dog}</span>
		})}</h1>
		<input 
			type="text"
			value={dogName}
			onChange={(e) => {
				setDogName(e.target.value)
 		}}
 		/>
 		<button
 			onClick={(e) => {
 				const tempDogArray = [ ...dogArray, dogName ]
				setDogArray(tempDogArray)
				setDogCount(dogCount + 1)
			}}
		>Submit</button>
 		</div>
	)
}
```

### Conditional Rendering components

You should be able to render different components based on state or props using any of the conditional rendering methods covered in class. You don't have to have all of the different methods memorized you just need to be able to render one component or another based on props or state using one method or another. 

Can you explain the code below? 

```JS
function showData({ data }) {
	if (!data) {
		return <div>Loading...</div>
	}

	return (
		<div>
			{data.map(item => <p>{item.name}</p>)}
		</div>
	)
}
```

### React Router

You should be able to implement React Router in basic form with BrowserRouter. This would be: 

- defining Routes that render components
- using Link to display a Route

### Redux 

You should be able to implement redux in basic form. 

- Defining Redux
	- What is it?
	- Why use it? 
- Defining the parts
	- Actions
	- Reducers
	- combineReducers()
	- Store
	- createStore()
- React and Redux
	- Provider
	- useSelector
	- useDispatch

