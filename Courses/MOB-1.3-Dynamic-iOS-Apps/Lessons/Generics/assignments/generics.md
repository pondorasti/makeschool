# Generics - modeling a pet shop 🐶🐱

Suppose you’re running a pet shop that sells only dogs and cats. To start, you define a type, `PetKind`, that can hold two possible values:

```swift
enum PetKind{
  case dog
  case cat
}
```

We also want to model employees who look after the pets.

```swift
struct KeeperKind {
  var keeperOf: PetKind
}
```

This is how we would initialize keepers for dogs and cats:

```swift
let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)
```

This works by changing the value of the `PetKind` enum. If we add more animals to the store we can keep creating different type of keepers as well.

Now suppose that for each kind of pet you want to model their behavior. At this point we realize that enums might not be enough, and we decide to use classes instead.

Then you would have something like this:

```swift
class Cat {...}
class Dog {...}
```

We could also represent the different kind of keepers with classes:

```swift
class KeeperForCats {}
class KeeperForDogs {}
```

Soon this becomes a problem since you would need to create a keeper class for each new pet you add to the store. If you forget either, the store would become a mess.

We want a way to declare a relationship in which every possible pet type implies the existence of a corresponding keeper type. But we don't want to do this manually.

**Generics provide a mechanism for using one set of types to define a new set of types.** 🤯

We can create a generic type for keepers:

```swift
class Keeper<Animal> {}
```

This automatically implies that we can use it to create keepers for every animal.

```swift
var catKeeper = Keeper<Cat>()
```

`Keeper` is the name of a **generic type**. It works as a template to create real **concrete types**.

In order to define a generic type like `Keeper<Animal>` you  need to choose the name of the generic type and of the type parameter. The name of the type parameter should clarify the relationship between the type parameter and the generic type. You’ll encounter names like T (short for Type) from time to time, but these names should be avoided when the type parameter has a clear role such as `Animal`.

So back to the problem, we want to keep a better track of animals and their keepers. You'll find the following code in `main.swift` :

```swift
class Cat {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Keeper<Animal> {
  var name: String

  init(name: String) {
    self.name = name
  }
}
```

Suppose every keeper is responsible for one animal in the morning and another in the afternoon. You can express this by adding properties for the morning and afternoon animals. These animals will be the same type.

Update the Keeper class to look like this:

```swift
class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal

  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}
```

Now, when you instantiate a Keeper, Swift will make sure at compile time, that the morning and afternoon types are the same.

Add the following to `main.swift` and check out the type for `kim` in the console.

```swift
let kim = Keeper(name: "Kim", morningCare: Cat(name: "Arlo"), afternoonCare: Cat(name: "Nova"))
print(kim)
```

What's the type for `kim`?

## Challenges

- Instantiate another Keeper but this time for dogs.
- What do you think would happen if you tried to instantiate a Keeper with a dog in the morning and a cat in the afternoon? How would you fixthe current code to suppor this?


## Swift challenge

- Can you write one a function that can determine if **any specific instance of any type** exists in any array that stores objects of that type?


## Resources

- https://www.appcoda.com/swift-generics/
- https://www.hackingwithswift.com/example-code/language/what-are-generics
https://medium.com/developermind/generics-in-swift-4-4f802cd6f53c
- Swift Apprentice Book

<!--
## Creating a collection

Imagine that instead of looking after only two animals, every keeper looks after a changing number of animals throughout the day. This means a keeper can take care of more than just the morning and afternoon animals. You’d have to do things like the following:

```swift
let ryan = Keeper<Cat>(name: "Ryan")
ryan.lookAfter(someCat)
ryan.lookAfter(anotherCat)
```

You want to be able to access the count of all of animals for a keeper like `ryan.countAnimals` and to access the 10th animal via a zero-based index like ryan.animalAtIndex(10)

Your challenge is to update the Keeper type to have this kind of interface. You’ll probably want to include a private array inside Keeper, and then provide methods and properties on Keeper to allow outside access to the array.
-->
