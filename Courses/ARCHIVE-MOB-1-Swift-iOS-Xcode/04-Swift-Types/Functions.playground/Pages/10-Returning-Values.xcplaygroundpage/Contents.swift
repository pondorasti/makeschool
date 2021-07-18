import Foundation
/*:
 ![Make School Banner](./swift_banner.png)
 # Returning data

 ## Return values

 There's one last thing functions can do: return data! Great code is readable code and returning values from functions will help you get things organized.

 Let's take a look at how to define a function with a return value.

 - note: A full circle is 360 degrees or 2π radians. A half circle is 180 degrees or π radians. A quarter circle is 90 degrees or π/2 radians.
 
 
 - note: `Double.pi` is a Swift constant that represents π as a `Double`

 */

func radiansToDegrees(radians: Double) -> Double {
    return radians * 180 / Double.pi
}

let halfPiRadiansInDegrees = radiansToDegrees(radians: Double.pi / 2)
let piRadiansInDegrees = radiansToDegrees(radians: Double.pi)
let twoPiRadiansInDegrees = radiansToDegrees(radians: 2 * Double.pi)

/*:

 ## Defining functions with return values

 The general form of a function with a return value is:

    func functionName() -> ReturnType {
        // "function body"
        return valueToReturn
    }

 You can add as many parameters as you would like but the important part is:

 1. `-> ReturnType` where `ReturnType` is the data type of the value you are returning (`Int`, `Double`, `String`, etc)
 2. `return valueToReturn` where `return` is a required keyword telling Swift to immediately exit the function and give the value back to it's caller. `valueToReturn` must be the same type as you specified earlier in `ReturnType`

 - important: The function must return a value of `ReturnType` with the `return` keyword no matter what!

 ## Degrees to radians

 It's time for you to define your own function with a return value!

 - callout(Challenge): Write a `degreesToRadians` function below and uncomment the test code. It should accept one parameter called `degrees` of type `Double` and return a `Double`.

 
 - note: You can convert from degrees to radians by inverting the math in the above function. Divide by `180` and multiply by `Double.pi` (π).

 */






//let halfPi = degreesToRadians(degrees: halfPiRadiansInDegrees)
//let pi = degreesToRadians(degrees: piRadiansInDegrees)
//let twoPi = degreesToRadians(degrees: twoPiRadiansInDegrees)

/*:

 - note: Half of π is roughly 1.57, π is roughly 3.14, 2π is roughly 6.28. Make sure your function returns the correct values!

 ## One more drawPolygon rewrite

 - callout(Challenge): Write a `calculateRotationForPolygon` function below that takes one parameter called `sides` of type `Int` and returns a `Double`. Copy your old `drawPolygon` function over and use `calculateRotationForPolygon`.

 */









//: - callout(Hint): Remember that you will need to _cast_ `sides` from an `Int` to a `Double`. Swift is very specific about types! You can _cast_ or convert it with `Double(sides)`.
//:
//: [Previous](@previous) | [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
