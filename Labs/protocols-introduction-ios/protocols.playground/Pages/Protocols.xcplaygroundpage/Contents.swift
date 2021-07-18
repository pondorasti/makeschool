import Foundation

/*:
 
 # Protocols
 
 A protocol defines a blueprint of methods, properties, and other requirements that
 suit a particular task or piece of functionality.
 
 The protocol can then be adopted by a class, structure, or enumeration to provide 
 an actual implementation of those requirements. Any type that satisfies the 
 requirements of a protocol is said to conform to that protocol.

 ## Defining and conforming to a Protocol
 
*/

enum Food {
    case fish
    case sandwich
    // Add a new food type
}

protocol Mammal {
    func eat() -> Food
    // What else can a mamal do? (add a new method)
}

struct Orca: Mammal {
    func eat() -> Food {
        return Food.fish
    }
    // Does this conform to the protocol? Add the missing method...
}

class Human: Mammal {
    func eat() -> Food {
        return Food.sandwich
    }
    // Does this conform to the protocol? Add the missing method...
}

let peter = Human()
peter.eat()

let myOrca = Orca()
myOrca.eat()


/*:
 Protocols can also have required properties like variables
*/

protocol Sandwich {
    var diameter: Int { get set }
    // Add another property to Sandwich?
}


/*:
 ## Inheritance and Protocols
 
 Protocols can be inherited by classes, structs or other protocols
 
 A class, struct or protocol can inherit multiple protocols
 
 A class on the other hand can only inherit from one Super class(Base class)
 
*/

// Protocol Definitions
protocol Vertibrates {}
protocol Flys {}
protocol Swims {}

// Protocol Inheritance
protocol Bird: Flys, Vertibrates {}
class Fish: Vertibrates, Swims {}
struct Amphibian: Vertibrates, Swims {}

/*:
 
 ## Protocol Extensions
 
 Protocols on their own do not have any functionality, they define contracts
 that an conformer must adhere to. To add functionality to a protocol, we can
 extend it.
 
 */


protocol Character {
    var health: Int { get set }
    var strength: Int { get }
    var aim: Int { get set }
}

struct Henchman: Character {
    var health: Int
    var aim: Int
    // What's missing here? (add the missing property and give it a value)
}

struct Hero: Character {
    var health: Int
    let strength: Int
    var aim: Int
}

/*:
 ## Restricting Protocols to specific types
 
 We can restrict protocols to specific instance types by using the ```where``` keyword and ```Self``` referring to the conforming instance (Henchman in  the example below)
 
*/

extension Character where Self == Henchman {
    var strength: Int {
        return 200
    }
}

let hero  = Hero(health: 100, strength: 100, aim: 100)

//: We can cast our hero to a character since a Hero is a Character (from protocol conformance)
let char =  hero as Character

//: We cannot change the strength of a Character because its specified at get only
//char.strenght = 100

let stormtrooper = Henchman(health: 100, aim: -100)
stormtrooper.strength


/*:
 
 *Notice* how stromtrooper has a default strength of 200 even though we didn't specify it in its initializer or struct defininition?
 
This is because we provided a default implementation of strength for only henchmen
*/



/*:
 ## Constraining Protocols
 We can constrain protocols to classes were we are only going to use this protocol on classes
 
 */

protocol TapDetectionDelegate: class {
    func didTapCircle(x: Int, y: Int)
}


/*:
 ## Protocol methods and conformation, Required vs Optional
 
 By default when you conform to a protocol, you are required to implement all methods defined by the protocol.
 Using the @optional keyword, we can mark a method or variable in a protocol as an optional method
 
 To to this, we must mark our protocol with @objc, even though we are not interacting with Objective-C.
 Doing this imposes some restrictions, one of them being that we can only use the protocol on reference types.
 
*/

@objc protocol Purchasable {
    @objc optional var discount: Double { get set }
    @objc optional func purchase()
}



/*:
 ## Multiple Protocol Restriction
 
 Remember, protocols are also *types* and we can return them when a type in a function signature is expected
*/

protocol Biped {
    func name() -> String
    func walk()
}

protocol Hairy {
    func hairColor() -> String
}

class Dog: Hairy {
    func hairColor() -> String {
        return "White"
    }
}

class Ostrich: Biped, Hairy {
    func walk() {}
    
    func name() -> String {
        return "Ostrich"
    }
    
    func hairColor() -> String {
        return "Black"
    }
}

func describe(item: Biped & Hairy) -> String {
    return("\(item.name()) 's hair color is \(item.hairColor())))")
}

//: Ostrich is *Biped* and *Hairy*
describe(item: Ostrich())

//: Dog does not conform to *Biped* so it wont be accepted into the describe function
// describe(item: Dog()) // error: Dog() doesn't conform to Biped

/*:
 
 ## Challenges
 
 1. a. Create a model of a car, it should have a max speed, number of wheels, doors and model properties.
    b. Generalize the car, create a model for a vehicle which will represent all vehicles, a truck, motorcycle & bus are vehicles
    c. Create a model(struct or class or enum) an instances of truck, motorcycle and bus
 
 2.
 */






/*:
 
 ## Challenges
 
 These animals all make noise. Make them conform to the CanMakeNoise protocol. They each need to implement the makeNoise method in the protocol they conform to.

 */

 protocol CanMakeNoise {
    func makeNoise()
 }
 
 class Elephant {
 
 }
 
 class Pig {
 
 }
 
 class Cow {
 
 }

 
 
 let elephant = Elephant()
 let pig = Pig()
 let cow = Cow()


/*:
 
 ## Challenges
 
 Make an an instance of Human call it human. Human defined above needs to conform to CanMakeNoise.

 */

 
 // let arrayOfNoiseMaker: [CanMakeNoise] = [human, pig, cow]


/*:
 
 2 a. Uncomment above line and make the code compile. This can be achieved by implementing the `CanMakeNoise` protocol in all the classes above. Think about a noise each class could make and print it to the console using `print`.
 
 b. Iterate over `arrayOfNoiseMaker` and let each object make their noise
 
 */

/*:
 3.
 
 Take at look at the protocol definition for Equatable by Apple:
 
 ```
 public protocol Equatable {
 
  Returns a Boolean value indicating whether two values are equal.
 
  Equality is the inverse of inequality. For any values `a` and `b`,
  `a == b` implies that `a != b` is `false`.
 
  - Parameters:
    - lhs: A value to compare.
    - rhs: Another value to compare.
 public static func ==(lhs: Self, rhs: Self) -> Bool
 }
 ```
 
 Given the Artist struct below, implement the Equatable protocol
 
 ### Hint
 
 With Equatable, you define what makes two instances equal. Imagine you have two colored balls.
 What makes them equal? Is it their colors? Their sizes? Its up to you to determine that.
 
 */

// Used by Artist to determine style of Artist
enum Style: String {
    case impressionism
    case surrealism
    case cubism
    case popArt
}

struct Artist {
    let name: String
    let style: Style
    let yearBorn: Int
}

// Example instances of Artists, use for testing your equatable
let monet = Artist(name: "monet", style: .impressionism, yearBorn: 1840)
let dali = Artist(name: "Salvador Dali", style: .surrealism, yearBorn: 1904)
let andy = Artist(name: "Andy Warhol", style: .popArt, yearBorn: 1928)


/*:
 
 4. Write an iterator for a 2Dimentional array. Eg. Given [[2,5,9], [0, 4, 2], [6, 8, 3]],
 you should be able to iterate through each element sequentially 2,5,9,0,4,2,6,8,3.
 
 ### Hint
 
 There are some protocols you can leverage in the collection data types to help guide you.
 
 
*/


