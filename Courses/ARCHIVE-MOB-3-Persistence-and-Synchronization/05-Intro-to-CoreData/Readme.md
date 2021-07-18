# Intro to CoreData

## Objectives


## Class Materials

[CoreData - Intro](core_data_intro.pdf)

## Terminologies

- Object Graph
- Queries
- NSManagedObject
- NSEntityDescription
- NSManagedObjectContext
- NSPersistentStoreCoordinator
- NSPersistentStore
- NSManagedObjectModel

## Challenges

Clone the this repo:

[MakeInventory CoreData App Starter](https://github.com/Product-College-Labs/MakeInventory)

**And:**

1. Add the date the inventory was entered to the Inventory model and display it.
2. Edit an inventory item and save the changes.
3. Add way to delete an inventory item.

**Extra:**

Lets model a shopping cart. There will only be one *Cart*. A Cart can have many *Products*. *Products* can belong to only one *Cart*.


1. Create a *Products* and *Cart* entity
2. Create the one-to-many and one-to-one relationships between the entities.
3. Create some dummy *products* and display them in a list.(You can have them as saved instances of NSManagedObjects).
4. Have a add to cart button on each *Product* cell in the list.
5. When a user taps the *Add to Cart* button, you add the product to the cart.
6. When a user taps the Cart button, it displays the cart with all the *products*.
7. Make sure to save the cart every time a new item is added to it. If the app is closed and opened, the *products* in the cart should persist.

**Favorites:**
Lets create a User. A "logged in" *User* will have only one cart. You can add products to this cart.
We will also have favorites, a "logged in user" can favorite many products.

8. Create a *User* NSManagedObject.
9. There should be only one instance of a user in your app.
10. Add a favorites tab. Users can *favorite* products, and that will appeart on the favorites tab.

*Sample App Image*

![App Sample](sample.jpeg)
