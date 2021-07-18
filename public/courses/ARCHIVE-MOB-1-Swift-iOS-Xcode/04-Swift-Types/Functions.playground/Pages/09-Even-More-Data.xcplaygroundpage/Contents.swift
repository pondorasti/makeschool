/*:
 ![Make School Banner](./swift_banner.png)
 # Passing Even More Data to Functions

 ## Even more parameters

 So far we've seen functions with no parameters and functions with one parameter. Let's try defining a function with two parameters! Can you guess what it might be?

 ## Generalized polygon function

 You might have noticed where we have been heading: a `drawPolygon` function with parameters of `numberOfSides: Int` and `sideLength: Int`. Your function should look like this:

    func drawPolygon(numberOfSides: Int, sideLength: Int) {
        // "function body"
    }

 - note: Notice how we comma-separate the parameters. You can define a function to take in as many parameters as you want -- you just need commas in-between each parameter!

 ## Give it a shot

 - callout(Challenge): Create a `drawPolygon` function using the template above. You want to use a for-loop like we did on the last page!

 */









/*:

 ## Calling functions with more than one parameter

 How do you think this function would be called? A reasonable guess is that `drawPolygon(numberOfSides: 3, 100)` would create a triangle with sides of length `100` but no, that won't work!

 The correct (and only way) you can call the function above is with the format `drawPolygon(numberOfSides: 3, sideLength: 100)`.

 ### What???

 Some of you are now wondering why `drawPolygon(numberOfSides: 3, sideLength: 100)` works and `drawPolygon(numberOfSides: 3, 100)` does not. By default, Swift requires a parameter label for each parameter. If you do not explicitly specify a parameter label, it assumes you want to use the parameter name as the label too. This means the generalized format of calling a function with multiple parameters is:

    functionName(parameterOneName: parameterOneValue, parameterTwoName: parameterTwoValue)

 - callout(Challenge): Test your `drawPolygon` function below and make sure it works!

 */





/*:

 ## Parameter labels in function calls

 Swift will automatically require a parameter label for every parameter. The label defaults to the parameter's internal name. Technically, when you define a function as:

    func drawPolygon(numberOfSides: Int, sideLength: Int)

 you are using a shorthand for:

    func drawPolygon(numberOfSides numberOfSides: Int, sideLength sideLength: Int)

 ## More control over parameter labels

 ### Specify a custom parameter label

 You could even use a parameter label that is different than the parameter name if you wanted to! You would need to define your function with the format:

    func drawPolygon(sides numberOfSides: Int, sideLength: Int)

 This would be called with:

    drawPolygon(sides: 3, sideLength: 100)
 
 - callout(Hint): Custom paramter labels can be specified for any paramter, not just the first one.

 ### Removing the parameter label from a parameter

 Or you could tell Swift you do not want a label for a parameter by defining your function with the format:

    drawPolygon(numberOfSides: Int, _ sideLength: Int)

 This would be called with:

    drawPolygon(numberOfSides: 3, 100)
 
 - callout(Hint): `_` is the way of specifying no label is required.

 */
//: [Previous](@previous) | [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
