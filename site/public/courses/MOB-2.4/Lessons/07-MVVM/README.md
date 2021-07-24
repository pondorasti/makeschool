<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# MVVM

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/07-MVVM/README.html ':ignore')

<!-- > -->

<!-- INSTRUCTOR:
1) For the QuizLet Game in the Initial Exercise:
- the URL is https://quizlet.com/_6hmrxi

2) For Activity 1:
- is just diagraming on boards
3) for Activity 2:
- use starter app listed in exercise
-->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe:
- the **MVVM** architectural pattern
- the problems it is intended to solve
- potential use cases for it
3. Assess the trade offs (pros/cons) inherent in choosing high-level (MVC, MVVM, etc.) design patterns
4. Implement basic examples of MVVM explored in this class


<!-- > -->

### Model-View-ViewModel

**MVVM** is a __*Structural*__ pattern which introduces a *fourth* component to MVC...


*the* __*View Model.*__

<!-- > -->

The idea behind the MVVM pattern is that any **View** *with business logic specific to itself* should be backed by a **View Model** that represents and handles the data for such view.

<!-- > -->

In MVVM, we implement *presentational* business logic in the __*ViewModel*__.

We would do this before in the View or in the Controller.

<!-- > -->

### A Brief History

MVVM was invented by Microsoft architects Ken Cooper and Ted Peters specifically to simplify **event-driven** programming of user interfaces.

MVVM was designed to make use of data binding functions in WPF (Windows Presentation Foundation) to better facilitate the separation of view layer development from the rest of the pattern, by removing virtually all GUI code ("code-behind") from the view layer.

<!-- > -->

### Components of MVVM

It can be seen as an extension of MVC's primary intent: separating the View from the Model and utilizing the Controller as a central "manager" between View and Model.

MVVM takes the principle of **Separation of Concerns** one step further &mdash; it adds a __*special layer*__ between the View and the Model (called the View Model) which __*allows Controllers to delegate data presentation responsibilities to the View Model.*__

<!-- > -->

![mvvm](mvvm.png)

<!-- > -->

Here is how the major components of MVVM relate to each other (and to MVC):

**View** &mdash; Responsible for displaying visual elements and controls on the screen. Typically, subclasses of `UIView`. </br>
(Same as in MVC)

<!-- > -->

**Model** &mdash; Objects that hold app data; typically, structs or simple classes. (Same as in MVC)

<!-- > -->

**View Controller** &mdash; In MVVM, VCs still set up UIView objects, but *they do not interact with the model.* Instead, the VC uses the View Model as a *mediator* and asks for what it needs in a format that will be ready for presentation. In MVVM, Controllers should have absolutely no business logic.

<!-- > -->

**View Model** &mdash; Transforms Model data into values that can be displayed on a View. Sits between the View Controller and Model. Can be a class or a struct,  but it is **typically a class** so that references of the same instance can be passed around in code.

<!-- > -->

### Problems Addressed

Share in the chat:

- Why do you think developers turn to this architecture?

- What are some limitations you've noticed while using MVC?

<!-- > -->

MVVM can be used to solve two related development issues:

**"MVC: Massive View Controller"** &mdash; In MVC, where do you put functionality that does not belong neatly in either the View or the Model?

iOS developers are too often tempted to use View Controllers as a "catch-all" component for such code, which results in bloated View Controllers.

<!-- > -->

__*Example*__ </br>
Data formatting is a common task. Imagine your app needs data &mdash; dates, currency, etc. &mdash; *formatted differently* for various user locales.

The data is stored in the Model layer, and the View displays the formatted data.

**But which component should be responsible for formatting the data?**

<!-- > -->

Implementing MVVM, the View Model could handle data formatting, freeing up the View Controller to do its primary job:

Responding to `viewDidLoad()` and other View lifecycle events, handling callbacks, and so on.

<!-- > -->

**Tight Coupling Between MVC Components** &mdash; In the following code snippet, assume that each reusable cell will be populated with data from separate user records when the `configureWithUser(_:)` function is executed:

```swift
    var userCell = tableView.dequeueReusableCellWithIdentifier("identifier") as UserCell
    userCell.configureWithUser(user)
```

In this design, the cell (the View) is configured directly with the Model, violating MVC guidelines. </br>

<!-- > -->

You could refactor it by configuring the cell from the Controller, which might follow MVC, but will increase the size of the Controller.

Such a problem might not be evident until you implement Unit Testing. Because the __*Controller is tightly coupled with the View,*__ it becomes __*difficult to test*__ due to the added complexity of mocking up views and their life cycles and keeping them all in sync with the Model.

<!-- > -->

With MVVM, the business logic required to supply presentation data to the View can be separated from View layout code.

When the View Model knows nothing about View layout, testing each - separately or together - is much easier.

<!-- > -->

## Identifying MVVM - 20 min

In pairs, check out [this project](https://github.com/amelinagzz/mvvm-notes).

1. **Complete** the only TODO pending in the project.

1. [Jamboard Link](https://jamboard.google.com/d/11kLepZI3XqhEYFh83bLxxSppFTI2A7NAbnt4f6oLscA/edit?usp=sharing) **Draw a diagram** to demonstrate what elements act as the Model, View Model and View.

1. **Describe the responsibilities** of each component, below their names.

1. **Identify the role** played by callbacks.

<!-- > -->

### Benefits

1. __*Separation of Concerns*__

<aside class = "notes">
MVVM can create a much clearer separation of concerns between Model, View and Controller providing several advantages:

It allows developers to break an app into smaller components, which facilitates easier debugging, testing, and code readability.

Due to the decoupling of UI and business logic, the MVVM design pattern results in more flexible code. 

MVVM can go a long way to solve the "Massive View Controller" problem by decreasing the code size of View Controllers by delegating some of a VC's tasks to a View Model.
</aside>

2. __*Testability*__

<aside class = "notes">
MVVM makes it easy to test the logic behind the views. By moving a ViewController’s business logic into a ViewModel it becomes much easier to create unit tests of the business logic and the View layout code.
</aside>


<!-- > -->

### Pitfalls of MVVM

- Hard at first to figure out components and responsibilities.
- Overkill for simple apps
- Generalizing ViewModel becomes harder as an app grows.
- Data binding in large apps can result in considerable memory consumption.

<!-- > -->

### When to Use MVVM

Use MVVM when you need to transform models into another representation for a View, especially in situations which require several model-to-view transformations.

For example, you can use a View Model to:

- configure a table cell
- transform a Date into a date-formatted String
- transform a Decimal into a currency-formatted String

<!-- > -->

### View Model - A Closer Look

Note that using a **View Model** is actually an example of the __*Mediator pattern.*__

**View Models** are:
- an abstraction of the view exposing public properties and commands.
- classes that take objects and transform them into different objects which can be passed into the view controller and displayed on the view.
- especially useful for converting computed properties - such as a Date or a Decimal - into a String or other data type that can be shown in a UILabel or UIView.

<!-- > -->

**Recommended Practices** </br>
When dealing with the View Model, ensure it is *as "dumb" as possible:*
- Decouple it from the View Controller as much as possible.
- Avoid tight coupling between the View Model layer and web service or data access layers.

<!-- > -->

If only using a View Model with a single View, it can be good to put all configurations and set up code into the View Model.

If you’re using __*more than one view,*__ you might find that putting all the logic in one view model complicates and clutters it.

In those cases, creating __*a separate View Model*__ specific to __*each type of View*__ might declutter and simplify the implementation (by further separating concerns).

<!-- > -->

### Bindings

The View Model provides a set of interfaces, each of which represents a UI component in the View. We can use a technique called __*“binding”*__ to *connect UI components to ViewModel interfaces.*

<!-- > -->

Binding refers to the **flow of information between Views and View Models**; a View directly binds to properties on the View Model to send and receive updates.

If View Model properties change, those changes can be immediately and automatically reflected on the View.

<!-- > -->

Instead of the controller of the MVC pattern, MVVM often employ a *binder,* which automates communication between the View and its bound properties in the View Model.

Most frameworks employ the __*Observer pattern*__ as the underlying binding mechanism.

<!-- > -->

### How to implement it?

The implementation of a View Model is usually straightforward:
- Identify opportunities to free up View Controllers from data formatting or other presentation tasks
- Create a View Model to handle those tasks

Whenever possible, it is recommended to implement a data binding mechanism (KVO, Notifications) to automatically **handle data state changes** between the View and the View Model.

<!-- > -->

## Implementing MVVM - 25 min

Individually complete [this activity](https://github.com/amelinagzz/mvvm-starter/tree/main)

<!-- > -->

## After Class

1. Research these related concepts:

- Event-Driven Programming
- UI Logic
- Business Logic
- Data Binding
- Data Binding and MVVM in iOS </br>
&nbsp;&nbsp;&nbsp;&nbsp; - two-way binding </br>
&nbsp;&nbsp;&nbsp;&nbsp; - one-way binding

<!-- > -->


## Additional Resources

2. [Model–view–viewmodel - wikipedia](https://en.wikipedia.org/wiki/Model–view–viewmodel)
3. [Presentation Model and Martin Fowler - an article](https://en.wikipedia.org/wiki/Martin_Fowler_(software_engineer))
4. [UI data binding - wikipedia](https://en.wikipedia.org/wiki/UI_data_binding)
5. [The Problems with MVVM on iOS - an article](http://www.danielhall.io/the-problems-with-mvvm-on-ios)
6. [From MVC to MVVM](https://www.appcoda.com/mvvm-vs-mvc/)
