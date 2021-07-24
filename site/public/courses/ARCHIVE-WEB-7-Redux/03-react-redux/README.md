# React Redux

Redux uses immutable immutable state to create 
more reliable and predictable state management.

## Objectives 

- Value vs Reference
  - value equality 
  - reference equality
- Immutablitity
- Immutable strategies  

### Value vs Reference

Variables in JavaScript only hold values. 

In the case of Objects (this includes Arrays, 
and functions) the value stored a variable is 
a *reference* to the Object.

### Comparing values and references

When comparing values you get what you expect. 
If the values are the same they are equal. 

When comparing references it's the reference
that is compared. If the reference is the same, 
in other words if two variables contain a 
reference to the same Object then they are 
equal. 

{} === {}

# Notes



## Value vs Reference

JavaScript supports both value and reference types. 

Value types are Strings, Numbers, and Bools. 

Reference types are Objects, this inlcudes Arrays. 

What's the difference? 

```JavaScript
var a = 11
var b = 11
```

These two numbers have the same value. This is _value equality_.

Each is a unique instance of the value. Setting another var equal to
one of these vars creates a new unique instance of the value. 

```JavaScript
var c = a
```

You can assign a new value to any of these variables without any side
effects. 

```JavaScript
a = 12
b = c + 13
c = 0
```

Each value is a unique and untethered to anything else. Each value 
represents a factual state at an instance in time. 

What about references. 

```
var objA = { name: 'Anne', age: 33 }
var objB = { name: 'Anne', age: 33 }
```

These two Objects appear to be equivalent. They have the same values 
for the same properties. 

The references are not equivalent!

```
objA === objB // false
```

In JavaScript Objects have _reference equality_.
That is two Objects are equal when they are the same reference. 

In the example above both objects have the same value they do not have 
the same reference. 

**Can you check for Object Equality**

The short answer is yes but not directly. To compare two objects for equality
you would need to compare all properties of each and, if any of those 
properties were objects you'd have to compare each property of those
objects etc. 

You can write a recursive function to do this in practice it seems impractical, 
especially considering that Objects can hold functions as properties. 

In practical terms your best answer to Object equality is writing 
functions to check equality for specific objects that you have created. 
For example. 

```
function(a, b) {
  if (a.name === b.name & a.age === b.age) {
    return true
  } 
  return false
}
```

**What about assignment?** 

When you assign a value you are creating a new unique value. 

When you copy a reference you are creating a copy of the reference 
that points a location storing values. 

```
var objA = { name: 'Anne', age: 33 }
var objB = objA
objB.name = 'Bob'

console.log(objA.name) // Bob !
```

In the example above both variables point to the same location. 
Changing properties on one changes properties on the other. 

This is what Rich Hickey referes to as "Place Oriented Programming"

- [See The Value of Values](https://www.youtube.com/watch?v=-6BsiVyC1kM)

The idea of references is great when memory is short. It allows 
you to make the most of reusing resources. 

If your program can only store a limited number of values you would
want to recycle as much of this storage as possible. 

Now days computers have some much memory this not an issue. 

References can become a problem as code becomes more complex. The longer 
your code gets the more opportunity there is for different parts of your 
code to hold a reference to same objects.

Creating a new value every there is a change allows for keeping a record 
or history of changes. Programming in place new values replace old 
values in the same location and this is not possible. 

## What is Immutable?

Immutable: unchanging over time or unable to be changed.

Immutable values can not change. While it looks like vars containing 
values can mutate. More closely the value itself is not changing instead
a new value is being created and assigned to the variable. 

References on the other hand may contain properties that can be assigned 
new values but these values replace the previous value in the same location
the reference itself hasn't changed. 

- http://reactkungfu.com/2015/08/pros-and-cons-of-using-immutability-with-react-js/

## How does this effect React?

React looks at state for changes. When state changes React will update 
a component and render it's view. If state is an object we can only 
make a reference comparison. 

Since doesn't work, remember reference equality, we call setState() 
passing in new properties.  

## What about Redux?

Redux works in much the same way. The dispatcher updates views when 
application state changes. To see changes in state a new object 
must be created. 

## Patterns 

To create the most reliable React and Redix applications requires a 
strict adherance to immutable state. This is a good article showing 
all of the immutable patterns. 

This article describes patterns used to work with arrays and objects 
and respect immutability. 

https://github.com/reactjs/redux/blob/master/docs/recipes/reducers/ImmutableUpdatePatterns.md

Most of the examples here revolve around `...` or 'spread' operator.

```JavaScript
const a = [1, 2, 3]
const b = [...a] // creates a copy of a, b is [1, 2, 3]
```

This also works for objects!


```JavaScript
const a = { name: "Anne", age: 33 }
const b = { ...a, age: 34 } // { name: "Anne", age: 34 }
// defines a new obj with all the properties of a and overwrites age with 34
```

Nested objects need to be identified and handled!

```JavaScript
const state = { id:1, posts:[1,2,3] }
const newState = { ...state }
newState.posts.push(4) // ! modifies nested reference posts !
```

Needs to copy nested object. 

```JavaScript
const state = { id:1, posts:[1,2,3] }
const newState = { ...state, posts:[...state.posts] }
newState.posts.push(4) // ! modifies nested reference posts !
```

**Challenge** - Read through the patterns here and look through your 
work and look for places where you may not be copying objects 
where you should be. 

