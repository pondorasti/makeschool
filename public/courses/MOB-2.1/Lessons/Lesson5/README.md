<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Intro to CoreData

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson5/README.html ':ignore')

<!-- > -->

## Why you should know this

Sometimes we want the data in our apps to remain the same even when the app is relaunched, after a device restart or in the event iOS ejects the app from memory when not in active use. When data becomes large and more complex, Core Data is the way to go 😀

<!-- > -->

## Learning Objectives

1. Describe Core Data, what it is and how it works.
1. Design models to use with Core Data using Xcode's model editor.
1. Understand key concepts and components of the Core Data Stack.
1. Get started with Core Data in Xcode (add/fetch/display)

<!-- > -->

## What is CoreData?

Framework that we use to manage the **model layer objects** in an application.

It provides **generalized and automated solutions to common tasks associated with object life cycle and object graph management, including persistence.**

<!-- > -->

You can use Core Data to save your application’s permanent data for:

- Offline use
- To cache temporary data

<!-- > -->

![coredata](coredata.png)

<!-- > -->

Through Core Data’s Data Model editor, you define your data’s **types and relationships**, and **generate class definitions**.

Core Data can then manage object instances at runtime to provide the following features:

<!-- v -->

**Persistence**  

Core Data abstracts the details of mapping your objects to a store, making it easy to save data from Swift and Objective-C without administering a database directly.

<!-- v -->

**Background Data Tasks**  

Perform potentially UI-blocking data tasks, like parsing JSON into objects, in the background.

You can then cache or store the results to reduce server roundtrips.

<!-- v -->

**View Synchronization**

Core Data also helps keep your views and data synchronized by providing data sources for table and collection views.

<!-- > -->

## Is it a database then?

CoreData is a **framework** from Apple that allows you to create and describe your model objects and their relationships to one another.

Assumes responsibility for the lifetimes of these objects, ensuring their relationships are kept consistent and up to date.

<!-- > -->

Because these objects can be thought of as nodes, and their interrelationships as vertices in a mathematical graph, such a collection of objects is often referred to as an object graph.

<!-- > -->

## Object Graphs

Object-oriented applications contain complex webs of interrelated objects where objects are linked to each other by one object either owning, containing, or holding a reference to another object.

This web of objects is called an object graph — an abstract structure that can be used to describe an application's state at a particular point in time.

First and foremost, CoreData is a framework for managing an object graph.

<!-- > -->

## What it isn’t

As CoreData has been a source of much confusion, especially among new iOS developers, understanding what the framework is not goes along way toward understanding what it does and how to implement it.

<!-- > -->

### Not ORM

The framework borrows a few concepts from object-relational-mapping (ORM), but it is not a full ORM system (more on ORM later).

And, unlike an ORM, CoreData takes complete control of storage, but you do not have to describe things like foreign keys, a database schema, etc, CoreData handles all of that.

<!-- > -->

### Not A Database / Not SQLite

Though it can be used to manage a database, CoreData is much more than that: It manages, stores and reloads a complex object graph into memory.

Though it is most often used to persist data to a SQLite database, it is not tied to SQLite, and it can be used without any database at all.

When implemented to use SQLite, CoreData provides a layer of abstraction on top of SQLite that provides a convenient API for maintaining the relationships between records stored in the database.

<!-- > -->

## Where does it fit?

![mvc](mvc.jpeg)

<aside class = "notes">
In the context of Apple’s definition of MVC, CoreData fits neatly as a component of your application’s Model as it potentially constitutes an entire data layer.
</aside>

<!-- > -->

## Components

**The Managed Object** — Subclasses of NSManagedObject. Used to represent the entities in your application.


**The CoreData Stack** - Contains all the Core Data components you need to fetch, create, and manipulate managed objects.


**SQLite** — A C-language library that implements a small, fast, full-featured and highly-reliable SQL database engine.

<!-- > -->

## In Class Activity I

Read [these notes on CoreData](https://github.com/Make-School-Courses/MOB-2.1-Local-Persistence-in-iOS/blob/master/Lessons/Lesson5/assignments/notes.md) and then complete the Gradescope assignment called: CoreData Components.

<!--
[Worksheet](https://docs.google.com/document/d/19c2pzBkKVTdMj9aNBCDtRpFhIIzQOeNsLmIwzWjePtM/edit?usp=sharing)
-->

<!-- > -->

## Creating a Core Data Model
The first step in working with Core Data is to create a **managed object model**, which describes the way Core Data represents data on disk.

Here you define the structure of your application’s objects, including their object types, properties, and relationships.

<!-- > -->

By default, Core Data uses a SQLite database as the persistent store, so you can think of the Data Model as the database schema.

You can add a Core Data model file to your Xcode project when you create the project, or you can add it to an existing project.

<!-- > -->

#### Add Core Data to a New Xcode Project

In the dialog for creating a new project, select the Use Core Data checkbox.
![first](firstoption.png)

<!-- > -->


The resulting project includes an `.xcdatamodeld` file.
![result](result.png)

<!-- > -->


When we create a new project using Core Data, we get boilerplate for the `NSPersistentContainer` in the AppDelegate.

“The NSPersistentContainer consists of a set of objects that facilitate saving and retrieving information from Core Data. Inside this container is an object to manage the Core Data state as a whole, an object representing the Data Model, and so on."

<!-- > -->

#### Add a Core Data Model to an Existing Project

Choose File > New > File and select from the iOS templates. Scroll down to the Core Data section, and choose Data Model:

![second](secondoption.png)

<!-- > -->


Click Next. Name your model file, and select its group and targets.
![targets](targets.png)

An `.xcdatamodeld` file with the name you specified is added to your project.

<!-- > -->

## Core Data key terms

- **An entity** is a class definition in Core Data.

The classic example is an Employee or a Company. In a relational database, an entity corresponds to a **table**.

<!-- > -->

- **An attribute** is a piece of information attached to a particular entity.

For example, an Employee entity could have attributes for the employee’s name, position and salary. In a database, an attribute corresponds to a particular **field in a table**.

<!-- > -->

- **A relationship** is a link between multiple entities. In Core Data, relationships between two entities are called to-one relationships, while those between one and many entities are called to-many relationships.

Excerpt From: By Pietro Rea. “Core Data by Tutorials.” Apple Books.

<!-- > -->

## In Class Activity II

[Instructions here](https://github.com/Make-School-Courses/MOB-2.1-Local-Persistence-in-iOS/blob/master/Lessons/Lesson5/assignments/driver.md)

<!-- > -->

# Additional Resources
- Quoted excerpts from “Core Data by Tutorials.” By Pietro Rea.
- [CoreData stack](https://cocoacasts.com/what-is-the-core-data-stack)
