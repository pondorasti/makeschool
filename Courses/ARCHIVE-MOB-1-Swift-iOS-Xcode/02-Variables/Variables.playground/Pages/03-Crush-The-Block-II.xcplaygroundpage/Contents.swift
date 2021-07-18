/*:
 ![Make School Banner](./swift_banner.png)
 # Crush the Block II

 Let's get started with the next challenge! This playground controls the _Crush the Block II_, the exciting sequel to the Crush the Block microgame.

 This time, in order to crush the block, you need to change the variable called force to make the block on the left jump off the platform and hit block on the right. `force` is the amount of rightward force applied to the block. You'll need to find the right value -- too high and you'll overshoot, too low and you won't make it across the gap!

 Start off by changing `0` to `10`. You might not see any changes until you get to higher values. Keep trying until you get it just right.

*/

let force: Int = 0

/*:

 Got it? Great!

 You might have noticed that there was one tiny difference between this code and the previous exercise: the word `let` is used instead of `var`. What is that all about?

 `var` is a keyword that tells the Swift compiler "create a variable". In the previous exercise, we created an `Int` type variable for you and gave it an initial value of `50` (using `var distanceFromLeft: Int = 50`). Throughout the exercise you continued to change the variable without using the var keyword (`distanceFromLeft = 160`). `var` and the type (`Int`) is only needed the first time a variable is encountered.

 So what does `let` mean? Let's experiment and see if we can figure it out...

 Try entering `force = 0` below to _reassign the force to zero_.

*/



/*:

 ![](imgs/let_error.png)

 ## OH NO! EVERYTHING IS TERRIBLE!

 Don't panic! We’ve just encountered a _compiler error_. The color red is used to indicate bits of code the compiler doesn’t like.

 But why does it not like this line? Lucky for us, the compiler also tells us exactly what is wrong and even gives us a suggestion on how to fix it (you might need to click the red error octogon to see this information).

 When you get an error, you can often find out what the issue is by reading the error message.  In this case, we get an error of:

 `Cannot assign to value: 'force' is a 'let' constant`

 Below that, it even gives you a recommendation of how to fix it (`Change 'let' to 'var' to make it mutable`).

 ## 'let' constant

 Using the keyword `let` instead of `var` creates a _constant_ instead of creating a _variable_. Constants (like variables) are used to store data for using later on. A _constant_ cannot change -- it must remain it's intial value. This means we cannot reassign a constant.

 You should use `let` to create constants when you want to store data that won't be changed later in the code. If the value might need to be reassigned then you'll have to use `var` to create a variable. This works because variables are "mutable" (can be changed). Constants on the other hand are "immutable" (can not change).

 - note: It is best to use `let` instead of `var` whenever possible. Swift will sometimes even "complain" to you (with a _compiler warning_) if you use `var` when it was possible to use `let`.

 
 - important: the Playground cannot run while there are errors (any red marks). Make sure to remove `force = 0` from above since it is not needed.
*/
//: [Previous](@previous) | [Next](@next)






































//:This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = CrushTheBlockIIScene.setup(crusherVelocity: force)
PlaygroundPage.current.liveView = results
