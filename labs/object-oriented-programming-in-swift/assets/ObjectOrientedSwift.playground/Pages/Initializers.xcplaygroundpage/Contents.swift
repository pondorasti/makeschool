
//: [Previous](@previous)

import Foundation

/*:
 # Initializers
 
 We learnt from the previous page that initializers are special functions that allow us to set an initial state for a class
 
 There are different types of initializers we can define in a class.
 
 There are *default*, *required*, *convenience* and *failable* initializers
 
*/

/*:
 ## Default/Designated Initializers
 
 >>>
 Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain. - Apple

*/

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
}

let john = Person(name: "John", age: 10)
john.name

//: A designated initializer must call the initializers from its immediate superclass.
class TallPerson: Person {
    let height: Int
    
    init(height: Int, name: String, age: Int) {
        self.height = height
        
        super.init(name: name, age: age)
    }
}

/*:
 ## Convenience Initializers
 
 Convenience initializers must call the designated initializer for its class.
 */

class Car {
    let model: String
    var serialNumber: String?
    
    init(model: String) {
        self.model = model
    }
    
    convenience init(model: String, serialNumber: String) {
        self.init(model: model)
        self.serialNumber = serialNumber
    }
}

let toyoto = Car(model: "Toyota")
let bmw = Car(model: "BMW", serialNumber: "xyz123")

bmw.serialNumber
//: [Next](@next)
