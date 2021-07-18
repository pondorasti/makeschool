//: [Previous](@previous)

/*:
 # Enums with associated types
 
 Enums can have values associated with cases
 
 eg.
 
 ```
 enum BattleShipAction {
     case attack(battleShip: BattleShip)
 }
 ```
 
 This mean when creating and instance of this enum, we will have to pass in a parameter of type BattleShip
 
 ```
 let battleShip = BattleShip()
 
 let action = BattleShipAction.attack(battleShip)
 ```
 
 Lets practice with some more concrete examples below
 
*/
struct Person {
    let name: String
}

enum MassageChair {
    case free
    case occupied(person: Person)
}

let nikolas = Person(name: "Nikolas")
let massageChair = MassageChair.occupied(person: nikolas)

switch massageChair {
case .free:
  print("The chair is currently free.")
case .occupied(let person):
  print("\(person.name) is enjoying an extremyle nice and comforting massage right now. Please don't disturb and wait until it's your turn!")
}


/*:
 ## Enum with functions
 
 Enums are first class types in Swift, so you can do most things that a *Struct* or *Class* can do with an enum
 
 1. You can define functions within an enum
 
 ```
 enum BattleShipAction {
     case attack(battleShip: BattleShip)
     case block
 
     // Our defined function
     func actionDescription() -> String {
         switch self {
             case .attack:
                 return "Attacking"
             case .block:
                 return "Blocking attack"
         }
     }
 }
 ```
 
 Above we switch on self, which in this example refers to the current instance of BattleShip action, if we are a BattleShipAction.attack, and run the actionDescription() we will return "Attacking", if we are BattleShipAction.block, we return "Blocking attack"
 
*/



/*:
 
 ### Challenges
 
 1. Write an enum that will represent these characters in a game:
 
 ```
 Henchman
 Hero
 Civilian
 Police
 Villain
 ```
 
 a. Each character should have an associated type to represent the strenght and health value of a character. These values should be integers
 
 b. Create a function inside the enum that will return the strenght of a character based on the current case
 
 */
 


