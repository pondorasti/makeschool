# FEW 2.3 - Lesson 2

<!-- > -->

## Map, Filter, and Reduce 

If you understand Arrays and loops the next step to leveling up your code craft is map, filter, and reduce.

<!-- > -->

React is built on functional programming. This class you will look at some functional programming concepts in the context of React.

Map, filter, and reduce shed light on the field of functional programming. 

<!-- > -->

## Learning Objectives/Competencies

1. Organize code with ES Modules 
1. Identify functional programming concepts
1. Use functional programming
    - `Array.map()`
    - `Array.filter()`
    - `Array.reduce()`
1. Transform data with `Array.map()`

<!-- > -->

## ES Modules

ES modules organize code by both file and scope. Code is written in a 'physical' file and variables and functions defined in those files are scoped to their file.

<!-- > -->

Scope det3ermines where a value is visible to the code you write. 

```JS
const bird = 'flapping'
function zoo() {
    const tiger = 'sleepy'
    
    console.log(bird)  // flapping
    console.log(tiger) // sleepy
}
zoo();
console.log(bird)  // flapping
console.log(tiger) // undefined
```

<small>Here the variables are visible inside the function but only one is visible outside!</small>

<!-- > -->

Variables declared in a module are only visible in that module.

```js
// zoo.js
const monkey = 'what?'
const meerkat = 'look out!'
```

```js
// visitor.js
console.log(monkey) // ReferenceError: Can't find variable: monkey
console.log(meerkat) // ReferenceError: Can't find variable: meerkat
```

<small>The variables monkey and meerkat are only available in zoo.js</small>

<!-- > -->

Variables and functions can be shared across modules using `export` and `import`. 

```js
// zoo.js
export const monkey = 'what?'
export const meerkat = 'look out!'
```

```js
// visitor.js
import { monkey, meerkat } from './zoo.js'
console.log(monkey) // what?
console.log(meerkat) // look out!
```

<!-- > -->

Take a read through the docs and see what it is has to say about modules: 

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules

You will use modules in the homework to organize your code. 

<!-- > -->

## import, export, and default

<!-- > -->

To share a value a file can export that value. 

```JS
// constants.js
const name = 'Foo'
const id = 'Bar'

export { name, id } // export name and id
```

<!-- > -->

Another file can import values like this: 

```js
import { name, id } from './constants.js'

console.log(name, id) // prints Foo Bar
```

<!-- > -->

A file may declare a single export as the default export. There can only be one default export and it is imported and exported a little differently. 

```JS
// constants.js
const name = 'Foo'
const id = 'Bar'

function hello() {
    console.log(name, id)
}

export default hello // the default export
export { name, id } // export name and id
```

<!-- > -->

Another file can import values like this: 

```js
import hello, { name, id } from './constants.js' // hello is the default export! 

hello() // prints Foo Bar
```

<small>Notice the default export goes outside the {}.</small>

<!-- > -->

### Array `map`, `filter`, `reduce`

The functions map, filter, and reduce are a gateway into functional programming concepts.

<!-- > -->

> Map/filter/reduce in a tweet:
```
[🌽, 🐮, 🐔].map(cook)            // -> [🍿, 🍔, 🍳]
[🍿, 🍔, 🍳].filter(isVegetarian) // -> [🍿, 🍳]
[🍿, 🍳].reduce(eat)              // -> 💩
```
>

<small>`cook`, `isVegitarian`, and `eat` are functions.</small>

<!-- > -->

```js
const prices = [0.55, 1.99, 23.67, 1.00001] // '$1.00'
const formattedPrices = prices.map((price) => {
    return `$${price.toFixed(2)}` // $x.xx
})

// formattedPrices ['$0.55', '$1.99', '$23.67', '$1.00']
```

<!-- > -->

[`Array.map()`]() transforms an array of data and **returns a new array**. Use it to convert an array of one type into an array of another type.

For example, you might transform an array of numbers into an array of strings. Or raw ingredients into lunch!

```JS
[🌽, 🐮, 🐔].map(cook)            // -> [🍿, 🍔, 🍳]
```

<!-- > -->

`Array.filter` returns an array containing none, some, or all of the elements from the source array. Filter returns a new Array.  

For example, you might filter an array of products to create an array of products with prices less than $10, or choose your snacks!

```js
[🍿, 🍔, 🍳].filter(isVegetarian) // -> [🍿, 🍳]
```

<!-- > -->

`Array.reduce` converts an array of values into a single value. It takes many values and returns a single aggregate value. 

For example, you might use reduce to get the total cost of all products in a shopping cart array, or process your food.

```JS
[🍿, 🍳].reduce(eat)              // -> 💩
```

<!-- > -->

## Using Array.map

Map transforms all of the elements in a array and returns a new array.

<!-- > -->

Imagine you have an array of category names that are strings, and you want to make them JSX buttons. 

```JavaScript
const catButtons = categories.map((catName) => {
    return <button>{catName}</button>
})
```

Important! `catButtons` is a new Array! The source array `categories` is unmodified!

<!-- > -->

## Using Array.filter

Use filter to create a new arry with a subset of the element in the source array.

<!-- > -->

For example, to get a list of only items in a category. 

```JavaScript
const prices = [0.55, 1.99, 23.67, 1.00001] // '$1.00'
const cheapest = prices.filter((price) => {
    return price < 2
}) // cheapest [0.55, 1.99, 1.00001]

const formattedPrices = cheapest.map((price) => {
    return `$${price.toFixed(2)}` // $x.xx
})

// formattedPrices ['$0.55', '$1.99', '$1.00']


array.filter((item) => {
    return // return true or false 
})

const allToys = inventory.filter((item) => {
    return item.category === 'Toys'
})
```

The sample returns a new array containing items from inventory where the category is Toys. 

<!-- > -->

## Using Array.reduce

Use `Array.reduce()` to reduce a collection of values to a single value. 

<!-- > -->

For example, you get the total cost of the inventory by adding all of the prices. 

```JavaScript
const prices = [0.55, 1.99, 23.67, 1.00001] // '$1.00'
const totalPrices = prices.reduce((acc, price) => {
    return acc += price
}, 0) // 27.21001

const priceStr = prices.reduce((acc, price) => {
    return acc += price // 
}, '') // '0.551.9923.671.00001'

const allInventory = inventory.reduce((total, item) => {
    return total += item.price
}, 0)
```

The first parameter of reduce is a function, the second parameter is the starting value of the accumulator. Here the starting value is 0.

<!-- > -->

The first param of reduce takes in the accumulator and the current value. The accumulator is the running total, and the current value is one of the items from the Array.

<!-- > -->

## React collections and Keys

What's a [collection](https://en.wikipedia.org/wiki/Collection_(abstract_data_type))?

> In short a collection is an Array or an Object

<!-- > -->

Often you will need to render Arrays of JSX components. You'll often have arrays of raw data that need to be converted into an array of JSX. 

To do this we will delve into functional programming with `map`, `filter`, and `reduce`. 

React will automatically iterate over a collection of JSX elements. To avoid error these elements need to have unique keys. 

<!-- > -->

**tl;dr** Anytime you have an array of JSX elements each should have a unique key prop. For example: 

```JS
const things = [1,2,3,4].map((item, index) => {
    return <p key={`thing-${index}`}>{item}</p>
})
```

<!-- > -->

**Q: What are keys and why do they need to be unique?**

<!-- > -->

**A:** The viritual DOM looks for changes to components, finds the things that change and updates only the elements that have been changed. 

To track the contents of a list each list item must have a unique identifier. The key prop serves this purpose. 

<!-- > -->

**Q: What is a key? (what kinds of values can be used as keys)**

<!-- > -->

**A:** Any _unique_ value can be used as a key. You can use ids that come with data. You can generate your own values.

The value only has to be unique to this list and should be the same each time the list is generated. 

<!-- > -->

**Q: How do you _set_ a key?**

<!-- > -->

**A:** The key is a prop. Set it like any other prop. 

`<SomeComponent key='unique-1' />`

Read more about React Lists and Keys here: https://reactjs.org/docs/lists-and-keys.html

<!-- > -->

## React collections and Keys 

React will automatically display a collection of JSX elements in JSX. For example: 

```JavaScript 
const ListOfButtons = (props) => {
    const buttons = [<button />, <button />, <button />]
    return (
        <div>
            {buttons}
        </div>
    )
}    
```

React automatically renders the array of JSX elements, no need to iterate. 

<!-- > -->

More often than not you will be receiving an Array of one type and converting it to an Array of JSX.

```JavaScript 
const ListOfButtons = ({ items }) => {
    const buttons = items.map( item => <button label={item.label} />)
    return (
        <div>
            {buttons}
        </div>
    )
}    
```

Here you can imagine the `items` as an array of objects with a label property. 

<!-- > -->

React needs to be able to keep track of elements with a stable identity. To do this you'll get elements in a list a `key`. The value for the key can be any value that is **unique among siblings**.

<!-- > -->

In the example above, if we knew that the label was unique it could be used as the key. 

```JavaScript 
const ListOfButtons = ({ items }) => {
    const buttons = items.map( item => <button key={item.label} label={item.label} />)
    return (
        <div>
            {buttons}
        </div>
    )
}    
```

<!-- > -->

## Add Styles 

There are a few different techniques that can be used to style React projects. We will cover different techniques in class. For this project, you can use a traditional approach of class names and stylesheet. 

Put your styles in index.css. Use class names to assign styles to JSX elements. 

For any component asssign a class name by using the `className` attribute. For example: 

`<button className="category-button" ... />`

In your stylesheet you might style this with:

`.category-button { color: red }`

## In Class

Start on [Assignment 2](../Assignments/Assignment-02.md). You'll be using map, filter, and reduce to solve some challenges here. 

## Homework

- [Assignment 2](../Assignments/Assignment-02.md)

## Additional Resources

1. [Array Map, Filter, Reduce](https://medium.com/jsguru/javascript-functional-programming-map-filter-and-reduce-846ff9ba492d)
1. [ES6 Module Practical Guide](https://medium.freecodecamp.org/how-to-use-es6-modules-and-why-theyre-important-a9b20b480773)
1. [ES6 Modules reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import)
1. [React Lists and Keys](https://reactjs.org/docs/lists-and-keys.html)

