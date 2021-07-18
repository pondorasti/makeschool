<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Functional Programming Pt.1

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/09-Functional-ProgrammingPt.1/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe:
- the programming issues caused by **mutable state**
- the difference between **Imperative** and **Declarative** programming styles
- potential use cases for FP
2. Implement basic examples of FP constructs explored in class


<!-- > -->

##  Functional Programming

“Functional programming is a **programming paradigm** &mdash; a style of building the structure and elements of computer programs &mdash; that treats computation as the evaluation of **mathematical functions** and **avoids changing-state and mutable data.**”

<!-- > -->

### Why Learn This?

**Enemy of the State**

iOS and Mac apps rely heavily on **state** to change their presentation and respond to input &mdash; it's hard to imagine writing an app without the use of __*properties*__ and __*variables.*__

<!-- > -->

In OOP, programs are composed of classes and objects. And statements, when executed, can mutate the state of objects.

However, __*state*__ is complex and becomes the *responsible for most of the easily avoidable bugs* that users encounter.

**State management is difficult and error-prone.**

<!-- > -->

Functional Programming (FP) seeks to avoid using mutable states by **using functions as fundamental building blocks** rather than variables.

<!-- > -->

Swift is not purely a functional programming language &mdash; we must always implement Cocoa frameworks that are mostly designed in an OOP manner &mdash; but Swift combines multiple programming paradigms to give you flexibility for app development, and it firmly embraces two key attributes of FP:

- **Higher-Order Functions** &mdash; Including map, filter, reduce, and compactMap.

- **Value Types** &mdash; Simple numerics, enums, and structs.

<!-- > -->

## Key concepts

- State
- Higher Order functions
- Mutation
- Pure Function
- Declarative
- Functional
- Imperative

<!-- v -->

Refers to a program's stored values at any given time.
<p class="fragment fade-in">State</p>

<!-- v -->

The act of updating some state in-place.

<p class="fragment fade-in">Mutation</p>

<!-- v -->

A function that does at least one of the following:</br>
&nbsp;&nbsp;&nbsp; - takes one or more functions as arguments </br>
&nbsp;&nbsp;&nbsp; - returns a function as its result.

<p class="fragment fade-in">HOF</p>

<!-- v -->

A programming paradigm that uses statements that change a program's state

Consists of commands for the computer to perform and implements algorithms in explicit steps.

<p class="fragment fade-in">Imperative</p>

<!-- v -->

Focuses on what the program should accomplish without specifying how the program should achieve the result.

It seeks to minimize or eliminate *side effects* by describing __*what*__ the program must accomplish rather than describing __*how*__ to accomplish it.

<p class="fragment fade-in">Declarative</p>

<!-- v -->

Meets two criteria: </br>
- It always produces the same output if given the same input.
- It does not produce external side effects (they do not change any data or state outside of themselves)

<p class="fragment fade-in">Pure Function</p>

<!-- > -->

### Problem(s) Addressed

`Variables` represent data &mdash; or *state.* By definition, since a `variable` can *vary* as your app runs, it fosters *mutable state.*

__*Imperative programming*__ &mdash; with mutable state &mdash; can lead to __*unintended consequences*__ of certain side effects.

<!-- > -->

#### Side Effects

*Side Effects* represent **any changes to the state outside of a code block's current scope**. Side effects might include:

- Changing the value of a variable
- Writing some data to disk
- Enabling or disabling a button in the User Interface

A function produces side effects if it modifies some variable's value (state) outside of the variable's local environment.

<!-- > -->

#### Benefits of FP

Benefits of applying immutability include:
- Elimination of concurrency issues such as dead-locks and race conditions
- Easy to create, test and maintain
- Promotes code with no side effects
- Cleaner code with less possibility for bugs
- More opportunities for the compiler to optimize the code for performance

<!-- > -->

### Imperative vs Declarative Code

<!-- > -->

#### Example 1

First, create a type and an array to hold objects of the type.

```swift
class Animal {
    var name: String
    var description: String

    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
```

<!-- v -->

```swift
var animals = [
    Animal(name: "Bear", description: "omnivore"),
    Animal(name: "Caterpillar", description: "herbivore"),
    Animal(name: "Ladybug", description: "carnivore")
]
```

<!-- v -->

With __*imperative programming,*__ you tell the compiler what you want to happen, __*step by step:*__

```swift
// Imperative approach
for item in animals {
    // step through the array and decide if condition is met
    if item.name == "Ladybug" {
        print("🐞 eat other insects ")
    }
}
```

<!-- v -->

With __*declarative programming,*__ you write code that describes **what** results are desired, but __*not*__ the step-by-step commands on **how** to achieve them:

```swift
// Declarative approach
if animals.contains(where: { $0.name == "Ladubug" }) {
    print("🐞 eat other insects ")
}
```

<!-- v -->

Both attain the same result.

But the imperative version walks through the array step-by-step, while the functional version simply passes a closure to the `.contains(where: )` function, which exists for every array object.

<!-- > -->

#### Example 2

Consider how the following code is __*imperative.*__ Notice that we are manipulating the values inside a mutable array called numbers, and then printing to the console:

```swift
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for i in 0..<numbers.count {
    let timesTen = numbers[i] * 10
    numbers[i] = timesTen
}

print(numbers) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
```

<!-- v -->

Now consider this alternative __*functional approach:*__

```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

extension Array where Element == Int {
    func timesTen() -> [Int] {
        var output = [Int]()
        for num in self {
            output.append(num * 10)
        }
        return output
    }
}

let result = numbers.timesTen()

print(numbers) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(result) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
```

<!-- v -->

Again, the results of the functional version are similar to that of the imperative one, except now:

- The `numbers` array is now made immutable with the `let` keyword.
- We moved the process of multiplying numbers into a method stored in an extension of Array.
-Though still using a `for loop` and updating a variable called `output`, the scope of this variable is limited to the method.
- The input argument `numbers` is being passed by value into the method, giving it the same scope as the output.

[source](https://medium.com/swift2go/functional-programming-in-swift-an-introduction-253c1f420ca9)

<!-- > -->

## In Class Activity - 5 min

1. Analyze the code in the previous Example 2
2. Answer the following questions about it

**Q:** What happens if another thread tries to access the `numbers` array during this process for:

- the imperative version?
- the functional version?

<!-- v -->

**Q:** What happens if we later want to access the original values stored in numbers?

- with the imperative version?
- with the functional version?

<!-- v -->

### First-Class and Higher-Order Functions

**First-Class Functions:**

True FP requires functions to be __*first class*__, and functions in Swift are *first class* citizens.

This means that functions are types, which allows us to treat them like values (variables) and to pass functions around like data: we can pass them into other functions as arguments, and even allows functions to return other functions.

**Treating functions as types lets us combine different functions to create new functions with new behavior.**

<!-- > -->

**Higher-Order Functions:**

Every language with FP has some version of `Map`, `Filter`, `Reduce`, as does Swift.

These functions are called __*Higher-Order Functions (HoF)*__ because they can take other functions as their parameters.

Higher-Order Functions can be used to reduce repetition and refactor code.

<!-- > -->

### Functors and the map Function

FP employs concepts of a branch of mathematics called *Category Theory.* where a category is a collection of "objects."

In Category Theory, a **map** between categories (object collections) is called a **"functor."**

<!-- > -->

The `map` function in Swift is a type of functor; it is a HoF that solves the problem of transforming the elements of a collection using a function.

![functor_mapping](assets/functor_mapping.png)

&nbsp;&nbsp;&nbsp; *Use `map` to loop over a collection and apply the same operation to each element in the collection.*

<!-- > -->

A **functor** is simply something that "can be mapped over," which means that you can take all the values  inside it, then for each value, derive something new out of it (by calling a function).

You then put these
resulting values back into a new container of the same structure and shape.

<!-- > -->

![functor](functor.png)

<!-- > -->

#### Example 1 - map with Array

Use map to convert the names in the array to lowercase strings and then to count their characters.

```swift
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
```

<!--
```swift
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map { $0.lowercased() }
// 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
let letterCounts = cast.map { $0.count }
// 'letterCounts' == [6, 6, 3, 4]
```
-->

<!-- > -->

#### Example 2 - map with Dictionary

The `map` function is not limited to arrays; you can use it on other collection types, too.

If you use `map` with a Swift `Dictionary` or `Set`, the return type will still always be a generic array, but you can return an array containing any type.

<!-- > -->

Consider a dictionary with book names as key and the amount of each book as the value.

```swift
let bookAmount = ["jumanji": 100.0, "junglebook": 60.00]
```

Use map to return a string that says how much the books are worth.

```swift
"Jumanji is $100"
"Junglebook is $60.0"
```

<!--
```swift
let returnFromMap = bookAmount.map({ key, value in
//    print(key.capitalized)
//    print(value * 10)
    return(key.capitalized, value * 10)
})

// print the mapped array returned...
print(returnFromMap) // [("Harrypotter", 1000.0), ("Junglebook", 600.0)]
```
-->

[source](https://medium.com/@abhimuralidharan/higher-order-functions-in-swift-filter-map-reduce-flatmap-1837646a63e8)

<!-- > -->

## Activity

Follow instructions [here](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/09-Functional-ProgrammingPt.1/assignments/activity.md)

<!-- > -->

## After Class

1. Research:

- Referential Transparency
- Equational Reasoning
- Currying
- Monad
- Applicative Functor
- Deterministic
- Side Effects (as it related to CS)

<!-- > -->

2. The tutorial below demonstrates FP using a game as the example. Study and execute it, completing as much of it as you can, but at the very least complete the steps from the beginning through the section on the `Reduce` function:

&nbsp;&nbsp;&nbsp; https://troz.net/post/2018/functional-programming/

<!-- > -->

## Additional Resources

2. [Functional programming - wikipedia](https://en.wikipedia.org/wiki/Functional_programming)
3. [Enemy of the State](https://speakerdeck.com/jspahrsummers/enemy-of-the-state?slide=5) <sup>1</sup>
4. [Controlling Complexity - an article by Andy Matuschak](https://realm.io/news/andy-matuschak-controlling-complexity/)
5. [State - wikipedia](https://en.wikipedia.org/wiki/State_(computer_science))
6. [Imperative programming - wikipedia](https://en.wikipedia.org/wiki/Imperative_programming)

<!-- > -->

7. [Declarative programming - wikipedia](https://en.wikipedia.org/wiki/Declarative_programming)
8. [Higher-order_function - wikipedia](https://en.wikipedia.org/wiki/Higher-order_function)
9. Domain-Specific Languages (DSLs):
- [Domain-Specific Languages - wikipedia](https://en.wikipedia.org/wiki/Domain-specific_language)
- [A book by Martin Fowler](https://www.martinfowler.com/books/dsl.html)


<!-- SOLUTION FOR ACTIVITY 2:

func doubleIt(inputArray: Array<Int>) {
    let results = inputArray.map({ $0 * 2 })
    print(results)
}

doubleIt(inputArray: [1,2,3]) // [2,4,6]
-->
