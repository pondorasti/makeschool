<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Components and State

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->
<!-- 
## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | -------- | ------------ |
| 0:00 | 0:05 | [Learning Objectives](#learning-objectives) |
| 0:05 | 0:15 | [Why you should know this](#why-you-should-know-this)] |
| 0:20 | 0:30 | In Class Activity I |
| 0:50 | 0:10 | BREAK |
| 1:00 | 0:45 | In Class Activity II |
| 1:45 | 0:05 | Wrap up review objectives | -->

<!-- > -->

## Why you should know this?

**State** is a key part of React components. To fully understand React you have to undestand state. 

<!-- > -->

## Learning Objectives

1. Describe State
1. Compare and contrast state and props
1. Use State in components

<!-- > -->

## React Component State 

State in React represents a value that is held/stored by a component, and triggers a render when the value changes. Imagine state as something that is connected to the user interface and when a change to state occurs you would want the user interface to update.

Props are values that come from outside of a component state is stored intinally by the component. Use props to configure your component use state to hold a value the component keeps track of. 

There are two ways to handle state. With a class based component, or with a hook. Hooks are a new feature. The first part of this lesson will cover class based components later we will look at hooks. 

## Class Based components 

Components can also be written/Created from a class. In the previous examples you used functions to make components. 

```JSX
import React, { Component } from 'react'

class Counter extends Component {
  constructor(props) {
    super(props)
    ...
  }
  render() {
    return (
      <div>
        <h1>0</h1>
        <button>Click</button>
      </div>
    )
  }
}
```

<!-- > -->

Class based components are: 

- Written as a class
- Must Extend React.Component
- Must include a render method 
- Must pass props to super

Pick these things out of the code sample above. 

<!-- > -->

### Defining state 

Define state in the constructor. With a class based component state is stored on `this` as a property that belongs to an instance of the class. State is always an object. All of the values you want to store on state should be properties of that object. 

```JSX
import React, { Component } from 'react'

class Counter extends Component {
  constructor(props) {
    super(props)
    this.state = { count: 0 } // define state here!
  }
  ...
}
```

State is an object and can have as many properties as you care to define with any value. 

```JSX
// define state here!
this.state = { 
  searchQury: '',
  userName: '',
  age: null, 
  date: new Date(),
  shoeSize: 43,
  choices: []
} 
```

<!-- > -->

- State is always an object
- State is always an instance property on `this`
- Values are stored as properties
- Use any value on `this.state`

<!-- > -->

### Changing State

You **must** change state by calling `this.setState()` with the new value for state. 

```JSX
import React, { Component } from 'react'

class Counter extends Component {
  constructor(props) {
    super(props)
    this.state = { count: 0 } // define initial value for state
  }

  increment() {
    // Increment count by calling setState()
    this.setState({ count: this.state.count + 1 })
  }

  render() {
    ...
  }
}
```

When changing state you must call `this.setState()`. Here are some examples: 

```JS
// sets count to 0
this.setState({ count: 0 }) 
// sets count to count + 1
this.setState({ count: this.state.count + 1 })
// Sets three properties at once
this.setState({ name: 'Jim', age: 66, shoeSize: 45 }) 
```

The setState() method takes an object with properties that you want to set and their new values. Set as many properties as needed at the same time.  

<!-- > -->

- Always access state with `this.state.someProperty`
- You should always change state by calling `this.setState()`
- Provide an object with the properties that you want to update: `this.setState({ value: newValue })`

<!-- > -->

### Handling Click events

Adding events in React is done through props. In vanilla JS you might add an event listener: 

```JS
// In vanilla JS you might handle a click event like this
button.addEventListener('click', (e) => { ... })
```

This same type of event would be created in React like this: 

```JSX
// In React you would handle a click event like this
<button onClick={(e) => { ... }}>Click</button>
```

<!-- > -->

```JSX
import React, { Component } from 'react'

class Counter extends Component {
  constructor(props) {
    super(props)

    this.state = { count: 0 }
  }

  increment() {
    this.setState({ count: this.state.count + 1 })
  }

  render() {
    return (
      <div>
        <h1>{this.count}</h1>
        <button onClick={(e) => {
          this.increment()
        }}>Click</button>
      </div>
    )
  }
}
```

<!-- > -->

- Events receive an event object
- Arrow functions are good here
- You'll need to call `this.increment()` inside of an anonymous function or bind that method to your instance.

<!-- > -->

### This is confusing in JS

The `this` keyword is often a point of confusion in JS. Below are common errors and solutions.

```JS
import React, { Component } from 'react'

class Counter extends Component {
  constructor(props) {
    super(props)

    this.state = { count: 0 }
  }

  increment() {
    this.setState({ count: this.state.count + 1 })
  }

  render() {
    return (
      <div>
        <h1>{this.count}</h1>

        {/* Does NOT work! */}
        <button onClick={this.increment}>Click</button>
        {/* Does NOT work! */}
        <button onClick={this.increment()}>Click</button>


        {/* Works! */}
        <button onClick={(e) => {
          this.increment()
        }}>Click</button>
        {/* Works! */}
        <button onClick={this.increment.bind(this)}>Click</button>
      </div>
    )
  }
}
```

**Mistake 1**

```JS
<button onClick={this.increment}>Click</button>
```

This does not work! Here the increment function is assigned to the button and `this` is executed in a different context. When clicked the button provides the value for `this` inside the increment function. 

**Mistake 2**

```JS
<button onClick={this.increment()}>Click</button>
```

This does not work! Here you've executed function when you created the button and assigned the value returned to `onCLick`. The `increment()` method doesn't return anything so the value is `undefined`.

## Lab

Try these challenges during lab:

### Challenge 0 - Counter

Create the Counter component as outlined above 

### Challenge 1 - decrement 

A counter that only counts up might be useful but might be more sueful if there were +/- buttons. Create the count component as 

### Challenge 2

Make an instance of your counter in the root component App. test it and make sure it's working. 

### Challenge 3 

Make three instances of the Counter Component in the root component. Test these. They should each track a separate value. 

This is state. Each component can keep their own state. State is held inside each component that defines it. 

### Challenge 4

Modify the counter component so that it can count in any increment. For example each click adds 1, 3, or 5. Then **make three counters using the same component**. The first counter shouls count in 1, the second by 3, and the third by 50!

You'll be making a single counter component. Then making three instances of this component. 

To make this work you'll be passing the step amount (the amount to add with each click) to each instance of the component as a prop. For example: 

```js
<Counter step={1} />
<Counter step={3} />
<Counter step={50} />
```

### Challenge 5 

Counters might be more useful if you could limit the minimum and maximum values. Add two props: `min` and `max`. The component should not allow state to not allow state to increase beyond max or below min. 

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

Take a break. 

### Challenge 6

Add some styles to your component. Think about the component as three elements in a container: 

```HTML
<!-- Counter -->
<div className="Counter-3">
  <button>−</button>
  <h1>{this.state.count}</h1>
  <button>＋</button>
</div>
```

The container is the outer div, inside are three elements two buttons surrounding an h1. 

div Container styles: 

- `display: flex;`

h1 value display: 

- `padding: 0.5em;`
- `margin: 0;`
- `border-top: 3px solid;`
- `border-bottom: 3px solid;`

button both left and right +/- buttons

- `font-size: 1em;`
-	`width: 50px;`
-	`margin: 0;`
-	`background-color: #eee;`
-	`border: none;`
-	`border-top: 3px solid;`
-	`border-bottom: 3px solid;`

button left - button

- `border-left: 3px solid;`
-	`border-top-left-radius: 1em;`
-	`border-bottom-left-radius: 1em;`

button right + button

- `border-right: 3px solid;`
-	`border-top-right-radius: 1em;`
-	`border-bottom-right-radius: 1em;`

### Challenge 7

How do you get state out of a component? It's nice that these counters know what their count is but the app might need to know the value stored by a counter.

To do this pass a callback to your component via props. 

```JS
import React, { Component } from 'react'
import './Counter-3.css'

class Counter extends Component {
	constructor(props) {
		super(props)

		this.state = {
			count: 0
		}
	}

  // ******************************************
	increment(amount) {
		const newValue = this.state.count + amount
    this.setState({ count: newValue })
    // If onChange exists 
		if (this.props.onChange) {
      // Call onChange with the new value
			this.props.onChange(newValue)
		}
  }
  // ******************************************

	render() {
		return (
			<div className="Counter-3">

				<button
					onClick={() => {
						if (this.state.count > this.props.min) {
							this.increment( -this.props.step )
						}
					}}
				>−</button>
				
				<h1>{this.state.count}</h1>

				<button
					onClick={() => {
						if (this.state.count < this.props.max) {
							this.increment( this.props.step )
						}
					}}
				>＋</button>

			</div>
		)
	}
}

export default Counter
```

Take a close look at the comments above. When the value is changed the component calls `this.props.onChange()` and passes the new value into this method as an argument. 

To use this you might write your component like this: 

```JS
<Counter 
  onChange={(newValue) => {
    // do something with newValue here! 
  }}
  min={0} 
  max={10} 
  ßstep={1} 
/>
```

Notice you're writing a function here that takes `newValue` as a parameter. 

<!-- > -->

## Defining your final project

Your goal is to take the ideas from class and create your project. Revisiting the ideas from class and building something new. 

Your final project must: 

- Use React
- Use React Router
- Be published to GitHub Pages

<!-- > -->

## Wrap Up (5 min)

- Review State
- Compare Props and State
- Update tracker and answer questions about homework

<!-- > -->

## Additional Resources

1. https://reactjs.org/docs/faq-state.html
