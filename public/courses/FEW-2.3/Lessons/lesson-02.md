# FEW 2.3 - Lesson 2

<!-- > -->

## React Props and State

This class you will work on improving the codebase you've developed in the previous classes.

<!-- > -->

## Learning Objectives

1. Describe Props and State
1. Compare Props and State
1. Use Props and State
1. Apply Profesional best practice with ESLint

<!-- > -->

## Video

Follow this class in these video lessons:

- https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

The videos are labeled "lesson 02 x" which corresponds to the class lesson numbers. 

<!-- > -->

## Review

1. What is a Single Page Application?
1. Name some pros and cons of Single Page Applications?
1. Create a new react project
1. What is JSX in your own words?

<!-- > -->

## Props and State

Props are values passed to a component from outside. 

State is values stored internally by a component.

<!-- > -->

A component renders when it receives props or state changes. This is one of the most important concepts to understand about React! 

<!-- > -->

### Counter Component

Let's make a count. Each counter will display a label, a value, and an increment and decrement button.

<!-- > -->

Start the example by creating a new React project: 

```
npx create-react-app props-and-state
```

<!-- > -->

Create a Counter component. Make a new file named: `Counter.js`.

```JS
function Counter(props) {
	return (
		<div className="Counter">
			<small>{props.label}</small>
			<h1>{props.value}</h1>
			<button>+</button>
			<button>-</button>
		</div>
	)
}

export default Counter
```

Notice the counter uses props to display its label and value. 

<!-- > -->

In App.js use your counter. You can the default code. Import your Counter component and render it here: 

```JS
import './App.css';
import Counter from './Counter'

function App() {
  return (
    <div className="App">
      <Counter label="Apples" value="1" />
    </div>
  );
}

export default App;
```

Notice you are setting the `label` and `value` here! This is where these props get their values! 

<!-- > -->

Make another Counter: 

```JS
<div className="App">
  <Counter label="Apples" value="1" />
  <Counter label="Oranges" value="3" />
</div>
```

Notice the second counter has different values for `label` and `value`.

<!-- > -->

Make a couple more counters and give each a different label and value. 

Notice that you made one component but props allows you to configure that component!

<!-- > -->

## Adding State 

Let's add state. State will keep track of the count that is displayed by the component. 

<!-- > -->

Edit `Counter.js`, import `useState` from react at the top:

```JS
import { useState } from 'react'
```

<!-- > -->

Now define a new state variable and a setter function with `useState`:

```JS
function Counter(props) {
	const [count, setCount] = useState(0)

	return (
    ...
  )
}
```

Here `count` is the value and `setCount` is a function that will be used to update the value of `count`. The default value of `count` is `0` (`useState(0)`.)

<!-- > -->

Display the count and update it's value: 

```JS
<div className="Counter">
  <small>{props.label}</small>
  <h1>{count}</h1>
  <button onClick={() => setCount(count + 1)}>+</button>
  <button onClick={() => setCount(count - 1)}>-</button>
</div>
```

There are three changes here: `<h1>{count}</h1>`, and both: `<button onClick={}>`. 

Notice we use `setCount(newValue)` to change the value of count!

<!-- > -->

Changing state by calling the setter function caues the component to render. This is why we see the component update! 

Just changing the value of state is not enough. For example: `<button onClick={() => count + 1}>` would not display the new count!

<!-- > -->

## Lifting State

What is lifting state? This is the process of moving values from a child component to a parent component.

<!-- > -->

Consider the counter example. What if you needed to show the total of all Counters? How would you do that?

The easiest way to handle this will be to pass the count down to the counter as a prop. The parent component would own and track state. While child component simply displays the value.

<!-- > -->

The solution is to "lift" state from each of the Counters and store the state in the parent. You can then pass the value of each counter down as a prop to be displayed. 

<!-- > -->

Edit your Counter.js. Go back to original version: 

```JS
function Counter(props) {

	return (
		<div className="Counter">
			<small>{props.label}</small>
			<h1>{props.value}</h1>
			<button >+</button>
			<button >-</button>
		</div>
	)
}

export default Counter
```

Here the value and the label are passed to the component as props. 

Notice I removed the `onClick` for now. You'll add these again later.

Notice you removed state! You're going to put state in App. 

<!-- > -->

In App.js import `useState` at the top:

```JS
import { useState } from 'react'
```

<!-- > -->

Define a state variable and setter function.

```JS
function App() {
  const [count, setCount] = useState([1,4,3])

  return (
    <div className="App">
      {count.map((value, index) => {
        return (
          <Counter 
            label={`counter ${index}`}
            value={value} 
          />)
      })}
    </div>
  );
}
```

Notice you're mapping the array of counts into Counter components.

<!-- > -->

With this change the values are stored in the parent component and the values are passed down to the child components. 

<!-- > -->

The next step is to handle clicks on the + and - buttons. To do this you'll need to pass a function as a prop to the children.

<!-- > -->

Important! When working with state and a [reference type](https://javascript.info/reference-type) you must make a copy!

<!-- > -->

```JS
// Bad! does NOT work! 
count[2] += 1 // add 1 to index 2
setCount(count) // updated 
```

This doesn't work! This is mutating the original object and setting state. React will not recognize this change!

<!-- > -->

```JS
// Good! 
const newCount = [...count] // Copy Count!
newCount[2] += 1 // add 1 to index 2
setCount(newCount) // updated 
```

This works! The first line creates a copy of the count array and uses that to update state! 

<!-- > -->

Let's apply that to the Counter example. In App,js:

```JS
<div className="App">
  {count.map((value, index) => {
    return (
      <Counter 
        label={`counter ${index}`}
        value={value} 
        
        increment={() => {
          const newCount = [...count]
          newCount[index] += 1
          setCount(newCount)
        }}

      />)
  })}
</div>
```

Here you added a new `increment` prop. This is a function that will update the count at index. 

<!-- > -->

Update Counter.js:

```JS
<div className="Counter">
  <small>{props.label}</small>
  <h1>{props.value}</h1>

  <button onClick={props.increment}>+</button>

  <button >-</button>
</div>
```

Here you called the increment function you passed down to this function through props. 

<!-- > -->

**Challenge!** Add a decrement function that will decrease the count when the - button is clicked.

<!-- > -->

**Solution!**

Setup a decrement function like this: 

In App.js

```JS
decrement={() => {
  const newCount = [...count]
  newCount[index] -= 1
  setCount(newCount)
}}
```

In Count.js use call the decrement function: 

```JS
<button onClick={props.decrement}>-</button>
```

<!-- > -->

**Stretch Challenge**

Display the total of all counters at the bottom of App.js.

<!-- > -->

**Solution!**

```JS
<h1>{count.reduce((acc, val) => acc + val)}</h1>
```

<!-- > -->

## After Class

Continue working on [Assignment 1](../Assignments/Assignment-01.md)

<!-- > -->

## Resources

- [React State](https://reactjs.org/docs/faq-state.html)
- [React Props](https://reactjs.org/docs/components-and-props.html)
- [Video Playlist](https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx)
- [Lifting State](https://reactjs.org/docs/lifting-state-up.html)

