/*:
## Routines
 
 Dancing is fun, but if you write out the moves one by one, describing even a simple dance gets long and repetitive. Instead, people usually string individual moves together, and then give a name to the whole routine. 
 
 You create routines in code by building functions like this:
 */
func doTheDisco() {
    leftArmUp()
    shakeItRight()
    leftArmDown()
    shakeItCenter()
}
//:  Once you've decided what moves go in the routine, start the robot dancing by calling the function you just made:
startBot()
fabulize()
doTheDisco()
doTheDisco()
doTheDisco()
/*:
 Functions are the way programmers group blocks of work together.
 
- A function is reusable, which saves on reading and typing.
- A function can be understood on its own, so you don’t have to think of every single step.
- If a function is changed, the changes apply everywhere the function is used.
 
 You’ll get all these benefits with `doTheDisco()`.

 - Experiment: Change the `doTheDisco()` function into a mirror image, so anything done “left” becomes “right”, and anything “right” becomes “left.” Imagine how much work it would have been if you’d typed out the same moves three times.

 Want to personalize your BoogieBot? Learn how to sign your work on the next page.
 
[Previous](@previous)  |  page 5 of 9  |  [Next: Sign Your Work](@next)
 */
