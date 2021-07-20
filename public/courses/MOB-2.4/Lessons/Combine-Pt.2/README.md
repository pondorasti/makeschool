<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Combine

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/Combine-Pt.2/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, you will be able to:

**Describe**:
- Subjects
- Back pressure

**Implement**:
- Subscriptions with operators

<!-- > -->

## Review from last class

Combine is a **declarative + reactive** framework for processing async events over time.

<!-- v -->

![components](assets/components.png)

<!-- v -->

![flow](assets/flow.png)

<!-- v -->

```swift
let _ = Just(8)
    .map { value -> String in
        // do something with the incoming value here
        return "\(value) as a string"
    }
    .sink { receivedValue in
        // sink is the subscriber and terminates the pipeline
        print("The end result was \(receivedValue)")
    }
```

<!-- > -->

## Creating a custom Subscriber

Playground Demo

[Subscriber Docs](https://developer.apple.com/documentation/combine/subscriber)

```swift
class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
    }
}
```

<!-- > -->

## Subject

A special case of publisher that also follows the [Subject protocol](https://developer.apple.com/documentation/combine/subject). 

Lets you inject values in a stream by calling a `send` method.

A way of emitting a single value whenever you say so.

<aside class = "notes">
Subjects can act as a conductor to send values from non-Combine imperative code to Combine subscribers.
</aside>

<!-- > -->

## Built-in Subjects

- 🚪🛎 [PassthroughSubject](https://heckj.github.io/swiftui-notes/#reference-passthroughsubject)
    
    Let's you publish new values on demand. They will pass along values and a completion event.

- 🏠💡 [CurrentValueSubject](https://heckj.github.io/swiftui-notes/#reference-currentvaluesubject)
    
    Lets you look at the current value of a publisher.

[Analogy](https://stackoverflow.com/questions/60482737/what-is-passthroughsubject-currentvaluesubject)

<aside class ="notes">
PassthroughSubject: When someone rings the door, you are notified if you are at home (you are the subscriber)

CurrentValueSubject: If someone turns on the lights in your house when you are out, when you get back you'll find them turned on.

</aside>

<!-- > -->

## Playground Demo

- PassthroughSubject
- CurrentValueSubject

<!-- > -->

## Playground Challenge

Blackjack hand dealer

<!-- > -->

## Transforming Operators

**Collect**

```swift
["🐊", "🦖", "🦕", "🐢", "🐍"].publisher
    .collect() //variation: specifying receiving up to a number of values
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
```

<!-- v -->

**Map**

```swift
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[8, 16, 20].publisher
    .map {
        formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: { print($0) })
```

<!-- > -->

## Filtering Operators

**Filter**

```swift
let numbers = (1...100).publisher

numbers
    .filter { $0.isMultiple(of: 5) }
    .sink(receiveValue: { n in
        print("\(n) is a multiple of 5")
    })
```

<!-- v -->

**CompactMap**

```swift
let strings = ["hey", "meh", "8","0.88", "80"].publisher

strings
    .compactMap { Int($0) }
    .sink(receiveValue: {
        print($0)
    })
```

<!-- > -->

## Combining Operators

**Append**

```swift
let publisherA = ["1️⃣", "2️⃣", "3️⃣"].publisher
let publisherB = ["4️⃣", "5️⃣", "6️⃣"].publisher

publisherA
    .append(publisherB)
    .sink(receiveValue: { print($0) })
```

<!-- v -->

**CombineLatest**

```swift
let publisherA = PassthroughSubject<String, Never>()
let publisherB = PassthroughSubject<String, Never>()

publisherA
    .combineLatest(publisherB)
    .sink(receiveCompletion: { _ in print("Completed") },
          receiveValue: { print("\($0),\($1)") })
```

<!-- > -->

## Sequence Operators

**Min**

```swift
let publisher = [100, 80, -2, 0].publisher

publisher
    .min()
    .sink(receiveValue: { print("Smallest value: \($0)") })
```

<!-- v -->

**Count**

```swift
let publisher = ["🐣", "🐣", "🐣"].publisher

publisher
    .count()
    .sink(receiveValue: { print("I have \($0) chickens") })
```

<!-- v -->

**Contains**

```swift
struct Movie {
    let year: Int
    let title: String
}

let movies = [
    (2001, "Harry Potter and the Philosopher's Stone"),
    (2002, "Harry Potter and the Chamber of Secrets"),
    (2004, "Harry Potter and the Prisoner of Azkaban"),
    (2005, "Harry Potter and the Goblet of Fire"),
    (2007, "Harry Potter and the Order of the Phoenix"),
    (2009, "Harry Potter and the Half-Blood Prince"),
    (2010, "Harry Potter and the Deathly Hallows – Part 1"),
    (2011, "Harry Potter and the Deathly Hallows – Part 2"),
]
.map(Movie.init)
.publisher

movies
    .contains(where: { $0.year == 2005 })
    .sink(receiveValue: { contains in
        print(contains ? "A HP movie was released" : "No HP movie was released that year.")
    })
```

<!-- > -->

## In-Class Activity

Challenges in Operators.playground

<!-- > -->

## After Class

Look up:
- Time manipulation operators
- Type erasure

<!-- > -->

## Additional Resources

- [Using Combine](https://heckj.github.io/swiftui-notes/#coreconcepts-publisher-subscriber)
- [Custom Subscriber](https://www.donnywals.com/understanding-combines-publishers-and-subscribers/)
- [Publishers in Combine](https://www.donnywals.com/publishing-property-changes-in-combine/)
- [Filtering Operators - examples](https://levelup.gitconnected.com/9-filtering-combine-operators-you-should-know-9c1ef2911352)
- [Transforming Operators - examples](https://medium.com/better-programming/5-transforming-combine-operators-you-should-know-4603fe112d74)
- Book: Practical Combine by Donny Walls
- Book: Combine - Asynchronous programming with Swift By Shai Mishali, Marin Todorov, Florent Pillet and Scott Gardner

