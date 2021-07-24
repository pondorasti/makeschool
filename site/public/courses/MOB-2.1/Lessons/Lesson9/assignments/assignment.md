
## In Class Activity

Making the necessary changes in a core data app to use multiple ManagedObjectContexts is not that complicated and it doesn't require many steps.

What's challenging is identifying the need to apply multiple MOC.

[This tutorial](https://www.raywenderlich.com/7586-multiple-managed-object-contexts-with-core-data-tutorial) uses an app that logs entries in a surf journal and rates surf sessions. The starter code can be found [here](https://koenig-media.raywenderlich.com/uploads/2018/09/multiple-managed-ob-ject-contexts-Swift-4.2.zip)

Before starting the tutorial, make sure you are able to run the project. See that there is an export functionality that will take all the contents of the table into a CSV file. Try scrolling the table and then try to export the content. Look out for the main problem we want to solve.

Go over the tutorial to fix the issue.
There are two main things you should have in the end:
- Created a `ManagedObjectContext` that works in the background.
- Used a child context to make edits in the ManagedObjects before hitting save.

## Discussion questions

- How did the app populated all the data when we fist opened it?
- What was the problem with exporting the data to CSV?
- When is it a good moment to start introducing multiple managed object contexts?
- What is a benefit from doing this?
- What can go wrong?
- What is `performBackgroundTask` doing in the app?
- What is the difference between Private an Main queues?
- What is `childContext.parent = coreDataStack.mainContext` doing for us?
- Why you we to pass the managed object *and* the managed object context to the `detailViewController`?


## Stretch Challenge for the tutorial
Change `SegueListToDetailAdd` to use a child context when adding a new journal entry. You will need to create a child context that has the main context as its parent. And create the new entry on the correct context.
