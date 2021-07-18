/*:
 ![Make School Banner](./swift_banner.png)
 # Becoming Functional
 ## An Introduction to Functions

 Now that you have some control over variables, it's time to move on to _functions_. _Functions_ are chunks of code that you can reuse by _calling the function_. You will be working with a special drawing tool throughout most of this Playground. The pictures will start off simple and build up in complexity as you learn more and experiment.

 ## Let's call a function!

 We're going to jump right into things so you can call your first function. Enter the following line of code and watch the visualization to see what happens!

    moveFifty()

*/



/*:

 What can we infer about _function calls_ from the line above?

 ## Anatomy of a function call

 A _function call_ looks a lot like a variable but it has parentheses after it. Function calls take the form of:

    functionName()

 In this case, you called a function named `moveFifty`. What happened in the visualization? You should have seen the triangle move `50 units` and leave behind a line.

 It's important to keep in mind that functions (like variables) must be defined before they are called. We have already defined the `moveFifty()` function for you in another file. `moveFifty()` will work anywhere but you cannot just call `moveThirty()` and expect it to work. A `moveThirty` has not been defined yet. We'll show you how to define your own functions soon but let's focus on calling them for now.

 - experiment: What happens if you call the `moveFifty` function again in the space below? What happens if you call it a third time?


 - important: _Make sure each function call is on a separate line and don't forget the parentheses!_

 */






/*:

 ## What happened?

 Every time you call `moveFifty` the function's code is executed another time. With 3 calls in a row to `moveFifty` the triangle should move `150 units` in a straight line and leave a path behind it.

*/
//: [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
