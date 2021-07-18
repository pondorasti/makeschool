<!-- .slide: class="header" -->

# Choosing an architecture

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/03-Selecting-an-Architecture/Lesson2.html ':ignore')

<!-- https://docs.google.com/document/d/1Qo3Llmfjttfu-LPMCjeuR4iRy2WWS_mG_Pt8Xa8nPh4/edit -->

<!-- > -->

## Agenda

- Overview of your current architecture
- Inheritance-Based Architecture
- Component-Based Architecture
- State Machines

<!-- > -->

## Learning Objectives

1. Identify and describe the pros and cons of the most popular iOS game architectures, including:
  - Inheritance-Based
  - Component-Based
  - State Machine
2. Refactor (implement) an existing code base into:
  - Component-Based architecture
3. Examine a simple State Machine using GameplayKit

<!--

## Initial Exercise

In preparation for today's activities...

1. Let's review progress of the assignment from end of last class

- In your AstroJunk app, you should now have class files for your Spaceship, Meteor, and Debris elements

2. Volunteers to showcase their work on AstroJunk so far, especially their organization of class files listed above...

-->

## Common iOS Game Architectures

Though there are more than a few software design patterns which *could* be useful for a given game app, only a small set are commonly used for iOS game app development.

In this lesson, we will explore the high-level design concepts, benefits, and shortcomings of the patterns most commonly-used to make iOS game apps.

<!-- > -->

### Inheritance-Based Architecture

In an inheritance-based (or "hierarchy-based") architecture, each game object is a **subclass** of a more general **base class**, and all game objects ultimately derive from this initial base class.

<!-- v -->

The first step in this architecture is to define a single base class common to all game objects. (As a standard convention, the base class is often named "GameObject")

The `GameObject` base class can be designed with all the **behaviors and properties** common to any and all game objects, especially general tasks such as being updated every frame.

<!-- v -->

Once you have your `GameObject` class, all other game objects then inherit properties and behaviors from `GameObject`, though subclasses can also be customized to suit their own specific needs.

![inheritance-based](assets/inheritance-based.png)

<aside class="notes">
Note that though your `GameObject` is not required to extend either `SKNode` or `SKSpriteNode`, but doing so is a very common form of the inheritance-based layout used in iOS games.
</aside>

<!-- > -->

### Example

<aside class="notes">
The following three classes together illustrate a simple example of using an inheritance-based game architecture. In this example, the `Princess` and `Dragon` subclasses each inherit and override the `update(deltaTime:)` function from the base class (`GameObject`), along with whatever custom behaviors and properties the `Princess` and `Dragon` subclasses need themselves.
</aside>

```swift
class GameObject: SKSpriteNode {
    func update(deltaTime : Float) {
       // 'deltaTime' is the number of seconds since update() was called last
      // Override this function in subclasses to update the object state
      //(i.e., changes in position, direction, etc.)
    }
}
```

<!-- v -->

```swift  
class Princess: GameObject {
    // Set initial amt of spells and magic powers
    var magicPowersRemaining : Int = 20
    // some other game object this object is interacting with
    var target : GameObject?

    override func update(deltaTime: Float) {
        super.update(deltaTime: deltaTime)
        // Do Princess-specific update tasks
    }
}
```

<!-- v -->

```swift
class Dragon: GameObject {
    // Set initial amt of fire units
    var firePowerRemaining : Int = 40
    // some other game object this object is interacting with
    var target : GameObject?

    override func update(deltaTime: Float) {
        super.update(deltaTime: deltaTime)
        // Do Dragon-specific update tasks
    }
}
```

<!-- v -->

It is also quite common with this pattern to create subclasses of `GameObject` for each specific type of game element in your game.

For example, if your game has dragons, ogres, harpies, and cyclops, all with common traits, creating a subclass of `GameObject` of type `Monster` or `Creature` will allow you to add behaviors common to all those elements, while still inheriting all the generic behaviors from the same `GameObject` base class.

<!-- v -->

**Benefits**

One key advantage of a game layout based on an inheritance hierarchy is that each object can stand on its own. In our example above, all of the behaviors of a `Princess` object live inside that single object, without needing any other object to do the work of a `Princess` element.

Inheritance-based architecture is also:
- the simplest to implement
- built on familiar concepts (object/class inheritance)

<!-- v -->

**Drawbacks**

An inheritance-based layout works fine and is easy to implement for simple games.

But in practice, as your game grows in complexity, an inheritance hierarchy begins to create its own set of challenges.

<!-- v -->

- Ending up with a hierarchy of different game object subclass types that are multiple levels deep, which can be difficult to keep track of as you expand your code base.
- Your initial `GameObject` base class evolves as you add elements, but moving more and more code to the base class makes it long and difficult to work with.

<!-- v -->

- You might find that not all game elements should derive from the same generic base class &mdash; *i.e., should weapons really derive from the same base class as creatures?*
- Code for various game "systems" &mdash; such as a drawing function or collision detection &mdash; is all mixed together in the same object hierarchy.

<!-- > -->

### Component-Based Architecture

The basic idea behind component-based architecture &mdash; otherwise known as an "Entity Component System" &mdash; is to prefer **composition** over inheritance.

It seeks to eliminate the problems of deep and wide inheritance hierarchies that are difficult to understand, maintain and extend.

<!-- v -->

In a component-based architecture, *all* of your game objects (Entities) are derived from the same initial base class, but they are **defined** by what **components** they have *not* by the type of subclass from which they inherit.

<aside class="notes">
Each game object (Entity) has a list of components. When the game updates, or the object is added to or removed from the game &mdash; or when some other game event occurs &mdash; the object notifies each component in its component list of the event.
</aside>

![component-based](assets/component-based.png)

[Source](http://cowboyprogramming.com/2007/01/05/evolve-your-heirachy/)

<!-- v -->

The first step in a component-based design is to create a base `Component` class:

```swift  
class Component {
    // The game object this component is associated with
    var gameObject : GameObject?
    func update(deltaTime : Float) {
        // Update this component
    }
}
```

<!-- v -->

Next, create a base class for game objects which holds a collection of all components associated with a given object of any game element:

```Swift  
class GameObject {
    // The list of Component objects belonging to this object
    var components : [Component] = []
        func update(deltaTime : Float) {
          // Update this object by updating all of its components
            for component in self.components {
                component.update(deltaTime: deltaTime)
          }
      }
        // And other functions,  to add and remove components...
}
```

<!-- v -->

Then, you can create specific components as customized subclasses of `Component`, subclass `GameObject` to create new Entity objects, and define each Entity object's gameplay capabilities by assigning it its own specific set of components.

<!-- TODO: useful to add examples of these last 3 steps here? -->

<!-- v -->

**Benefits**

Component-based architecture is the most commonly used architecture in game app development.

In this architecture, game objects (Entities) are reduced to simple structures that serve primarily to connect various functional components, which can really boost game production.

<!-- v -->

Here are key reasons why:

**Scalability**

Whenever you need to add new features or change the way some feature works, all you need to do is to create a new component. No fussing with class hierarchies or dependencies.

And new types of entities can be created on-the-fly (programmatically) without developer input.

<!-- v -->

**Re-usability**

Rather than re-using code in super-classes, you re-use code by giving similar entities similar components.

Since components are self-contained, they can be interchanged to create new entities.

You can also take components from one game and put them into another extremely easily.

<!-- v -->

**Flexibility**

A component-based layout means you can be more flexible with your design and not worry about inheritance issues.

It also lends itself well to different kinds of games and different strategies of storing and representing entities.

<!-- v -->

**Consistency**

When all your game entities are instances of the same class, and all of your functionality has a standardized interface, you can avoid all of the hassle of inheritance trees and dependency diagrams and focus on your core game functionality.

[Source](https://www.raywenderlich.com/2806-introduction-to-component-based-architecture-in-games)

<!-- v -->

**Drawbacks**

The drawback of component-based architecture is the increase in Level Of Effort required:

- Initially &mdash; At the start of development, you will need to create more base classes than you likely would for inheritance-based.
- As your game grows &mdash; It takes more effort to create multiple copies of an object because you need to create and add the same set of components each time you want a new copy.

<aside class="notes">
Note that Apple’s GameplayKit framework provides a set of classes that allows you to easily construct your own entity-component system. Hang tight, we'll be learning more about the GameplayKit framework shortly...
</aside>

<!-- > -->

## In Class Activity

Implementing a component based architecture.

Starter code will be given.

<!--
So far, we've applied very little thought to the architectural design of the game objects in your AstroJunk app. We could say that we've only applied some generic OOP concepts to it &mdash; or maybe just the very basic tenets of MVC.

**TODO:**
Your assignment is to apply what you've learned so far about inheritance-based architecture to your AstroJunk app code base by refactoring your game objects so that they now derive from an initial base class:

1. Create a `GameObject` base class
- Decide on your own what functionality, generic to all game objects, should be present in this base class
2. Create new versions of your game object classes (meteor, debris, and so on) in which each new game object class now extends from the `GameObject` class itself
3. Run your code ...

__*Result:*__ Your code should behave exactly as it did before you refactored it! The only difference should be that your game objects now derive from the `GameObject` class.

<!-- TODO: Add questions here about: 1) is it now easy to add other game objects? 2) what would be the effect if you needed to add <something complex that will cause you to have to rework your base class and all classes derived from it> ? -->

<!-- > -->

## State Machines

When developing games, at some point we will encounter the need to work with finite state machines.

**What is a FSM?**

*“A structure that allows to define complex behaviors.”*

This means we can define complex behaviors and encapsulate them in a single object that we call state. Each state should describe a very simple action.

<!-- v -->

The easiest way to visualize state machines is by drawing FSM diagrams.

Let’s start with a basic example: a button. This button can have two states: Pressed and Released. To track this logic we could use a boolean.

This boolean enables us to track two states.

```swift
class somebutton:UIButton{
  let isPressed = false
    if(isPressed){
      //the button has been pressed, do something
    }else{
      //the button has been released do something else
    }
}
```

<!-- v -->

![buttonStates](assets/button.png)

The arrows show the relation between the two states. You can move from one state to the other at any given time.

<!-- > -->

## In Class Activity

Now let’s say we have something a little more complex. The movement of a main character in a game. That can do these:
- Be standing
- Jump (with single tap)
- Attack in middle of jump (with double tap)
- Duck (with long press)

Draw how you would represent this with a FSM diagram.

<!-- v -->

These are the main points:

- We have a fixed set of states that the machine can be in. Standing, jumping, attacking and diving.
- The machine can only be in one state at a time. The character can’t be jumping and standing at the same time.
- A sequence of inputs is sent to the machine.These events are the long presses and taps.
- Each state has a set of transitions, each associated with an input and pointing to a state. When an input comes, if it matches a transition for the current state, the machine changes to that state.

<!-- > -->

## State machines - the coding part

When we start building a game it’s easy to put all the state-dependent code in one place. For example, in the `update` method. As you can already imagine, as our game grows, it becomes more complex and harder to maintain there.

In code we could translate this to 4 booleans to represent the 4 states. But think about what this would imply moving forward:
- A lot of if-else statements to check the current state
- Possibly land in some bugs by mistakenly setting any combination of booleans wrong.

<aside class="notes">
What could really help is to define all the different states in the game and the rules that determine which transitions between states should be allowed. By using a state machine to organize code, we can more easily reason about complicated behaviors in the game.
</aside>

<!-- > -->

**GameplayKit** has a ready to use solution for state machines that we can take advantage of.

We can see how it works with [this example of a water dispenser](https://developer.apple.com/library/archive/samplecode/Dispenser_GameplayKit/Introduction/Intro.html#//apple_ref/doc/uid/TP40016460).

Take some time to go over the sample project with a partner to see how State Machines were used.

<aside class="notes">
The game simulates a water dispenser that can only be in one state at a time out of these: empty, full, partially full, serving or refilling. In this case using a state machine makes it easy to enforce this restriction and helps organizing the game logic of each specific state (how the graphics move, what to enable/disable, etc.)
</aside>

<!-- > -->

Analyze:
- What are all the possible states?
- What happens in each state?
- How are transitions between states handled?
- Does it matter what the previous state was before entering a new one?
- How is is possible that we can't get multiple glasses of water on screen?
- Why can't we request a glass when the dispenser is empty?
- What something you would add to the simulation?

<!-- v -->

## In Class Activity

Diagram a state machine for your game (SpaceJunk). Then as a stretch challenge implement in in code.

<!-- > -->

# After Class

1. Review or read about:
  - [Game mechanics - wikipedia](https://en.wikipedia.org/wiki/Game_mechanics)
  - [Entities and Components - from Apple docs](https://developer.apple.com/library/archive/documentation/General/Conceptual/GameplayKit_Guide/EntityComponent.html)
  - [The Command Pattern - MOB 2.4 Lesson 3](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/03-Behavioral-PatternsPt.1/Lesson3.md)
  - [The Command Pattern - an article](https://gameprogrammingpatterns.com/command.html)
  - [The Observer Pattern - MOB 2.4 Lesson 4](https://github.com/Make-School-Courses/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/blob/master/Lessons/04-Behavioral-PatternsPt.2/Lesson4.md)
  - The Strategy Pattern

<!-- TODO: find a version of this tutorial in Swift ...NOT Obj-C...

- [Introduction to Component Based Architecture in Games - A Ray Wenderlich tutorial](https://www.raywenderlich.com/2806-introduction-to-component-based-architecture-in-games)

-->

<!-- > -->

## Additional Resources

1. [State machines with GameplayKit](https://developer.apple.com/library/archive/documentation/General/Conceptual/GameplayKit_Guide/StateMachine.html)
2. [Entity component system - wikipedia](https://en.wikipedia.org/wiki/Entity_component_system)
3. [GameplayKit - from Apple docs](https://developer.apple.com/documentation/gameplaykit)
4. [Entity Component System - an article](http://www.roguebasin.com/index.php?title=Entity_Component_System)
5. [Refactoring Game Entities with Components - an article](http://cowboyprogramming.com/2007/01/05/evolve-your-heirachy/)
6. [Software design pattern - wikipedia](https://en.wikipedia.org/wiki/Software_design_pattern)

<!-- v -->

7. [Design Patterns: Elements of Reusable Object-Oriented Software](https://en.wikipedia.org/wiki/Design_Patterns)
- An extremely important book in the field of software development. Co-written by the "Gang of Four" (not the British punk rock group of the same name)
8. [Top 5 Design Patterns in Swift for iOS App Development - an article](https://rubygarage.org/blog/swift-design-patterns)
9. [Basic Parent-Child Concepts in Sprite Kit](http://spritekitlessons.com/child-basics-in-sprite-kit-adding-removing-finding/)
10. [FSM](https://gamedevelopertips.com/finite-state-machine-game-developers/)
11. [FSM](https://gameprogrammingpatterns.com/state.html)
12. [Component based arch](https://www.oreilly.com/library/view/ios-swift-game/9781491920794/ch01.html)
