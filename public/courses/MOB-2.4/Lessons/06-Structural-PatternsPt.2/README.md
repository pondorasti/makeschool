# Structural Patterns Pt.2 - Resources

<!-- INSTRUCTOR NOTES:
1) No quiz this class -- course project intro instead
2) For Activity 1:
- Solution is embedded below Add'l Resources
3) for Activity 2:
- Solution is embedded below Add'l Resources
-->


### The Decorator Pattern &nbsp;&nbsp;&nbsp;:art:

The Decorator pattern is used to extend or alter the functionality of objects __*at run-time*__ by wrapping them in an object of a decorator class. This provides *a flexible alternative to using inheritance* to modify behavior.

It allows behavior to be added to an individual object - __*dynamically,*__ at run-time - without affecting the behavior of other objects from the same class or in cases where subclassing would result in an exponential rise of new classes.


#### Implementation Notes

<!--Decorator and Adapter are two key patterns related to polymorphism that you will see often in Swift. They are implemented using the language keywords `protocol` and `extension` respectively.-->

The __*primary example*__ of the Decorator pattern __*in Swift*__ is when you create an `extension`.

Decorator consists of base components that are *extended* at *run-time* and ‘decorated’ with decorator classes.

Decorator is typically comprised of these components:

1. **(Abstract) Core Component** — The (abstract) base class or protocol that a base object will subclass or implement.
2. **Concrete Core Component** - Implementation of the Core Component.
3. **Decorator** — The Decorator can extend the Core Component using two forms:
    - As an __*Abstract Decorator*__ - A protocol which extends the Core Component protocol
    - As a __*Concrete Decorator*__ - An implementation (or subclass) of the Core Component.

The pattern has been implemented correctly when you can select some of the objects created from a class to be modified without affecting all of them and without requiring changes to the original class.

**Key Points**

- Concrete Decorators have the capability of wrapping around Components or other Decorators and building structures.
- Decorator designed so that multiple decorators can be stacked on top of each other, each time adding a new functionality to the overridden method(s).
- Decorators and the original class object share a common set of features.
- To prevent subclassing the Core Component class can be declared `final`.

#### Problems Addressed
What problems can the Decorator design pattern solve?

Responsibilities should be added to (and removed from) an object dynamically at run-time.
- A flexible alternative to subclassing for extending functionality should be provided.
- When using subclassing, different subclasses extend a class in different ways. But an extension is bound to the class at compile-time and can't be changed at run-time.

Decorator is also a solution to the **Exploding Class Hierarchy** problem: An exploding class hierarchy occurs when the number of classes needed to add a new functionality to a given class hierarchy grows exponentially.

*Source: wikipedia*

#### Benefits
The decorator pattern is an alternative to subclassing. Subclassing adds behavior at compile time, and the change affects all instances of the original class; decorating can provide new behavior at run-time for selected objects.

The decorator pattern is often useful for adhering to the __*Single Responsibility Principle,*__ as it allows functionality to be divided between classes with unique areas of concern.

The changes in behavior defined with the decorator pattern can be combined to create complex effects without needing to create large numbers of subclasses.

**TIP** If you do not have control over the class definition (source code) of an object, you can apply the decorator pattern.

#### Pitfalls

**Question:** What do you think is the main pitfall to this pattern?

<!--The main pitfall is implementing the pattern so that it affects all of the objects created from a given class rather than allowing changes to be applied selectively. A less common pitfall is implementing the pattern so that it has hidden side effects that are not related to the original purpose of the objects being modified.-->

<!--#### Related Patterns

Decorator is structurally nearly identical to the Chain-of-Responsibility (CoR) pattern.

The difference:
- in CoR, exactly one of the classes handles the request
- for Decorator, all classes handle the request
Decorator in iOS

Decorator is a pattern for object composition, which is something that you are encouraged to do in your own code.

Cocoa Touch, however, provides some classes and mechanisms of its own that are based on the pattern.

Cocoa Touch uses the Decorator pattern in the implementation of several of its classes, including `NSAttributedString`, `NSScrollView`, and `UIDatePicke`r. The latter two classes are examples of compound views, which group together simple objects of other view classes and coordinate their interaction.

In Swift there are two very common implementations of this pattern: **Extensions** and **Delegation.**

*Source: Apple*
-->
#### When to use
Use Decorator when you need to change the behavior of objects without changing the class they are created from or the components that use them.

Another use case: when you must use several existing classes or structs which lack some desired functionality and that cannot be subclassed. Building a new target interface by wrapping these classes with Decorator can be a very clean solution.

Do not use the Decorator pattern when you are able to change the class that creates the objects you want to modify. It is usually simpler and easier to modify the class directly.

#### Example

**The Problem**

In this example, the `SimpleCoffee` object is constrained to only a single price and a single ingredient. If additional ingredients are desired, the cost of a coffee-based item must increase to reflect the cost of additional or more expensive ingredients added.

**The Solution**

Instead of subclassing `SimpleCoffee` for every type of coffee or ingredient desired, the `Decorator` pattern was used to extend the original object with new desired behaviors.

**Playground Code**

```swift
import UIKit

// Abstract Core Component
protocol Coffee {
    func getCost() -> Double
    func getIngredients() -> String
}

// Concrete Core Component
class SimpleCoffee: Coffee {
    func getCost() -> Double {
        return 1.0
    }

    func getIngredients() -> String {
        return "Coffee"
    }
}

// Decorator (Base) class
class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee
    fileprivate let ingredientSeparator: String = ", "

    required init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }

    func getCost() -> Double {
        return decoratedCoffee.getCost()
    }

    func getIngredients() -> String {
        return decoratedCoffee.getIngredients()
    }
}

// Decorator class
final class Milk: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Double {
        return super.getCost() + 0.5
    }

    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Milk"
    }
}

// Decorator class
final class WhipCoffee: CoffeeDecorator {
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }

    override func getCost() -> Double {
        return super.getCost() + 0.7
    }

    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Whip"
    }
}

var someCoffee: Coffee = SimpleCoffee()
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = Milk(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")
someCoffee = WhipCoffee(decoratedCoffee: someCoffee)
print("Cost : \(someCoffee.getCost()); Ingredients: \(someCoffee.getIngredients())")

/* Will print:
 Cost : 1.0; Ingredients: Coffee
 Cost : 1.5; Ingredients: Coffee, Milk
 Cost : 2.2; Ingredients: Coffee, Milk, Whip
 */
```

*From this series of Swift design pattern articles:*
 https://github.com/ochococo/Design-Patterns-In-Swift
 <!-- under GNU License -->


## In Class Activity II  (25 min)

When completed, the playground code below will aggregate pizza prices based on type of pizza and toppings selected.

**TODO:** Complete the  code so that it it runs and its output matches the 2 scenarios listed in comments below the working code.

1. Implement the toppings decorator classes:
    - **Extra Cheese** - costs 1.0 extra
    - **Mushrooms** - at 1.49
    - **Jalapeno Peppers** - at 1.19
2. Implement the **Gourmet** pizza type. Its price is 7.49
3. Ensure the code works and outputs correctly *for both* the *Plain Margherita* and the *Plain Gourmet* client code scenarios.

**Playground Code**

```swift
import UIKit

// Abstract Core Component
protocol PizzaBase {
    func getPrice() -> Double
}

// Concrete Core Component
class PlainPizza: PizzaBase {

    var myPrice: Double = 1.0

    func getPrice() -> Double {
        return self.myPrice
    }
}

// Concrete Core Component
class Margherita: PizzaBase {

    var price: Double = 6.99

    func getPrice() -> Double {
        return self.price
    }
}

// Concrete Core Component
class Gourmet: PizzaBase {

    //TODO: Implement the Gourmet pizza; price is 7.49
}

// Decorator (base) class
class ToppingsDecorator: PizzaBase {

    private let pizza: PizzaBase

    required init(pizzaToDecorate: PizzaBase) {
        self.pizza = pizzaToDecorate
    }

    func getPrice() -> Double {
        return pizza.getPrice()
    }
}

// Decorator class (extended)
class ExtraCheeseTopping: ToppingsDecorator {

    //TODO: Implement Extra Cheese -- add 1.0 to current price
}

// Decorator class (extended)
class MushroomTopping: ToppingsDecorator {

    //TODO: Implement adding mushrooms -- add 1.49 to current price

}

// Decorator class (extended)
class JalapenoTopping: ToppingsDecorator {

    //TODO: Implement JalapenoToppingk, add an extra 1.19 for peppers

}

/// Client-code for Margherita
let pizza: PizzaBase = Margherita()
print("Plain Margherita: ", pizza.getPrice())

/// Client-code for Gourmet
//let pizza: PizzaBase = Gourmet()
//print("Plain Gourmet: ", pizza.getPrice())

let moreCheese: ExtraCheeseTopping = ExtraCheeseTopping(pizzaToDecorate: pizza)
print("moreCheese: ", moreCheese.getPrice())

let evenMoreCheese: ExtraCheeseTopping = ExtraCheeseTopping(pizzaToDecorate: moreCheese)
print("evenMoreCheese: ", evenMoreCheese.getPrice())

let mushrooms: MushroomTopping = MushroomTopping(pizzaToDecorate: evenMoreCheese)
print("mushrooms: ", mushrooms.getPrice())

let withPeppers: JalapenoTopping = JalapenoTopping(pizzaToDecorate: mushrooms)
print("withPeppers: ", withPeppers.getPrice())

/* OUTPUT:

 1) For Client-code for Margherita, should print:

 Plain Margherita:  6.99
 moreCheese:  7.99
 evenMoreCheese:  8.99
 mushrooms:  10.48
 withPeppers:  11.67

 1) For Client-code for Gourmet, should print:

 Plain Gourmet:  7.49
 moreCheese:  8.49
 evenMoreCheese:  9.49
 mushrooms:  10.98
 withPeppers:  12.17

 /*
```
*Adapted from this Java example:*

https://stackoverflow.com/questions/2707401/understand-the-decorator-pattern-with-a-real-world-example

<!-- SOLUTION FOR ACTIVITY 2 -- is below Additional Resources... -->



#### Proxy &nbsp;:mailbox_closed:

![proxy](proxy.png)

*[Sihui Huang](https://www.sihui.io/design-pattern-proxy/)*

The Proxy design pattern is used to provide a __*surrogate*__ or __*placeholder*__ object, which references an underlying object.

In its most general form, a *proxy* is a class functioning as an interface to something else.

The proxy could interface to anything:

- a network connection to a remote service
- a large object in memory
- a file
- or some other resource that is expensive or impossible to duplicate

 Calling components operate on the proxy, which in turn operates on the underlying resource.

#### Problems Addressed

The Proxy pattern is used to solve three different problems:

1. **Remote Object Problem** - This arises when dealing with resources that are accessed over a network, such as a web page or a RESTful web service.

2. **Expensive Operation Problem** - Involves tasks such as making HTTP requests which are classified as *expensive* operations.

3. **Restricted Access Problem** - When you need to restrict access to an object but you don’t have access to the source code or because there is already a dependency on the object type elsewhere in the application, and you cannot afford to let any user perform the operations that the object encapsulates.

*From:
Pro Design Patterns in Swift* - Adam Freeman


#### Benefits
Proxies allow close control over the way underlying resources are accessed, which is useful when you need to intercept and adapt operations.

The *intent* of the pattern is to:
- Control access to some object by providing a surrogate or placeholder (proxy) to it.
- Use an extra level of indirection to support distributed, controlled, or intelligent access.
- Add a wrapper and delegation to protect the real component from undue complexity.

Proxies can also be used to *defer expensive operations* (example, `lazy loading`).

#### Pitfalls

Pitfalls associated with the proxy pattern depend on how it is being implemented:

- For **Remote Object proxies** - Ensure that no unnecessary details of the mechanism used to access the remote object are revealed.
- For proxies used to manage **Expensive Operations** - Avoid exposing details of how the cost of the operation is being mitigated.
- For **Access Restriction proxies** - Take care not to allow calling components to bypass the proxy and access the underlying object directly.

Some general, common themes are:

- Do not allow details of the implementation to leak out of the proxy class into the calling component.
- Avoid allowing instances of the underlying class to be instantiated when a proxy is used to restrict access to an object.

And, if you use the proxy pattern to implement __*reference counting:*__
- Do not use proxies to manage the life cycle of objects.
- Do not use proxies to implement concurrency protections such as locks and semaphores. Let GCD handle this.

### Proxy in iOS

Proxy is very popular in iOS. It is frequently used throughout the Cocoa Touch framework.

Examples in iOS include:

- `UIApperance protocol` - You can customize the appearance of instances of a class by sending appearance modification messages to the class’s appearance proxy.
- `NSProxy class` - An abstract superclass defining an API for objects that act as stand-ins for other objects or for objects that don’t exist yet.

In addition, due to the resource constraints inherent in iOS devices, *deferring operations* through the use of `lazy loading`/`lazy initialization` has long been an __*iOS best practice *__ under relevant conditions.


#### When to use

The proxy pattern can be used whenever an object is required to represent some other resource. The resource can be something abstract, such as a web page, or something local to the application, such as another object.

Proxies are used in three main situations mentioned:

- to define an interface to a remote resource
- to manage the execution of expensive operations
- to restrict access to the methods and properties of other objects

Implementing proxy can be complex and labor intensive. If you need a solution that does *not* involve intercepting and adapting operations of another object, consider using one of the other Structural patterns instead.

#### Protection Proxy Example

For this example, assume that the `HAL9000` object has its own access control/authentication mechanism and that you do not want client classes to access that mechanism directly.

Instead, the `CurrentComputer` class acts as a Protection Proxy intercepting and handling the client's request for access to the `HAL9000` object.

```swift
//Protection Proxy protocol
protocol DoorOperator {
    func open(doors: String) -> String
}

//Restricted Access Object
class HAL9000 : DoorOperator {
    func open(doors: String) -> String {
        return ("HAL9000: Affirmative, Dave. I read you. Opened \(doors).")
    }
}

//Protection Proxy object
class CurrentComputer : DoorOperator {
    private var computer: HAL9000!

    func authenticate(password: String) -> Bool {

        guard password == "pass" else {
            return false;
        }

        computer = HAL9000()

        return true
    }

    func open(doors: String) -> String {

        guard computer != nil else {
            return "Access Denied. I'm afraid I can't do that."
        }

        return computer.open(doors: doors)
    }
}

//Client
let computer = CurrentComputer()
let podBay = "Pod Bay Doors"

computer.open(doors: podBay) // Result: "Access Denied. I'm afraid I can't do that."
computer.authenticate(password: "pass")
computer.open(doors: podBay) // Result: "HAL9000: Affirmative, Dave. I read you. Opened Pod Bay Doors."
```

*From this series of Swift design pattern articles:* </br>
 https://github.com/ochococo/Design-Patterns-In-Swift
 <!-- under GNU License -->

## Implementation Notes

The *proxy class* provides the same public interface as the underlying *subject class,* adding a level of __*indirection*__ *by accepting requests from a client object* and passing these to the real subject object as needed.

But implementation of the proxy pattern varies based on the kind of problem that it is being used to solve.

**Break into 3 groups where each group discusses one of the following problems. Can you add more to how the proxy pattern helps here?**

#### **Solving the Remote Object Problem**

Use a **Remote Proxy**, where a local object is a proxy for (represents) a remote object, and calling a method on the local object causes the corresponding method to be invoked on the remote object.

    - The proxy object hides the details of how the remote resource is accessed and only presents its data.
    - It consolidates requests to the remote resource in a single application class. It allows implementation changes to itself or the remote object without requiring changes to the calling client code.

__*Examples:*__

- HTTP requests to a remote web service
- Any scenario involving a *distributed system,* such as an ATM (the ATM must communicate transactions with the bank's central computing system).

#### **Solving the Expensive Operation Problem**

A **Virtual Proxy** is used for loading objects on demand. It provides a simplified version of a complex or heavy object. Only when the detail of the object is required is the main object actually populated, providing a form of lazy initialization.

- A Virtual Proxy can be used to minimize the cost of expensive operations by decoupling the operation from its use, which can often be combined or at least deferred until the cost of performing the operation is lower.

__*Examples:*__

- A file management utility may use an object for each file visible on the screen. When obtaining the file list, the file name, size and other easy-to-retrieve information would be held in proxy objects. Only when the actual file is viewed (requested) would the real object be created and populated with the full contents of the file, as these are slower to access and require more memory.
- A very large image object can be represented using a virtual proxy object (with thumbnail and other image metadata), only loading the real object "on demand" the real image is requested by the user.

#### **Solving the Restricted Access Problem**

By using a **Protection Proxy**, which might be used to control access to a resource based on access rights. The proxy is defined as a wrapper around an object, adding additional logic to enforce some kind of restriction on its use (which presents a different implementation path from the other proxy types).

- A Protection Proxy object usually conforms to a common protocol shared with the wrapped object, which means that proxy objects can be used as seamless replacements without having to modify calling clients.
- The proxy intercepts requests to access the properties and methods of the underlying object and will pass them on only if an access control policy has been satisfied.

The Proxy pattern is implemented correctly when the proxy object can be used to perform operations on the resource it represents.

Note, too, that proxies can reveal as much or as little of their implementation detail as they choose.


## In Class Activity

In this exercise, you are going to create an `Image` protocol and concrete classes implementing it:

- `ProxyImage` is a a proxy class created to reduce the memory footprint created when loading the image.
- Loading the image will up to the `RealImage` object.

Your "client" will use `ProxyImage` to get an `Image` object to load and display, as needs.

```swift
import UIKit

//Step 1 - Create a protocol (interface)

    //TODO: Create Image protocol, with a display() function

//Step 2 - Create concrete classes implementing the same protocol
class RealImage: Image {

    var fileName: String

    init (fileName: String) {
        self.fileName = fileName
        loadFromDisk(fileName: fileName)
    }

    func display() {
        print("Displaying", fileName)
    }

      //TODO: Create loadFromDisk(_:) function that will accept a fileName and print "Loading" along with the fileName

}

class ProxyImage: Image {

    //TODO: Create vars needed

    init (fileName: String) {
        self.fileName = fileName
    }

    func display() {
        if realImage != nil {
            print("realImage already loaded")
        } else {
            print("Load realImage")

            //TODO: If realImage var is nil, create/load a new RealImage object, and pass it to realImage var
        }
        realImage!.display()
    }
}

//Step 3 - Client uses ProxyImage object to load the image through the RealImage class, but only when needed
let image: ProxyImage = ProxyImage(fileName: "test_10mb.jpg")
image.display()
print("") // Add line break for separation in output
image.display()

/* Output should be:

 Load realImage
 Loading test_10mb.jpg
 Displaying test_10mb.jpg

 realImage already loaded
 Displaying test_10mb.jpg
 */
```

*Adapted from this Java example:* </br>
https://www.tutorialspoint.com/design_pattern/proxy_pattern.htm

## Overview/TT II (20 min)

#### Facade &nbsp;:office:

![facade](facade.png)

The Facade pattern is used to define a simplified interface to a more complex subsystem: a library, a framework, or a complex system of classes.

The primary purpose of the Facade pattern is to hide the complexity of a system, class or API and provide all of its functionality behind a simple interface.

The __*central actor*__ in this pattern is an __*object that serves as a front-facing interface*__ that masks more complex underlying, structural code.

#### Problems Addressed

Clients that access a complex subsystem directly refer to, and depend on, many different objects having different interfaces (tight coupling), which makes the clients hard to implement, change, test, and reuse.

#### Benefits

Facade can make a complex subsystem easier to use.

A facade can:
- improve readability and usability of a software library by masking interaction with more complex components behind a single, simplified API
- provide a context-specific interface to more generic functionality
- serve as a launching point for a broader refactoring of monolithic or tightly-coupled systems

#### Pitfalls

The primary pitfall when implementing the façade pattern is to leak details of, or create tight dependency to, the underlying objects. This means that the calling components are still dependent on the underlying classes or supporting types and will require modification when they change.

Also steer clear of creating a “god” facade, which might need to know too many details about every class in your app.


#### When to use

**Think, Pair, Share:** When should you use the Facade pattern?

<!--Facade is often used when a system is very complex, or it is difficult to understand because it has a large number of interdependent classes, or because its source code is unavailable.

Use Facade when:
- you want to provide a simple or unified interface to a complex subsystem.
- you need to decompose a subsystem into separate layers.

The facade pattern is ideal when working with a large number of interdependent classes, or with classes that require the use of multiple methods, particularly when they are complicated to use or difficult to understand.

Facade is __*particularly useful*__ when wrapping __*poorly designed subsystems*__ but cannot be refactored because the __*source code is unavailable*__ or the existing interface is too widely used.-->

#### Implementation Notes

This **core component** of this pattern a single class - __*the facade class*__ - which provides simplified methods required by client and which delegates calls to methods of existing system classes.

The facade class is a *wrapper* that contains a set of members that are easily understood and simple to use. Members access the subsystem on behalf of the facade client, hiding the implementation details of the subsystem.

This minimize dependencies on a subsystem by offloading work to the Facade object, which provides a single, simplified interface to the more general facilities of the subsystem.


**To implement** Facade:

1. **Identify target system(s)** whose functionality you seek to simplify.
2. **Define a Facade object** which provides simple methods to interact with the system and allows clients to use the facade instead of needing to interact with multiple classes in the system. The Facade object could also perform additional functionality before or after forwarding a request/interaction with the target system.

The façade pattern is implemented correctly when common tasks can be performed without the calling components having any dependency on the underlying objects or their supporting data types.

In addition, consider whether additional Facades would add value: You may decide to implement more than one facade to provide subsets of functionality for different purposes.

For example, if you notice a facade has functionality that some classes use and other functionality that other classes use, consider splitting it into two or more facades.
</br>

##### - Simplified Example -

In this example, three simple classes - `SubSystemOne`, `SubSystemTwo`, and `SubSystemThree` - represent three separate systems, each potentially with its own set of functions and/or properties.

Though these are classes, each one could be a separate collection of related classes, as in an API.

```swift
///Subsystem 1
class SubSystemOne {

    func performActionOne()
    {
        // Do something cool...
        print("printing on line \(#line) in function \(#function)")
    }
}

///Subsystem 2
class SubSystemTwo {

    func performActionTwo()
    {
        // Do something else cool...
        print("printing on line \(#line) in function \(#function)")
    }
}

///Subsystem 3
class SubSystemThree {

    func performActionThree(item: String)
    {
        // Do something even more cool...
        print("printing on line \(#line) in function \(#function), with \(item) passed as the arg")
    }
}
```

Note that after *wrapping* each of the three "subsystems," the Facade class can choose which behaviors of a given subsystem are to be exercised. The Facade class can also aggregate similar subsystem functions into a single function, simplifying the executions of several functions.

```swift

///Facade class
class Facade {
    let subSystemOne = SubSystemOne()
    let subSystemTwo = SubSystemTwo()
    let subSystemThree = SubSystemThree()

    func performActionA() {

        print("printing on line \(#line) in function \(#function) from Facade class")

        subSystemOne.performActionOne()
        subSystemTwo.performActionTwo()
    }

    func performActionB() {

        print("printing on line \(#line) in function \(#function) from Facade class")

        subSystemOne.performActionOne()
        subSystemThree.performActionThree(item: "Thing")
    }
}

///Client
let facade = Facade()
facade.performActionA()
facade.performActionB()

/* This will print:

 printing on line 41 in function performActionA() from Facade class
 printing on line 9 in function performActionOne()
 printing on line 19 in function performActionTwo()
 printing on line 49 in function performActionB() from Facade class
 printing on line 9 in function performActionOne()
 printing on line 29 in function performActionThree(item:), with Thing passed as the arg
 */
```

##### - An iOS-Specific Example -

The Facade pattern is commonly used in apps written in Swift. It’s especially handy when working with complex libraries and APIs.

In this example, the "system" being wrapped by the *facade* is the `UserDefaults` system built into iOS.

Try this in a playground.

**Q:** *Can you see how much simpler it is to set and get values from UserDefaults using this facade pattern?*

```Swift
import UIKit

// Facade class
final class Defaults {

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }

        set {
            defaults.set(newValue, forKey: key)
        }
    }
}

// Client
let storage = Defaults()

// Store
storage["Bishop"] = "Disconnect me. I’d rather be nothing"

// Read
storage["Bishop"]
```

*From:*
https://github.com/ochococo/Design-Patterns-In-Swift/blob/master/source/structural/facade.swift



## In Class Activity II (15 min)

The `HotelBooker` and `FlightBooker` classes in the code below represent separate systems. Your customer, a travel agency, would really like to be able to book both airline flights and hotel accommodations in one simple procedure.

**TODO:** Using the Facade pattern, create a class that will unify the calls to these two disparate interfaces for your customer's app.

```swift
import UIKit

///Subsystem 1
class HotelBooker {

    func book() {
        print("Hotel booked successfully")
    }
}

///Subsystem 2
class FlightBooker {

    func book() {
        print("Flight booked successfully")
    }
}

///Facade

    //TODO: Create a facade class that wraps both systems and invokes each of their separate book() functions

/// Client
let travelFacade = TravelFacade()
travelFacade.getFlightsAndHotels()


/* This prints:
Hotel booked successfully
Flight booked successfully
*/
```

## Additional Resources

1. [Refactoring Guru](https://refactoring.guru/design-patterns/structural-patterns)
2. [Proxy pattern - wikipedia](https://en.wikipedia.org/wiki/Proxy_pattern)
2. [Facade pattern - wikipedia](https://en.wikipedia.org/wiki/Facade_pattern)
4. [Proxy design pattern in iOS - an article](http://devmonologue.com/ios/proxy-design-pattern-ios/)
5. [Gang Of Four Cheat Sheet](http://www.blackwasp.co.uk/GangOfFour.aspx)


<!-- SOLUTION TO ACTIVITY 1:
import UIKit

//Step 1 - Create a protocol (interface)
protocol Image {
    func display()
}

//Step 2 - Create concrete classes implementing the same protocol
class RealImage: Image {

    var fileName: String

    init (fileName: String) {
        self.fileName = fileName
        loadFromDisk(fileName: fileName)
    }

    func display() {
        print("Displaying", fileName)
    }

    func loadFromDisk(fileName: String) {
        print("Loading", fileName)
    }
}

class ProxyImage: Image {

    var realImage: RealImage?
    var fileName: String

    init (fileName: String) {
        self.fileName = fileName
    }

    func display() {
        if realImage != nil {
            print("realImage already loaded")
        } else {
            print("Load realImage")
            realImage = RealImage(fileName: fileName)
        }
        realImage!.display()
    }
}

//Step 3 - Client uses ProxyImage object to load the image through the RealImage class, but only when needed
let image: ProxyImage = ProxyImage(fileName: "test_10mb.jpg")
image.display()
print("") // Add line break for separation in output
image.display()


/* Output should be:

 Load realImage
 Loading test_10mb.jpg
 Displaying test_10mb.jpg

 realImage already loaded
 Displaying test_10mb.jpg
 */

-->


<!-- SOLUTION TO ACTIVITY 2:

import UIKit

///Subsystem 1
class HotelBooker {

    func book() {
        print("Hotel booked successfully")
    }
}

///Subsystem 2
class FlightBooker {

    func book() {
        print("Flight booked successfully")
    }
}

///Facade
class TravelFacade {

    private let hotelBooker = HotelBooker()
    private let flightBooker = FlightBooker()

    init() {

    }
    func getFlightsAndHotels() {
        hotelBooker.book()
        flightBooker.book()
    }
}

/// Client
let travelFacade = TravelFacade()
travelFacade.getFlightsAndHotels()


/* This prints:
Hotel booked successfully
Flight booked successfully
*/
  -->
