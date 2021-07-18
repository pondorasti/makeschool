import UIKit


/*:
 # Object Oriented Programming
 
 ## Modeling Data with Classes
 
 Using classes, we can model data.
 
 ***Initiallizers*** allow us to set the initial state of a class
 
 Variables and Constants that live in the *scope* of the class are referred to as ***instance variables***
 
 The ***self*** keyword used in class is used to refer to the current instance.
 */


class Animal {
    
    // Instance variable
    let species: String
    
    // Initializer, setting instance variables of Animal
    init(species: String) {
        self.species = species
    }
}

/*:
 ## Creating an Instance
  Creating an Animal is called creating and ***instance*** of the class Animal
 */

let dog = Animal(species: "Canine")


/*:
 ## Scope
 
 Classes encapsulate variables and functions.
 i.e they can have variables and functions.
 
 Variables that live at the *top* level of the class are global to the class. That means they can be access by functions in the class.
 
 */

class House {
    let size: Int
    
    init(size: Int) {
        self.size = size
        let door = "Front Door"
    }
    
    func enter() {
        // Cant access door because its in a different function and not global
        // door
        
        self.size
        // Can access size because its an instance variable and scoped to the class
    }
}


/*:
 ## Inheritance
 
 Classes can *inherit* functionality from other classes. This is called inheritance
 */

class Dog: Animal {
    func bark() -> String {
        return "Bow wow"
    }
}


class Phone {
    static let size = 600
}

Phone.size

/*:
 ## Access Modifiers
 
Variables and functions in classes can be **private, or public**
 
 Variables and functions are public by default
 
 */

class Todo {
    private let content: String = ""
    public let completed: Bool = false
}

let todo1 = Todo()

// Cannot access content because its private
// todo1.content

// Can access public variables
todo1.completed


/*:
 ## Final Classes
 
 Classes can be marked with the final keyword,
 meaning it cannot be subclassed.
 
 You cannot subclass the class below
 */

final class Table {
    init() {
        
    }
}

/*:
class BlueTable: Table {
}
 We get the error if we try to subclass Table:
 
 *Error* inheritance from a final class 'Table'
 */

/*:
 ## Class Extenstions
 
 We can extend a class to provide extra functionality
 
 */

class BuyView {
    let item: String
    
    init(item: String) {
        self.item = item
    }
}

extension BuyView {
    func display() -> String {
        return item
    }
}

//: We can also use extensions to inherit from other classes/protocols

extension BuyView: CustomStringConvertible {
    var description: String {
        return item
    }
}
/*:
 ## Initializers and Deinitializers
 **Initializers** are special functions that allow us to setup initial state of a class.
 
 **Deinitializers** are special functions that are called when a class is destroyed/removed/deallocated from memory
 */


class Basket {
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
    deinit {
        // Called when class is about to be removed from memory/deallocated
    }
}

let basket = Basket(content: "Balls")


//: [Next](@next)

