<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Realm

## [Slides](https://make-school-courses.github.io/MOB-2.1-Local-Persistence-in-iOS/Slides/Lesson10/README.html ':ignore')

<!-- > -->

## Why you should know this

We spent time learning about how Core Data works, building our own Core Data Stack and learning how it works under the hood. It's good to know there are other options that will give us the same results with maybe less effort and with a certain level of freedom.

One of this options is Realm, and we'll see how to add it to our projects to get the same results as we did with Core Data.

<!-- > -->

## Learning Objectives

1. Describe how Realm works and it's ties with Core Data.
1. Implement CRUD methods using Realm.
1. Design a solution for an app using Realm.

<!-- > -->

## Realm

Realm is a cross platform database(iOS, Android, Web). It can be used in place of CoreData for persisting data in iOS. It was designed to be faster and more efficient than other solutions.

<!-- > -->

### Why Realm?

- Easy set up.
- Easy to solve queries.
- Thread safe.
- Reactive architecture to always show updated data.
- Widely used.

<!-- > -->

### Core Data vs Realm

| **Feature**     | **Core Data**  | **Realm**      |
| --------------- | -------------- | -------------- |
| Easy to set up  | -              | XX             |
| Speed           | X              | XX             |
| Crossplatform   | -              | XX             |
| Thread safe     | X              | X              |
| Documentation   | X              | XXX            |
| DB Management   | External tools | Realm studio   |

<!-- > -->

## Realm walkthrough

**Installation**

Download Realm here(Manual, Cocoapods, Carthage)

[Realm Download](https://realm.io/docs/swift/latest#installation)

<!-- > -->

## Realm

A **Realm** is an instance of a Realm Mobile Database container.<br>
Realms can be in *memory, synchronized or local.*

- In-memory Realms have no persistence mechanism (temporary storage)
- Synchronized Realms sync with other devices (shopping carts, chats).
- Local

<!-- > -->

A Realm is not:
- A single application-wide database. We can have multiple Realms to organize data more efficiently.
- A table. Tables typically store one kind of information, a Realm can have multiple kinds of objects.

<!-- > -->

## QuickStart

https://docs.mongodb.com/realm/sdk/ios/

<!-- > -->

## Realm online tutorial

For further practice you can go to the documentation and follow [this tutorial](https://docs.mongodb.com/realm/tutorial/ios-swift/) to create a task manager app.


## External Resources
- [Realm vs Core Data](http://www.rockersinfo.com/blog/realm-database-vs-coredata/)
- [Realm's Data Models](https://realm.io/docs/data-model)
- [More on Realms](https://realm.io/docs/swift/latest/#realms)
- [Realm's notifications](https://realm.io/docs/swift/latest/#notifications)
- [On finding the Realm file](https://stackoverflow.com/questions/28465706/how-to-find-my-realm-file)
- [Tutorial & first activity](https://rollout.io/blog/realm-database-tutorial-get-started-quickly-swift/)
