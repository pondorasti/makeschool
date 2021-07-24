# Advanced Swift - Generics, Enums, Protocols

### Objectives
- Generic functions
- Generic enums
- Protocols with associated types
- Generics with type contraints

## Generics
> Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

Swift standard library is made up of structs, enums, protocols and generics

Generics are very powerful and allow us to express our intent in a simple manner.

### Problems solved by Generics



## Generic Functions

```swift
func<T>()
```

// Equatable
```swift
func !=<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return !(lhs == rhs)
}
```

## Generic Enums


## Protocols with Associated Types
It is a way to achieve generics with protocols

```swift
protocol Animal {
    associatedType Food = String
}
```

## Type Constraints on Generics & Protocols

We can also constrain our generic code for specific instances

**Example:**

```swift
protocol Popable {
    func pop()
}

extension Popable: where Self: UIView {
    func pop() {
        // Animation code
        UIView.animate.... {
            self.transform = ///some transform
        }
    }
}
```

Here we are only allowing instances of UIView to be able to conform to the Popable protocol


## Discussion

1. How can generics infuence our code?
2. In terms of pagination, can you think of a way to solve pagination using Generics?


## Summary

