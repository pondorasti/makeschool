## JavaScript Concepts

### Types 

JavaScript defines 5 types of primitive data types:

- string
- number
- boolean
- null
- undefined

https://codeburst.io/explaining-value-vs-reference-in-javascript-647a975e12a0

#### String 

Like most languages a String is a "string" of characters. Strings are defined with the 
"" or ''. 

Combine or concatenate strings with the +. 

`"hello " + "world"`

**Notable methods:** 

- `charAt(index)` : Returns character at index.
- `substr(start [, length])` : Returns the characters in a string begining at start continuing through 
length.

**Properties:**

- length : property returns the number of characters in a string. 

[String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)

#### Number 

A Number is any number float or int, positive or negative. 

** Notable methods:** 

- `isNaN()` : Returns true if the value is NOT a number. (NaN == Not a Number) 
- `toFixed(points)` : Returns a string representation of the number with a fixed number of decimal 
points. 

[Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)

#### Boolean 

A boolean is either true or false. In most cases true == 1 and false == 0.

#### null

In JavaScript null represents the abscence of a value. 

### Objects

Are the stock and trade of the JavaScript language. In JavaScript there are only five 
primitives and everything else is Objects!

All Objects are assigned by reference. Take note this is an important point that has significance 
with React! and later with Redux. 

#### Array 

An array is a collection of elements. Elements can be any type and mixed. Array supports 
many methods that manipulate the content of an array. 

In JS Arrays are passed by reference! 

**Important properties:**

- `length` : Returns the count of the array.

**Notable methods:**

- `push()` : Adds an element to the end of an array.
- `pop()` : Removes the last element from an array and returns it.
- `shift()` : Removes the first element of an array and returns it.
- `unshift()` : Adds one or more items to the front of an array.
- `concat(array [, array2, ...])` : Merges two or more arrays returns a __new array__! 
- `slice([begin, end])` : Returns a __copy of an array__ containing the items between begin and end.

- `filter(function)` : Returns a __new array__ made up of items for which the function returns true.
- `map(function)` : Returns a __new array__ by applying the function to each item.
- `reduce(function)` : Returns a single value using an accumulator fucntion.

**Array is a deep subject in JS!**

Some of the methods above return a modified array while others return a copy, or a new 
array. These distinctions are important to functional programming, React, and Redux. 

[Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

### Objects

Objects are collections of key value pairs. Values in Objects can be anything including 
functions! JavaScript doesn't have classes like other languages. Instead classes are 
represented by Objects. 

[Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object)

### Functions 

Functions in JS are similar to other languages they take in parameters and return values.

[Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions)

## Examples 

Follow the examples [here](./index.html) and complete the challenges at the end. Open the  
example and follow the code contained there for a live example. 

- [Example 1](./index.html)

If you feel comfortable solving the challenges move on to the next section. If not follow up the 
reading material to learn more about the material covered here. Return to the challenges and finish
them. 