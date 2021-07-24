<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# 📜 Day 11: Design Patterns

<!-- > -->

### ⏱ Agenda

1. [[**05m**] 🏆 Objectives](#05m-%f0%9f%8f%86-objectives)
2. [[**10m**] ☀️ Warm Up](#10m-%e2%98%80%ef%b8%8f-warm-up)
3. [[**30m**] 📖 Overview: Common Design Patterns](#30m-%f0%9f%93%96-overview-common-design-patterns)
4. [[**30m**] 💻 Activity: Pick a Pattern](#30m-%f0%9f%92%bb-activity-pick-a-pattern)
5. [[**10m**] 🌴 BREAK](#10m-%f0%9f%8c%b4-break)
6. [[**35m**] 💻 Activity: MakeUtility Project](#35m-%f0%9f%92%bb-activity-makeutility-project)
7. [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

<!-- > -->

## [**05m**] 🏆 Objectives

1. Define what a design pattern is, and why they are frequently useful.
2. List many different design patterns along with their specific purposes.
3. Create real-world examples of different popular design patterns.

<!-- > -->

## [**10m**] ☀️ Warm Up

- What is a design pattern?
- List all the design patterns you've heard of or implemented.

We'll discuss this together before starting our overview.

## [**30m**] 📖 Overview: Common Design Patterns

### Design Patterns

- Used to represent some of the best practices adapted by experienced object-oriented software developers.
- Systematically names, motivates, and explains a general design that addresses a recurring design problem in object-oriented systems.
- Describes the problem, the solution, when to apply the solution, and its consequences.
- Gives implementation hints and examples.

### Object Creation Patterns

#### Singleton

[Singletons](http://tmrts.com/go-patterns/creational/singleton.html) restrict the instantiation of a type to a single object.

#### Factory Method

The [Factory Method](http://tmrts.com/go-patterns/creational/factory.html) pattern allows creating objects without having to specify the exact type of the object that will be created.

### Structural Patterns

#### Decorators

The [Decorator](http://tmrts.com/go-patterns/structural/decorator.html) pattern allows extending the function of an existing object dynamically without altering its internals. Decorators provide a flexible method to extend functionality of objects.

### Messaging Patterns

#### Publish-Subscribe

[Publish-Subscribe](http://tmrts.com/go-patterns/messaging/publish_subscribe.html) is a messaging pattern used to communicate messages between different components without these components knowing anything about each other's identity.

It is similar to the Observer behavioral design pattern. The fundamental design principals of both Observer and Publish-Subscribe is the decoupling of those interested in being informed about Event Messages from the informer (Observers or Publishers). Meaning that you don't have to program the messages to be sent directly to specific receivers.

To accomplish this, an intermediary, called a "message broker" or "event bus", receives published messages, and then routes them on to subscribers.

## [**30m**] 💻 Activity: Pick a Pattern

1. Choose a partner.
2. Together, choose a pattern we discussed, or pick one from [this list](http://tmrts.com/go-patterns/).
3. Implement the pattern using a real-world example.
4. Add comments that describe how the pattern works.
5. Slack your code out to the class channel.

## [**10m**] 🌴 BREAK

## [**35m**] 💻 Activity: MakeUtility Project

Continue working on your project!

## 📚 Resources & Credits

- [Go Patterns](http://tmrts.com/go-patterns/#creational-patterns)
- [Geeks for Geeks: Design Patterns](https://www.geeksforgeeks.org/software-design-patterns/) - Definition / overview.
