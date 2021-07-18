# Introduction to Realm

Realm is a cross platform database(iOS, Android, Web). It can be used in place of CoreData for persisting data in iOS.

## Installation up Realm

Download Realm here(Manual, Cocoapod, Carthage)

[Realm Download](https://realm.io/docs/swift/latest#installation)

### Realm

Realm has two products, a RealmObjectServer and RealmDatabase. We will be using the RealmDatabase product its open source and free to use in production.

Realms can be in *memory, synchronized or local.*


### Realm Setup

```swift
// Setups the default Realm

let realm = try! Realm()
```

### Modeling Objects

Instances of items stored in Realm are referred to as *Objects* - Similar to ManagedObject in CoreData.

```swift
import RealmSwift

class Inventory: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var quantity: Int = 0
}

```


### Writing Objects

```swift

let inventory1 = Inventory()
inventory1.name = "Bubbles"
inventory1.quantity = 10


try! realm.write {
    realm.add(inventory1)
}

```

### Fetching Objects

**Fetching**
```swift
let inventories = realm.objects(Inventory.self)

let arrayInventory = Array(inventories)

```

**Filtering**

```swift
let inventories = realm
                    .objects(Inventory.self)
                    .filter("quantity > 5")

let arrayInventory = Array(inventories)
```

## Challenges

Clone this repo and integrate realm:

[TriviaTime Starter](https://github.com/Product-College-Labs/TriviaTime)
