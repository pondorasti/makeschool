<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->

<!--TODO: Type Casting-->

# Object Oriented Programming with Swift

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/08-OOP/README.html ':ignore')

<!-- > -->

## Agenda

- OOP
- Classes
- Inheritance
- Initializers
- Activity

<!-- > -->

## OOP

OOP is a programming paradigm that represents the concept of **objects** that have **attributes** to describe them and can perform certain procedures known as **methods**.

When you learn about it you can read and write code easier and you will have a better understanding on how Swift works.

<!-- > -->

## Classes

Classes are reference types and can be used to support traditional OOP.

They introduce inheritance, overriding and polymorphism. These features require we know about initialization, class hierarchies, and other aspects.


<!-- v -->

- Using classes we can model data.
- Initializers allow us to set the initial state of a class.
- Variables and Constants that live in the scope of the class are referred to as *instance variables*
- The *self* keyword used in class is used to refer to the current instance.

<!-- v -->

```swift
class Person {
    // Instance variable
    let name: String

    // Initializer, setting instance variables of Person
    init(name: String) {
        self.name = name
    }
}
```

<!-- v -->

### Creating an instance

You create an instance of the class `Person`

```swift
let eddy = Person(name: "Eduardo")
```

<!-- v -->

### Scope

Classes encapsulate variables and functions.

Variables that live at the top level of the class are **global** to the class. That means they can be accessed by functions in the class.

```swift
class Person {
    let name: String

    init(name: String) {
        self.name = name
        let age = 20
    }

    func sayHello() {
        print("Hi, I'm \(self.name)")
        print("I'm \(age) years old") //This won't work, why?
    }
}
```

<!-- > -->

### Inheritance

```swift
class BandMember: Person {
  var songs: [String] = []

  func performedSong(_ song: String)
    print("Performed: \(song)")
    songs.append(song)
  }
}
```

We indicate inheritance by writing the name of the class, colon, and the name of the class being inherited.

A Singer is a subclass of Person and automatically gets the properties and methods in the Person class.

<!-- v -->

```swift
let adriana = Person(name: "Adriana")
let elton = BandMember(name: "Elton")

adriana.firstName
elton.firstName  
elton.performedSong("Tiny Dancer")
```

A class that inherits from another class is known as a **subclass** or **derived class**, and the class from which it inherits is known as a **superclass** or **base class**.

<!-- v -->

### Rules for inheritance

- A Swift class can inherit from *only one other class*
- No limit to the depth of subclassing, we can subclass from a class that is also a subclass.

```swift
class Person {
...
}

class BandMember: Person {
...
}

class Singer: BandMember {
...
}
```

<aside class="notes">
A chain of subclasses is called a class hierarchy. Here the hierarchy would be BandMember -> Singer -> Person.
</aside>

<!-- > -->

## Override

```swift
class BandMember: Person {
  var songs: [String] = []

  func performedSong(_ song: String) {
    print("Performed: \(song)")
    songs.append(song)
  }

  override func sayHello(){
    print("Hi, I'm \(nam,e), I'm in a band.")
  }
}
```

Subclasses can override methods defined in their superclass.

<!-- > -->

## Super

```swift
class Singer: BandMember {
    override func performedSong(_ song: String) {
      super.performedSong(song)
      print("And also kept audience hyped.")
    }

    override func sayHello(){
      print("Hi, I'm \(name), I'm a singer.")
    }
}
```
The super keyword is similar to self, but it will invoke the method in the nearest implementing superclass. Here it will execute the method as defined in the BandMember class.

<!-- v -->

### Questions

**Q1:** Which of the following statements are true about these classes? Select all that apply:

```swift
class Scientist {}
class Geologist: Scientist {}
class Physicist: Scientist {}
class Astrophysicist: Scientist {}
```

1. `Scientist` is a base class <!--true-->
1. There is only one subclass of `Scientist`
1. `Geologist`, `Physicist`, and `Astrophysicist` are all descendants of `Scientist` <!--true-->
1. `Astrophysicist` does not inherit from `Scientist`

**Q2:** Why does the following code give an error?

```swift
class Scientist {
    func performCalculation() {}
}

class Physicist: Scientist {
    func performCalculation() {}
}
```

<!--missing override keyword-->

<!-- > -->

## Initializers

Initializers are special methods we call to create a new instance. They omit the func keyword and even a name. Instead, they use init.

<!-- v -->

### Default/Designated initializer

Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.

```swift
class Person {
  var name: String

  init(name: String) {
    self.name = name
  }

  func sayHello(){
    print("Hello")
  }
}
```

<!-- v -->

A designated initializer must call the initializers from its immediate superclass.

```swift
class BandMember: Person {
    var songs: [String] = []
    var instrument: String!

    init(name: String, instrument: String) {
      super.init(name: name)
      self.instrument = instrument
    }

    func performedSong(_ song: String) {
        print("Performed: \(song)")
        songs.append(song)
    }
    override func sayHello(){
        print("Hi, I'm \(name), I'm in a band.")
    }
}

```

<!-- v -->

### Convenience initializer

Convenience initializers must call the designated initializer for its class.

```swift
class BandMember: Person {
    var songs: [String] = []
    var instrument: String!
    var genre: String?

    init(name: String, instrument: String) {
      super.init(name: name)
      self.instrument = instrument
    }

    convenience init( name: String, genre: String, instrument: String) {
        self.init(name: name, instrument: instrument)
        self.genre = genre
    }

    func performedSong(_ song: String) {
        print("Performed: \(song)")
        songs.append(song)
    }
    override func sayHello(){
        print("Hi, I'm \(name), I'm in a band.")
    }
}

```

<!-- > -->

## Hotel activity

[Instructions](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/08-OOP/hotel.md)

<!-- > -->

## Final classes

If we have a class that we don't want to subclass ever, we use the `final` keyword.

When we declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior.

```swift
final class Person {
  ...
}
```

<!-- > -->

## Type Casting

Type casting is a way to **check the type of an instance**, or to **treat that instance as a different superclass or subclass** from somewhere else in its own class hierarchy.

Type casting in Swift is implemented with the is and as operators.

<!-- > -->

```swift
let peopleArray = [BandMember(name: "someName", genre: "Jazz", instrument: "Sax"),
              Singer(name: "someName", instrument: "mic"),
              Singer(name: "someName", instrument: "guitar"),
              Singer(name: "someName", instrument: "drums")]

var singerCount = 0

for person in peopleArray{
    if person is Singer{
        singerCount += 1
    }
}
```

<!-- > -->

## Downcasting

A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes.

Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (**as?** or **as!**).

<!-- > -->

```swift
for person in people {
    if let singer = person as? Singer {
        print(singer.name)
    }
}
```

<!-- > -->

## Review Questions: `as?` and `as!`

**Q1:** When you conditionally downcast from one type to another and store the value in a `constant`, which combination of keywords can you use? _Select all that apply_

1. `as?` <!--correct-->
1. `as!`
1. `is`
1. `if let` <!--correct-->

<!-- > -->

**Q2:** When is it appropriate to use the `as!` operator?

1. When you need to unwrap an optional
1. When you need to convert a value to an `Any` type
1. When you need to downcast from one type to another, on the condition that the type is valid
1. When you need to downcast from one type to another, and you can guarantee the type is valid <!--correct-->

<!-- > -->

## Use Cases

OOP in iOS development:

- Handle data (creating Models used in the app)
- Handle logic modules
- Create UI (how UIKit is built)

<!-- > -->

## After Class - Lab

- [OOP Lab - Optional](https://github.com/MakeSchool-Tutorials/Intro-Object-Oriented-Programming-Playground/archive/master.zip)
- Look up what are static properties
- Loo up Type Casting for `Any` and `AnyObject`
- Begin [Magic 8 ball tutorial](https://www.makeschool.com/academy/track/learn-how-to-build-apps--magic-8-ball)

<!-- > -->

## Additional Resources
1. [Documentation for Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
1. [Type Casting](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html
1. [Rules of initializers](https://useyourloaf.com/blog/adding-swift-convenience-initializers/)
