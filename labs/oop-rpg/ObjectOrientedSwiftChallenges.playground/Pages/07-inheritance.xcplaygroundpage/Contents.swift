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
    
    var battleCry: String
    
    init(name: String, battleCry: String = "") {
        self.battleCry = battleCry
        
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

var george = Fighter(name: "George", battleCry: "Arrr!")
george.melee()

// Now that the fighter has a battle cry they should use it when they attack.

// - Challenge: 

// The fighter should use the battleCry when the melee() method is called. 


