<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->

# Protocols

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/09-POP/README.html ':ignore')

<!-- > -->

## Warmup - Review of UIKit

**Q1:** What view would you use to display information that doesn't fit on the screen? Select all that apply

1. UIView
1. UILabel
1. UIScrollView <!--correct-->
1. UITableView <!--correct-->

<!-- v -->

**Q2:** Which view or control allows the user to enter a single line of text? Which one allows the user to enter multiple lines of text?

1. UITextField <!--single-->
1. UITextView <!--multiple-->

<!-- v -->

**Q3:** Which of the following allows you to execute code for a specific control event? Which allows you to access properties on a specific view or control?

1. IBAction <!--execute code-->
1. IBOutlet <!--access properties-->

<!-- > -->

## Agenda

- Intro to Protocols
- Protocols vs Inheritance
- Protocols in the Swift Standard Library

<!-- > -->

## Learning Objectives

- Create and use Protocols
- Distinguish between **Protocol Conformance** and **Inheritance**
- Use protocols to describe properties and behaviors of a conforming type
- Identify common protocols in the Swift Standard Library

<!-- > -->

## What are we trying to solve?

<p class="fragment fade-in">We start with class inheritance.</p>
<p class="fragment fade-in">We realize we need more functionality in one class from two other classes.</p>
<p class="fragment fade-in">We need multiple inheritance. Not supported 😟</p>
<p class="fragment fade-in">Passing around classes can cause unexpected behavior. We want to avoid this as much.</p>
<p class="fragment fade-in">Tight coupling.</p>

<!-- > -->

## Protocol

Protocols are another type in Swift. 🙃

But **they don't create any instances**. Instead, they **define a blueprint** of methods, properties, and other requirements that other types need to implement.

A protocol can be adopted by a class, structure, or enumeration.

Any type that satisfies the requirements of a protocol is said to **conform** to that protocol.

<!-- v -->

**Protocols are similar to contracts.**

A contract is a guarantee that some terms will be satisfied. ✍🏼

Anything on the contract becomes a set of obligations to whoever gets it.

<!-- whiteboard mini diagram -->

<!-- v -->

```swift
protocol FullName {
  var fullName: String {get}
  func printToConsole()
}
```

<aside class="notes">
This protocol indicates that any class, struct or enum that conforms to it, needs a property called fullName. And it is get only. This means we can only read it after we give an initial value.

We can declare methods in a protocol but notice we don't define any implementation for them. A protocol makes no assumption about the implementation details of any type that conforms to it.
</aside>

<!-- v -->

```swift
struct Person: FullName{
    var fullName: String
    func printToConsole() {
        print(fullName)
    }
}

var author = Person(fullName: "Haruki Murakami")

struct Person: FullName{
    var firstName: String
    var lastName: String
    var fullName: String {
      return "\(firstName) \(lastName)"
    }
    func printToConsole() {
        print(fullName)
    }
}

var author = Person(firstName: "Haruki", lastName: "Murakami")
```

<aside class="notes">
Conforming to a protocol looks like class inheritance but it isn’t. Structs and enumerations can also conform to protocols with this syntax.

If a class inherits from another and also conforms to a protocol, all can be separated by commas and the inheritance comes first.
</aside>

<!-- > -->

## Mini challenge

Create a protocol `Perimeter` that defines a read-only property `side` of type `[Double]`.

<!-- > -->

## Mini challenge

Implement `Perimeter` with structs representing `Square`, and `Circle`.

<!-- > -->

## Mini challenge

Add a circle and a square to an array, print their perimeters.

<!-- > -->

## Walkthrough

[Walkthrough](https://github.com/Product-College-Labs/protocols-introduction-ios/archive/master.zip)

<!-- > -->

## Mini challenge

1. Create a model of a car, it should have:
  - max speed
  - number of wheels
  - doors
  - model  

<!-- v -->

2. Generalize the car, create a model for a vehicle which will represent all vehicles, a truck, motorcycle & bus are vehicles

3. Create a model(struct) and instances of each a truck, motorcycle and bus.

<!-- > -->

## Jigsaw activity 🧩

Swift uses protocols extensively. We won't learn every single aspect of the Swift standard library, it makes no difference in our code's performance. But we can benefit from being familiar with several commonly used protocols.

In groups of X, get together to research about one of the following protocols. **One per group.**

- [Sequence Protocol](https://swiftdoc.org/v4.2/protocol/sequence/)
- [Collection Protocol](https://swiftdoc.org/v4.2/protocol/collection/)
- [Equatable Protocol](https://swiftdoc.org/v4.2/protocol/equatable/)
- [Hashable Protocol](https://swiftdoc.org/v4.2/protocol/hashable/)
- [CaseIterable Protocol](https://swiftdoc.org/v4.2/protocol/caseiterable/)

<!-- have students number themselves from 1 to 5 and then make groups, it's ok if in the end some groups are smaller -->

<!-- v -->

Make sure everyone understands how they work and **individually prepare an example in a playground**. (it can be the same for everyone in the group).

Also **make sure you can explain in words what it does, it might be helpful to have notes.**

It will be thanks to your contribution that others can learn about what you researched.

<!-- v -->

- Now split the group. Go and find people who did the other protocols.

- We should have groups with people who know about all of them.

- Take turns to have each person explain their protocol and show the example.

- By the end of the activity you should be familiarized with all 4 protocols thanks to your peers. 😀

<!-- > -->

Any questions?

<!-- > -->

## Mini challenge

Given the Artist struct below, implement the Equatable protocol. You'll define what makes two instances equal.

```swift
// Used by Artist to determine style of Artist
enum Style: String {
    case impressionism
    case surrealism
    case cubism
    case popArt
}

struct Artist {
    let name: String
    let style: Style
    let yearBorn: Int
}

// Example instances of Artists, use for testing your equatable
let monet = Artist(name: "Monet", style: .impressionism, yearBorn: 1840)
let dali = Artist(name: "Salvador Dali", style: .surrealism, yearBorn: 1904)
let andy = Artist(name: "Andy Warhol", style: .popArt, yearBorn: 1928)

```

<!-- > -->

## After class

Continue working in your final project.

<!-- > -->

## External resources

1. [Iterator](https://developer.apple.com/documentation/swift/iteratorprotocol)
1. [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
1. [Protocols - article](https://medium.com/ios-os-x-development/how-protocol-oriented-programming-in-swift-saved-my-day-75737a6af022)
1. [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID521)
