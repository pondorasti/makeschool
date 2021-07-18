//: Playground - noun: a place where people can play

import Foundation

// Define some protocols

protocol Casts {
    var name: String {get}
    func castSpell()
}

protocol Fights {
    var name: String {get}
    func melee()
}

// Define some protocol extensions.

extension Casts {
    func castSpell() {
        print("\(name) Casts spell")
    }
}

extension Fights {
    func melee() {
        print("\(name) Attacks with Sword!")
    }
}

// Define a base class

class Player {
    var name: String
    var hitPoints: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func adventure() {
        print("\(name) goes adventuring!")
    }
}


class Fighter: Player, Fights {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 8
    }
}


// Sub classes player and implements Casts
class Wizard: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 4
    }
}

// Sub classes player and implements Casts.

class Priest: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
    
    // Priests cast spells but they are different from Wizard spells!
    func castSpell() {
        print("\(name) heals the party!")
    }
    
}


// Sub classes player and implements both Fights and Casts

class Elf: Player, Fights, Casts {
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
}

// Wizard adds a new method
var mephisto = Wizard(name: "Mephisto")
mephisto.castSpell()

// Priest duplicates functionality
var clancy = Priest(name: "Clancy")
clancy.castSpell()

// Fighter
var frank = Fighter(name: "Frank")
frank.melee()

var elrond = Elf(name: "Elrond")
elrond.castSpell()
elrond.melee()

// This is working really good so far. We need to add some detail. Fighters should have
// a battle cry.
// This is something they say when they melee(). 

// - Challenge: 

// Add a new property to the Fighter: var battleCry: String.

// - Challenge: 

// Modify the initializer for Fighter to accept a parameter and use that to set the value
// for the new property. Give this parameter a default value of "Huzzah!".

// ** Do not set the default value in the property declaration
// ** Do not use an optional or implicitly unwrapped optional. 
// In other words these are not allowed: 

// var battleCry = "Huzzah"
// or 
// var battleCry: String!


//: [Next](@next)
