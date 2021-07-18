import UIKit

// Variables associate a name to a value.
// Use the word `var` to to define a new variable
var height = 6

// Later you can reassign to a variable like this:
height  = 10
// or
height = 8

// Define a new variable width with a value of 12:

// Assign a new value to width:


// Define a new variable area. Set the value to
// height * width


// Important! operators like * must see two
// values of the same type!


// Define a new variable: perSqFt and set the value
// to 5.99.


// Check the type it should be Double. Int is a
// whole number. Doubles are decimal numbers.
// This could cause problems. For example:
// area * perSqFt would throw an error:
// Binary operator '*' cannot be applied to operands of type 'Int' and 'Double'
// You can convert area to a Double with `Double(area)`









// Some variables are never reassigned they hold
// the same value always. Define these with `let`
let pi = 3.14

// Uncomment the line below and test to see an error
// pi = 6.28


// Define a variable for your name and shoesize below.
// Since this is unlikely to change use `let`:


// Challenge:
// Consider each of the following situations and ask
// yourself whether it is best to use a var (mutable
// variable) or let (constant variable)...


// Storing information about the number of cars parked in
// a parking lot daily.
// Storing the number of units in an apartment complex.
// Storing your highscore in a game.
// Storing the number of letters in an alphabet.




// Challenge:

// Imagine you're making a fitness tracker app.
// It needs to store the following information:

// Name: The user's name
// Age: The user's age
// Number of steps taken today: The number of steps that a
//   user has taken today
// Goal number of steps: The user's goal for number of
//   steps to take each day
// Average heart rate: The user's average heart rate over
//   the last 24 hours

// Define variable for each. Use var for values that will
//   change and let for values that will not change:

// Add a comment to each line with an explanation of
//   why chose let or var







// Types and Type safety

// Remember you set a couple variables earlier named:
// width and height. Turns out you need to Assign them
// a decimal value.

// Uncomment the line below Notice the error that shows:

// height = 9.77

// Swift assigns a type to each variable and you are not
// allowed to change the type later. Earlier height was
// typed Int. You can option click it to see the type.

// Go to the top and change the type to look like this:
// var height: Double = 6

// Set the type of `width` and `shoeSize` to Double.

// Int is a whole number or integer and Double is a
// decimal or floating point number.



// Implicit types
// Notice you haven't set the type all your variables.
// Only some. When assigning a value Swift guess at the
// type from the value you assign.

// Consider this problem: You need to find the area of a
// circle then divide it into slices (imagine you're making
// an app that sells pizza by the square inch!):



// Consider the following, notice the error.
// Binary operator '*' cannot be applied to operands of type 'int' and 'Double'
// Radius is an int and pi is a double. Fix it by making radius type double.

//let slices = 8
//let radius = 10
//let area = radius * radius * pi // error

// That worked but Slices should be a whole number. What happens now, Error:
// Binary operator '/' connot be applied to operands of type 'Double' and 'Int'
// In this case you can cast a value as another type like this: Double(8)
// Try it here:

//let sliceArea = area / slices

//print(area) // 314.0
//print(sliceArea) // 39.25


// Challenges:
// 1. Your app needs to accept a username and hold it in a variable. What type is
//   best for this variable?

// 2. Your app needs to accept a password. What type should this be?

// 3. Your app needs to accept a variable that holds a user's shoe size. What type
//   is it?

// 4. Your app has a UIPicker that allows a visitor to choose their gender. The
//   choices are M, F, O(ther), N(ot specified). What type should these be?

// 5. Your app asks whether an applicant is older than 18. This is a check box or a
//   switch, what type is best here?

// 6. Your app asks how many people are in your party. (Imagine a reservation form)
//   What type is this?










