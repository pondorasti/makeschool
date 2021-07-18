<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 11 - Forms and User inputs

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Why you should know this

Collecting user data is crucial to many apps you will create. React is a library for creating user interfaces and creating interfaces for forms is an art in itself. React handles forms a little differently from how you have handled forms in other systems. 

<!-- > -->

## Learning Objectives

1. Use State to manage form input
1. Implement the controlled component patern
1. Create forms using components

<!-- > -->

## Review Your Work

Pair up and review projects show your work. Walk through all of the features you have implemented.

Make a list of Everything you need to complete to show your work in class on Tue, March 3.

Identify the three most important things on your list that need to get done.

Identify one or more items on the list that you can accomplish in class today during lab time.

<!-- > -->

# React and Forms

When using forms and inputs React has a special pattern.

https://reactjs.org/docs/forms.html

<!-- > -->

The controlled component pattern uses state to hold the value of an input. 

You should try it for yourself with these challenges. 

## Using Input with React

When using input fields/form elements with React you'll use a special pattern called the controlled component pattern. 

https://reactjs.org/docs/forms.html

The idea is that the value you enter into a form element is stored in state and it's that value that is displayed by the form element. 

Imagine the input below takes in a person's name. Imagine this is defined a component with state defined as `{ name: '' }`.

```JS 
<input 
  type="text"
  value={this.state.name}
  onChange={(e) => this.setState({ name: e.target.value })}
/>
```

This might seem a little strange or circular. Here is the process. 

- You enter a character in the field
- onChange fires
- Call set state and change state to the new value in the field
- set the value of the input to the new value on state

Here is the whole component. 

```JS
class FormThing {
  constructor(props) {
    super(props)
    this.state = { name: '' }
  }

  render() {
    <form>
      <input 
        type="text"
        value={this.state.name}
        onChange={(e) => this.setState({ name: e.target.value })}
      />
    </form>
  }
}
```

### Hooks 

Hooks are a new way to handle state with a function based component. 

```JS
import react, { useState } from 'react'

function FormThing() {
 const [name, setName] = useState('')

  return (
    <form>
      <input 
        type="text"
        value={name}
        onChange={(e) => setName(e.target.value )}
      />
    </form>
  )
}
```

Here state is defined with `setState` which returns a value of state and a function used to change or set a new value for state. 

```js
const [name, setName] = useState('hello')
```

Here `name` is a value and `setName` is a  function used to change the value of `name`. Call `useState()` with the default value. Here name would have a default value of `hello`.

To change state call the setter function with the new value: 

```JS
setName('Foo Bar')
```
 With Hooks you'll use always change state by calling your setter. When changing state the component will render again and update it's view. Calling the setter function has the same effect as calling `this.setState()` in class based component. 

 If you have more than one value you want to store 

<!-- > -->

### Challenge 1

Use the Controlled Component pattern. The goal of this challenge is to create a component with an input field and an H1. As you enter text in the input the H1 should display the same text

- Make a React Project
- Make a New Component with an input
- Use Conotrolled Component pattern to store the input value on state
- Display the value of state in the H1. 

<!-- > -->

### Challenge 2

Make the a tip calculator. Google Tip Calculator and use the Google tip calculator as a model.

You'll use the controlled component pattern for the tip calculator inputs. This should store the bill, tip%, and split vlaues on state. In the render method calculate the tip amount from the values in state and display it. 

- You'll need inputs for: 
  - Bill
  - Tip %
  - Split (number of ways to split the bill)
- Dipslay: 
  - Tip amount
  - The bill total 
  - Per person amount
- These values should update as you change the values

### Stretch Challenges

If you've got the tip calculator working try these stretch goals. 

- Use CSS to style the tip calculator
- Format the Bill with a decimal
- Create an input for the tip amount that calculates the tip percent

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

# Topic 2

<!-- > -->

## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. Links to additional readings and videos

<!-- > -->

<!-- ## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | -------- | ------------ |
| 0:00 | 0:05 | [Why you should know this](#why-you-should-know-this) |
| 0:05 | 0:15 | [Learning Objectives](#learning-objectives) |
| 0:20 | 0:30 | In Class Activity I |
| 0:50 | 0:10 | BREAK |
| 1:00 | 0:45 | In Class Activity II |
| 1:45 | 0:05 | Wrap up review objectives | -->
