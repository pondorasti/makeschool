# Creating the CoreData Stack

Instead of having the stack in the App Delegate, we'll create a separate class for it.

## Step 1: Download starter project

Download the [starter project here](https://github.com/amelinagzz/coredata-starter) and work from there.

## Step 2: CoreDataStack file

Create a new file and name it CoreDataStack.

**File -> New -> File -> iOS -> Source -> Swift File template -> Next**

Add the following to the file:

```swift
import Foundation
import CoreData //import the core data module

class CoreDataStack {

  private let modelName: String //create a private property to store the modelName

  //we always need this
  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()

  init(modelName: String) {
    self.modelName = modelName //initializer needed to save the modelName into the private property
  }

  //lazy instantiate the NSPersistentContainer, passing the modelName
  private lazy var storeContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores {(storeDescription, error) in
      if let error = error as NSError? {
        print("Error: \(error), \(error.userInfo)")
      }
    }
    return container
  }()

}
```

Notice everything is private except for the `NSManagedObjectContext`.

**Q: What do you think is the reason for this?**

<!-- This is the only thing we need to interact with to use the stack. -->

## Step 3: Save method

We need a method to save the context. If we don't call it, data in the store won't change. Add this inside the CoreDataStack class.

```swift
  func saveContext () {
    guard managedContext.hasChanges else { return }

    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Error: \(error), \(error.userInfo)")
    }
  }
```

Now we can move on to use the stack in the main view controller.

## Step 4: Importing CoreData

Go to `ViewController.swift` and import Core Data. then add a property for the managed object context. Call it `managedContext`.

```swift
var managedContext : NSManagedObjectContext!

```
Now go to the app delegate and import Core Data. Add a property to hold the stack.

```swift
lazy var coreDataStack = CoreDataStack(modelName: "WaterLog")
```

**Q: Why do you think this is a lazy initialization?**
<!-- The stack won't be set up until we need to access the property -->

We need to send the managed context from our stack to the ViewController.
Add the following inside the `didFinishLaunchingWithOptions` method.

```swift
guard let navController = window?.rootViewController as? UINavigationController, let viewController =
        navController.topViewController as? ViewController else {
        return true
    }

viewController.managedContext = coreDataStack.managedContext
```

We want to make sure the app will save any changes if it goes to the background or if it gets terminated. For this, find the `applicationDidenterBackground` and `applicationWillTerminate` methods and call the method `saveContext` in our stack property.

We're done. Now we need to model data. 😀


## Step 5: Creating the models

If you notice, we don't have a model file because the project was created without the Core Data template, so there's no `.xcdatamodeld` file. Create a new one.

**File -> New -> File -> iOS -> Core Data -> Data Model -> Next**

Name the file `WaterLog.xcdatamodeld`. Make sure the name matches what you had previously in your stack.

Create a new entity named `Plant` with an attribute named `species` of type String.<br>
Create another entity named `WaterDate` with an attribute named `date` of type Date.<br>

We know each plant can be watered several times a month, there is no type Array to model this. But the thing we do is create a **relationship**. Go to the Plant entity and add a new relationship, name it `waterDates` and set the destination to `WaterDate`.

## Step 6: Graph view & relationships

Change the view to graph (right option from lower right segmented control). This a great way to see the relationships between entities.

All relationships are by default to-one, meaning you can only track a date once. But we need this to be more times, or else your plant will die. So change the relationship in the Data Model Inspector and change `Type` to `To Many`. See how this changes in the chart.

At this point, make sure to also check the box that says Arrangement: Ordered.

Select the relationship in the Plant entity and set the delete rule of the relationship. Read more about [deletion rules here](https://cocoacasts.com/core-data-relationships-and-delete-rules) and choose the appropriate one. Ask the instructor if you are unsure which one to use.

Now select the WaterDate entity and create an inverse relationship to Plant. Set `plant` as destination and `waterDates` as inverse. Again see how this changes in the chart.

**Q: Why are we leaving this relationship as to-one?**
<!-- A plant can be watered many times but each water date belongs to a plant -->

**Q: How are to-one vs to-many relationships represented in the graph editor?**
<!-- to-many with a double arrow, to-one with one arrow -->

## Step 7: Generate classes

Let's create subclasses of managed objects for our entities. Open the `.xcdatamodeld` file and select an entity. Change the Codegen dropdown in the inspector to Manual/Note. Do this for all entities.

Then go to **Editor -> Create NSManagedObject subclass** Choose the WaterLog model and both entities. Then create.

We now have two files per entity. One is for the properties defines in the mode editor and the other one for future functionality.

Open the `Plant+CoreDataProperties.swift` and notice how the relationship is modeled.

Open the `WaterDate+CoreDataProperties.swift` and notice how the inverse relationship is modeled.

Everything is ready for the app to save entities with Core Data.

## Step 8: Everything put together

Go back to the main ViewController. Suppose we can only see the data of one plant at a time, so instead of having an array of dates, we have `var mainPlant : Plant?`.

Add the following to `viewDidLoad`

```swift
//we will look for Cactus for this example. We'll go over how to query in future lessons.

   let plantSpecies = "Cactus"
   let plantSearch: NSFetchRequest<Plant> = Plant.fetchRequest()
   plantSearch.predicate = NSPredicate(format: "%K == %@", #keyPath(Plant.species), plantSpecies)

   do {
     let results = try managedContext.fetch(plantSearch)
     if results.count > 0 {
       // cactus found
       mainPlant = results.first
     } else {
       // not found, create cactus
       mainPlant = Plant(context: managedContext)
       mainPlant?.species = plantSpecies
       try managedContext.save()
     }
   } catch let error as NSError {
     print("Error: \(error) description: \(error.userInfo)")
   }
```

Change `numberOfRowsInSection` to use the count of the plant's waterDates.

Change `cellForRowAt` to display the date.

Finally modify the add method to create new Dates accordingly.

```swift
//new water date entity
let waterDate = WaterDate(context: managedContext)
waterDate.date = NSDate() as Date

//add it to the Plant's dates set

if let plant = mainPlant, let dates = plant.waterDates?.mutableCopy() as? NSMutableOrderedSet {
  dates.add(waterDate)
  plant.waterDates = dates
}

//save the managed object context  
do {
  try managedContext.save()    
} catch let error as NSError {
  print("Error: \(error), description: \(error.userInfo)")
}
tableView.reloadData()
```

Try it out, check to see if you got persistence to work.


## Stretch challenges
1. Include the functionality to delete dates in today's activity.
