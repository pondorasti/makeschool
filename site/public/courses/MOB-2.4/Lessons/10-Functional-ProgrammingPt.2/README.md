<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Functional Programming Pt.2

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/10-Functional-ProgrammingPt.2/README.html ':ignore')

<!-- > -->

<!-- INSTRUCTOR:
1) For Activity 1:
- solution is inline below each exercises
-->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe **Higher-kinded types (HKTs)** in FP:
  - **Functors**
  - **Applicative Functors**
  - **Monads**
2. Describe how HKTs map to **Higher-Order Functions (HoFs)** in Swift
3. Practice using: `map`, `flatMap`, and `compactMap`.
4. Describe **Best Practices** for integrating FP

<!-- > -->

### Higher-Order Functions

A **Higher-Order Function** is a function that does at least one of the following:
- takes one or more functions as arguments
- returns a function as its result

<!-- > -->

## Higher-kinded types

Another concept from Category Theory that Functional Programming languages seek to implement is called **Higher-kinded types (HKT)**

In progressive order, HKTs types are:

- **Functors**
- **Applicative Functors**
- **Monads**

<!-- > -->

Swift took features and ideas from many other programming languages, including *Haskell,* from which Swift loosely adapted some of Haskell's implementation of FP concepts such as HKTs.

Though HKTs are not currently supported in Swift, Swift simulates HKTs by using Higher-Order Functions that *model* key HKT behaviors.

<!-- > -->

## Functors revisited

In the last lesson, we defined a **Functor** as a "a map between categories (object collections)."

A Functor can also be thought of as:
- an abstraction of a way to apply a function over some structure which we cannot (or do not want to) alter

<!-- > -->

In other words, a Functor is *any type that implements the `map` function.*

The map function can be applied to any *container type* that wraps a value or multiple values inside itself. Any container that provides the map function becomes the Functor.

<!-- > -->

Examples of Functors in Swift:
- Dictionaries
- Arrays
- Sets
- Closure types
- Functions
- Optionals

<!-- > -->

But...__*what specific programming problem*__ do functors solve?

**Problem:** When a value is wrapped in a context, you can’t apply a normal function to it.

<!-- > -->

![map](assets/map1.png)

<aside class="notes">
Value wrapped in a context, we can’t apply a normal function to it.
</aside>

<!-- > -->

![map2](assets/map2.png)

<aside class="notes">
We can apply map to the functor, because it knows how to apply functions to values that are wrapped in a context.
</aside>

<!-- > -->

![map3](assets/map3.png)

<!-- > -->

![map4](assets/map4.png)

<!-- > -->

**Functor Example: Using `map` with Optionals**

*Swift Optionals are another item borrowed from Haskell, which has a type called a `Maybe` that is functionally equivalent to the Swift `Optional` type definition.*

<!-- > -->

Because Optionals are *container types,* we can use the `map` function to guard against `nil` (without unwrapping them).

<!-- > -->

You can see how optionals are implemented in the Swift Standard Library by typing "Optional" into any Swift file and ⌘-clicking on it:

```swift
public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}
```

<!-- > -->

Thus, an optional is a type of container. It contains optional values of `none` and `some(Wrapped)`, and it can be mapped over just like an array or other Sequence type.

<!-- > -->

To illustrate how an Optional behaves under the hood, we can create a function that takes an Optional, adds 1 to it if it is not `nil`, or returns `nil` if the Optional was actually `nil`...

```swift
func increment(someNumber: Int?) -> Int? {
    if let number = someNumber {
        return number + 1
    } else {
        return nil
    }
}

increment(someNumber: 5)   // Some 6
increment(someNumber: nil) // nil
```

<!-- > -->

...but we can also accomplish the same task, and with fewer lines of code, by creating a function that uses `map` to iterate over the Optional and return whichever optional state it finds...

```swift
func increment(someNumber: Int?) -> Int? {
    return someNumber.map { number in number + 1 }
}

increment(someNumber: 5)   // Some 6
increment(someNumber: nil) // nil
```

For a similar example using String Optionals, see [this post](https://www.hackingwithswift.com/example-code/language/how-to-use-map-with-an-optional-value).

<!-- > -->

## Applicative Functors

Applicative Functors take Functors to the next level.

An **Applicative** lets you put the transformation function inside a container or Functor.

With an Applicative, both the value and the function are wrapped in a context.

<!-- > -->

![app](assets/applicative.png)

<!-- > -->

![app2](assets/applicative2.png)

<!-- > -->

Suppose we want to have *a function in the Functor* and apply it to values *in another Functor* of the same kind.

For instance, we can extend a Functor by adding an `apply` function that *takes a function* and *applies it to the Functor.*

<!-- > -->

### Example 1 - Creating `apply` for Array

Unfortunately, Swift does not provide any `apply` function on arrays. To be able to implement Applicative Functors, we need to create `apply` functions.

Here is a simple version of an `apply` function. Look at the definition and describe what it does:

```swift
func apply<T, V>(fn: ([T]) -> V, args: [T]) -> V {
    return fn(args)
}
```

<!-- > -->

Here is how that `apply` function could be used in your code:

```swift
let numbers = [1, 3, 5]

func incrementValues(a: [Int]) -> [Int] {
    return a.map { $0 + 1 }
}

let applied = apply(fn: incrementValues, args: numbers) // prints: [2, 4, 6]
```

<!--

Just to demonstrate how you could make the above `apply` function available to *all* arrays in a project, here is the same simple example in an extension of the Array class:

```swift
extension Array {

    func apply<T, V>(fn: ([T]) -> V, args: [T]) -> V {
        return fn(args)
    }
}
```

### Example 2 - Creating `apply` for Optionals

Applicative Functors provide us with the ability to operate on not just values, but values in a functorial context &mdash; such as __*Optionals*__ &mdash; without needing to unwrap or map over their contents.

Examine how the `apply` function in this example handles the Optional without unwrapping it:

```swift
func add(_ a: Int) -> (Int) -> Int {
    return { b in
        return a + b
    }
}

let value: Optional<Int> = Optional.some(12)
let wrappedFunction: Optional<(Int) -> Int> = Optional.some(add(5))

func apply<T,U>(_ wrappedF: Optional<(T) -> U>, to value: Optional<T>) -> Optional<U> {
    switch (wrappedF, value) {
    case let (.some(f), .some(v)):
        return .some(f(v))
    default:
        return .none
    }
}

apply(wrappedFunction, to: value) // Prints: 17
```

-->

## Monads

- Functors apply a function to a wrapped value.

- Applicatives apply a wrapped function to a wrapped value.

**Monads** apply a function that *returns* a wrapped value *to* a wrapped value.

<!-- > -->

![monad](assets/monad.png)

<!-- > -->

To do this, Monads have a `flatMap` function (modeled after the `liftM` in Haskell).

`flatMap` can be used to flatten one level of a dimension of a sequence or to remove `nil` values in the sequence.

<!-- > -->

#### Example 1 - Flattening a Nested Array

This example starts with a nested array of integers. The numbers array consists of an array of 3 arrays, that each contain 3 numbers.

The closure { $0 } simply returns the first argument of the closure, i.e. the individual nested arrays.

When you call `flatMap(_:)` on the numbers array, you end up with a flattened array of individual numbers.

```swift
let numbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let result = numbers.flatMap({ $0 })

print(result) // [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

*from:* </br>
https://learnappmaking.com/swift-flatmap-compactmap-how-to/

<!-- > -->

#### Examples of Monads with Optionals: `compactMap(_:)`

A common use of a Monad in Swift is to filter out `nil` values from flattened arrays.

Since Swift 4.2, this is using the `compactMap(_:)` function.

Here is a simple example which removes `nil` from an array...

```swift
let paths:[String?] = ["test", nil, "Two"]
let nonOptionals = paths.compactMap{$0}

print(nonOptionals) // ["test", "Two"]
```

*from:* </br>
https://useyourloaf.com/blog/swift-non-nil-values-in-an-array-of-optionals/

<!-- > -->

For this example, let's first see the results of using the `map` function on a collection with mixed data types. The `Int($0)` closure takes an individual string from numbers with $0 and attempts to convert it to an integer with the
`Int()` initializer, which might return `nil` (since it’s an optional) – so its return type is `Int?`.

```swift
let numbers = ["5", "42", "nine", "100", "Bob"]
let result = numbers.map({ Int($0) })

print(result) // [Optional(5), Optional(42), nil, Optional(100), nil]

```
<!-- > -->

As a result, the return type of the mapping transformation is [Int?] – an array of optional integers:

```swift
[Optional(5), Optional(42), nil, Optional(100), nil]
```

<!-- > -->

Let's apply the `compactMap(_:)` function to the same array:

```swift
let numbers = ["5", "42", "nine", "100", "Bob"]
let result = numbers.compactMap({ Int($0) })

print(result) // [5, 42, 100]
```

<!-- > -->

`compactMap(_:)` automatically removes `nil` elements from the returned array, and the return type of the `compactMap(_:)` function is a non-optional array:

```Swift
[5, 42, 100]
```

*from:* </br>
https://learnappmaking.com/swift-flatmap-compactmap-how-to/

<!-- Monads are any type of *container* you can call `flatMap` on.

In Swift, you can define `flatMap` for a type, the type can be called a Monad.

Arrays and Optionals are examples of Monads.

You can also define `flatMap` for other types, such as functions, tuples, reactive cocoa signals, the Result type, and many more... -->

<!-- > -->

## Practice Playground

Complete the Functional Playground

<!-- > -->

#### FP in Swift: Best Practices

1. **Follow The Concepts**

Your functions should have a clear input and a clear output with no global side effects such as mutating objects.

So, use the Swift equivalents of FP Functors, Monads, etc.: Higher-Order Functions like `map`, `filterMap`, etc.

<!-- > -->

2. **Avoid Mutable State**

Use `lets` instead of `vars` when dealing with data. Functional code is less prone to bugs and easier to understand than imperative code.

`Enums` are especially powerful in Swift because cases can have associated values. This kind of type (known as a `sum` type) are common in functional languages.

<!-- > -->

Using `value types` (structs) and `protocols` instead of classes helps you avoid mutable state. This can lead not only to much safer and easier to maintain code, but also to performance gains in computationally intensive parts of the program.


<!-- > -->


3. **Readability First**

Readability takes priority over complexity and cleverness.

Complicated things can be broken down into smaller, simpler things: break code down into smaller, pure functions, which can be used several times throughout the project.

<!-- > -->

4. **Don’t fight the iOS Frameworks**

Swift is not a purely functional programming language and we always need to deal with Cocoa Touch frameworks that are mostly designed according to OOP principles.

Achieving a goal of no global side effects is not possible a great deal of the time due to how the Cocoa Touch frameworks are set up.

<!-- > -->

## After Class

1. Research (for light familiarity):

- Category Theory
- Functional Programming:
  - Currying
  - Partial Functions
  - Eager vs Lazy Evaluation
  - Recursion
- Futures, Promises, and Promise Frameworks
- Other Swift HoFs:
  - sorted
  - zip

2.  Study the "Traversing view hierarchy" section of the post below:

[Practical functional programming in Swift - an article](https://jakubturek.com/practical-functional-programming-in-swift/)

<!-- > -->

## Additional Resources

1. [Swift Functors, Applicatives, and Monads in Pictures - an article](https://www.mokacoding.com/blog/functor-applicative-monads-in-pictures/)
1. [What is a Mondad? - article](https://www.hackingwithswift.com/example-code/language/what-is-a-monad)
1. [Videos on FP in Swift](http://2014.funswiftconf.com)
1. For curious readers, it is recommended to read the [Swift Evolution Proposal](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20151214/002736.html) and the **Higher-kinded types** section of the [Generic manifesto](https://github.com/apple/swift/blob/master/docs/GenericsManifesto.md#higher-kinded-types)
1. Book: Swift In  by Tjeerd in 't Veen
1. Book: Functional Swift by Chris Eidhof, Florian Kugler, and Wouter Swierstra
