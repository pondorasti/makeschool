# Class - FEW 2.3 - Assignment 1

React, Map, Filter, and Reduce

<!-- > -->

## Learning Objectives

- Use map, filter, and reduce
- Aggregate Date with Map, Filter, and Reduce
- Use `map` to render collections of React components
- Use Props to make more flexible components
- Use state to manage interactive UI
- Use import and export with modules to manage code

<!-- > -->

## Review

- What is React? 
- How do you create a default react app? 
- Write a component that displays your name

<!-- > -->

## Map, Filter, and Reduce

<!-- > -->

Map, Filter, and Reduce are important methods. After you learn these you will wonder how you got by without them in the past, you will also want to use them often.

<!-- > -->

The purpose of this assignment is to get some practice with `map` and reduce. You'll practice with filter in a future assignment. 

Another purpose of this assignment is to organize data that will be used later in the assignment. 

Last, the assignment will look at using modules in JS and using `import`, `from`, `export`, and `default`. You'll use these to control the scope of code you write while limiting the code that you share with other modules. 

### Background 

Here is an [awesome Tweet](https://twitter.com/steveluscher/status/741089564329054208?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E741089564329054208&ref_url=https%3A%2F%2Fwww.freecodecamp.org%2Fnews%2Fjavascript-map-reduce-and-filter-explained-with-examples%2F) that sums up Map, Filter, and Reduce

> map/filter/reduce in a tweet:
>
> `[🌽, 🐮, 🐔].map(cook)` -> `[🍿, 🍔, 🍳]`
>
> `[🍿, 🍔, 🍳].filter(isVegetarian)` -> `[🍿, 🍳]`
>
> `[🍿, 🍳].reduce(eat)` -> `💩`

All three are methods of Array. That is you will always call map, filter and reduce on an array. For example: 

```JS
const arr = [1,2,3,4]
arr.map()
arr.filter()
arr.reduce()
['A','B'].map()
```

Each method: map, filter, and reduce take a callback function as the first argument. They each use this callback in different ways. Here is an example:

```JS
arr.map((a) => {...}) // Use an anonymous function as callback

const isAmazing = (a) => { ... }
arr.filter(isAmazing) // Or a named function as callback
```

**array.map()**

Use Map to transform all elements of an array. For example, take an array of objects and turn them into an array of Strings. The transform here would be Object -> String.

Map always returns a new array. The callback receives an element from the array and is expected to transform and return transformed value. For example: 

```JS
const numbers = [1,2,3,4]
const prices = numbers.map(n => n.toFixed(2))
console.log(prices) // ['1.00', '2.00', '3.00', '4.00']
```

The callback receives a number `n` and returns a string with two decimals.

**array.filter()**

Use Filter to create a new Array that is a subset of the source array. For example, take an array of product objects and return an array of products where the category is "Books". 

```JS
const numbers = [1,2,3,4] 
const greaterThan2 = numbers.filter(n => n > 2)
console.log(greaterThan2) // [3,4]
```

The callback here returns the result of the expression `n > 2` which is true when `n` is greater than 2.

**array.reduce()**

Use Reduce to create a new value from a source array. Usually, this will be a single value but there isn't any rule that says you can't make an object from an array. For example, you might take an array of products and get a sum of the prices for all products. Here you started with an array of products and ended with a number. 

The callback for reduce receives two arguments, the accumulator and an element from the array. It's important to remember to set the initial accumulator value! 

```JS
const numbers = [1,2,3,4] 
const total = numbers.reduce((acc, n) => acc + n, 0)
console.log(total) // 10 
```

Notice that reduce takes two parameters! The second parameter in the example above is 0. 

https://medium.com/poka-techblog/simplify-your-javascript-use-map-reduce-and-filter-bd02c593cc2d

### Why this assignment? 

This project will give you a good starting place to practice React by creating components, using props and state. It will also give you a chance to level up your programming skills by adding map, filter, and reduce to your toolset. 

Map, Filter, and Reduce are not esoteric oddities that you might use once in a blue moon, these are important tools that you can use in almost any programming problem that involves Arrays. They abstract three of the most common operations that programmers perform on all collections. 

## Project requirements

Create a new React Project with:

`npx create-react-app react-product-list`

Copy the [`data.json`](https://raw.githubusercontent.com/Make-School-Courses/FEW-2.3-Single-Page-Web-Applications/master/Assignments/data.json) file into your src directory. 

Make a new "module". A module is just a JS file. Name your file: `data.js`

Anything you define in this file will be scoped to this file. 

If you can use `import` and `from` you are using modules. 

All variables and functions you define are scoped to the Module/file where they are defined. 

https://javascript.info/modules-intro
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules

Import your JSON data into your module: 

`import data from './data.json'`

JSON is text format but is easily translated into JavaScript. Importing like this will convert the JSON data into an array of objects. 

What's in data? The example data is an array of objects describing products. Each product has the following properties: 

- id 
- name 
- category
- description
- price
- rating 
- units

## Challenges 

**Challenge 1** - Get the array of products. 

You should be able to do this by importing the JSON file. Best to make a module, something like `data.js`, and import the JSON at the top of this file. You can export the array from here. 

This data.js module can now be a place where you will work with data from data.json and export the things that the rest of your program needs.

```JS
import data from './data.json' // imports data.json

export default data // export the native JS array
```

With this, you can now import your data and work with it from any other module. 

Results:

```JS
import data from './data' // imports dats from data.js

[
  { id: 1, ... }, 
  { id: 2, ... }
  ...
]
```

**Challenge 2** - Get a list of all categories.

Inside your data.js module make a list of all of the categories contained in the data. Do this with `Array.map()`. **Remember map returns a new array and is used to transform an array of one type into an array of another type.** In this case you have an array of Objects and you want an array of strings.

```JS
const allCategories = data.map(obj => obj.category)
```

Notice the callback takes the `obj` and returns the category.

Results:

```JS
[
  "Movies", 
  "Grocery", 
  "Baby", 
  "Movies",
  ... 
]
```

**Challenge 3** - Make the categories list a list of unique values. 

There are a few ways to solve this problem. While there could a lot of searching the categories array for duplicate values a better solution would be to create a data structure that only allows unique values. You have two choices in JS:

- Set - It's like an array but all values must be unique
- Object - Keys must be unique

**Option 1 Using a Set:** Assuming you have an array of all category names. 

```JS
// Make a set from an array all values of the set will be unique!
const categorieSet = new Set(allCategories) 
// Make an array from a set with Array.from()
const categoriesUnique = Array.from(categorieSet)
```

**Option 2 Using an Object:** Assumes you have an array of category names.

```js 
// Make an object where each key is a category name
const categoryObjects = allCategories.reduce((obj, cat) => {
  obj[cat] = 0
  return obj
}, {}) // !!! Be sure to define the initial value as an Object!
// Make an arr array of the keys
const categoriesUnique = Object.keys(categoryObjects)
```

Results: as above but **no values are duplicated.**

```JS
[
  "Movies", 
  "Grocery", 
  "Baby", 
  ... 
]
```

**Challenge 4** - Make an Object whose keys are the names of categories and whose values are the number of times that category appears in the data. This is called a histogram. 

To do this use `Array.reduce()`. Why use reduce? Think about it like this: You have an array of objects and you want to reduce it to a single object. The idea is to end up with an object that looks like: 

```JS
{ 
  Movies: 6, 
  Grocery: 4, 
  Baby: 7, ... 
}
```

Here the key is the name of the category and the value of that key is the count of products in that category. 

Start here: 

```js 
const categoriesWithCounts = data.reduce((obj, cat) => {
  // check if cat exists as a key on obj
  // if category key does not exist
  // add that key with a value of 1
  // else 
  // add 1 to the current value of that key
  return obj
}, {}) // !!! Be sure to define the initial value as an Object!
``` 

Results: 

```JS
{ 
  Movies: 6, 
  Grocery: 4, 
  Baby: 7, ... 
}
```

_review your work with another student. Explain your code, get feedback on your work._

**Challenge 5** - Use Reduce to make an array of objects that have a name and a count. This will similar to the previous challenge but will be an array of objects instead of a single Object. 

All of the names should be unique and each should only appear once! 

Start by mapping the `categoriesUnique`. This will give you the names, you can get the counts from the histogram!

```js 
const namesAndCategories = categoriesUnique.map(name => {
  // return an object here with the name and count
})
```

Results: 

```JS
[
  {name: "Movies", count: 6}, 
  {name: "Grocery", count: 4}, 
  {name: "Baby", count: 7},
  ...
]
```

**Challenge 6** - Export all of the data you have collected.

Export the data array as the default export. This array you imported from `data.json`. You can 
just export it unchanged. 

Make sure you've given each of the other arrays and objects you've created good descriptive
names and export those.

At this step you might have something like this: 

```JS 
// The default export
export default data 

// The other exports
export { categories, categoriesUnique, categoriesAndCount }
```

**Challenge 7** - Import your exported data into the App component. If the exports matched the example in Challenge 6 the import would look like this: 

```JS
import data, { allCategories, productCount, namesAndCategories } from './data'
```

Import your data into `App.js`.
 
Display some of the information here:

**Challenge 8** - Display the categories as buttons. 

Use `Array.map()` to transform the `category` array into an array of JSX/Components You can import categories into any module with `import { namesAndCategories } from './data'`

When you're done it might look like this: 

![ass-2-ch-8.png](ass-2-ch-8.png)

**Challenge 9** Display the products.

List all of **products** below the categories buttons. 

- Each Product should display its name, category, and price. How these are displayed is up to you. 
 - If you add a class name to a JSX element use `className` in place of `class` for example `<div className="product">`. See the documentation for [`className`](https://reactjs.org/docs/faq-styling.html) for more information.
- You can import the inventory Array into any module with `import data from './data'`.
- `data` is an Array of Objects with properties: id, name, description, price, and category. See the notes above for more details. 

When you're done it might look like this: 

![ass-2-ch-9.png](ass-2-ch-9.png)

**Challenge 10** - Add some interaction and functionality. The goal here is to click on a category button to filter the list of products so only products in the chosen category are displayed. 

To do this you'll need to define a state variable in your parent component (probably App.js). Clicking a button should set this variable to category name for that button.

Import `useState` at the top of your component: 

```JS
import { useState } from 'react'
```

At the top of your component define your state variable and setter function:

```JS
function App() {
  const [category, setCategory] = useState('All')

  return (
    ...
  )
}
```

Each of your buttons needs to call `setCategory` with their category name.

Filter the list of products using the category name. This will happen before you map the products into JSX. 

```js
data.filter((item) => {
  return item.category === category || category === 'All'
}).map(item => { ... })
```

If you took out the other code it might look like: 

```JS
data.filter().map()
```

**Challenge 10** - Use components Whenever possible. The component architecture is a really good thing it makes your projects easier to manage, keeps your code [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself), and makes your code more [portable](https://en.wikipedia.org/wiki/Software_portability). 

Note the code below is an approximation, your code may vary from this. This is provided to give you some direction rather than use as presented. 

**Make a component that is a category button.** 

- Define this in a module/JS file. Something like: `CategoryButton.js`
- Be sure to export this. Something like: `export default CategoryButton`
- Set the label and click function as props, something like: `<CategoryButton label={cat} onClick={() => clickCategory(name) } />`

The category button component might look like this. These are incomplete! You'll need to retool these to fit your project. 

```JS
function CategoryButton(props) {
  return (
    <button onClick={props.onClick}>{props.label}</button>
  )
}
```

**Define a component to display the Product.**

- The product component should take in its id, name, description, and price as props. Alternately it could take an object with these properties or deconstruct an object with these properties! 
- The product component should reasonably display these bits of information.

The product component might look like this:

```JS
function Product(props) {
  return (
    <div>
      <h1>{props.name}</h1>
      <p>{props.name}</p>
      <p>${props.price}</p>
    </div>
  )
}
```

**Challenges 11** - Unless you went rogue, the page is probably looking pretty bland, better add some styles! 

Try these: 

**Style the category buttons.** Make them look like something people will want to click on. Use Flexbox to put them all in a row. It's okay if they wrap, there are many categories.

Make the container element display flex and set it to wrap. 

```CSS
.CategoryList {
  display: flex;
  flex-wrap: wrap;
}
```

**Style the products in the list.** Use CSS Grid. You can just set the number of columns with: `grid-template-columns` this should be enough to get all your pro**ducks** in a row so to speak. 

Set the container of all products to display grid, define some grid columns, and a gap.

```CSS
.ProductList {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 1rem;
}
```

**Challenges 12** - Handling the details. If you've got the items above worked out you'll realize the interface is not very satisfying. You can make it better! 

**Display All categories**

- Add one more button to the list of category buttons. Its label should "All".
- Clicking this button should display all products.

**Display the selected category.** 

- Define a style to make the currently selected category stand apart from the other buttons.
- When generating the category elements check the category name against "current category" if the names match assign a class to that element, something like `selected-category`. Remembers to use `className` not `class`!

You could use a [ternary](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator) operator to define the class name:

```JS
const className = name === category ? 'selected' : ''
```

Then use the class name in the button:

```JS
<button 
  className={className}
  onClick={() => onClick(name)}
>
```

- You'll need to take into account that the "All" button is it's own category and this category should display all the products! The code that lists and filters the products can check this: 

```JS
data.filter(obj => obj.category === category || category === 'All').map(...)
```

Here the filter includes this product **if** the category name matches **or** if the category is 'All'.

**Stretch Challenges** - These are challenges you can try to further practice with React, map, filter, and reduce. 

**Challenges 13** - Okay so you did all of the other challenges and you need something more to do, good for you! 

Use `Array.reduce()` to get the sum of all of the prices for all Products. 

- Remember the prices are stored as Strings you'll need to convert these to numbers. You'll also need to remove the first character of the string which is the "$": `price = item.price.slice(1)`. Then parse the string value into a float with Something like: `parseFloat(price)` should work. 
- Display this somewhere on the page.

Using `Array.reduce()` again, sum the total for _currently selected products_. 

Use `Array.reduce()` to count the number of products in each category. 

- Display count for each category as "badge" next to the category label in each category button. 

Display the number of units for each product somewhere in the product display component.

- If there are 0 units make this product.
- Make this more interesting by styling the product so that it looks disabled if the number of units is 0. 

Show the rating for each product.

- Round the number off the nearest decimal
- Make this more interesting by displaying stars instead of the number! 

**Challenge 14** - The category buttons are useful. Currently, they should display all of the items with a matching category. These buttons could be even more useful if you could select more than one category at a time! 

- Allow for selecting multiple categories. For example selecting Toys, Automotive, and Music should show all of the inventory items in the data array that match any of these three categories. 
- Selecting the All button should deselect the other category buttons and show all inventory items.

To do this you'll need to use an array to hold the selected category in place of a string! When using reference type: Array/Object as state you must copy the object when calling the setter function! 

## Some Visuals

Some people like pictures. Here are a few images showing what the project might look like when you are finished, with some notes.

![picture-1](../notes/picture-1.png)

![picture-2](../notes/picture-2.png)

### Deliverable

A link to your completed project on GitHub in the course progress tracker. 

### Due date

Class 3 - Jun 8

## Assessing the assignment

| - | **Does not meet expectations** | **Meets expectations** | **Exceeds expectations** |
|:--------------|:-------------------------------|:-----------------------|:-------------------------|
| **Completed** | Did _not complete_ | Completed challenges 1-10 | Completed some or all of the stretch challenges |
| **Functional** | Is _not functional_ | Has _base functionality_, displays products and categories, can filter products by category | Has the All button, and highlights current category |
| **Code quality** | Indentation is bad spacing is _inconsistent_ | Uses _consistent_ indentation and spacing | _Well written_ and well commented |
| **Structure and Architecture** | All code is in App.js | Uses App.js and two other components | Uses App.js, 3 or more components, and makes use of presentational and stateful components to best advantage |
| **Work Ethic** | Did not commit when working on project | Initial commit at class and commit while working | Commits show 3 hours and document process | 
| **Map Filter and Reduce** | Can't use map, filter, and reduce, or would have a hard time using these outside the context of this project | Can use map, filter, and Reduce | Could explain map, filter, and reduce to someone else! |
| **Props** | Not sure what props are, can not identify them in this project | Can explain props, can identify props in this project where they are used | Could implement props in future React projects! | 
| **State** | Not sure what component state is, can not identify state in this project | Can explain state, can identify state in this project where it is used | Could implement state in future React projects! |
| **Modules** | Not sure what a module is | Can use modules, import, and export | Could explain modules to someone else! |

