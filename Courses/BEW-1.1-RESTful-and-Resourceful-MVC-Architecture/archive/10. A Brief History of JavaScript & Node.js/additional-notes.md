## History of JavaScript Notes

### Netscape Invents a Browser "Glue Language"

Originally JavaScript was meant to be a "glue language" to allow developers to write scripts to make the client more dynamic.

Netscape (now Mozilla), the first major web browser, brought in Brendan Eich to create the language. He made the prototype of Javascript in 10 days, in May 1995. Originally called "Mocha", and then "LiveScript", but finally Netscape settled on "JavaScript" by December.

### Standardization


### Internet Explorer Holds Out

## V8 Engine

https://medium.freecodecamp.org/understanding-the-core-of-nodejs-the-powerful-chrome-v8-engine-79e7eb8af964

https://en.wikipedia.org/wiki/Chrome_V8

## ECMAScript Timeline - ES3, ES4, ES5, ES6 (ES2015)

[ECMAScript Wikipedia](https://en.wikipedia.org/wiki/ECMAScript)

## ES4 - An Ambitious Failure

* Classes
* A module system
* Optional type annotations and static typing, probably using a structural type system
* Generators and iterators
* Destructuring assignment
* Algebraic data types

## CoffeeScript - 2009

CoffeeScript was a **preprocessor** meant to make JavaScript to be as beautiful as Ruby. It would **Transpile** into JavaScript before the browser read it. CoffeeScript was an inspiration for improvements to future versions of JavaScript.

Here are some examples:

```CoffeeScript
# Assignment:
number   = 42
opposite = true

# Conditions:
number = -42 if opposite

# Functions:
square = (x) -> x * x

# Arrays:
list = [1, 2, 3, 4, 5]

# Objects:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

# Splats:
race = (winner, runners...) ->
  print winner, runners

# Existence:
alert "I knew it!" if elvis?

# Array comprehensions:
cubes = (math.cube num for num in list)
```

## ES6 (ES2015) Features

Complete list of [ES6 features](http://es6-features.org/)

From [Top 10 ES6 Features Every Busy JavaScript Developer Must Know](https://webapplog.com/es6/)

#### Default Parameters

```js
var link = function (height, color, url) {
    var height = height || 50
    var color = color || 'red'
    var url = url || 'http://azat.co'

}

var link = function(height = 50, color = 'red', url = 'http://azat.co') {

}
```

#### Template Literals (String Interpolation)

```js
// ES5
var name = 'Your name is ' + first + ' ' + last + '.'
var url = 'http://localhost:3000/api/messages/' + id

// ES6
var name = `Your name is ${first} ${last}.`
var url = `http://localhost:3000/api/messages/${id}`
```

#### Multi-line Strings

```js
var roadPoem = 'Then took the other, as just as fair,\n\t'
    + 'And having perhaps the better claim\n\t'
    + 'Because it was grassy and wanted wear,\n\t'
    + 'Though as for that the passing there\n\t'
    + 'Had worn them really about the same,\n\t'

var fourAgreements = 'You have the right to be you.\n\
    You can only be you when you do your best.'


var roadPoem = `Then took the other, as just as fair,
    And having perhaps the better claim
    Because it was grassy and wanted wear,
    Though as for that the passing there
    Had worn them really about the same,`

var fourAgreements = `You have the right to be you.
    You can only be you when you do your best.`
```

#### Destructuring Assignment

```js
var data = $('body').data(), // data has properties house and mouse
  house = data.house,
  mouse = data.mouse

var {house, mouse} = $('body').data() // we'll get house and mouse variables

var [col1, col2]  = $('.column'), // works with arrays too!
  [line1, line2, line3, , line5] = file.split('\n')
```

#### Arrow Functions

```js
var _this = this
$('.btn').click(function(event){
  _this.sendData()
})

$('.btn').click((event) =>{
  this.sendData() // this will have the same value as in the context of the function
})
```


```js
var ids = ['5632953c4e345e145fdf2df8','563295464e345e145fdf2df9']
var messages = ids.map(function (value) {
  return "ID is " + value // explicit return
})

var ids = ['5632953c4e345e145fdf2df8','563295464e345e145fdf2df9']
var messages = ids.map(value => `ID is ${value}`) // implicit return
```

#### Promises

```js
var wait1000 =  () => new Promise((resolve, reject) => { setTimeout(resolve, 1000) })

wait1000()
  .then(function() {
    console.log('Yay!')
    return wait1000()
  })
  .then(function() {
    console.log('Wheeyee!')
  })
```

[Introduction to ES6 Promises – The Four Functions You Need To Avoid Callback Hell](http://jamesknelson.com/grokking-es6-promises-the-four-functions-you-need-to-avoid-callback-hell/)

#### Block-Scoped Constructs Let and Const

`let` is mutable. `const` is constant.

#### Classes

```js
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(this.name + ' makes a noise.');
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name); // call the super class constructor and pass in the name parameter
  }

  speak() {
    console.log(this.name + ' barks.');
  }
}

let d = new Dog('Mitzie');
d.speak(); // Mitzie barks.
```

#### Modules

```js
module.exports = {
  port: 3000,
  getAccounts: function() {
    ...
  }
}

var service = require('module.js')
console.log(service.port) // 3000
```

```js
// foobar.js

function foo() { return 'foo'; }

function bar() { return 'bar'; }

export { foo, bar };
```

```js
// main.js

import {foo, bar} from 'foobar';
foo();
bar();

import * as lib from 'foobar';
lib.foo();
lib.bar();
```

# Activity: Researching ES2016-18

Break up into pairs and research what new features will be available in ES2016, 17, and 18. For each new feature write:

1. An example
1. A description
1. A use case

# Typescript

Like CoffeeScript, TypeScript **transpiles**

![typescript](assets/typescript.png)

JavaScript but with types

[TypeScript Playground](https://www.typescriptlang.org/play/index.html)

[What is new in Typescript](https://channel9.msdn.com/Events/Build/2017/B8088/)

[Deno](https://github.com/denoland/deno)
[Deno Roadmap](https://github.com/denoland/deno/blob/master/Roadmap.md)

## Homework
