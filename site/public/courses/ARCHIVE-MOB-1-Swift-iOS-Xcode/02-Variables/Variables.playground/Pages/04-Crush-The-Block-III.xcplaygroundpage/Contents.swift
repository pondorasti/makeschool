import Foundation
/*:
 ![Make School Banner](./swift_banner.png)
 # Crush the Block III

 This is _Crush the Block III_, the third and final installment in the saga. This microgame is exactly the same as the previous one, except now a gust of wind blows against your block!

 The way wind works in this microgame is the force of the wind gets subtracted from whatever value you set for force, so if the wind blows with a value of `4` and you set `force = 6`, the block will have a total force of `2` (because `6 - 4 = 2`).

 If you knew the wind force, you could just adjust your number from before accordingly. So, if you knew the wind force was `4`, and you wanted your block to experience a total force of `6`, rather than setting the `force = 6`, you would set `force = 10`, because `10 - 4` equals `6`.

 - note: The value of wind force is saved to the constant windForce. We can see where that constant is created below.

 */

let windForce: Int = Int(arc4random()) % 25 + 50

/*:

 Unfortunately for us, this isn’t something simple like `let windForce: Int = 4`, instead, we have `let windForce: Int = Int(arc4random()) % 25 + 50`. You'll be able to understand this soon enough but, for now, just trust us that `windForce` is a random number between `50` and `74` inclusive.

 `windForce` will change every time the game is run (at least every time you change the code) so you cannot count on it being any specific value.

 In a _Playground_, the value of an expression is shown to the far right of the line of code:

 ![](imgs/random.png)

 In the above screenshot you can see the windForce with a value of `64` (look at the far right side). This changes every time the playground runs (every time the code changes). You can also manually re-run a playground by toggling the stop/play buttons at the bottom:

 ![](imgs/toggle_run.gif)

 ## What now?

 `windForce` is constantly changing so we need force to be our old `force` plus `windForce`. Try adding `+ windForce` to the line below.

*/

let force: Int = 80

/*:

 ## Did that work?

 Hopefully you got it working. If not, make sure the line above reads `let force: Int = 80 + windForce`. The spaces around the plus operator need to even (putting a space only on one side won't work) for the computer to correctly compute the value!

 What does this line of code say, and why does it work?

 The line of code can be read: "create a constant named `force` of type `Int` to be equal to the value of `80` plus the value of `windForce`."  The cool thing about this is, we never even need to know the value of wind force! (80 is an arbitrary working value from _Crush the Block II_)

 Another way to translate the line of code we’ve just written is this: "set the constant force to be equal to the output of the math on the right side of the equal sign" and then we can translate that math into "80 plus the value of the variable windForce."

 - note: The plus sign, by the way, between 80 and windSpeed is one of many operators you can use to do math between number variables.  Others include `-` for subtraction, `/` for division, and `*` for multiplication.  You can also use parentheses to determine order of operations, but be aware that, unlike in normal math, something like `(x) y` does not mean (x) times y.  You need to explicitly put a multiplication operator between any values you want to multiply, so `(x) * y` or even just `x * y` would be valid.

*/
//: [Previous](@previous) | [Next](@next)






































//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = CrushTheBlockIIIScene.setup(forceToApply: force, windSpeed: windForce)
PlaygroundPage.current.liveView = results
