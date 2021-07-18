/*:
 ![Make School Banner](./swift_banner.png)

 # `If` then `else` statements

 You might be wondering how to do something different when the _conditional_ is `false`... Sure, you could try to invert the logic and use a second `if` statement, but there has to be a better way, right?

 ## Enter `else`

 `If` statements can be paired with a matching `else` statement. The code inside the `if` will run when the _conditional_ is `true` and the code inside the `else` will run when the _conditional_ is `false`. An `if` then `else` statement looks like this:

    if conditional {
        // code in here only runs when the conditional is true!
    } else {
        // code in here only runs when the conditional is false!
    }

 Pretty cool, huh? A lot of code relies on conditional statements. They allow our programs to appear smart!

 # A smarter cruise control

 Our previous cruise control accelerates to the speed limit no matter what! In this example, there is a car driving under the speed limit and our logic causes a crash :(

 Now that we know about `else` statements, can you turn the _cruise control_ into an _adaptive cruise control_?

 - callout(Challenge): Fix the `cruiseControl` function below! It should call the `brake()` function when `distance` is less than fifty, otherwise it should call `accelerate()` _until it reaches 60 mph_.

 */
func cruiseControl(currentSpeed: Int, distance: Int, previousDistance: Int) {
    // Fix this to implement a basic adaptive cruise control
    if currentSpeed < 60 {
        accelerate()
    }
}
/*:

 - callout(Hint): You are going to need to put a second `if` statement inside of `else`!

 ## That works, but it's not very stable...

 The outcome should look something like this:

 ![](not_stable.gif)

 Our logic can still use a bit of an improvement! Right now our car is speeding up and braking erratically while the car in front of it maintains a steady speed. We'll try to stablize our _adaptive cruise control_ on the next page so that our car will slow down to a safe following distance and match the speed of the car in front of it.

 */
//: [Previous](@previous) | [Next](@next)
//:
//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = GameScene.setup(step: .maintainDistance)
(results.scene as! GameScene).updateCar = cruiseControl
PlaygroundPage.current.liveView = results
