<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Building a Network Layer

## [Slides](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/Slides/Lesson9/README.html ':ignore')

<!-- > -->

## Why you should know this

As a professional iOS developer, you will want to...

1. Design and implement code that:
- Is organized and easy to understand
- Is easy for you and your team mates to debug, extend and maintain

2. Demonstrate to potential employers your understanding of best practices for organizing code, as well as core programming principles and design patterns.

<!-- > -->

## Learning Objectives

At the end of this class, you should be able to...

1. Design and construct a network layer that optimizes:
  - modularity and reusability
  - maintainability
  - extendability
2. Demonstrate understanding of key application design principles:
  - Separation of Concerns (SoC)
  - Code reuse

<!-- > -->

## Design Principles

As a design pattern, MVC seeks to promote two important design principles fundamental to OOP:

1. **Separation of Concerns (SoC)** - modular approach to constructing an application in which code can be separated into logical sections, each addressing separate areas of functional behavior (concerns).

 - MVC can separate content from presentation, and data-processing (model) from content.
 - Service-oriented design can separate concerns into services.

<!-- > -->

 2. **Reusability** - If correctly implemented, view and model layers can easily be composed of reusable, modular components.

<!-- > -->

### Project Organization

Structure and organization are key contributors to effective modularized architecture. Creating groups folder is a great place to start.

*Controllers, views, and model are only suggestions - feel free to name yours whatever makes sense in your project.*

<!-- > -->

![syntax](assets/project_folders.png)

<!-- > -->

### Service Objects

The core component of an API Layer is the **Service** or **API object.**

This object's job is to:
- **Fetch, post and process** data to and from the target web services
- **Serialize JSON** data for manipulation and presentation
- Provide constructs for **handling the successful or failed** state of web service requests and responses

<!-- > -->

## The Request Builder

The **Builder** design pattern is a type of **Creational** design pattern that is used to create complex objects step-by-step.

It offers:
- **Flexibility** - Can easily create different representations of the same complex object
- __Simplicity__ - It simplifies the creation of a complex object

<!-- > -->

HTTP request methods GET, POST, DELETE, and so on, are constructed using parameters common to them all.

HTTP requests offer a prime opportunity to employ the Builder pattern to create different types of request objects with commonly shared parameters.

<!-- > -->

Instead of rewriting the parameters for a separate request object for each HTTP method, a more efficient design is to design a single **RequestBuilder** object.

It reuses the commonly shared request parameters, then call a separate function on the RequestBuilder object to create a request for a GET or a POST, respectively.

<!-- > -->

## Moviefy App

This tutorial goes over creating a networking layer using a version ofthe builder patter to create requests.

[Moviefy Tutorial](https://www.makeschool.com/mediabook/oa/tutorials/moviefy-app-004/getting-started/)

<!--
Two approaches:

[Moviefy base implementation](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson9/assignments/moviefy-base.md)

[Moviefy generic implementation](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson9/assignments/moviefy-plus.md)

Suggestion: Do both in order to identify how they differ.
-->

<!-- > -->

## Additional Resources

- [Separation of Concerns (withJSONObject) - from Wikepedia](https://en.wikipedia.org/wiki/Separation_of_concerns)
- Apple on JSONSerialization Reading and Writing Options:</br>
- [Writing Options - from Apple](https://developer.apple.com/documentation/foundation/jsonserialization/writingoptions)
- [Reading Options - from Apple](https://developer.apple.com/documentation/foundation/jsonserialization/readingoptions)
- [Writing a network layer - Protocol Oriented](https://medium.com/flawless-app-stories/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908)
- [Writing network layer](https://medium.com/@rinradaswift/networking-layer-in-swift-5-111b02db1639)
