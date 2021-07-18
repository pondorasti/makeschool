import UIKit

// Functions

// Functions are core to all programming languages. Defining they in Swift is
// very similar to other languages.

func doNothing() {
    //
}

// invoke the function:
doNothing() // nothing happened!

// Functions in Swift take parameters and those parameters have a type:

func takesParam(name: String) {
    //
}

// Invoke the function. Parameters have names that appear with the value
takesParam(name: "Sour") // name: "value"

// Functions in Swift return values and the return value has a type. Notice the return
// type is preceded by: ->

func returnsSomething(name: String) -> String {
    return "Hello \(name)!" // returns a string
}

var something = returnsSomething(name: "fancy")
// Here `something` is assigned a string and is type string since the
// function Returns a string.


// This means that if you had a variable that was type string:
var somethingElse: String
// You could use `returnSomething` to assign a value:
somethingElse = returnsSomething(name: "Fantastic!")
// But if you had a variable that was type Int you would get an error
var otherStuff: Int
// The line below shows an error: Cannot assign value of type 'String' to type 'Int'
//otherStuff = returnsSomething(name: "Boondoggle!")






// Quick note! Concatenate a variable with a string using \().
var twentyTwo = 22
// Combine the variable above with the string below
var description = "There are \(twentyTwo) reasons..."
print(description)
// You can put any valid expression in the \(...)
print("Todays greeting is: \(returnsSomething(name: "Fungi"))")
print("The number Pi is roughly \(22.0/7.0)")





// Challenge:
// Write the following functions:

// 1. Write a function that prints your name using print().



// 2. Call/invoke the function you just wrote



// 3. Write a function that takes a String as a parameter.
//   Your function should print the string with "***" before and
//   after the input string.



// 4. Write a function that calculates the area of a rectangle.
//   It should take the width and height as parameters of type Int
//   and return an Int



// 5. Call your area function with the values 25 and 35 and print
//   returned results.



// 6. Write a function that calculates the area of a circle. It
//   take radius, an Int, and return a Double. The area of a
//   is roughly 3.14 * radius * radius.
//   You'll have to convert the radius to Double to do the math!







// Functions in swift use named paramters but can also define an extrnal
// and internal name. The internal name is used inside the function block
// while the external name is used when invoking the function.

func someFunc(externalName internalName: Int) -> Int {
    return internalName + 10 // internal name used here!
}

// Notice there are two names: externalName and internalName.
// Notice the internale name is used inside the code block.
// The external name is used when calling the function:

let res = someFunc(externalName: 40) // externalName is used here!

// Read the two code blocks above carefully. Notice in the first the
// variable used inside the function is `internalName` and in the second
// the name for the argument is `externalName`






// The function below uses only the internal names. This means you'll
// need to use the names: width1, height1, width2, and heigh2

func resize(width1: Int, height1: Int, width2: Int, height2: Int) {
    // use width1, height1, width2, and height2 here
}

// Use width1, height2, width2, height2 here also
resize(width1: 20, height1: 30, width2: 100, height2: 400)

// Notice here the external names are the same as the internal name.




// Adding some external and internals names you could rewrite this
// function like this:

func resize2(fromWidth width1: Int, fromHeight height1: Int, toWidth width2: Int, toHeight height2: Int) {
    print("Previous dimensions: \(width1) x \(height1)")
    // ...
    print("New dimensions: \(width2) x \(height2)")
}

// Invoking the function you'll use the names: fromWidth, fromHeight, toWidth, toHeight
resize2(fromWidth: 20, fromHeight: 30, toWidth: 100, toHeight: 400)



// Why use internal and external names?

// Naming is important. The names used for parameters can have a
// different semantic meaning when calling a function
// and when used inside a function. Using different names in each place can help
// clarify how to use a function. Expect to see this often when programming
// in Swift and UIKit it's how they do it!

// Consider this:

func greet(user name: String, withPrefix prefix: String) {
    // Here we use prefix and name
    print("Hello \(prefix) \(name)")
}

// When in invoking the function:
greet(user: "Frango", withPrefix: "Mr.")
// This reads as: greet user with prefix which maybe makes it more clear.



// Write some new functions. Be sure to make use of internal and extrernal paramters.

// 1. Imagine you are making an app to help contractors calculate area.
//    This would help them estimate cost for materials and time. Your
//    first function will calculate the area of a square. Your function
//    should accept two Int values: length and width, and a cost per
//    square foot a Double. It should calculate the area and multiply by
//    the cost and return the answer as a Double. For example imagine
//    length of 48 and a width of 96 and a cost of 0.33 per square foot.
//    The function should return: 4 * 8 * 0.10 = 10.56



// 3. Write a function that orders a pizza. It should take the type of
//    pie as a string (cheese, pepperoni, etc.), the size of the pie
//    inches in inches as an int, the number of toppings as an Int,
//    and return a tuple that includes the type with the size for example:
//    "cheese 10"" as string, and the cost as a Double.
//    Calculate the cost as the area times 0.05 + 0.03 * number of toppings
//    For example a 5" radius pie with 3 toppings:
//    5 * 5 * 3.14 * (0.05 + 0.03 * 3) = 10.99








