## The components of Core Data

### The Managed Object
An NSManagedObject instance implements the basic behavior required of a Core Data model object.

An instance of NSManagedObject requires two elements:
- an entity description (an NSEntityDescription instance)
- a managed object context (an NSManagedObjectContext instance)

## The CoreData Stack
CoreData is composed of a collection of objects often referred to as the CoreData Stack.

The stack is composed of one or more managed object contexts connected to a single persistent store coordinator, which is in turn connected to one or more persistent stores.

Minimally, it contains:<br>
**Managed Object Model** — Describes the entities in the stores<br>
**Managed Object Context** — The object used to create and fetch managed objects and to manage undo and redo operations<br>
**Persistent Store Coordinator** — Aggregates all the stores.<br>
**Persistent Object Store** — Maps between records in the store and objects in your application<br>


 ![corestack](corestack.png)

<!-- - An instance of `NSManagedObjectModel` represents your app’s model file describing your app’s types, properties, and relationships.
- An instance of `NSManagedObjectContext` tracks changes to instances of your app’s types.
- An instance of `NSPersistentStoreCoordinator` saves and fetches instances of your app’s types from stores.
- An instance of `NSPersistentContainer` sets up the model, context, and store coordinator all at once. -->

### The Managed Object Model (NSManagedObjectModel)
An in-memory representation of the .xcdatamodeld file which you create and use to define your CoreData managed objects. Describes app's types, properties and relationships.

### The Managed Object Context
An instance of NSManagedObjectContext, the context is a powerful object that plays the central object in a CoreData application.

Its primary responsibility is to manage a collection of managed objects, with responsibilities from life-cycle management (including faulting) to validation, inverse relationship handling, and undo/redo.

It represents a single object space — or scratch pad — where you create the managed objects.

These managed objects represent an internally consistent view, in memory, of the contents of one or more persistent stores.

**The context tracks changes to and relationships between managed objects.**

Within a given context, there is at most one managed object to represent any given record in a persistent store.

### The Persistent Store Coordinator
The NSPersistentStoreCoordinator is instantiated first when the Core Data stack is created.

It sits in the middle of the Core Data stack and is responsible for creating new instances of entities that are defined inside the model.

It **retrieves** existing instances from a persistent store, and passes these objects off to the context requesting them.

### The Persistent (Object) Store
The framework is only useful if the persistent store coordinator is connected to one or more persistent stores.

CoreData can persist data using a few different formats:
SQLite — Data is saved to disk using a SQLite database. This is the most commonly-used store type.<br>
Atomic — Data saved to disk using a binary format.
XML — Data saved to disk using an XML format. (Not available in iOS).<br>
In-Memory — Data is not saved to disk, but instead is stored in memory.

### The Store
The persistent store communicates directly with the actual storage structure used for persistence: the store.

For CoreData, SQLite is the most frequently used store.

The store that underlies a SQLite-based CoreData implementation is simply a single flat file saved locally on the device.

### NSPersistentContainer
Starting with iOS 10, Apple introduced the NSPersistentContainer class, which encapsulates the entire CoreData Stack into a single object.

Advantages of implementing the stack using the NSPersistentContainer include that it simplifies development of:
- the CoreData stack — by abstracting away the need to implement each of the individual objects
- CoreData Concurrency — by providing built-in contexts and functions associated with the main and background queues

Even though this standard practice works well for most apps, an app’s data requirements may require customization of the stack to achieve greater efficiency, performance, or control over specific data persistence factors.

## SQLite
SQLite is the most widely-used database engine in the world.

It is built in to all mobile devices and most computers, and it comes bundled inside countless applications that people use every day.

A short list of SQLite’s most noteworthy features:
- self-contained, highly-reliable, highly-performant, transactional
- stored locally on the device — no server needed
needs no configuration
- lightweight — uses very little RAM
- small — takes up very little (precious) device real estate (only a single flat file)

All of those characteristics render SQLite an ideal fit for mobile devices.

As a C-language library, it is native to the iOS system, and it is available by default on iOS.
