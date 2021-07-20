<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Reactive Programming (Part 3 of 3)

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/11-Reactive-ProgrammingPt.3/README.html ':ignore')

<!-- > -->

<!-- INSTRUCTOR:
1) For Activity 1:
- solutions are inline below each example/exercise
3) for Activity 2:
- Solution app is not included here...download it from source...(starter app was zipped and sent via slack)
-->


## Learning Objectives

By the end of this lesson, you should be able to...

1. Implement basic examples of:
- **UI components** (Table Views) constructed using **RxSwift** (Operators, Subjects) and **MVVM** (viewModels)
2. Identify Rx functionality in example projects and completing challenges

<!-- > -->

## Operators expanded

[Operators list](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/13-Reactive-ProgrammingPt.3/assignments/operators.md)

<!-- > -->

## In Class Activity I

[Operators activity](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/13-Reactive-ProgrammingPt.3/assignments/operators-activity.md)

<!-- > -->

### RxSwift and UI Components (Table Views)

- Rx is way to simplify the creation of interactive user interfaces and near-real-time system animation.
- In MVC architecture, Rx can facilitate changes in an underlying __*model*__ that are reflected automatically in an associated __*view.*__

**Why is this important in iOS?**

<!-- > -->

Because there is an increasingly high demand for smooth UI transitions, pixel-perfect apps, and fewer steps to populate UI widgets with user data.

And Rx lets you create amazing UI behavior without managing the state complexity of variable interactions, and with fewer lines of code.

<!-- > -->

Two critical ways that Rx helps you handle data changes to the UI properly are by using:
- **Bindings**
- **Reactive Data Sources**

<!-- > -->

#### Bindings

**Binding** &mdash; A means of keeping `model` and `view` values *synchronized* without you having to write a lot of “glue code.” It allows you to establish a mediated connection between a view and a piece of data, “binding” them such that a change in one is reflected in the other.

<!-- > -->

Binding is one of key ways that Rx enables building apps in a *declarative* way. It creates a connected relationship between two entities.

Think of those entities as:
- A "producer," which produces the value
- A "consumer," which processes the values from the producer

<!-- TODO: insert diagram -->

<!-- > -->

## The `bind(to:)` Function

The primary method for binding an observable to another entity is the `bind(to:)` function.


<!-- TODO: add other uses of bind(to:), see reference ...examples, "background tasks" -->

<!-- > -->

__*Example 1*__

When you bind an observable subscription to the `text` property, the property returns a new observer which executes its block parameter when each value is emitted.

In other words: any time the `text` property receives a new value, it runs the code `label.text = text`

```swift
Observable.combineLatest(firstName.rx.text, lastName.rx.text) { $0 + " " + $1 }
    .map { "Greetings, \($0)" }
    .bind(to: greetingLabel.rx.text)
```

<!-- > -->

__*Example 2*__

This also works with `UITableView`s and `UICollectionView`s. Here, you call `bindTo(_:)` to associate the `viewModel` observable with the code that should get executed for each row in the table view.

```swift
viewModel
    .rows
    .bind(to: resultsTableView.rx.items(cellIdentifier: "WikipediaSearchCell",
    cellType: WikipediaSearchCell.self)) { (_, viewModel, cell) in
        cell.title = viewModel.title
        cell.url = viewModel.url
    }
    .disposed(by: disposeBag)
```


<!-- Question re: Data Source - is this an example of doing that with Rx? -->

*Source:* </br>
`Why.md` in Documentation section of RxSwift library.
</br>

<!-- ### data sources

Writing table and collection view data sources is tedious. There is a large number of delegate methods that need to be implemented for the simplest case possible.  -->

<!-- > -->


## RxSwift and MVVM

When applied appropriately, the MVVM pattern can result in an app with fewer defects that is more easily tested and maintained.

Two of MVVM's primary benefits are:

- Data immutability  &mdash; Guarantees total control over updates triggered by the UI. Guards against issued caused by application *state.*
- Testability is greatly improved &mdash; With ViewModels, much of an app can be easily tested in a "headless" manner (without any views).

<!-- > -->

In MVVM, the `ViewModel` is responsible for interacting with `Model` data, applying business logic, and preparing (formatting) data for user (View) presentation.

The `ViewModel` may also execute database or network interactions.

<!-- > -->

The new role of the `View Controller` is to simply *bind* the data exposed by the `ViewModel` to the `View`. The `View Controller` also handles user interactions like button taps and gestures, notifying the `ViewModel` of those events.

Ways to implement __*data binding*__ on the `ViewModel` include:
- Delegation
- Key-Value Observing
- Reactive Programming

MVVM works especially well with RxSwift/RxCocoa because these Rx frameworks have built-in functionality that let's you bind Observables to UI components.


<!-- > -->

<!-- TODO:
- add an example. this seems ok, but Swift code needs updates:
https://stackoverflow.com/questions/46201795/rxswift-rxcocoa-and-uitableview
-->

<!-- > -->

## In Class Activity II

[MVVM & Rx](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/13-Reactive-ProgrammingPt.3/assignments/mvvm.md)

<!-- > -->

## Examples & Challenges

- Numbers
- Validation
- Table View
- Networking

<!-- > -->

## After Class

1. Research:

- `ControlPropertyType`
- `Binder`
- The `retry()` operator
- The `throttle()` operator, compared with the`debounce` operator
- What is an `Action` in Rx
- Converting Data Sources to Rx
- `Driver` (RxCocoa)

<!-- > -->

## Additional Resources

2. [What Are Bindings - from Apple docs](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CocoaBindings/Concepts/WhatAreBindings.html)  <sup>1</sup>
3. [RxDataSources - from RxSwiftCommunity](https://github.com/RxSwiftCommunity/RxDataSources)
4. [Driver - from RxSwift documentation](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Traits.md#driver)
<sup>2</sup>
5. [A Practical Intro to RxSwift - an article](http://adamborek.com/practical-introduction-rxswift/)
6. [Build an App with RxSwift and MVVM - an article](https://medium.com/textileio/build-your-first-set-app-using-mvvm-and-rxswift-5a37d027950f)
7. [Rx Resources Repo](https://github.com/DroidsOnRoids/RxSwiftExamples)
8. [RxSwift repo](https://github.com/ReactiveX/RxSwift)
