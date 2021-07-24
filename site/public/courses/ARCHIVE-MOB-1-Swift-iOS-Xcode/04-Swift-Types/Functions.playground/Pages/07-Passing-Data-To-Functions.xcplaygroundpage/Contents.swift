/*:
 ![Make School Banner](./swift_banner.png)
 # Passing Data to Functions

 ## Defining a function

 Previously, we've seen how to call functions with and without parameters but only how to define a function with no parameters. Let's review really quickly

 Calling a function without parameters:

    functionName()

 Calling a function with 1 parameter:

    functionName(parameterName: parameterValue)

 Defining a function without parameters:

    func functionName() {
       // "function body"
       // function's code goes here
    }

 Where `func` is the keyword used to define a function, followed by the function name, an empty pair of parentheses, and a pair of curly braces (`{` `}`) surrounding the code contained in the function.

 ## Adding a parameter to your function definition

 The general form of a function with one parameter is:

     func functionName(parameterOneName: parameterOneType) {
         // "function body"
         // function's code goes here
         // value passed in becomes a constant with the name parameterOneName
     }

 If you compare this to the earlier functions we defined, you'll see the difference is the parameter name and type inside of the parentheses. It starts off with the same keyword `func`, followed by the function name, parentheses and curly braces. Remember, anything "inside" the curly braces gets indented once (one press of the tab key if Xcode doesn't do it for you automatically).

 A lot like the variables we defined before, parameters must specify their data type and you cannot call a function with anything of a different type. Parameter names are similar to variable names -- they should be concise and descriptive. Another programmer should know what they are going to be used for just by looking at their name.

 ### Quick review of data types

 Data types describe information used in programming. They are important when defining variables/constants, performing operations on values, and passing parameters into functions. The basic data types you should be familiar with so far are:

  - `Int`: whole numbers, when divided they output integer division -- result is always rounded down!
  - `Double`: numbers with a decimal place
  - `String`: combination of letters, numbers, and other characters -- cannot be used for arithmetic even if the `String` contains only numbers! String types must be surrounded with double quotes (`"this is a string!"`)

 ## A more versatile drawSquare

 - callout(Challenge): Let's create a new `drawSquare` function that accepts a parameter for size. This will allow one function to create squares of multiple sizes! We've already started you out in the space below -- `drawSquare` takes one parameter named `sideLength` of type `Int` (a whole number). Fill out the function's body!

 Remember, `sideLength` becomes a constant inside of the function's body. You can directly use constants and variables as parameters when you call other functions! Test out your new method with a function call of `drawSquare(sideLength: 150)`.

 - important: Make sure to call the drawSquare function after you have defined it! It needs to be called with a function parameter like we did on the previous page.

 */

func drawSquare(sideLength: Int) {

}

/*:

 ## All working?

 - callout(Challenge): Once you have the resizable `drawSquare` function working, do the same for `drawTriangle`, `drawPentagon`, and `drawHexagon` below.

 */












//: [Previous](@previous) | [Next](@next)


















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
