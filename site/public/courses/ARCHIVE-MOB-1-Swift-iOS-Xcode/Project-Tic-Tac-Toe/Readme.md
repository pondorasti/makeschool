# TicTacToe

Today, we are starting a new project in class: A TicTacToe game. In this project, we want to apply what we learned last week about sizing and positioning `UIView` instances by creating a _custom UI component_ for the game. We also revisit the `delegate` pattern, as the custom UI component will need some generic way to talk to other objects.

With this project, once again, we particularly focus on a proper implementation of the MVC architecture! 

![TicTacToe Board](tictactoe.png)

## Building a custom UI component and adhering to MVC

When implementing the game, we are going to build a _custom UI component_. Generally, we need custom UI components when the classes in `UIKit` are not enough for our needs. 


#### No `UIBoardView` in `UIKit`

Looking at the requirements for our TicTacToe game, we obviously need some component on our user interface that can represent a TicTacToe board (i.e. a 3x3-grid) and is able to receive touch events that indicate it where the board was tapped. However, when checking the available classes in `UIKit`, we unfortunately won't find a `UIBoardView` class that gives us this functionality, so we need to build it ourselves! Note that one might think, that a `UICollectionView` could be used to display board on the UI. While certainly feasible, this approach is not appropriate at all in such a case. `UICollectionView` is a class that has been built and optimized to display a _collection_ of things (just like `UITableView`), using it to display a 3x3-grid is vastly inappropriate.


#### Reusability

When building a custom UI component, _reusability_ is very important. We need to minimize the dependencies of our custom view, in particular it must not know anything about the **Model** or the **Controller** (i.e. no name of a type from the **Model** or the **Controller** may appear in the source code of our custom view). Think about it like this: In theory, the `BoardView` you're about to build should work in _any_ iOS project. Imagine you want to build another game that uses some kind of a board (e.g. _Connect Four_, _Chess_,...) but has different rules and maybe even a different size of the grid that represents the board. You wouldn't want to rebuild your `BoardView` from sratch every time, rather it would be neat if it was possible to configure it in such a way that it _adapts_ to the new environment because of the way it was implemented.


#### Delegation

As we can't know anything about a **Controller** class inside the `BoardView`, but still need to communicate to some other component when touch events happen, the `BoardView` will need a `delegate` object that it can send messages to and inform it which field inside the grid has been tapped.

This way, the `BoardView` can be _plugged in_ to any other project, and any class can become the `BoardView`'s `delegate` and handle the touch event to decide what should happen next.


#### Public API

Think about what the _Public API_ of this component should look like. _How_ can other classes (e.g. view controllers) interact with it? What kind of messages should they send to the the class? What needs to happen?

The term _API_ stands for _Application Programming Interface_. Nowadays, we mostly refer to Web APIs when using this term, but in fact every piece of code that we write has an API, i.e. an interface that defines how to interact with it. When talking about the _API_ of a class, we refer to its _methods_ and _properties_ that can be used by other classes. Everything that is not essential to the usage of the class from the outside, should be _hidden_ (i.e. `private`) from the outside world. Hiding implementation details from other classes is called [_encapsulation_](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)). The purpose of encapsulation is to make sure that our class is used in the right ways by its users and that nobody can accidentally break it because they changed some implementation details that we rely on.


## Using a Playground to implement individual parts

Rather than starting with a new Xcode project right away, we are going to use Playgrounds again to build the main functionality of the app.

In particular, we are going to approach the project as follows:

1. Build a `BoardView` class in Playground ([Video](https://youtu.be/t8CdNn0wOBw))
2. Implementing the game logic for the TicTacToe game in a Playground, this part also includes building the right **Model** ([Video](https://www.youtube.com/watch?v=8j-R9gcUQjw))


## Hints

1. We somehow need to build a _grid_. Consider this resource [challenge 4](https://github.com/MakeSchool-18/iOS-MVC/blob/master/1130-w/view-challenges.playground/Resources/challenge4.png)
2. Use `UILabel` rather than `UIView` to represent the individual fields of the grid, this way you can easily display the `X` and `O` that represent the players' moves (remember that `UILabel` is a _subclass_ of `UIView` and thus can be sized and positioned exactly live a `UIView`).
3. You can use `view.layer.borderWidth` and `view.layer.borderColor` to draw a border around a `view`.
4. When building the **Model**, think about when you can use `enum`s.
5. Use `UITapGestureRecognizer` in the `BoardView` to receive touch events.