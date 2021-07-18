import Foundation

// Define a base class for our new RPG app.

class Player {
    var name: String    // All Players have name
    var hitPoints: Int  // and hitPoints
    
    // Initialize your class.
    init(name: String) {
        self.name = name
        self.hitPoints = 0
    }
    
    func adventure() {
        print("\(name) Goes adventuring!")
    }
}

// The game is more fun with different character classes. 
// Make a fighter.


// Fighter inherits all methods and properties from Player
class Fighter: Player {
    // Override the initializer
    override init(name: String) {
        super.init(name: name)
        // Override the default
        self.hitPoints = 8 // Fighters have 8 hit points
    }
    
    // Fighters melee
    func melee() {
        print("\(name) attacks with sword!")
    }
}

// frank calls a method from it's super class.
var frank = Fighter(name: "Frank")
frank.adventure()
frank.melee()

// - Challenge:

// Add two new classes: Wizard and Priest. Both of these class will inherit from Player.

// - Challenge: 

// The Wizard and Priest cast spells instead of melee. Give them a castSpell() method.

// - Challenge: 

// Fighters have 8 hit points, Wizards should have 4, Priests should have 6.


//: [Next](@next)
