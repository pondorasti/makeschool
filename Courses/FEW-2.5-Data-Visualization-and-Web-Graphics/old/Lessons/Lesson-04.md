# Sorting and Filtering data interactively

The earlier class brushed on the topic of sorting and filtering in this class we will cover sorting and filtering data interactively. 

## Why?

Everything you do will work with collections of objects. This is really just an extension of all of those things. Looking at ways to structure data will build your toolbox of skills that you can apply to many future projects. 

## Objectives 

1. Build collections of elements and data
1. Apply changes to all members of a collection
1. Sort and filter collections 
1. Use CSS transform: translate, rotate, scale
1. Use CSS transform: translate3d
1. Create a distribution of values 
1. Identifying context and using closures

## Distributions

A distribution shows how many times a value appears. While seeing a list of people whoe survived and did not survive is interesting showing how many survived by class, fare or gender might add insight to the data. 

A distribution shows how many times a value appears. For example we might have 891 passengers who each boraded the Titanic in a class. The distribution would show how many passengers were in each class. 

Often you won't know how many 'buckets' you will have for a group. For example in the case of the Titanic we might not know the number of classes. 

An easy way to create a distribution is to use an object. Use the key to track 'buckets' and the value of the key to count the occurance of a value. 

```JS
// Create a distribution 
function createDistribution(data) {
  return data.reduce((acc, value) => {
    if (acc[value] !== undefined) {
      acc[value] += 1
    } else {
      acc[value] = 1
    }
    return acc
  }, {})
}

const d = [0, 1, 1, 3, 6, 6, 6, 7, 7, 8, 8, 8, 9, 9, 9, 10, 11, 12, 12, 12]
createDistribution(d) // returns: 
// {0: 1, 1: 2, 3: 1, 6: 3, 7: 2, 8: 3, 9: 3, 10: 1, 11: 1, 12: 3}
// This says the number 7 appears 2 times in d. 
// The numbers 8 and 9 appear 3 times etc. 
console.log(createDistribution('javascript'.split('')))
// {j: 1, a: 2, v: 1, s: 1, c: 1, r:1, p: 1, t:1}
```

## sorting 

`Array.sort([sorting-func])` sorts the source Array in place. By default the sorting function sorts by UTF-16 code units values. Think of this as sorting alphabetically. 

```JS
const arr = 'javascript'.split('')
arr.sort()
console.log(arr) // Returns:
// ["a", "a", "c", "i", "j", "p", "r", "s", "t", "v"]
```

For numbers this sorts on the **first digit** which may not be what you want!

For all other cases supply `Array.sort()` with a sorting function that receives two params. These are values to compare. Your function should return -1, +1, or 0. This determines which valuue comes before the other. 

For example:

```JS
const numbers = [4, 5, 5, 5, 5, 6, 6, 6, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 12]
numbers.sort((a, b) => a - b) // Rearranges numbers to: 
// [4, 5, 5, 5, 5, 6, 6, 6, 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 11, 12]
```

## Filtering 

Use `Array.filter(filterFunc)` when you want only a subset of data from a source array, `Array.filter()` returns a new array. 

The filter function should return true when an item is to be included and false when it is not included. 

```JS
const class3Passengers = titanicData.filter((passenger) => passenger.fields.pclass === 3)
// class3Passengers has only passengers where fields.pclass === 3
```

## Holding Elements 

Once you have created elements you might want to hold onto them. This is good if you have a fixed number of elements and you want to display different data points owned by each. 

Since you're making the elements based on your data might as well save reference to those elements at the moment they are created! 

Imagine you're starting with the Titanic dataset from the JSON. Add an element to each object as create the elements.

```JS 
// Set up your elements and save them to objects in data
data.forEach((passenger, i) => {
	const el = document.createElement('div')
	...
	passenger.el = el
	...
})
```

After you can access the elements from your data. 

```JS
// From here you could 
data.forEach((passenger, i) => {
	...
	passenger.el.style.height = `${passenger.fields.age / maxAge * 400}px`
	...
})
```

## Sorting and Filtering 

Use sort to arrange and order your data on a field. You can sort multiple times to when datapoints share the same value for a field. For example you can sort by passenger class then sort by age. 

Use filter when you want to show a subset of data. For example, maybe you want to show only the male or female passengers, or only those that survived or those that did not. 

### Sort 

[`Array.sort()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) sorts on alphabetically. This applies to numbers, by sorting on the first digit. For example 10, 200, 3000 etc. 

Use a compare function to sort on your own criteria. This function receives two parameters, which are two elements (a, b) from the array. It should returns -1 (a should be sorted before b), +1 (b should sorted before a) 0 (the elements should remain in place). 

`Array.sort()` sorts an array in place! 

### Filter

[`Array.filter()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) returns a subset of an array. 

Filter returns a new array. 

You supply a filter function that receives a an element form the array and returns true if that element should be included or false if it should not be included. 

## Animating changes

Use CSS transition to set the time it takes for changes in all CSS properties to take place. You can se the time in milliseconds `ms` or seconds `secs`. For example: 

`transition: 400ms;`

You can optionally include a property to animate, ignoring other properties. 

`transition: height 400ms;`

Include a list of properties and times to assign a different time to each property that may change: 

`transition: height 400ms, color 1200ms;`

You can also include an easing function. This sets the curve of the change. 

A linear curve maintains a constant rate of change. This is a good for color and opacity changes. 

Ease In accelerates the change over time. 

Ease out decellerates change over time. 

`transition: height 400ms ease-out, color 1200ms linear;`

The [timing function](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-timing-function) has a lot of options. 

## CSS transform

The CSS transform property provids methods to move, scale, rotate, and skew elements. There are also a set of 3d transforms. The 3d transforms use the hardware acceleration and should be used when possible, even if you are not thinking of transforming an element in 3 dimensions. 

For example: 

`transform: translate(100px, 200px)` translates an object `100px` on the x and `200px` on the y. 

`transform: translate3d(100px, 200px, 0)` same as above, but also translates `0` on the z while also taking advantage of hard acceleration. You should always use this when animating elements!

Only define `transform` once! it takes as many properties as needed. For example: 

`transform: translate3d(300px, 0, 0) rotate3d(0, 0, 45deg)`

The order transforms are applied matters! The example above translates 300px to the right, then rotates 45 degrees on the z axis. Swapping the rotate and translate here would rotate first, then move the object down and to the right at a 45 degree angle! 

- [translate(x, y)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate)
- [translate3d(x, y, z)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate3d)
- [scale(x, y)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale)
- [scale3d(x, y, z)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/scale3d)
- [rotate(angle)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate)
- [rotate3d(angleX, angleY, angleZ)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/rotate3d)
- [skew(angleX, angleY)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/skew)

## Using closures for fun and profit!

When a function is created within another function that function captures variables in it's outer scope. This often goes un-noticed, sometimes create un-expected results, and often can be used to your advantage!

An example of colsure working for you. Imagine you have an array of data and you want to create an array div elements. You'd like to add a couple functions to each of these new elements that set change appearance of the element the method is called on. 

```JS
// Data is an array of objects 
const data = [{a:45, b:88, c:'group-a'}, {}, ...]

data.forEach((item) => {
	const el = document.createElement('div')
	el.setHeight = () => {
		el.style.height = `${item.a}%`
	}
})
```

## After Class

- Complete [Visualization 2](Assignments/Visualization-2.md)

## Additional Resources


