<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 8 - Component Architecture

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ------------ |
| 0:05 | 0:05 | Admin |
| 0:05 | 0:10 | [Overview](#overview) |
| 0:05 | 0:15 | [Learning](#learning-objectives) |
| 0:50 | 0:30 | [React Collections](#react-collection) |
| 1:00 | 0:10 | [BREAK](#break) |
| 2:00 | 1:00 | [Lab](#lab) |
| 1:00 | 0:30 | [After Lab](#after-lab) |
| 2:45 | 0:15 | [Wrap up review objectives](#wrap-up) |

<!-- > -->

# Overview

This class you will explore React a little more in-depth. We will learn about the virtual DOM and how React handles collections.

<!-- > -->

## Why

Single-page applications are how many web applications are built today. Expect to see this in the workplace. React is the most popular tool used today for building single-page applications. You should know how to use it.

<!-- > -->

## Learning Objectives

1. Describe use cases for props
1. Build applications from components
1. Design components
1. Use Component collections and keys

<!-- > -->

# React Concepts

React concepts you should know

<!-- > -->

## Virtual DOM

React uses a virtual DOM. Rather than manipulating the DOM directly by modifying, creating, and removing DOM elements React keeps track of DOM elements created by Components in JavaScript and updated the actual DOM from what it holds in this virtual DOM.

Take a moment to read one of these articles:

https://www.codecademy.com/articles/react-virtual-dom

https://reactjs.org/docs/faq-internals.html

Discuss: the virtual DOM

<!-- v -->

### Important things you should know about the Virtual DOM

- It's a React thing, it's not part of the default JS API
- Do not use jQuery or other non-react JS libs with React
- Do not manipulate DOM elements directly, for example:
  - `getElementById()` is not reliable since elements might be added and removed by the virtual DOM system
  - `innerHTML` is not reliable since the virtual DOM system will not be aware of your changes and overwrite them

How do you get around this?

**Make all of your changes within React components**

There are a couple of special cases that need to be looked at closely. We will be covering these later.

- Forms and inputs - if the virtual DOM replaces input you'd lose what was typed into that input. There is a special pattern for this. You also need values entered into inputs and don't have a reliable reference to these elements.
- Animation - animation of components can have problems when the virtual DOM updates. You can use a ref or a React specific animation lib.
- Canvas - if the virtual DOM was to update your canvas you'd lose anything that was drawn on the canvas. React has a special feature called a ref which prevents virtual DOM from updating a referenced node.

<!-- v -->

# React Collections

Collections are groups of things you keep together. In life collections are things like books, and movies, stuffed animals, Legos, or Star Wars mini figures. In programming terms, a collection is an array, an object, or a dictionary.

React is a library for building user interfaces. Often user interfaces are made up of collections. Give me some examples of situations where you have used an Array of Objects to display elements in a user interface?

What kind of code did you write to use an array to display something on the screen?

You might show a list of products in a shopping cart, an array of images in a slide show, create a list of users, or posts, or comments. The possibilities are endless.

React handles collections in an elegant way. If React sees an Array of JSX elements it will automatically display them all, no need for you to write a loop. What would this look like?

```JS
// An array of components
const headings = [
  <Heading str='Apples' />,
  <Heading str='Bananas' />,
  <Heading str='Currants' />,
  <Heading str='Durian' />,
  <Heading str='Elderberry' />
]

const App = () => {
  return (
    <div className="App">
      <header className="App-header">
        {headings} {/* headings is an array and we don't need a loop! */}
      </header>
    </div>
  );
}
```

## Keys

When you use a collection to display JSX elements in this way you'll get a warning:

> Warning: Each child in a list should have a unique "key" prop.

This warning is related to the virtual DOM. For the virtual DOM to track elements in collections each element needs to have a unique key prop.

The Virtual can't tell if an element in a collection has changed unless that element has a unique way to identify it.

You can see the warning in the console.

Add a key by giving each element a unique key prop. The value can be anything you like but keys in a collection should unique.

You may think list index would be ideal, however this is an anti-pattern. *Anti-patterns are common solutions to common problems where the solution is ineffective and may result in undesired consequences.*

```JS
const headings = [
  <Heading key="Apples" str='Apples' />,
  <Heading key="Bananas" str='Bananas' />,
  <Heading key="Currants" str='Currants' />,
  <Heading key="Durian" str='Durian' />,
  <Heading key="Elderberry" str='Elderberry' />
]
...
```

Try this. The error should go away.

<!-- .slide: data-background="#087CB8" -->
## BREAK

Take a ten-minute break and think of your favorite lists.

<!-- > -->

# Lab

Continue working on the React Fundamentals tutorial. This needs to be done before the next class. Use the lab time to work, ask questions, solve problems.

<!-- v -->

# After Lab

- What questions came up while working on the tutorial?
- How did you solve problems?
- What do you think about React?

Discuss

<!-- v -->

## Wrap Up

- Review learning Objectives
- Clarify homework expectations

<!-- > -->

## Additional Resources

1. https://www.codecademy.com/articles/react-virtual-dom
1. https://reactjs.org/docs/faq-internals.html
