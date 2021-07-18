import UIKit

// Tuple:
// Are groups of values that always go together.
// Here's an example:

let myTuple = (12, 23)

// You can mix types in a tuple:
var otherTup = ("Name", 9.99)

// But the types always have to match:

otherTup = ("Bean Soup", 3.78)

//otherTup = (5.66, "What!")
// Throws error:
// Cannot assign value of type '(Double, String)' to type (String, Double)



// Tuples can have more than two values:
let truple = (1,2,3)
let qruple = (1,2,3,4)

// Option click on each of the variable above to
// check it's type.
myTuple  // (Int, Int)
otherTup // (String, Int)
truple   // (Int, Int, Int)
qruple   // (Int, Int, Int, Int)


// Challenge:
// Define the following tuples:

// 1. Login holds name and password both type String



// 2. Vector holds two nunmbers: 1.56, 3.45



// 3. Profile holds name, age, shoesize



// 3. Address holds street address, city, state, and zip code






// Above the types were Implicit. Tuple types can be
// expressed explicitly. For example:

let coords: (Double, Double) = (37.754871, -122.498789)


// Challenge:
// While Swift will implicitly type these it is good
// practice to also add the type to prevent mistakes.
// Explicitly type each of the variables below:

let name = ("Frango", "Martini")
let pizza = ("Peperoni", "Large", 21.99)
let damage = ("heat", 120000)



// Accessinng the values of a tuple is similar to accessing values
// from an array, object or dictionary and a little different.
// Each value is indexed. Use the dot (.) followed by the index.

print(name.0) // Frango
print(name.1) // Martini

// Challenge:
// Print all of the values from the pizza and damage



// Tuples are great but it can sometimes be confusing to identify
// the values they contain. Tuples in Swift can also have named
// values.

let track: (name: String, time: Double) = ("Happy Birthday", 1.57)

// Now you can access the values in the track tuple by name:

print(track.name) // Happy Birthday
print(track.time) // 1.57


// Challenge:
// Define tuples for the following, be sure to include names for
// each value. Also assign a valid value for each variable.

// 1. location: latitude: 37.754871, longitude: -122.498789



// 2. doughnut: type: cake, flavor: chocolate, has sprinkles: false



// 3. shoe: model: Skate, color: red, size: 9.5



// Challenge:
// Print each value from the three tuples you defined above:



