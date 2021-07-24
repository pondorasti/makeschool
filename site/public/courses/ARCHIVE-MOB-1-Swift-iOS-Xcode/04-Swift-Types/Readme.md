# Swift Types

## Objectives

- Identify Swift types
- Discuss the value and use of types
- Use Swift's types to model/structure your code efficiently
- Understand the difference between value and reference types

## Vocabulary 

- Type(s)


## Class Material

Download and go through:

[Swift Playgrounds - Functions](Functions.playground)

[Swift Playgrounds - Enums & Pattern Matching](enums.playground)

[Slides - Swift Types](swift-types.key)

Read:

[Apple Documentaton - Types](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Types.html)

[Apple Documentation on Value and Reference Types](https://developer.apple.com/swift/blog/?id=10)

## Swift Types - Enums, Structs, Classes, Protocols

At the heart of Swift is its type system. This makes Swift safe and fun to write because the compiler catches logical error at compile time.

Swift gives you, the programmer the ability to create your own types made out of an aggregate of basic types.

**Basic named types**:

- Enums
- Structs
- Classes
- Protocols

**Aggregate types**:

- Functions(Closures)
- Tuples

Primitive types in Swift are composed of these basic types. Take a look at type signature for the Int, Double, Float type in Swift.

```swift
public struct Int : SignedInteger, Comparable, Equatable {}
```

Swift's standard library (a collection of useful functionality we use when building software in swift) is also made up of these basic types.

## Value Types vs Reference Types

Read: 

[Apple Documentation on Value and Reference Types](https://developer.apple.com/swift/blog/?id=10)

## Review

1. What is the difference between a class and a struct?
2. When will you use a class vs a struct?
