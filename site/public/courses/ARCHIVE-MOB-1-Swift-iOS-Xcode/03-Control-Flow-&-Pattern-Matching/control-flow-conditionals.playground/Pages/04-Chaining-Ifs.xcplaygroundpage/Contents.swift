/*:
 ![Make School Banner](./swift_banner.png)

# Chaining Conditionals

 Sometimes we will need to evaluate more than two independent conditionals and run different pieces of code for each of them. We could do this with `if then else` statements nested in other `if then else` statements, but Swift provides a shortcut for this -- `if else`

 The following nested `if then else`:

     if conditional1 {
        // runs if conditional1 is true
     } else {
        if conditional2 {
            // runs if conditional1 is false and conditional2 is true
        } else {
            // runs if both conditional1 and conditional2 are false
        }
     }

 can be re-written as:

     if conditional1 {
         // runs if conditional1 is true
     } else if conditional2 {
         // runs if conditional1 is false and conditional2 is true
     } else {
         // runs if both conditional1 and conditional2 are false
     }

 This saves us a few keystrokes _and_ makes it more clear what our logic is trying to do!

 # Panic braking!

 What happens if the car in front of us brakes suddenly and hard? Our cruise control needs to support panic braking! Let's change up our logic a bit. This time we want to support two types of braking -- `brake()` and `brakeHard()`. Our logic should be able to survive this scenario without crashing! It should also get up to the speed limit in a reasonable amount of time.

 - callout(Hint): Only brake if the distance between cars is reasonably close -- there is no reason to brake for a car a mile ahead slowing down! Use the difference between `previousDistance` and `distance` to decide how hard to brake. Accelerate only when under the speed limit and the distance between cars is increasing.

*/
func cruiseControl(currentSpeed: Int, distance: Int, previousDistance: Int) {
    // Fix this to implement a basic adaptive cruise control

}
//: [Previous](@previous) | [Next](@next)
//:
//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = GameScene.setup(step: .maintainUntilClear)
(results.scene as! GameScene).updateCar = cruiseControl
PlaygroundPage.current.liveView = results
