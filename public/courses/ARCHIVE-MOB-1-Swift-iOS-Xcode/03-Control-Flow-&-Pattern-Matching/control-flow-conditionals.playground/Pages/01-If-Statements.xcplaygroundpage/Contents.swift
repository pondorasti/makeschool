/*:
 ![Make School Banner](./swift_banner.png)
 # Conditionals
 
 We'll be talking about _booleans_ and _conditionals_ in this playground. Booleans represent the values of `true` and `false`. _Conditionals_ allow us to use _boolean_ values to decide what code should run!
 
 We'll be programming an _adaptive cruise control_ system as we learn about _booleans_ and _conditionals_. For those of you who do not drive, _cruise control_ is a feature that maintains the speed of your car. In the past few years, consumer cars have gotten closer and closer to the fabled self driving car. Many new cars have an optional _adaptive cruise control_ feature that not only maintains speed, but uses distance sensors to automatically slow your car down if it is approaching an obstacle!
 
 ## Bool
 
 In Swift, _booleans_ are represented by the `Bool` type. There are two values possible values for a `Bool` -- `true` and `false`. We can use the following _boolean operators_ to evaluate and expression to a boolean:
 
 - `<` less than
 - `>` greater than
 - `==` equal to
 - `!=` not equal to
 - `<=` less than or equal to
 - `>=` greater than or equal to
 
 You can see this in action below!
 
 */
let lessThanExample = 0 < 1
let greaterThanExample = 1 > 0
let equalToExample = 0 == 0
let equalToStringExample = "test" == "test"
let notEqualToExample = "boolean" != "random string"
let lessThanEqualToExample = 0 <= 0
let greaterThanEqualToExample = 1 >= 0
//: - experiment: Try out some _boolean operators_ below!





/*:
 
 ## `If` statements
 
 We can combine `Bool` values with _if statements_ to react to conditions in our code! The code inside of an _if statement_ will only run if the _boolean conditional_ is `true`.
 
 An _if statement_ takes the form of:
 
    if conditional {
        // code in here only runs when the conditional is true!
    }
 
 Check out some examples below!
 
 */
if 0 < 1 {
    print("Zero is less than one")
}

if 0 > 1 {
    // this will never run! Swift even warns you about it with the yellow triangle
    print("Zero is greater than one")
}
/*:
 
 Those examples are a bit silly but should demonstrate the point. The code inside _if statements_ will run when the _conditional_ evaluates to `true` and will not run when the _conditional_  evaluates to `false`.
 
 # A basic cruise control
 
 Let's put this knowledge to the test and program a basic cruise control system!
 
 The `cruiseControl` function below gets called automatically a few times a second. It currently will accelerate our car (the blue one) no matter what. The car actually crashes into another car!
 
 - callout(Challenge): Fix the code below! The speed limit on this road is _60 mph_. Change the code to make the car accelerate up to, but not past _60 mph_!
 
 */
func cruiseControl(currentSpeed: Int, distance: Int, previousDistance: Int) {
    if true {
        accelerate()
    }
}
/*:
 
 - callout(Hint): The car will increase its speed by _1 mph_ everytime you call `accelerate` but you can only call `accelerate` once per time `cruiseControl` is automatically called.
 
    You do not need to use `distance` and `previousDistance` right now! We'll be using those in later sections...
 
 */
//: [Next](@next)
//:
//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = GameScene.setup(step: .speedUp)
(results.scene as! GameScene).updateCar = cruiseControl
PlaygroundPage.current.liveView = results
