/*:
 ![Make School Banner](./swift_banner.png)
 # Combining Function Calls
 ## Rotate by ninety degrees

 Let's try a new function: `rotateNinety`. Remember, function calls are followed by parentheses! Enter the following line of code and watch the visualization to see what happens!

    rotateNinety()

 */



/*:

 ## What happened?

 The triangle should have rotated the triangle ninety degrees counter-clockwise (to the left or in the opposite direction of a clock's hands). The `rotateNinety` function has a different name than the `moveFifty` function and each function executes a different set of code.

 - experiment: What happens if you combine calls to `moveFifty` with calls to `rotateNinety`? Go back to the space above where you originally called `rotateNintey` and try it out! Can you draw anything cool?

 
 - important: _Make sure each function call is on a separate line and don't forget the parentheses!_

 */
//: [Previous](@previous) | [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
