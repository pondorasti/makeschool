<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->
# Variables, Types & Functions

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/01-Variables-Types-&-Functions/README.html ':ignore')

<!-- > -->

## Agenda

- Intro to course
- Learning Objectives
- Variables and Constants
- Activity on Variables
- Types
- Break
- Functions
- Activity on Functions

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

1. Familiarize with Swift Playgrounds
1. Identify and create variables & constants
1. Identify and define types in Swift
1. Formulate and use functions to encapsulate code with parameters and return values

<!-- > -->

## Swift Intro

Swift is a programming language to write software for phones, wearables, desktops, servers, and much more.

It was released in June 2014 by Apple. The language is a combination of years of Apple engineering development and the contribution of an open-source community.

Swift is **beginner friendly, safe, fast, interactive** and optimized for **performance** and **development**.

<!-- > -->

## Playgrounds

To learn a lot of the course content we will be using Playgrounds. It will be easy and fast to experiment without having to set up an app in Xcode.

**Xcode** is the environment where we build apps.

<!-- v -->

## Playground Demo

- Identify sections
- Calculations
- Comments
- Print statements

<!-- v -->

### Playground sections

- **Source editor**: where we write code
- **Results sidebar**: shows results of code
- **Execution control**: manual or automatic
- **Activity viewer**: shows status of the playground
- **Panel controls**: toggle them on or off from the screen

<!-- > -->

### Comments

```swift
// This is a single line comment
```

```swift
/* This is a comment that can
   span over many lines.
   Like this.
*/
 ```

<aside class="notes">
Before we start writing code, it's important to know how you can document what you do. This is helpful for people who will later work with your code, or just you in the future. We can write comments to help us know why we wrote some code and this will be ignored by the compiler.
</aside>

<!-- > -->

### Print to console

It's also useful to see what our code is doing. For this we use print statements. The results will print in the debug area or console.

```swift
print("Hello, you are ready to write some Swift")
```

<!-- > -->

## Constants

When we handle data in our code, we can give it a name and a type. This makes it easier to reference it later and manipulate it.

```swift
let months: Int = 12
```

<aside class="notes">
This is a constant. We declare a constant using `let` followed by the name we want to give that data, here it's `months`. We also set it's type to `Int` and assigned a value of 12. What comes after the colon is called a *type annotation*, you use this to be clear about the kind of values the constant can store.
</aside>

<!-- v -->

The type **Int** can store integers.

```swift
let average: Double = 8.88
```

The type **Double** can store decimals with high precision.

The type **Float** can store decimals with less precision but takes up less memory.

<!-- v -->

Once we've declared a constant we can't change it's data. So this makes them useful for values that we know they won't change.

If by mistake you try to change the value of a constant, Xcode will throw an error message to let you know.

```swift
Cannot assign to value: 'number' is a 'let' constant
```

<!-- v -->

### Question

**Q1:** Will the following code snippet run without error? Justify your answer:

`let number: Double = 3`

<!--Yes, because the compiler will assign the value 3.0 to number-->

<!-- > -->

## Variables

What if we need to change the value? For example if we are tracking our bank account balance. Then we use a variable.

```swift
var accountBalance: Double = 8000.80
```
<aside class="notes">
It's very similar as a constant, but we declare it with the keyword `var`.

Constants are useful in cases when we know our data can change.
</aside>

<!-- v -->

### Naming

Choose names for your variables and constants that reflect what they are. This will help as documentation and to make your code readable.

|     Good     |      Bad      |
|:------------:|:-------------:|
| numberOfPets |      np       |
| username     |     usrnm     |
| borderColor  |     temp      |

<!-- v -->

In Swift is common to use **camel case**.

- Start with lower case
- If the name has more than one word, start the next words with uppercase
- If there is an abbreviation, use the same case for it

<!-- v -->

### Questions

**Q1:** For a video game, which of the following would be best represented with a constant:

1. Player name <!--correct-->
1. Player level
1. Player score
1. Player location

<!-- v -->

**Q2:** Which of the following would be best represented with a variable? Choose all that apply

1. Name
1. Birthday
1. Age <!--correct-->
1. Home Address <!--correct-->

<!-- v -->

**Q3:** ____ is used to declare a constant, and ______ is used to declare a variable:

1. `const`, `var`
1. `const`, `let`
1. `let`, `var` <!--correct-->
1. `var`, `let`

<!-- > -->

## Constant or Variable?

Imagine you're creating a simple photo sharing app. You want to keep track of the following metrics for each post:
- Number of likes: the number of likes that a photo has received
- Number of comments: the number of comments other users have left on the photo
- Year created: The year the post was created
- Month created: The month the post was created represented by a number between 1 and 12
- Day created: The day of the month the post was created

 For each of the metrics above, declare either a constant or a variable and assign it a value corresponding to a hypothetical post. Be sure to use proper naming conventions.

 <aside class="notes">
Source: Swift Fundamentals. Apple Books.
 </aside>

<!-- > -->

## In Class Activity - 25 min

In this playground we review the concepts learned so far, experiment using arithmetic operations and also learn about a new type: Strings.

[Variables - Swift Playgrounds](https://github.com/MakeSchool-Tutorials/Intro-Variables-Swift-Playground/archive/swift4.zip)

<!-- > -->

## Type Casting

There can be times when we have data of a certain type but need to convert it to another.

```swift
var integer: Int = 20
var decimal: Double = 8.5

integer = Int(decimal)
```
<aside class="notes">
With these we say we want to convert from the original type, Double, to the new type, Int.
</aside>

<!-- > -->

## Type Inference

Every time we declare a new variable or constant we add a **type annotation**. If we do not include it and still assign a value, the Swift compiler can deduce the type. This is called **type inference**

```swift
let height = 155
```
<aside class="notes">
We can find something like this and assume that the compiler knows it's an Int. We can double check this by holding down the Option key ⌥ and clicking on the variable or constant name. Then we should see a popover telling us the inferred type.
</aside>

<!-- v -->

Sometimes we need a variable to be a certain type even when assigning something different. Let's say we have this:

```swift
let height = 155
```

This would be assigned as an Int by the compiler. Here are several ways to fix it:

```swift
let height = Double(8)
let height : Double = 8
let height = 8 as Double
```

<!-- v -->

### Question

Using type inference, which of the following would be asssigned a `Double` type?

1. `var state = "Rhode Island"`
1. `let country = "Belgium"`
1. `let population = 142000`
1. `let speedLimit = 75.0` <!--correct-->

<!-- > -->

## Other types

```swift
let char: Character = "a"
let string: String = "a string"
let cheesecakeLover: Bool = true
let coordinates: (Int, Int) = (1, 2) // tuple
```

<aside class="notes">
This last example is a **tuple**. A tuple is a type that represents data made up  of more than one value of any type.
</aside>

<!-- > -->

## Functions

From what you know using other programming languages, what's a function? 🤔

<!-- v -->

They let you enclose a block of code that performs a task. Then when you need to execute that block of code you can call the function to do it.

You can call the function as many times as you need from different places, instead of repeating code all over.

<!-- v -->

Here's one way to write a function in Swift.

```swift
func sayHello() {
  print("Hello World, this is me.")
}
```
<aside class="notes">
We declare functions with the keyword *func* followed by the name of the function (something meaningful) and followed by parenthesis. Inside we can have zero or more input parameters. In this case there aren't any. Then comes the body of the function enclosed by braces.
</aside>

<!-- v -->

We call the function like this:

```swift
sayHello() // prints "Hello World, this is me."
```
<!-- v -->

Sometimes we need to pass in values to be used inside the function. These are input **parameters** and go inside the parenthesis, specifying their type, like this:

```swift
func printSumOf(value:Int, andValue:Int) {
  print("\(value) + \(andValue) = \(value + andValue )")
}
```

<!-- v -->

When we call the function, we send the **arguments** it needs to work.

```swift
printSumOf(value:4, andValue:8)
```

<!-- v -->

*Apple's convention*

Try to make your functions read as sentences. This makes it easier to understand what they do. You'll see a lot of Swift documentation written like this.

"Print sum of value 4 and value 8"

<!-- v -->

We can make it more readable if we use external names.

```swift
func printSumOf(value:Int, and value:Int) {
  print("\(value) + \(andValue) = \(value + andValue )")
}
printSumOf(value: 4, and: 8)
```
<aside class="notes">
*and* is the external name that we use when calling the function, while *value* remains as the internal name that we use in the body of the function.

Now it reads as "Print sum of value 4 and 8"
</aside>

<!-- v -->

You can also opt to have no external names and use an underscore.

```swift
func printSumOf(_ firstValue:Int, _ secondValue:Int) {
  print("\(firstValue) + \(secondValue) = \(firstValue + secondValue )")
}
printSumOf(4,8)
```

<!-- v -->

You can also give parameters default values.

```swift
func printSumOf(_ firstValue:Int, _ secondValue:Int = 10) {
  print("\(firstValue) + \(secondValue) = \(firstValue + secondValue )")
}
```

**Q:** Can you figure out how to call the function to use the default value?

<!-- > -->

## Return values

So far we've seen functions that print out to console. But in most real life situations we'll need functions that return a value, so we can store it in a variable or use it directly in another operation.

```swift
func sumOf(_ firstValue:Int, and secondValue:Int) -> Int {
  return firstValue + secondValue
}

let result = sumOf(4, and: 8)
```

<aside class="notes">
We use -> followed by the type of the return value. Then inside the function we use a return statement to give back the resulting value.
</aside>

<!-- > -->

## In Class Activity

[Playground on today's topics.](https://github.com/Make-School-Labs/swift-lab1)

<!-- > -->

## After Class - Lab

Complete the playground on today's topics if you aren't done yet, submit to Gradescope.

<!-- > -->

## Additional Resources

- [About Swift](https://docs.swift.org/swift-book/index.html)
- [Apple's documentation on Variables & Constants](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Video on Types in Swift](https://www.youtube.com/watch?v=BlXrMgmvNBI)
- [Article explaining Functions](https://learnappmaking.com/swift-functions-how-to/)
