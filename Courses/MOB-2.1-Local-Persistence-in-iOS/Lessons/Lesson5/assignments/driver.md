## Core Data - first steps

We'll do pair programming for this activity.

Decide on who is driving the activity and who will guide the driver first.

Follow Along in the creation of a tableview that stores the names of your Friends and displays them in a Tableview.


1. Create a New Xcode project. Call it Friends and make sure to check the box for Core Data.

This generates boilerplate in the App delegate with the NSPersistentContainer. - set of objects that facilitate saving and retrieving information from Core Data.

The idea of the app is to add names of our Friends and then make sure to use Core Data to persist the list even when we terminate the app and open it again.

2. Set up a navigation controller and a table view the way you prefer.

3. Set up the datasource methods for the tableview.

```swift
extension ViewController: UITableViewDataSource {

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    return cell

    }
}
```

4. Add a navigation button with the title “Add” we’ll use it to add entries to the table.

5. Set up Large titles and set “Friends” as a title. Run the app to make sure it works so far.

6. Add an action to the bar button item.

7. Set up the model for the table view. An array of Strings to hold the names of your friends.

```swift
var names : [String] = []
```

8. Implement the add action.

```swift
let alert = UIAlertController(title: "New Friend", message: "Add the name of your friend", preferredStyle: .alert)

let saveAction = UIAlertAction(title: "Add Now", style: .default) { [unowned self] action in

      guard let textField = alert.textFields?.first, let nameToSave = textField.text else { return }

      self.names.append(nameToSave)
      self.tableView.reloadData()
  }

  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

  alert.addTextField()
  alert.addAction(saveAction)
  alert.addAction(cancelAction)
  present(alert, animated: true)
```

Run the app and add a few names. See what happens when you close the app and open it again.

9. It's time to model the data. The first step is creating a Managed Object Model. Go and open the xcdatamodeld file.

Add an entity and call it Person.
Add an attribute to it for `name`.

10. Now we'll use Core Data to save. Go to the main ViewController and import Core Data.

11. Replace the names variable with this `var people: [NSManagedObject] = []`

12. Go ahead and modify the tableview's datasource to be able to use this new Managed Object.

```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {

    let person = people[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = person.value(forKeyPath: "name") as? String
    return cell


}
```
The only way Core Data provides to read the value is key-value coding, commonly referred to as KVC.

13. Modify the save call in the add method too.

```swift
guard let textField = alert.textFields?.first, let nameToSave = textField.text else { return }
self.save(name: nameToSave)
self.tableView.reloadData()
```

14. Looks like we need a new method `save`. Let's add this one now.
```swift
func save(name: String) {

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}

    // 1
    let managedContext = appDelegate.persistentContainer.viewContext

    // 2
    let entity = NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!

    let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)

    // 3
    person.setValue(name, forKeyPath: "name")

    // 4
    do {
        try managedContext.save()
        people.append(person)
    } catch let error as NSError {
        print(error.userInfo)
    }
}
```


What happens here?

1. Before we save or get anything from the store, we need a NSManagedObjectContext. Remember it serves as a scratchpad for us to work with objects.

1. We create a new managed object and insert it into the managed object context. Using NSManagedObject’s static method: `entity(forEntityName:in:).`

1. Once we have the NSManagedObject we set the name attribute using key-value coding. We must spell the KVC key  exactly as in the Data Model.

1. We save our changes to person and call save on the managed object context. Saving can throw an error, so we use a do-catch block. Finally, we insert the new managed object into the array and reload the table.

15. Now just fetch the data when we open the app.

```swift
let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Person")
guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}

let managedContext = appDelegate.persistentContainer.viewContext

do {
    people = try managedContext.fetch(fetchRequest)
   } catch let error as NSError {
       print("Could not fetch. \(error), \(error.userInfo)")
  }
```

### Stretch Challenge

- Add more properties to our only Entity and display them in the cell. For example: age and birthday.
- Find out how to delete records from the table view to complete the app. Because, you know, friends come and go 🙃

<!-- Diagram how you think core data components work in the app described below. Include all the components needed.

**Favorites:**

Lets create a User. A "logged in" *User* will have only one cart. You can add products to this cart.
We will also have favorites, a "logged in user" can favorite many products.

1. Create a *User* NSManagedObject.
1. There should be only one instance of a user in your app.
1. Add a favorites tab. Users can *favorite* products, and that will appear on the favorites tab.

*Sample App Image*

![App Sample](sample.jpeg)
-->

<!-- # In Class Activity III (30 min)

Clone the this repo:

[MakeInventory CoreData App Starter](https://github.com/Product-College-Labs/MakeInventory)

**And:**

1. Add the date the inventory was entered to the Inventory model and display it.
1. Edit an inventory item and save the changes.
1. Add way to delete an inventory item.

-->
<!-- **Stretch Challenge:**

Lets model a shopping cart. There will only be one *Cart*. A Cart can have many *Products*. *Products* can belong to only one *Cart*.


1. Create a *Products* and *Cart* entity
1. Create the one-to-many and one-to-one relationships between the entities.
1. Create some dummy *products* and display them in a list.(You can have them as saved instances of NSManagedObjects).
1. Have a add to cart button on each *Product* cell in the list.
1. When a user taps the *Add to Cart* button, you add the product to the cart.
1. When a user taps the Cart button, it displays the cart with all the *products*.
1. Make sure to save the cart every time a new item is added to it. If the app is closed and opened, the *products* in the cart should persist. -->
