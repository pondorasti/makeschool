# Object-Oriented Programming Part 2: Inheritance

## [Slides](https://docs.google.com/presentation/d/19HYyz1AGeSLnHCxKNOOT7YEiKMbBLFf0QChq1-8TiVI/edit?usp=sharing)

## Learning Objectives
By the end of this lesson, students will be able to:
- Appreciate why encapsulation and inheritance with OOP are useful in software design
- Map OOP concepts onto code structures and translate code into OOP terms
- Implement code utilizing classes, objects, properties, and methods
- Refactor repetitive code to use classes inheriting superclass behaviors
- Override methods inherited from superclass to customize subclass behaviors

## Encapsulation
- Teacher talk: Motivate how encapsulation helps program structure (5 min)
- Think, pair, share: Everyday examples of classes and objects (5 min)
- I do, we do, you do: Code examples that use classes and objects (30 min)
  - Defining a class: `class Tiger`
  - Instantiating an object: `tony = Tiger('Tony')`
  - Accessing a property: `tony.name`
  - Defining a method: `Tiger.eat(food)`
  - Calling a method: `tony.eat('fish')`

Break (5 min)

## Inheritance
- Teacher talk: How inheritance allows code reuse and customization (5 min)
- Think, pair, share: Examples of superclasses and subclasses (5 min)
- I do, we do, you do: Code examples that use class inheritance (30 min)
  - Defining a superclass: `class Animal`
  - Class inheritance: `class Tiger(Animal)` and `class Giraffe(Animal)`
  - Method overriding: `Giraffe.eat(food)`
  - Polymorphism: `animal.eat('meat')`
- Pair program on challenges listed below (25 min)

## Resources
- Al Sweigart's article [Why OOP is Useful with a Role Playing Game Example][OOP RPG]
- Jessica Hamrick's accessible [Introduction to Classes and Inheritance in Python]
- TK's articles covering Object Oriented Programming in Python:
  - [Part 1: Classes, Objects, Attributes & Methods][OOP Python 1]
  - [Part 2: Encapsulation & Inheritance][OOP Python 2]

[OOP RPG]: https://inventwithpython.com/blog/2014/12/02/why-is-object-oriented-programming-useful-with-a-role-playing-game-example/
[Introduction to Classes and Inheritance in Python]: http://www.jesshamrick.com/2011/05/18/an-introduction-to-classes-and-inheritance-in-python/
[OOP Python 1]: https://medium.com/the-renaissance-developer/python-101-object-oriented-programming-part-1-7d5d06833f26
[OOP Python 2]: https://medium.com/the-renaissance-developer/python-101-object-oriented-programming-part-2-8e0db3ddd531

## Challenges
- Complete pages 3-4 of the [Superhero Team Dueler] tutorial:
  3. Inheritance and Weapon Class, Running Unit Tests
  4. Team Attack and Defense, Build Armor Class

[Superhero Team Dueler]: https://make.sc/superhero-team-dueler
