<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Writing in TypeScript

<small style="display:block;text-align:center">Writing in TypeScript</small>

<!-- ([slides](https://docs.google.com/presentation/d/1ovt7YeAfqaiN8duWjwhYxldTwvca382QTHYyBUFZZ_8/edit)) -->

In this class, you will begin writing TypeScript code and learn how to adapt your existing JS code to TypeScript.

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Why Is This Important? 🤔

TypeScript is becoming more popular, and is extremely useful in large codebases. Knowing how to refactor, write, and publish TypeScript code will allow you to decide whether TypeScript is right for a project.

Writing TypeScript will also force you to think about the types you use in the code you write which will make a you a stronger programmer.

<!-- > -->

## Learning Objectives

1. Define static & dynamic typing
2. Explain the pros & cons of static vs. dynamic typing
3. Implement functions, enums, & interfaces using TypeScript
4. Convert existing JS code to TypeScript

<!-- > -->

## Static vs. Dynamic Typing

<!-- > -->

### Q: What is a type?

Data types describe the *shape* of the data that we're expecting.

Examples: `string`, `number`, `boolean`, `object`, `array`, `class`

<!-- > -->

### Q: What is static typing?

In a statically typed language, variables' types are *static*, meaning that once a variable is set to a type, it cannot be changed. Statically typed languages generally check *at compile time* that a variable is being assigned the correct type of data. 

Examples of statically typed languages include Java, C, C++, and Swift.

<!-- > -->

**Q:** Can you use static typing in JS?

**A:** Nope. 

TypeScript is another language separate from JS and must be compiled into vanilla JS. **You can't use static typing in vanilla JS.**

You compile your TypeScript into vanilla JavaScript. 

<!-- > -->

### What is dynamic typing?

In a dynamically typed language, a variable's type can change over the course of the program. Consider the following code:

```JavaScript
let x = 10       // x starts as a Number
x = 'hello'      // x becomes a String
x = y.toFixed(2) // x becomes a string! 
```

Usually you won't do this on purpose, **most often it will happen by accident.** 

<!-- > -->

In a dynamically typed language, we do not know *until runtime* what type of data a particular variable holds.

<!-- > -->

Examples of dynamically typed languages include Python, **JavaScript**, PHP, and Ruby.

<!-- > -->

## Why use one or the other?

**Discussion:** Write down 3 reasons each for using either a statically typed or dynamically typed language.

<!-- > -->

### Static typing catches errors earlier in program development.

**Q:** What is happening on each line of code below?

```JavaScript
function getPriceWithTax(amount, rate) {
  const price = amount.toFixed(2)
  const tax = price * rate
  return price + tax
}
```

<small>Ask yourself what type is assigned the variables at each line.</small>

What could possibly go wrong? 🤔

<!-- > -->

### Static typing improves readability 🥸

<!-- > -->

Consider this code 🔎:

```JavaScript
function mystery(x) {
  if (x.powerLevel <= 100) {
    x.leave();
  } else {
    x.display();
  }
}
```

Now, consider the following questions:
- What is x?
- What other fields, data, and behavior does x have? How else can I interact with x?
- How would I find this information?

<!-- > -->

Now, let's take a look at this code with some types added. 😎

```TypeScript
class Cat {
  powerLevel: number;
  personality: string;
  appearance: string;
  photo: Image;
  leave(): void {...}
  display(): void {...}
}

function mystery(x: Cat) { ... }
```

<!-- > -->

### Static typing can improve your workflow ⚒️

Since our types are set in stone at compile time, many code editors will use that information to give you smart autocomplete suggestions based on that particular data type. If you use VSCode, you can use Intellisense to browse available methods from a class while writing code. You can also Cmd+Click on a method name to go directly to its definition.

<!-- > -->

### Advantages of dynamic typing 🧐

<!-- > -->

There isn't just one right answer that works in all scenarios; you will need to decide which style is right for your project. Here are some pros of dynamic typing to consider:

- It's faster to write, thus might be better for scripting
- It's more succinct
- It's more tolerant to change: a code refactor will have a smaller area of effect
- Doesn't require extra compilation step

<!-- > -->

## Features of TypeScript 

<!-- > -->

Follow the example with these files:

https://github.com/Make-School-Labs/few-2.1-typescript/

Your source code will be the files named: .ts 

Typescript files must be compiled into .js before they can be used. 

- `npm install -g typescript`
- `tsc example-2.ts`

<!-- > -->

### Variables

The most basic types are `string`, `number`, and `boolean`, and we can use them in the same way as in regular JavaScript; we just can't reassign a variable to a different type.

```TypeScript
let y = 88; // implicitly typed number
let sum: number = 10; // explicitly typed number
const title: string = 'hello'; // type string
let done: boolean = false; // type boolean

sum = undefined; // OK
sum = null; // OK
sum = '100'; // Not OK - will result in a compile error
Math.round(title) // Compile error
```

<!-- > -->

Try these ideas out in example-2.ts 

https://github.com/Make-School-Labs/few-2.1-typescript/

<!-- > -->

### Functions, Parameters, and Return types

<!-- > -->

We can add types to the parameters and return values of functions:

```TypeScript
// Add types to each parameter, and a type for the return value
function add(num1: number, num2: number): number {
  return num1 + num2;
}

add(4, 6);
add('2', 7); // Compile Error
```

<!-- > -->

Try these ideas out in example-3.ts 

https://github.com/Make-School-Labs/few-2.1-typescript/

<!-- > -->

We can also use default and optional parameters. If you want to skip one, just pass in `undefined`:

```TypeScript
function greet(greeting = 'Hello', person?: string) {
  if (person) {
    console.log(`${greeting}, ${person}!`);
  } else {
    console.log(`${greeting}!`);
  }
}

greet(); // prints 'Hello!'
greet('Hola'); // prints 'Hola!'
greet(undefined, 'Jane'); // prints 'Hello, Jane!'
```

<!-- > -->

Finally, if you don't know what type a piece of data will be, e.g. if you're receiving it from an API, you can always use the `any` type:

```TypeScript
let someValue: any = 10;
someValue = [1, 2, 3];
```

<!-- > -->

Try these ideas out in example-4.ts 

https://github.com/Make-School-Labs/few-2.1-typescript/

<!-- > -->

### Arrays and Tuples

<!-- > -->

There are two ways to declare an array, which are completely equivalent (if you've used Java before, these should look familiar):

```TypeScript
let list1: number[] = [1, 2, 3];
let list1: Array<number> = [1, 2, 3];
```

Note! Every memeber of an array must be the same type. 

<!-- > -->

What if we want an array with mixed values of different types? In that case, we can use the 'tuple' type:

```TypeScript
let person1: [string, number] = ['Jane', 20];
```

<!-- > -->

You can also easily make your own enum type. If you try to print the value of an enum, you'll see that it's actually a number, with the first value defaulting to 0.

```TypeScript
enum Fruit { Apple, Orange, Pear };

let f: Fruit = Fruit.Pear;

console.log(Fruit.Apple);  // 0
console.log(Fruit.Orange); // 1
console.log(Fruit.Pear);   // 2
```

<!-- > -->

## Classes & Interfaces

<!-- > -->

In addition to primitive types, we can denote the shape of a JavaScript object using type annotations:

```TypeScript
let user: { firstname: string, lastname: string, postcount: number } = { 
  firstname: 'Jane', 
  lastname: 'Smith',
  postcount: 222
};
```

<!-- > -->

We can also define the type ahead of time using an interface:

```TypeScript
interface Person {
  name: string;
  age: number;
  greet(message: string): string;
}

let person: Person = {
  name: 'Jane', 
  age: 22, 
  greet(message) { return this.name + message }
}
```

<!-- > -->

## Challenges: Getting started with Typescript

Take a look at this 5 min tutorial from the source. Take 5 mins and do the tutorial. 

https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html

<!-- > -->

- What did you see in the tutorial? 
- What was different about using typescript than using JS?
- Did you see anything new? 

<!-- > -->

## Fizz Buzz 

Use the fizz buzz code, you wrote test for this earlier. Let's convert it to TypeScript. 

<!-- > -->

**Step 1**

Get the code here at the link below or use your copy of the code from the previous assignment:

https://github.com/Make-School-Labs/fizz-buzz-test

<!-- > -->

**Step 2**

All of the code here is in `fizzbuzz.js`. Change the name of this file to `fizzbuzz.ts`. The .ts file extension denotes a TypeScript file. 

<!-- > -->

**Step 3**

VSCode will provide hints in the form of three small dots under the names of variables, function, parameters, and more to tell you where types are missing. You can hover over this to get a hint as to what is missing. 

Set the types for the vairables at the top: 

```TS
const FIZZ = 'fizz'
// FIZZ is type string change to:
const FIZZ: string = 'fizz'
```

Not you're not getting a code hint since TypeScript is inferring the type. 

Do the other variables. 

<!-- > -->

**Step 4**

Functions take parameters as input and provide a return value as output. These should define a type. Look at the comments for a clue about the parameters and return values: 

```ts
function isFizzy(n) {
  return n % 3 === 0
}
// Takes a number returns a boolean change to:
function isFizzy(n: number): boolean {
  return n % 3 === 0
}
```

Do the other functions: 

- isFizzy
- isBuzzy
- isFizzyBuzzy
- fizzyBuzzy

<!-- > -->

**Step 5**

The last function is more complicated. Here the input is just a number but the output is an object. You can see the "shape" of the object here:

`const result = { count, fizz: 0, buzz: 0, fizzBuzz: 0 }`

To define this you should create an interface. An interface defines all of the properties an object might have and their types. This interface becomes the type.

Read more about interfaces here: 

https://www.typescriptlang.org/docs/handbook/2/objects.html

After reading the docs above, write an interface for the fizzbuzz results. Use it to complete the types for this function. 

<!-- > -->

**Step 6**

Run the TypeScript compiler.

There's one last step, convert your .ts files into .js files. Follow the guide here: 

https://www.typescriptlang.org/docs/handbook/typescript-tooling-in-5-minutes.html

tl;dr

- `npm install -g typescript`
- `tsc fizzbuzz.ts`

This should compile your TypeScript code into standard js, or provide helpful error messages where types are mismatched. 

<!-- > -->

## Discuss TypeScript

What do you think of typescript so far? 

<!-- > -->










<!-- 
## Activity: TypeScript Exercises

Go to [make.sc/typescript-activities](https://make.sc/typescript-activities) and complete the 8 activities there to help solidify how to use TypeScript. You can write in the same repl.it you were using before to check your work -->

<!-- > -->

<!-- ## Activity: Get Your Project Up and Running with TypeScript

Let's try out what we learned by modifying an existing project with TypeScript. Add TypeScript to your String library.

Now, we just need to make a few small changes to get it working again! -->

<!-- > -->

<!-- ### Add Types

Rename the files to use a TypeScript extension (e.g. `index.js` to `index.ts`), and modify the functions to use types.

To get the string prototype functions to compile, you will need to add the following interface definition to `index.js`:

```TypeScript
declare global {
  interface String {
    capitalize(): string;
    capitalizeAll(): string;
    allCaps(): string;
    oddCaps(): string;
    evenCaps(): string;
    kabobCase(): string;
    snakeCase(): string;
    stripSpaces(): string;
    stripExtraSpaces(): string;
  }
}
``` -->

<!-- > -->

<!-- To check your work so far, try running `tsc src/index.ts` and take a look at the output file produced. It should look like regular JavaScript, including some changes like using `var` instead of `let`. Nifty! -->

<!-- > -->

<!-- ### Modify rollup.config.js

Install the following in order to use TypeScript and the TypeScript Rollup plugin:

```bash
npm install --save-dev rollup typescript rollup-plugin-typescript2
``` -->

<!-- > -->

<!-- Go to `rollup.config.js`. Change the `input` files to `src/index.ts`. This now points to the 'new' typescript file.


Import the TypeScript plugin at the top of the file:

```
import typescript from 'rollup-plugin-typescript2';
``` -->

<!-- > -->

<!-- Then enter the following into your plugins for both output files:

```JavaScript
input: {
  ...
},
plugins: [
  typescript({
    typescript: require('typescript'),
  }),
],
output: {
  ...
}
```

Try it out! The `rollup --config` command should work and give us the JS output files. Now we just need to configure tsc. -->

<!-- > -->

<!-- ### Add tsconfig.json

Add a new file `tsconfig.json` with the following content:

```
{
  "compilerOptions": {
    "declaration": true,
    "declarationDir": "./esm",
    "outDir": "./esm",
    "module": "es6",
    "target": "es5",
    "noImplicitAny": true,
    "moduleResolution": "node"
  },
  "include": [
    "src/**/*"
  ],
  "exclude": [
    "node_modules"
  ]
}
```

For a more thorough explanation of each of these lines, see [here](https://hackernoon.com/building-and-publishing-a-module-with-typescript-and-rollup-js-faa778c85396). -->

<!-- > -->

<!-- ### Modify package.json

Now we need to tell our library users where to find the TypeScript types. Go to `package.json` and add the following line after the main and module:

```JSON
"types": "esm/index.d.ts",
``` -->

<!-- > -->

<!-- Now running `npm run prepare` should do everything you need to get your files ready. To verify, try going through the steps in Lesson 6 to test out your module. -->

<!-- > -->

### Homework

<!-- [Assignment 8 - Typescript](../assignments/assignment-08.md) -->

Choose one: 

- Update one of your libraries: Date lib or String Lib to TypeScript. 
- Do the TypeScript Exercism: https://exercism.io/my/tracks/typescript

<!-- > -->

## Additional Resources

1. https://exercism.io/my/tracks/typescript
1. https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html

<!-- > -->
<!-- 
## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         | -->
