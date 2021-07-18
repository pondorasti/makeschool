# TypeScript 1

The code here has a problem. See if you can spot it before running the code. 

Run the code and look at the output. The function wants to calculate the price with tax but the output is not correct. 

What's wrong? 

example-1.js

# Typescript 2

This project has code written in Typescript. The function calculates the price plus the tax. 

Notice the editor is telling us there is a problem. Try and figure out the problem. Use the Type notation to help you. 

example-2.ts

# Typescript 3

The function in the sample code takes a string and number and copies the string that number of times and returns it. 

Typescript has some problems with this because we haven't declared any types. 

Your job is to add the types. 

- Add types for both parameters
- Add a type for the return value
- Add types for the variables inside the function

example-3.ts

# Typescript 4

While typescript will infer a type. It is best practice most often to explicity type thing. 

The sample wants to build two arrays, one with random numbers and the other with random characters. Since this is Typescript you need to add the types.

example-4.ts

# Typescript 5

This example has three tuples. These are really arrays with mixed types. 

Since the code is typescript you need to add the types. 

The function needs parameters type, and return type. 

example-5.ts

# Typescript-6

You can define a type and apply that type. 

Here the first line defines a type Snack that is a tuple of `[sting, name]`. This is shorter than: 

```
const snack1: [sting, name] = ['Cookies', 142]
const snack2: [sting, name] = ['Avocado', 234]
const snack3: [sting, name] = ['Banana', 105]
```

example-6.ts

# Typescript 7

Any time you have a set of fixed values you can represent these with an enum. 

When would you use this: 

- Units - standard, imperial, metric
- Gender - Male, Female, Non-Binary
- Direction - North, South, East, West

Challenge: Write an enum for a card type. Make the example code work by adding an Enum for Suit and defining `ace` of spades!

example-7.ts





