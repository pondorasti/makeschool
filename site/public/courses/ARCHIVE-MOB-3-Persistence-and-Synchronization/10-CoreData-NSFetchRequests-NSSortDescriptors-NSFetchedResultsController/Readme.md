# NSFetchRequests, NSSortDescriptors & NSFetchedResultsController

## Objectives

- Fetch data from Core Data with NSFetchedRequest
- Filter through data stored in Core Data with NSPredicate
- Sort data with NSSortDescriptor
- Fetch and display data with NSFetchedResultsController

## Predicates

Provides an interface for querying much like a mixture of sql and a regular expression

**Example**

```swift

// Filter for results with property firstName == "Bubbles"

let firstName = "Bubbles"
fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
```

### Gist of Predicates

1. Simple Comparison Operators
We can use ```>, <, >=, <=, ==, !=```

**Example**

*Simple Comparison*
```swift
let pred = NSPredicate(format: "population >= 10")
```

*Comparison with like*
```swift
let fruit = "mango"
let pred = NSPredicate(format: "fruit like %@", fruit)
```

*Logical Operations (OR, AND)*
```swift
let pred = NSPredicate(format: "name like John OR age == 5")
```

*Filter with a list*

```swift
// Will yield any results containing the name Apples and Mango

let pred = NSPredicate(format: "name in %@", ["Apples", "Mango"])
```


2. Formating

%i is for substituting integers, %@ is for substituting strings

**Example**

*Strings*
```swift
let pred = NSPredicate(format: "quantity > %i", 4)
```

*Numbers*

```swift
let pred = NSPredicate(format: "name == %@", "Eliel")
```

#### Full Cheatsheet of Predicates

[Realm Predicate Cheatsheet](https://academy.realm.io/posts/nspredicate-cheatsheet/)


## Sort Descriptors

Sort Descriptors enables us to sort results from a fetch request.

```swift
let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
fetchRequest.sortDescriptors = [sortDescriptor]
```

## NSFetchedResultsController

Performing queries to Core Data and displaying them has never been easier.
Using NSFetchedResultsController, we can perform 

1. Initialize your fetch request

```swift
// Initialize a FetchRequest
let fetchRequest: NSFetchRequest<Inventory> = Inventory.fetchRequest()
```

2. Add any sort descriptors (Optional)

```swift
// Add any SortDescriptors
let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
fetchRequest.sortDescriptors = [sortDescriptor]
```

3. Add any predicates (Optional)

```swift
let quantityFilter = 4
let pred = NSPredicate(format: "quantity > %i", quantityFilter)

fetchRequest.predicate = pred
```

4. Initialize a FetchedResultsController with our FetchRequest and MOC

```swift
let fetchedResultsController = NSFetchedResultsController(
    fetchRequest: fetchRequest,
    managedObjectContext: self.stack.viewContext,
    sectionNameKeyPath: nil,
    cacheName: nil
)
```

5. Set the FetchedResultsController delegate

```swift
fetchedResultsController.delegate = self
```

6. Implement NSFetchedResultsControllerDelegate (Optional)

7. UITableView/UICollectionView number of rows in section and cellForRow change to use fetched results

```swift

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = fetchedResultsController.sections else {
        return 0
    }

    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
}


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath)
    
    // FetchedResultsController controls fetching of ManagedObjects
    let item = fetchedResultsController.object(at: indexPath)

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = "x\(item.quantity)"

    return cell
}
```


8. Fetch from FetchedResultsController and reload data as needed
```swift

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    try? fetchedResultsController.performFetch()
    tableView.reloadData()
}
```

## Resources

[Realm Predicate Cheatsheet](https://academy.realm.io/posts/nspredicate-cheatsheet/)

[NSPredicate](http://nshipster.com/nspredicate/)