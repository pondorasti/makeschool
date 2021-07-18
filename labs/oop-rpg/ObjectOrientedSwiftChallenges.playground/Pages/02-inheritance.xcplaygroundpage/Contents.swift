//: Playground - noun: a place where people can play

import Foundation

class Player {
    var name: String
    var hitPoints: Int
    
    init(name: String) {
        self.name = name
        self.hitPoints = 0
    }
    
    func adventure() {
        print("\(name) goes adventuring")
    }
}


class Fighter: Player {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 8
    }
    
    func melee() {
        print("\(name) attacks with sword!")
    }
}


// Fighter inherits all methods and properties from Player
class Wizard: Player {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 4
    }
    
    func castSpell() {
        print("Do magic stuff")
    }
}

class Priest: Player {
    
    override init(name: String) {
        super.init(name: name)
        
        hitPoints = 6
    }
    
    func castSpell() {
        print("Do magic stuff")
    }
}


// Wizard adds a new method
var mephisto = Wizard(name: "Mephisto")
mephisto.castSpell()

// Priest duplicates functionality
var clancy = Priest(name: "Clancy")
clancy.castSpell()

var joe = Fighter(name: "Frank")
joe.melee()


// This is working but I have duplicated code for Priest and Wizard, they both define the castSpell() method. 

// - Challenge: 

// Create a new class SpellCaster. This class should inherit from Player and implement the castSpell() method. 

// - Challenge: 

// Modify both Wizard and Priest, they should inherit from SpellCaster instead of Player.

//: [Next](@next)
