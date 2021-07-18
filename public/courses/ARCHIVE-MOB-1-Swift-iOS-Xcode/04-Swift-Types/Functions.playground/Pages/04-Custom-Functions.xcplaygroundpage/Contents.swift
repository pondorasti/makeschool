/*:
 ![Make School Banner](./swift_banner.png)
 # Custom Functions

 Let's try creating our own, custom function. We just developed a procedure for drawing a square, wouldn't it be nice to have a `drawSquare()` function?

 ## Defining functions

 We've already learned how to call functions, but how do we create our own?

    func functionName() {
        // "function body"
        // function's code goes here
    }

 We use the keyword `func` to define a function (similar to how we use `var` for variables and `let` for constants). The function's name (`functionName` in our example) comes after the `func` keyword and it is followed immediately by parentheses. This is then followed by matched curly braces `{` and `}`. These are located near the enter key on your keyboard -- you'll need to hold the shift key to type them.

 All your function's code should be put inside the curly braces. Any code inside the curly braces will be executed whenever the function is called.

 ## Your first function

 - callout(Challenge): Try defining your own `drawSquare` function below. Use the sample function above as a reference but make sure to change the name! You should be able to copy your square drawing code from the previous page and paste it inside of the function body.

 */



/*:

 ## Did it work?

 Did the visualization draw a square like you planned it to? Why not?

 ## Defining a function does not execute the code!

 You still must call the function to execute its code. If you followed the steps closely, nothing will have happened to your drawing visualization because you only defined a new function, you never called it. Go back up and add a new line of code to call `drawSquare` (after the closing curly brace of your custom function). Now you should see a square drawing on the screen!

 ## Some notes

 ### Naming functions

 Keep in mind that function names must follow the same rules at variable names.

 - must start with a letter of the alphabet
 - may contain any alphanumeric character, plus some additional ones, like underscores
 - may not contain spaces

 ### Indentation

 You might have also noticed that we indented everything in the "function body". _It is common practice in programming to indent once (one press of the tab key if Xcode doesn't do it automatically) for every time you open a curly brace._ __Pay attention to our indentation and try to match it when you code. It's really important for readability that you follow this practice!__

 ### Reminder about Playgrounds

 - important: Your custom functions will only work on the page you defined them. That means, when you go to the next page, you won't have access to the `drawSquare` function anymore! This is the expected behavior of Swift Playgrounds so don't worry. We'll remind you when you should copy code over between pages...

 */
//: [Previous](@previous) | [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
