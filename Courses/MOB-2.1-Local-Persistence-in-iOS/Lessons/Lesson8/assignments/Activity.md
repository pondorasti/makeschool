# Implementing NSFetchedResultsController

How the final app should work:

The app will display a list of teams participating in the World Cup. When tapping on a cell, we increase the country's wins with each tap, by one. The country with the most taps wins the tournament. 🏆

The starter project has all the Core Data setup you need. Including Subclasses of NSManagedObjects and the Core Data Stack. Take a moment to check them out a get familiar with the project's structure.

## Step 1

First step is to create a fetch request. Do this in the main ViewController after importing Core Data.

```Swift
//property that holds fetched results
lazy var fetchedResultsController: NSFetchedResultsController<Team> = {

  let fetchRequest: NSFetchRequest<Team> = Team.fetchRequest()
  fetchRequest.sortDescriptors = []

  let fetchedResultsController = NSFetchedResultsController(
    fetchRequest: fetchRequest,
    managedObjectContext: coreDataStack.managedContext,
    sectionNameKeyPath: nil,
    cacheName: nil)

  return fetchedResultsController
}()
```

## Step 2

Then do the fetching as the screen loads.

```swift
do {
  try fetchedResultsController.performFetch()
} catch {
  print(error)
}
```

## Step 3

Now we connect the fetched results controller with the data source methods. To determine the number of sections and rows.

```swift
//sections
return fetchedResultsController.sections?.count ?? 0

//rows
guard let sectionInfo =
    fetchedResultsController.sections?[section] else {
      return 0
  }

  return sectionInfo.numberOfObjects
```

## Step 4

We also need to change the cell for row at. Find `configure(cell:for)` and replace the contents.

```swift

guard let cell = cell as? TeamCell else { return }
let team = fetchedResultsController.object(at: indexPath)
cell.teamLabel.text = team.teamName
cell.scoreLabel.text = "Wins: \(team.wins)"

if let imageName = team.imageName {
  cell.flagImageView.image = UIImage(named: imageName)
} else {
  cell.flagImageView.image = nil
}

```

Run the app to see how you're doing.

Notice the line `fetchRequest.sortDescriptors = []`. I included it so our app wouldn't crash. Here's why it would crash:

“A regular fetch request doesn’t require a sort descriptor. Its minimum requirement is you set an entity description, and it will fetch all objects of that entity type. NSFetchedResultsController, however, requires at least one sort descriptor. Otherwise, how would it know the right order for your table view”

## Step 5

So let's add a real sort descriptor, that's the main idea of using the NSFetchedResultsController. **Try sorting the countries in alphabetical order from A to Z.**

## Step 6

Now let's add the code to increment the number of wins. Think about where should this code go

```swift
let team = fetchedResultsController.object(at: indexPath)
team.wins = team.wins + 1
coreDataStack.saveContext()
tableView.reloadData()
```

Run the app and check that it works just fine.

So far, that is how you can implement NSFetchedResultsController. It might not look like much of a difference from using a regular fetch request. But the power lies in how easy it is to manage data. 🙌🏼

## Stretch Challenge 1

There are 6 zones in the World Cup: Africa, Asia, Oceania, South America, North/Central America and Europe. The entity `Team` has an attribute called "qualifyingZone". Your challenge is to split the list of countries and group them into their qualifying zone. Make sure to use appropriate headers to indicate the name of the zone (this means your table will have more than one section).

Hint: sectionNameKeyPath is a parameter you can use to specify an attribute the fetched results controller should use to group the results and generate sections.
`#keyPath(Team.qualifyingZone)` might be useful now.

Once you have them in their zones, make sure they are sorted by zone, number of wins and name in that order.

## Stretch Challenge 2

Get rid of `tableView.reloadData()` it's expensive to use and guess what, NSFetchedResultsController can listen to changes in data if we use its delegate. 😎

Make an extension to the view controller to add NSFetchedResultsControllerDelegate.
Don't forget this after Initializing the fetched results controller: `fetchedResultsController.delegate = self`

The method you're looking for is called: `controllerDidChangeContent`

## Stretch Challenge 3
Even when we use the delegate method, the data updating still fells like doing a reload of everything.

Replace the delegate method with this and the challenge is to understand what's happening in every step. Ask if you're not sure.

```swift
func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.beginUpdates()
  }

  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                  didChange anObject: Any,
                  at indexPath: IndexPath?,
                  for type: NSFetchedResultsChangeType,
                  newIndexPath: IndexPath?) {

    switch type {
    case .insert:
      tableView.insertRows(at: [newIndexPath!], with: .automatic)
    case .delete:
      tableView.deleteRows(at: [indexPath!], with: .automatic)
    case .update:
      let cell = tableView.cellForRow(at: indexPath!) as! TeamCell
      configure(cell: cell, for: indexPath!)
    case .move:
      tableView.deleteRows(at: [indexPath!], with: .automatic)
      tableView.insertRows(at: [newIndexPath!], with: .automatic)
    }
  }

  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.endUpdates()
  }

```

End result:

![wcup](wcup.gif)

Adapted instructions and original source code: Core Data by Tutorials by Pietro Rea.
