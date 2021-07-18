//: Playground - noun: a place where people can play

import Foundation

// Define what each class does. 
// Casters cast, Fighters melee.

protocol Casts {
    func castSpell()
}

protocol Fights {
    func melee()
}


// Player defines the default traits shared by all classes

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
    
    func melee() {
        print("\(name) Attacks with Sword!")
    }
}


// Sub classes player and implements Casts
class Wizard: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 4
    }
    
    func castSpell() {
        print("\(name) Casts spell")
    }
}

// Sub classes player and implements Casts

class Priest: Player, Casts {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
    
    func castSpell() {
        print("\(name) Casts spell")
    }
    
}


// Sub classes player and implements both Fights and Casts

class Elf: Player, Fights, Casts {
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
    
    func castSpell() {
        print("\(name) Casts spell")
    }
    
    func melee() {
        print("\(name) Attacks with Sword!")
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


// While this works we are still duplicating lots of code. I needed to
// write the castSpell(), and melee() methods 5 times!

// - Challenge: 

// Write a protocol extension for Fights that defines a default implementation of the
// melee() method.

// - Challenge: 

// Write a protocol extension for Casts that defines a default implementation of the
// castSpell() method().



//: [Next](@next)




