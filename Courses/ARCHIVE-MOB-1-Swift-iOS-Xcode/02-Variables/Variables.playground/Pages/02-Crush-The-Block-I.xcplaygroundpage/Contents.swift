/*:
 ![Make School Banner](./swift_banner.png)
 # Crush the Block

 We'll be playing a microgame called _Crush the Block_. The goal is to change the position of the yellow block so it will fall onto the white block.

 Like we said earlier, _Playgrounds_ allow for both code and instructions in the same file. This means we can explain everything as you code your way through the challenges. Prepare to see your first line of code!
*/

var distanceFromLeft: Int = 50

/*:

 ## First line of code

 See that line above? This creates a new _variable_ called `distanceFromLeft` and stores the value `50` in it. We'll dissect the syntax of this line after we complete the challenge.

 Based on the visualization (on the right), the center of the falling block is `50` units from the left side of the screen. It starts to fall as soon as the microgame starts.

 Try updating `distanceFromLeft` to contain the value `160` instead.

 - callout(Try it out): Enter the following code below to update the value stored in `distanceFromLeft = 160`

*/



/*:

 - note: Make sure to enter things exactly as you see them when coding! Spelling, capitalization and spacing all need to be exact or the computer might end up confused.

 ## Experimenting with variables

 If everything is working correctly, the microgame should have restarted and the top block should have moved! It is now `160` units from the left side of the screen! _Congratulations!_ You just wrote your first line of code!

 - experiment: Try a few more values until you’re convinced that the center of the falling block will always use the value of `distanceFromLeft` to decide where it will drop from.

 Explore the following:
 * What happens if you use a negative number?
 * What about a number greater than 320?
 * Can you use arithmetic? Try `distanceFromLeft = 25 + 50`

 - important: As you're experimenting, you should notice that the code runs sequentially from the top of the _Playground_ to the bottom. You can "re-assign" distanceFromLeft as many times as you want. It will just use the bottom-most or last value!

*/



/*:

 ## Crushing the block!

 Once you’re convinced, try placing the top block above the one sitting on the ground. 260 units ought to be just right!

 - callout(Try it out): Enter the following code below `distanceFromLeft = 260`

*/



/*:

 Yay! You just completed your first challenge! :)

 ## What just happened?

 In this challenge, you created a variable and set it's initial value in the first line. In the other lines, you continued to update the value of the variable (or "re-assign it").

 That explanation probably raises a few more questions. What is a variable exactly?  What does it mean to set it?

 In code, values like `160` or `270` can be saved into what are called "variables". A variable is a nickname for a value that can be used to refer to that value later.

 A variable is a thing that can hold a value, a lot like a cell in a spreadsheet. Setting (or assigning) a variable means specifying what the variable is holding, like entering a number into a spreadsheet.

 ## Creating a variable

 Variables can be created with the "keyword" `var`. When you create a variable, it must be created to hold a specific _type_ of data. A _type_ is a classification for data, like how apples and oranges are both types of fruit.

 There are many types of data in Swift, in these early exercises we will be using:

 - `Int` type for integers (whole numbers)
    - `0`, `77`, `-42`
 - `Double` type for non-integer numbers
    - `3.14`, `0.375`, `-1.337`
 - `String` type for words and letters
    - `"This is a String example!"`, `"Catch 22"`, `"e"`

 This exercise only used the `Int` type (whole numbers). How did the computer know that we wanted the variable `distanceFromLeft` to be an `Int` variable?

 - important: We created `distanceFromLeft` with the line

      `var distanceFromLeft: Int = 50`

    We already know `var` is the keyword for creating a variable. We know `distanceFromLeft` is the name of the variable. We also know that `50` was the intial value. Using this knowledge we can infer that the syntax to create variables is `var variableName: variableType = value`. `var`, the `:` and the `=` are always there. _variableName_, _variableType_, and _value_ are what change.

 ## Naming a variable

 The cool thing about variables is you can nickname them in what looks like regular language. This makes it easy to remember what they mean. If you name your variables well, other people can figure it out by looking at them.

 Our variable `distanceFromLeft`, for example, is a number of units from the left, like the name implies. If we had wanted to be even more specific, we could have named it something like `distanceFromTheLeftSideOfTheScreenThatTheCenterOfTheTopBlockWillAppear`, but... we wanted something a bit shorter that still got the basic idea across.

 Each coding language has different rules for naming variables. In Swift a variable:
 - must start with a letter of the alphabet
 - may contain any alphanumeric character, plus some additional ones, like underscores
 - may not contain spaces

 `distanceFromLeft` is named using a pretty common naming convention called "Camel Casing". This means each new word (not counting the first) starts with a capital letter (since we can't use spaces and underscores can be annoying to type).

 ## Updating the value in a variable

 To update a variable that was already created, you write the name of the variable on the left (`distanceFromLeft`, in this case), an equal sign (also called "the assignment operator") and the value you’d like to assign on the left (`50` initially, but you changed it to make it work).

 An expression like: `distanceFromLeft = 50` can be read: "assign the variable named distanceFromLeft to have the value 50."

 ## Why was setting this variable special?

 Why did it make the game do stuff? Changing this makes the game do stuff because the code below uses the value of distanceFromLeft to position the top block when the scene loads. It’s not important to understand this code now, but you can see it at the bottom of this Playground page.

 See how the code has the variable `distanceFromLeft` in there?  That’s the same variable we set a few lines earlier. What do you think will happen if you set the variable after the line starting with `let results`?

 - callout(Moving on): Whew, that was a lot of information. Let's continue through the challenges and try applying these concepts in a few other ways. Press next below!

*/
//: [Previous](@previous) | [Next](@next)






































//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import Foundation
let results = CrushTheBlockIScene.setup(crusherPosition: distanceFromLeft)
import PlaygroundSupport
PlaygroundPage.current.liveView = results
