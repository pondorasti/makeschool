<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->
# Structs & Enums

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/04-Classes-Structs-Enums/README.html ':ignore')

<!-- > -->

## Agenda

- Challenges from last class
- Structs
- Break
- Enums

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## Challenges from last class

<!-- > -->

## Learning Objectives

1. Create and use data models with Structs
1. Add functions to Structs
1. Use enums and their raw values
1. Create enums with associated values

<!-- > -->

## Intro

So far, we have learned about different types (Int, String, Array, Optionals).

Almost every time we will need to create our custom types to suit the purpose of our programs. We can create our own types with Classes & Structs in Swift.

<iframe src="https://giphy.com/embed/YiUredNQ5OdxzAaXbV" width="240" height="240" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/stickers/aminalstickers-aminals-aminal-stickers-YiUredNQ5OdxzAaXbV"></a></p>

<aside class="notes">
Context for the examples in this lesson: we need to build a program that helps a Boba Tea shop to implement an "order ahead" system, because they constantly have long lines. We need to model how it will work using Swift. Eventually it might become an app.
</aside>

<!-- > -->

## Struct

A Structure is a type that stores named properties and related behaviors. We can give a struct a name to use later in our code.

```swift
struct BobaTea {
  let tea: String
  let sweetness: Int
}
```

Syntax involves using the `struct` keyword followed by the name. Everything inside the curly braces will be a property of the struct.

Properties are constants or variables that are a member of the type. Every instance of the struct will have these properties.

<aside class="notes">
We'll start simple. Let's say we have a custom type and we call it BobaTea. Right now the customer can choose the kind of tea they want and the level of sweetness. Every new boba tea will need these two properties.
</aside>

<!-- v -->

## Your turn: Coffee Struct

1. Create a new playground in Xcode
1. Create a struct named `Coffee` that has three properties:
    1. `bean`: a String that says what type of bean the coffee uses
    1. `sugar`: an Int that says how many sugar packets are in the coffee
    1. `hasMilk`: a Bool that says whether the coffee has milk or not

<!-- v -->

## Creating an instance

```swift
var boba = BobaTea(tea: "black", sweetness: 25)
print(boba)
// prints BobaTea(tea: "black", sweetness: 25)
```
To create an instance, we use the name of the type with the needed parameters. This is an example of an **initializer**. This one makes sure that all the properties of the struct are set before we try to use them. Safety first!

<aside class="notes">
An initializer is generally a method that the struct can use. But we didn't code it. Swift automatically gives an initializer for structs, using all of its properties.
</aside>

<!-- v -->

## Your turn: Coffee Instance

Create an instance of your `Coffee` struct by storing it in a variable named `coffee`. Make sure to provide values for the `bean`, `sugar`, and `hasMilk` properties.

<!-- v -->

## Accessing Properties

We use dot notation to access the properties in a struct.

```swift
let boba = BobaTea(tea: "black", sweetness: 25)
print(boba.tea) // black
print(boba.sweetness) //25
```

Dot notation will also work to assign values.

If you know you will modify the values in your struct, you should consider making it's properties variables instead of constants. The same applies when considering if the struct should be a constant or variable.

<!-- > -->

### Challenge 1

Include the type `BobaTea` from the example in your playground.

Write a structure called `Order` that will represent a client's order. It needs two properties:

- `name` of type String
- `boba` of type BobaTea 😯

<!--
```swift
struct Order {
  let boba: BobaTea
  let name: String
}
```
-->

<!-- > -->

## Create-A-Boba

We can use functions to create an instance of a `struct` and its properties. For example, let's write the `createBoba` function that takes `teaType` and `sweetnessLevel` as inputs, and returns a new `BobaTea`:

```swift
func createBoba(teaType: String, sweetness: Int) -> BobaTea{
    let boba = BobaTea(teaType: teaType, sweetnessLevel: sweetness)
    return boba
}

```

<!-- v -->

### Your turn: createCoffee

Write a `createCoffee` function that takes `beanType`, `sugarLevel`, and `containsMilk` as inputs (String, Int, Bool respectively), and returns a `Coffee` struct based on those input parameters.

<!-- v -->

### Challenge 2

1. Write a function that given input parameters returns an order type `Order` (You'll need to make an `Order` struct!)
2. Then create an order using the function (this should return an `Order`)
3. Then print it's details.

This is how I should be able to call your function:
`let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)`

and this is what you'll print in the end:
`Adriana ordered black boba tea, 25% sweetness, with boba`

<!--
```swift
func createOrder(withTea tea: String, sweetness level:Int, forCustomer name: String, includeBoba hasBoba: Bool) -> Order{
    let boba = BobaTea(tea: tea, sweetness: level, hasBoba: hasBoba)
    let order = Order(boba: boba, name: name)
    return order
}

let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)

print("\(newOrder.name) ordered \(newOrder.boba.tea) boba tea, \(newOrder.boba.sweetness)% sweetness, \(newOrder.boba.hasBoba ? "with boba" : "no boba")")
```
-->

<!-- > -->

## Methods

We know now that structures can have constants and variables. They can also have their own functions. And every instance will have access to them, to execute them.

Functions that are members of types are called **methods**.

What if we want to able to display the complete order of a customer every time? It might be useful to include a method inside the Order struct.

<!-- > -->

### Challenge 3

```swift
struct Order {
  var boba: BobaTea
  let name: String

  func printDescription(){
    print("\(name) ordered \(boba.tea) boba tea, \(boba.sweetness)% sweetness, \(boba.hasBoba ? "with boba" : "no boba")")
  }
}

let newOrder = createOrder(withTea: "black", sweetness: 25, forCustomer: "Adriana", includeBoba: true)

newOrder.printDescription()
//Adriana ordered black boba tea, 25% sweetness, with boba
```

**Do the same improvement in your implementation, then move your `createCoffee` function into the `Coffee` struct.**

<!-- > -->

## Structures as value types

A value type is a type whose instances are copied when assigned.

```swift
var boba = BobaTea(tea: "black", sweetness: 25, hasBoba: true)
var anotherBoba = boba
print(boba.tea)         // black
print(anotherBoba.tea)  // black

boba.tea = "oolong"
print(boba.tea)         // oolong
print(anotherBoba.tea)  // black
```

<aside class="notes">
This shows that when boba is assigned to anotherBoba, it's copying the value into the new variable. They are two independent instances, with different memory addresses.
</aside>

<!-- > -->

## Exploring Swift types

Many of the standard Swift types are structures:
- String
- Double
- Bool
- Array
- Dictionary

You can confirm this by looking at the documentation 🤓 (command+click -> jump to definition)

<!-- > -->

### Questions

**Q1:** When is it useful to define a `struct`?

<!--When you want to represent a new data type with a collection of properties and functions-->

<!-- v -->

**Q2:** Which of the following is NOT a key component of a `struct`?

1. Name
1. Properties
1. Functions
1. Enumerations

<!-- v -->

**Q3:** What do you call a function that's added to a `struct`?

<!--instance method-->

<!--

## Classes

Classes are also named types with properties and methods.

We use classes to create objects.

```swift
class Customer {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

let customer = Customer(firstName: "Monica", lastName: "Geller")
print(customer.firstName) // Monica
```

<aside class="notes">
It's very similar to the way we write structs. Some differences: using the keyword class and the need for an initializer. Classes don't come with predefined initializers, and we must still assign an initial value to all the properties.

Accessing the value of properties is also using dot syntax.

This time we see the word self. In Swift, self is a property of an instance that holds the instance itself.
</aside>


### Activity - Cashier Class

Build a `Cashier` class that has `firstName`, `lastName`, and `hasBathroomKey` properties. Make sure you build out the `init` method for the class as well.


### Challenge 4

Add the class `Customer` from earlier into your playground and refactor your code to use it.

**Example:** using a class to represent the customer, instead of just using a String for the name.


## Classes as reference types

While structs are *value types*, classes are *reference types*.

This means than a variable of a class doesn't store an instance but a reference to a location in memory, and that location stores the instance.

<img data-src="https://miro.medium.com/max/940/1*oiSNPErZHJ40FcWNTxAM0A.gif">

-->

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Enums

An enumeration is a list of related values that define a common type. It's a great way to work with **type-safe** values.

Enums can also have methods and properties, that makes them extra powerful.

<aside class="notes>
Let's solve a problem that we have so far with the Boba Tea shop. When we create a new BobaTea, we can specify the type of tea. It's a String, this means we can assign pretty much any word. But the store manages only 4 types of tea. We can solve this with enums.
</aside>

<!-- v -->

## Creating an enum

```swift
enum TeaType{
    case black
    case oolong
    case lavender
    case chai
}

// Creating an instance
var typeOfTea = TeaType.chai
```
Standard practice: start each case with lowercase.

<!-- v -->

### Your turn: Coffee Enum

Make a `CoffeeType` enum, where `robusta`, `liberica`, and `arabica` are valid types.

<!-- > -->

## Switch statement

```swift
var typeOfTea = TeaType.chai

switch typeOfTea {
case .black:
    print("This is black tea.")
case .oolong:
    print("This is oolong tea.")
case .lavender:
    break
case .chai:
    print("This is chai tea.")
}
```

Switch statements are another option to handle control flow. A switch will execute different code depending on the value of the variable given.

<!-- v -->

A few notes about switch statements
- They need to be exhaustive (check all cases or use default)
- If we want nothing to happen in a case, we write `break`
- Cases can't be empty
- They work with any data type
- You can group several cases

```swift
switch typeOfTea {
case .black, .chai:
    print("This is a house favorite.")
case .oolong, .lavender:
    print("This is a seasonal special.")
}
```

<!-- v -->

### Your turn: Coffee Case

Write a `typeOfCoffee` switch that prints out the name of the coffee type.

<!-- > -->

## Raw values

We can assign a value to each case in an enum. This helps handling each case or getting a value to work with in our program.

```swift
var typeOfTea = TeaType.chai

enum TeaType : String{
    case black = "black"
    case oolong = "oolong"
    case lavender = "lavender"
    case chai = "chai"
}
print(typeOfTea.rawValue) // chai

enum TeaType : Int{
    case black
    case oolong
    case lavender
    case chai
}

print(typeOfTea.rawValue) // 3

```

<aside class = "notes">
When we add raw values we need to specify their type right after the name of the enum. If we use Int, and don't specify otherwise, it will enumerate the cases starting with 0.
</aside>

<!-- v -->

We can use raw values to instantiate an enum.

```swift
let teaType = TeaType.init(rawValue: 2)
if let tea = teaType{
    print(tea)
}
```

The initializer will give back an optional type. Since there's no guarantee that the raw value we're giving matches one of the available types of tea.

<!-- v -->

## Associated values

- Enums can have 0 or more associated values.
- These values need their own type.
- We can give them names, like external names in functions.
- **An enum can have either raw or associated values, not both**

<!-- v -->

```swift
enum OrderFullfilment {
  case success(message: String)
  case error(message: String)
}
```

We will handle the order result with an enum. The associated value will be a message, that we can set later when using it.

<!-- v -->

```swift
func makeOrder(order: Order) -> OrderFullfilment {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    print(hour)
    if hour < 17 && hour > 9{
        return .success(message: "You can pick up your order in 30 min")
    }else{
        return .error(message: "We are closed, try tomorrow")
    }
}
```

<!-- v -->

```swift
let orderResult = makeOrder(order: newOrder)

switch orderResult {
case .success(let message):
  print("Order result: \(message)")
case .error(let message):
  print("Order result: \(message)")
}
```

We used `let` bindings to read the associated values.

<!-- > -->

### Challenge 5

Finish the implementation of the Boba Tea shop.

- Use enums to represent the tea types
- Add an option to customize milk too: whole, almond, oat
- Include the `makeOrder` function to practice using associated values
- Experiment, break things 🤓

<!-- > -->

Find the solutions to each step of the challenges [here](https://github.com/Make-School-Courses/MOB-1.1-Introduction-to-Swift/blob/master/Lessons/04-Classes-Structs-Enums/assignments/challenges.md).

<!-- > -->

### Questions

**Q1:** Which of the following would be best represented with an enumeration?

1. Names of people in a room
1. Political parties <!--correct-->
1. Addresses
1. Compass degrees


<!-- v -->


**Q2:** Which of the following would be best represented with an enumeration? _Choose all that apply_

1. Hair colors <!--correct-->
1. T-shirt sizes <!--correct-->
1. Favorite numbers
1. Car speeds

<!-- v -->

**Q3:** Which of the following would be best represented with an enumeration? _Choose all that apply_

1. Car manufacturers <!--correct-->
1. Wi-fi network names
1. Professional basketball teams <!--correct-->
1. Shoe brands <!--correct-->

<!-- > -->

## Lab + After Class

- [Lab 4](https://github.com/Make-School-Labs/swift-lab4)
- Optional Review on Swift topics (up to what we've seen) [Swift Playgrounds](https://github.com/MakeSchool-Tutorials/Swift-Language-Playgrounds/archive/swift4.zip)
- Look up Property Observers
- Check the documentation for Optionals and discover how they relate to today's lesson. **Optional chaining**

<!-- > -->

## Additional Resources

- [Structs & Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
- [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#)
- [Custom Inits for structs](https://www.hackingwithswift.com/example-code/language/how-to-add-a-custom-initializer-to-a-struct-without-losing-its-memberwise-initializer)
- [Properties](https://www.hackingwithswift.com/read/0/17/properties)
- [Apple Docs - When to use structs vs classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes)
- [Apple Docs - Value vs Reference Types](https://developer.apple.com/swift/blog/?id=10)
- [The use of self](https://dmitripavlutin.com/how-to-use-correctly-self-keyword-in-swift/)
- [Article - Value vs Reference type](https://medium.com/@abhimuralidharan/difference-between-value-type-and-a-reference-type-in-ios-swift-18cb5145ad7a)
- [Difference Between Value and Reference Type](https://medium.com/@abhimuralidharan/difference-between-value-type-and-a-reference-type-in-ios-swift-18cb5145ad7a)
    - Discussion Questions:
        - What's the difference between value type and reference type? give an example of each.
