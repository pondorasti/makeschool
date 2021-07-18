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

// Define some protocol extensions. These define default implementations for 
// methods defined in the protocol. Notice I need to add name as a property
// to the protocol since name appears in the extension!

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


// Subclasses Player and implements Fights

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

class Priest: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
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


// This is working well there is one problem. When Priests cast a spell it heals the party. 

// - Challenge: 

// When a Priest casts a spell the message displayed should say: "\(name) heals the party!"
// Override the default implementation of castSpell() in the Priest class to make this
// happen. 




//: [Next](@next)




