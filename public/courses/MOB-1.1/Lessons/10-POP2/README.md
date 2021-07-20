<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->
# Protocols

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/10-POP2/README.html ':ignore')

<!-- > -->

## Agenda

- Recap on Protocols in Swift Standard Library
- Benefits using Protocols
- Extensions
- Pair-programming activity

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

- Work with extensions
- Use Protocols and Inheritance to build a character creation system
- Identify pros and limitations of protocols

<!-- > -->

## Recap on Protocols activity from last class

<!-- using mini whiteboards, have students write what protocol the code snippet relates to -->

```swift
let howManyTrees = Tree.allCases.count
//4
```
<p class="fragment fade-in">CaseIterable Protocol</p>

<!-- v -->

```swift
let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
let home = StreetAddress("1400", "16th Street")
print(addresses[0] == home)
```

<p class="fragment fade-in">Equatable Protocol</p>

<!-- v -->

```swift
let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}
```
<p class="fragment fade-in">Hashable Protocol</p>

<!-- v -->

```swift
let bugs = ["Ant", "Spider", "Mantis", "Fly", "Caterpillar"]
for bug in bugs {
    print(bug)
}
```
<p class="fragment fade-in">Sequence Protocol</p>

<!-- v -->

```swift
let text = "Hello, hello, hello again."
if let firstComma = text.firstIndex(of: ",") {
    print(text[..<firstComma])
}
```
<p class="fragment fade-in">Collection Protocol</p>

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

//This is what we want to achieve, being able to compare artists like:

monet == dali //returns true? false?

```

<!-- > -->

## Benefits observed

What are some benefits you've seen so far about using protocols?

<p class="fragment fade-in">Behavior similar to multiple-inheritance</p>
<p class="fragment fade-in">Adopted by classes, structs & enums</p>
<p class="fragment fade-in">Value types = less risk</p>

<!-- > -->

## Extensions

Extensions add new functionality to an existing class, structure, enumeration, or protocol type.

- Add computed properties
- Define methods
- Provide new initializers
- Make an existing type conform to a protocol

<!-- v -->

Protocols can be extended to provide methods, initializers, and computed property implementations to conforming types.

This **allows us to define behavior on protocols themselves**, rather than in each type’s individual conformance.

<!-- v -->

```swift
extension FullName {
    func printUppercase(){
        print(fullName.uppercased())
    }
}

var me = Person(firstName: "Haruki", lastName: "Murakami")
me.printUppercase()
```

<!-- v -->

### Providing default functionality

```swift
extension FullName {
    func printToConsole(){
        print(fullName)
    }
}

var me = Person(firstName: "Haruki", lastName: "Murakami")
me.printToConsole()
```

<!-- Demo what happens if we delete the implementation of the method in the struct. And also if the extensions prints something different. When it overrides? -->

<!-- > -->

### Food for thought

How to know when to use a subclass and an extension?

<!-- > -->

# BREAK (10 min)

<!-- > -->

## Checkpoint

<p class="fragment fade-in">What is a protocol in Swift?</p>
<p class="fragment fade-in">What does it mean when a class conforms to a protocol?</p>
<p class="fragment fade-in">Why is there a limitation when using OOP when it comes to inheritance?</p>
<p class="fragment fade-in">How do protocols solve this limitation?</p>

<!-- > -->

## In Class Activity

In pairs, go over the following activity where you'll use inheritance and protocols to build the characters of a game.

[RPG Game](https://github.com/Product-College-Labs/oop-rpg/archive/master.zip)

<!-- > -->

## Additional Resources

1. [Sets](https://swiftdoc.org/v4.2/type/set/#func-isstrictsubset-of_-set-set-element-element)
1. [Hashable protocol](https://swiftdoc.org/v4.2/protocol/hashable/)
1. [CaseIterable protocol](https://swiftdoc.org/v4.2/protocol/caseiterable/)
1. [Sequence protocol](https://swiftdoc.org/v4.2/protocol/sequence/)
1. [Collection protocol](https://swiftdoc.org/v4.2/protocol/collection/)
1. [Equatable protocol](https://swiftdoc.org/v4.2/protocol/equatable/)

<!-- v -->

1. [POP usage with UIKit](https://academy.realm.io/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/)
1. [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
1. [Article about protocols](https://medium.com/@abhimuralidharan/all-about-protocols-in-swift-11a72d6ea354)
1. [Article on POP](https://medium.com/nsistanbul/protocol-oriented-programming-in-swift-ad4a647daae2)
1. [More on Protocols](https://dev.to/abelagoi/protocol-in-swift-with-practical-examples-3iif)
1. [StackOverFlow answer](https://stackoverflow.com/questions/38827265/class-extension-vs-subclassing-in-swift)
