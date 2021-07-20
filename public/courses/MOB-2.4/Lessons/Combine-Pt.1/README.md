<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Combine

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/Combine-Pt.1/README.html ':ignore')

<!-- > -->

▶️ Watch this before the lesson:

[Combine - Video introduction](https://developer.apple.com/videos/play/wwdc2019/722/)

<!-- > -->

## Learning Objectives

By the end of this lesson, you will be able to:

Describe:
  - Reactive programming
  - Marble diagrams
  - Combine as a framework and it's main components
  - Basic operators
  - Lifecycle of a stream

<!-- > -->

## Reactive Programming

Reactive Programming can be thought of as the practice of programming with **asynchronous** data streams, or __*event streams.*__

<!-- > -->

### Event Streams

An event stream is a **sequence of events** happening over time.

An **asynchronous data stream** is a stream of data where values are *emitted*, one after another, with a delay between them, and without blocking program flow to wait for results.

And because the stream is asynchronous, the data emitted can appear anywhere in time.

<!-- > -->

## Combine

A framework that provides a declarative Swift API for processing values over time.

These values can represent many kinds of asynchronous events.

[Docs](https://developer.apple.com/documentation/combine)

<!-- > -->

## Core Concepts

- [Publisher](https://developer.apple.com/documentation/combine/publisher) and [Subscriber](https://developer.apple.com/documentation/combine/subscriber)

- Operators

- [Subjects](https://developer.apple.com/documentation/combine/subject)

<!-- > -->

## Publisher

- Described as a protocol
- **Provides data when available and upon request**
- A publisher that has not had any subscription requests will not provide any data
- Has two associated types: one for **Output** and one for **Failure**
- Value types

<aside class="notes">
The idea of publishers is so generic that we can represent any data: making calculations, exxecuting and handling network calls, reacting to user input, displaying data, etc.
</aside>

<!-- > -->

## Subscriber

- Responsible for **requesting data and accepting the data** (and possible failures) provided by a publisher
- Has two associated types: one for **Input** and one for **Failure**
- Reference types (usually act and mutate state upon receipt of values)

<!-- v -->

## Built-in Subscribers

- [Assign](https://heckj.github.io/swiftui-notes/#reference-assign) - let's us **bind** the result to some property in our model or on a UI control via a key path.
- [Sink](https://heckj.github.io/swiftui-notes/#reference-sink) - let's us pass closures and completion handlers (you can do anything here 😎)

<!-- > -->

<img src="https://heckj.github.io/swiftui-notes/images/diagrams/input_output.svg">

Publishers and subscribers are meant to be connected, and make up the core of Combine.

<aside class="notes">
When you connect a subscriber to a publisher, both types must match: Output to Input, and Failure to Failure.
</aside>

<!-- > -->

## Subscription

We need a [Subscription](https://developer.apple.com/documentation/combine/subscription) How does it work? 

A subscriber activates the publisher. Note that publishers won't emit values if there are no subscribers.

When you successfully create a subscription it can almost work on it's own.

A subscription will get activated when an event occurs (gestures, timers, etc.) and then a publisher reacts to the event.

</aside>

<!-- > -->

## Memory management

There is no need to manually memory manage subscriptions. The protocol `Cancellable` is used to indicate that the return object of a subscription is `Cancellable`. 

When that object is released from memory, the entire subcsription is cancelled and memory resources are released. 🗑

<!-- > -->

## Coding examples

Playground Demo for Publishers & Subscribers

<!-- > -->

## Operator

- An object that acts both like a subscriber and a publisher
- Classes that adopt both the Subscriber protocol and Publisher protocol
- They support subscribing to a publisher, and sending results to any subscribers
- Can be chained to process, transform data

<aside class="notes">
Operators focus on handling data they receive from a previous operator and give an input to the next one in the pipeline. This means there is no shared state.
</aside>

<!-- > -->

<img src="https://heckj.github.io/swiftui-notes/images/diagrams/pipeline.svg">

<!-- > -->

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

<aside class="notes">
The pipeline starts with the publisher Just, which responds with the value that its defined with (in this case, the Integer 8). The output type is <Integer>, and the failure type is <Never>.

The pipeline then has a map operator, which is transforming the value and its type. In this example it is ignoring the published input and returning a string.

This is also transforming the output type to <String>, and leaving the failure type still set as <Never>.
The pipeline then ends with a sink subscriber.
</aside>

<!-- > -->

When creating pipeline like the previous example we are often selecting **operators** to help transform the data, types, or both to achieve an end goal. That end goal might be:

- enabling or disabling a user interface element
- retrieving some piece of data to be displayed

<!-- > -->

## Marble Diagrams

Focus on describing how a specific pipeline changes the stream of data.

<img src="https://heckj.github.io/swiftui-notes/images/diagrams/marble_diagram.svg">

<aside class="notes">
A publisher is generating and sending data, operators are reacting to that data and potentially changing it, and subscribers requesting and accepting it.

On top of that, some operators may change the timing when events happen. We can illustrate these changes with a visual description called a marble diagram.
</aside>

<!-- v -->

## How to Read Marble Diagrams

- The name of the operator in in the center
- Lines above and below represent data moving through time
    - Time travels from left to right
    - Top line = input
    - Bottom line = output

<!-- v -->

- Symbols on the lines represent data
- If symbols are different, they mean data is of different types

<!-- v -->

- An X means an error or exception occurred
- A vertical bar means the stream terminated normally

<!-- > -->

## Diagrams + code

Whiteboard explanation 🤓

<!-- > -->

## In Class Activity

**5 min read, 10 min share**

Visit [this website](https://rxmarbles.com) that has marble diagrams for some operators in Rx.

- Choose one operator and understand what it does
- Be ready to share your explanation in class

<!-- > -->

## Why Combine?

Now that you've been introduced to Combine, what's one benefit of using it over "standard code"? 🤔

- Write your answer in the chat 

<!-- v -->

- Combine is integrated on the system level
- Handling asynchronous operations can become reusable
- Operators are composable
- Can be used in any architecture

<!-- > -->

## After Class

Check out the Subscription protocol, specifically the `request` method. It takes in a value for demand. What is this? Research the meaning of it and how it relates to a concept called **Backpressure**. 

We saw we can use `Just` to emit single values to a subscriber. Research what `Future` does.

<!-- > -->

## Additional Resources

- [Using Combine](https://heckj.github.io/swiftui-notes/#coreconcepts-publisher-subscriber)
- Book: Practical Combine by Donny Walls
- Book: Combine - Asynchronous programming with Swift By Shai Mishali, Marin Todorov, Florent Pillet and Scott Gardner
