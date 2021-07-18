//: [Previous](@previous)

import Foundation

/*:
 ## Subclassing
 
 */



/*:
 ## Class functions vs Static functions
 
 Functions in classes can have some modifiers attached to them.
 
 *Regular functions in classes*
 They can be regular functions, that is, we need an instance of the class to call those methods.
 
 *Class functions in classes*
 They are functions in classes that belong to the class itself, you do not need an instance to access the method. Subclasses can *override* them.
 eg. Calculator.off()
 
 *Static functions in classes*
 They work similarly to *classes* except they cannot be overriden by subclasses
 */

class Calculator {
    class func off() {
        
    }
    
    static func on() {
        
    }
}

// Calculator Subclass
class Casio: Calculator {
    
    override class func off() {
        
    }
    
    //  Cannot do this
    //    override static func on() {
    //    }
    
}

Calculator.off()
Calculator.on()

/*:
 ## Static Variables
 
 Variables in classes can have the static keyword attached to them.
 A static variable belongs to the class. ie. You do not need an instance of the class to access it
 
 */

//: [Next](@next)
