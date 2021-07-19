# FEW 1.2 Class 9

Solving problems and researching documentation. 

## Intro

Reading the documentation is key to working with any library. The only reason you understand the code you write is because you wrote it. 
No one expects you to understand what parameters are required for 
a method that you have never heard of.

This is why documentation exists. 

## Objectives 

- Use Inheritance with JS
- Build Objects from other Objects with Extends

## OOP

A class allows you to wrap all of the functions and variables, this the actions and data required by a system, into a single element called an object. 

Objects are great because they encapsulate, store methods and properties in one place. They are also reproducible, that is you can as many instances of an object from a class as you might need. 

Together these last two points are why it's worth learning Object 
Oriented Programming. 

## Extending Classes === Inheritence

A Class needs to be generic enough to use but this can also be frustrating when a class either doesn't do enough, it's too generic, or does too much and is so specific it can't be reused. 

Inheritance to the rescue! Any class can be extended. By extending a 
class you are making a new Class that gains all of the properties and methods from the other class. 

### Why extend a class? 

When you find you are writing two or more classes that are not the same
but share features you can write a base class they both share. This allows you to make changes to the base functionality of both classes in
one place. 

In some cases, you may have a class that has basic features you need, 
but you want to add more features. This is a good time to extend that class. 

In the beginning, you may find it more complex to puzzle out which class
is responsible for which piece of functionality. Later when you are more comfortable with inheritance you'll appreciate being able to make changes to a whole group of classes in a single location. 

### Example

For example, imagine the BreakOut game. You might have created classes
for the Ball, Brick, and Paddle. These each need properties `x` and `y`. 

```JavaScript
class Ball {
    constructor() {
        this.x = 0
        this.y = 0
    }
}

class Brick {
    constructor() {
        this.x = 0
        this.y = 0
    }
}

class Paddle {
    constructor() {
        this.x = 0
        this.y = 0
    }
}
```

These implementations have a lot of duplication. You can save yourself
some trouble by adding a superclass lets call it Sprite, that Ball, 
Brick and Paddle inherit from. 

```JavaScript
class Sprite {
    constructor() {
        this.x = 0
        this.y = 0
    }
}
class Ball extends Sprite {
    constructor() {
        super()
    }
}

class Brick extends Sprite  {
    constructor() {
        super()
    }
}

class Paddle extends Sprite  {
    constructor() {
        super()
    }
}
```

Here the `x` and `y` properties are defined in one place. The other classes
declare that they `extend Sprite`. A class that extends another class must call `super()` in its constructor! Calling super is essentially
calling the `constructor()` in the superclass, Sprite in this case. 

If the constructor requires parameters you'll have to include them in 
`super()`. For example, if out implementation wanted to include values 
for x and y when the class was initialized we might: 

```JavaScript
class Sprite {
    constructor(x = 0, y = 0) {
        this.x = 0
        this.y = 0
    }
}
class Ball extends Sprite {
    constructor(x, y) {
        super(x, y)
    }
}

class Brick extends Sprite  {
    constructor(x, y) {
        super(x, y)
    }
}

class Paddle extends Sprite  {
    constructor(x, y) {
        super(x, y)
    }
}
```

Here every subclass takes `x` and `y` in the constructor and passes these on
to the superclass. The superclass includes a default value in case these values are missing. 

## Extending Phaser's classes

Phaser's classes exist for you to use. You can use them as is. 

In some cases, they also may not have all of the functionality that you might need for your uses. In these cases, you can add new properties and methods by creating a new class that extends one of the Phaser classes. 

### Extending Phaser.Scene

Phaser games are made up of Scenes. A scene represents one view of a game. A game might have a scene for preloading, 
a scene that displays a menu, and a scene to play the game. 

Each of these scenes would need custom code that is unique to each. A good way to organize code around this is to create custom classes that extend Phaser.Scene. 

## Challenges 

- Refactor the tutorial code to use inheritance
    - Move Scenes into their own file creating a class that extends Phaser.Scene. 
    

