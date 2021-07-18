/*:
 ![Make School Banner](./swift_banner.png)
 
 # Boolean logic
 
 Sometimes we will want to check two different conditionals at the same time. We could make this work with an `if` statement inside of an `if` statement but that seems like a lot of typing! Especially when we want to do something _if either one of two conditionals are true_.
 
 There are three _boolean logic operators_ we will need...
 
 ## Not `!`
 
 `!` (not) is used on a single `Bool`. It inverts it! `true` becomes `false` and `false` becomes `true`.
 
 */
!true
!false
/*:
 
 ## And `&&`
 
 `&&` (and) is used to combine two `Bool` values into one. The result is `true` when both `Bool` values are `true` and `false` all other times.
 
 */
true && true
true && false
false && true
false && false
/*:
 
 ## Or `||`
 
 `||` (or) is used to combine two `Bool` values into one. The result is `true` when either or both `Bool` values are `true` and `false` when both `values` are `false`.
 
 */
true || true
true || false
false || true
false || false
/*:
 
 - important: In the examples we use raw `true` and `false` values but `!`, `&&`, `||` can all be used with `Bool` variables and conditional statements like `<` and `==`!
 
 # Improving the logic
 
 Our first shot at an _adaptive cruise control_ worked but was pretty unstable. It was not able to match the speed of the car in front of it and looked something like this...
 
 ![](not_stable.gif)
 
 We want our _adaptive cruise control_ to behave a bit more like this...
 
 ![](stable.gif)
 
 See how it is speeding up and braking erratically while the car in front of it maintains a steady speed. We want it to slow down to a safe following distance and match the speed of the car in front of it.
 
 - callout(Challenge): Fix the `cruiseControl` function below! It should call the `brake()` function when `distance` is less than fifty. Otherwise, it should call `accelerate()` when it's is under 60 mph and it is slower than the car in front of it.
 
 */
func cruiseControl(currentSpeed: Int, distance: Int, previousDistance: Int) {
    // Fix this to implement a basic adaptive cruise control
    if distance < 10 {
        brake()
    } else {
        if currentSpeed < 60 {
            accelerate()
        }
    }
}
/*:
 
 - callout(Hint): You will need to use `distance` and `previousDistance` to solve this!
 
 */
//: [Previous](@previous) | [Next](@next)
//:
//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = GameScene.setup(step: .maintainDistance)
(results.scene as! GameScene).updateCar = cruiseControl
PlaygroundPage.current.liveView = results
