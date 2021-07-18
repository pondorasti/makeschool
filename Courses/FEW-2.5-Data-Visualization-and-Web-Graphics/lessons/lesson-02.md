
# FEW 2.5 - Lesson 2

Higher order functions and callbacks. 

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](https://make-school-courses.github.io/FEW-2.5-Data-Visualization-and-Web-Graphics/Slides/Lesson-2.html ':ignore') -->

<!-- > -->

## Overview

In the last class we examined data to find some relevant values. Today we will continue with this idea but go further. This time around we'll look at abstracting our methods of data collection, collecting data that has more than one association, and build data structures that express the data.

<!-- > -->

## Why you should know this?

The problems in the challenges for today will help you develop your coding skills by offering more involved problems. 

<!-- > -->

## Learning Objectives

- Abstract methods to expand their functionality
- Build histograms
- Use map, filter, and reduce

## Looping over Arrays

Looping over each element in an array is a common operation. Expect to do this often. 

Imagine you have an array and need to log each number to the console. 

Loop over an array with a for loop:

```JS
const arr = [1,2,3,4]
for (let i = 0; i < arr.length; i += 1) {
	console.log(arr[i])
}
```

Running code for each element in an array is so common Array provides a method for this: `forEach`. Foreach takes a callback function as a parameter and calls that function once for each element in the array and passes the element and the index to the callback.

```JS
const arr = [1,2,3,4]
arr.forEach((item, index) => {
	console.log(`${index}: ${item}`)
})
```

For each takes a callback. The callback is a function. You can use anything that references a function here. 

```JS
const arr = [1,2,3,4]
const timesTwo = n => n * 2
arr.forEach(timesTwo)
```

How does forEach work? Its a function that takes another function as a parameter! 

```JS
function thrice(callback) {
	callback(1)
	callback(2)
	callback(3)
}

thrice(() => console.log('hello world'))
thrice(i => `${12}px`) // 12px 24px 36px
```

The function above executes the callback three times, and passes the number of iteration as a parameter.


Challenge: Write a function that works like forEach.

```JS
function forEvery(arr, callBack) {
	...
}

const numbers = [1,2,3,4,5]
forEvery(numbers, (item, i) => {
	console.log(item, i) 
})
```

Take a look at this Repl.it and try the challenges here: https://repl.it/join/qvbkyifb-mitchellhudson

## Map, Filter, and Reduce

Running code on each element in an array is common. Often you'll want to perform one of three other common tasks. 

- Map - Transform each element in the source array and add it to a new Array
- Filter - Create a new array that contains a subset of the source array 
- Reduce - Create a single value aggregated from the source array

> Map/filter/reduce in a tweet:
>
> `[🌽, 🐮, 🐔].map(cook)` -> `[🍿, 🍔, 🍳]`
>
> `[🍿, 🍔, 🍳].filter(isVegetarian)` -> `[🍿, 🍳]`
>
> `[🍿, 🍳].reduce(eat)` -> `💩`

Some examples: 

### Map

What is transforming an array and why would you do this? When you map an array you take each item from the original array and transform it in some way. Here are a few examples: 

- React - transform an array of objects or values into an array of components. 
- Objects to Strings - It's not uncommon to have an array of objects that you want to display. You might want to combine one or more fields on the object into a string that will be displayed. 
- Array date objects to an array date strings
- An array of numbers into formatted numbers
- An array of objects into an array of simple values like numbers or strings
- Turn an array of strings into an array of objects like Date objects

**Facts about map**

- Map returns a new array (it does not mutate the source array)
- The returned array has the same number of items as the source array

**Examples of map**

Abstract example. 

```JS
// map takes one parameter a callback function
const newArray = array.map(callbackFunction)

// The callback receives each item of the array as a parameter
const newArray = array.map((item) => { ... })

// Optionally map also provides the index of the item and the array itself
const newArray = array.map((item, index, arr) => { ... }) 

// The callback is responsible for transforming the item and returning the transformed value
// Here all items are formatted and returned. 
const newArray = array.map((item) => item.toFixed(2))
```

Here's a practical example: 

```JS 
// Imagine you had some date strings 
const dateStrings = ['9/26/1965', '2/6/1971', '10/27/2005']
// Turn these into date objects because reasons 
const dates = dateStrings.map( str => new Date(str) )
// Turn these Date objects into formatted dates
const datesFormatted = dates.map( date => date.toDateString() )
// The new array: ['Sun Sep 26 1965', 'Sat Feb 06 1971', 'Thu Oct 27 2005']
// Maybe you just need the years for some reason: 
const years = dates.map( date => date.getFullYear() )
// years: [1965, 1971, 2005]
```

Keep in mind that in each example a new array was created at each step! 

To go from the first step to the formatted dates required two steps: making a date object from a string and then making a formatted date from the date object. Since map returns an array you can do that by chaining the calls to map together. 

```JS
// Chain calls to map together to work through several steps
const datesFormatted = dateStrings.map(str => new Date(str)).map(date => date.toDateString())

// Maybe it's easier to break this up onto separate lines
const datesFormatted = dateStrings
	.map(str => new Date(str))
	.map(date => date.toDateString())
```

The callback provided to `map` can be any function that takes in a value and returns a value. 

```JS
// Consider these functions: 
const timesTwo = n => n * 2
const squared = n => n * n
const moneyFormat = n => `$${n.toFixed(2)}`

// An array of numbers
const arr = [5, 3, 6, 9]
const wth = arr.map(timesTwo)
	.map(squared)
	.map(moneyFormat)
```

This starts to show the ideas behind functional programming. Above the first three functions all take a value and return a value. The map function takes a function as a parameter and returns an array. Combining theee together we create a system of functions that all work together. 

Take a look at the Repl.it here and try the challenges: https://repl.it/join/zcutdjnu-mitchellhudson

### Filter 

Use filter to create a new array containing a subset of the elements from the original array. 

- Filter takes a callback that it expects to return a boolean
- Filter calls the callback once for each element in the source array
- If callback returns true the element is inlcuded in the output array

**Facts about filter**

- Filter returns a new array
- The ouput array may have some, all or, none of the elements from the original array
- The callback shouls only return true or false 

**Examples of Filter**

Abstract example:

```JS
// Start with an array, make a new array, use a callback function
const newArray = array.filter(callbackFunction)

// The callback receives each item of the array and asks should we keep it? 
const newArray = array.filter( (item) => { ... } )

// Optionally the callback gest the index, and array also
const newArray = array.filter( (item, index, arr) => { ... } )
```

Practical example:

```JS
// Imagine you have an array of numbers 
const numbers = [11,32,45,66,76,78,36]
// No you want only the even numbers
// If n % 2 === 0 is true that number is included in evenNumbers
const evenNumbers = numbers.filter(n => n % 2 === 0)
```

Write your own filter function: https://repl.it/join/ffdybxac-mitchellhudson

### Reduce 

Reduce takes an array and reduces it to a single value. A value can be anything including arrays an objects. 

Reduce always passes the running total or accumulated value to the callback.

Unlike map and filter reduce takes a second optional parameter which is the starting value for the accumulator.

**The facts about reduce:**

- Reduce returns a new array
- The callback receives the accumulator and an item from the source array
- The call back returns the accumulator
- If you don't supply the starting value reduce uses the first value from the source array as accumulator.

Abstract example: 

```JS
// Reduce takes a callback
const newValue = array.reduce(callback)

// The callback takes the accumulator and the item
const newValue = array.reduce((acc, item) => {...})

// Set the starting value as the second  parameter
const newValue = array.reduce((acc, item) => {...}, startingAccumulator)
```

Practical example: 

```JS
// An array of values
const values = [49,28,67,1,73]
// Add up all values
const total = values.reduce((acc, n)=> acc + n)
// No need for the second parameter here

// What if you had an array objects? 
const items = [
	{name: 'Goo', price: 2.99},
	{name: 'Foo', price: 1.99},
	{name: 'Bar', price: 5.99},
]

// Add up all of the prices
const total = items.reduce((acc, item) => acc + item.price, 0)
// MUST include the second parameter here! 0

// Note the example above could also have been mapped first 
// to get all of the prices before reducing
const total = items.map(item => item.price).reduce((acc, price) => acc + price)
```

Reduce examples: https://repl.it/join/svmjizdu-mitchellhudson

### Use Reduce to create a histogram

A histogram is a distribution of values. Think of a historgram as a list of buckes or bins and the value in each bin is how many times value or range of values appears in your dataset. Here are a few examples from the Titanic data: 

- `sex` - buckets would be male and female and the number passengers would be the value. This would have two buckets and each passenger would be put into one or the other.
- `pclass` - Each passenger travelled in one of three classes: 1, 2, or 3. There would three buckets and the value of each would be the number of passengers who travelled in that class. 
- `age` - If we made a bucket for each age we'd have almost as many buckets as passengers. Here you use a range. Imagine buckets being ages of: 0-10, 10-20, 20-30, 30-40, 40-50, 50-60 etc. 

What would a histogram look like in code? An object would work well. Imagine something like: `{ apples: 23, oranges: 57 }`. 

How would you make a histogram? Use reduce!

```JS 
const passengersByClass = data.reduce((acc, p) => {
	// Check if this property exists
	if (acc[p.fields.pclass] === undefined) {
		// If not add the property and give it a value of 1
		acc[p.fields.pclass] = 1
	} else {
		// Otherwise add 1 to the current value
		acc[p.fields.pclass] = acc[p.fields.pclass] + 1
	}
	return acc
}, {}) // Be sure to set the default value to an object!
```

## Break

Take a 10 minute break!

## The Titanic data

Time to apply map, filter, and reduce to the Titanic data. Let's start with this Repl.it: https://repl.it/join/wrtihkha-mitchellhudson

## Lab

Continue working on the Assignment 1. Think about refactoring your solutions to take advantage of map filter and reduce.

## After Class

Continue working on assignment 1. You should be finishing up challenges 1 and starting on challenges 2. 

## Resources

Video Lectures: 

- https://youtu.be/sWcW9iNkMgw
- https://youtu.be/qrHO0kKWOBc
- https://youtu.be/rLxgeN1OhP8
- https://youtu.be/VAvaMeSBeLs
- https://youtu.be/WERvwbQ98dY
- https://youtu.be/hGpQ7kQVafg


- [Array.map()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [Array.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- [Array.reduce()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)


<!-- 

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:10      | [Overview](#overview) |
| 0:10        | 0:05      | [Why you should know this?](#why-you-should-know-this) |
| 0:15        | 0:05      | [Learning Objectives](#learning-objectives) |
| 0:20        | 0:05      | [Looping over Arrays](#looping-over-arrays) |
| 0:25        | 0:10      | [Map, Filter, and Reduce](#map-filter-and-reduce) |
| 0:35        | 0:05      | [Map](#map) |
| 0:35        | 0:05      | [Filter](#filter) |
| 0:35        | 0:05      | [Reduce](#reduce) |
| 0:40        | 0:10      | [Break](#break) |
| 0:40        | 0:10      | [The Titanic data](#the-titanic-data) |
| 0:50        | 0:40      | [Lab](#lab) |
| 1:30        | 0:10      | [After Class](#after-class) |

 -->
 