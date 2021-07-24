import Foundation
/*:
 ![Make School Banner](./swift_banner.png)
 # Fix the Clock

 In _Fix the Clock_, your job is to make the three hands of the analogue clock match the time on the digital one! Every frame, your code will read new values for the time in hours, minutes, and seconds.

 The constants containing the current time are `hours`, `minutes`, and `seconds`. Each of these are a randomized `Double` type. Can you guess why we use a `Double`?

 We are using a few concepts we haven't taught you yet to randomize these values. Don't worry though, you'll understand them in the next set of challenges when we teach you functions!

*/

let hours: Double = Double(Int(arc4random()) % 12 + 1)
let minutes: Double = Double(Int(arc4random()) % 60)
let seconds: Double = Double(Int(arc4random()) % 60)
var hourRotation: Double = 0.0
var secondRotation: Double = 0.0
var minuteRotation: Double = 0.0

/*:

 ## Why do we need to use Double type?

 Prior to this challenge we have only dealt with `Int` and `String` types. `Int` works great for whole numbers but cannot store any non-integer numbers.

 We'll need non-whole number division results to calculate rotation angles. The `Double` type is just the type we are looking for since a `Double` is a non-integer number!

*/

let integerDivisionExample: Int = 15 / 4
let doubleDivisionExample: Double = 15 / 4

/*:

 ## Where Int falls short

 `Int` is a whole number. When you divide an `Int` by an `Int` and ask for an `Int` result you lose "precision". Look at the example above.

 `integerDivisionExample` contains the result of 15 divided by 4. It stores the result as an `Int`. `doubleDivisionExample` contains the result of the _same_ expression but stores it as a `Double`. `doubleDivisionExample` shows us an accurate result while `integerDivisionExample` just throws away the extra data after the decimal point (`0.75`).

 ![](imgs/division_example.png)

 ## Setting the time

 The way you’re going to control the clock hands is by setting the variables `secondRotation`, `minuteRotation`, and `hourRotation`, which control the rotation of the clock hands.

 - callout(Try it out): To get some intuition for this, set one of their values to a number between 0 and 360. This number corresponds to the number of degrees the hand is rotated from its start position (pointing straight up).

    For those unfamiliar, degrees are a measurement of rotation. When an object is rotated in a full circle so that it’s facing the same direction it started, we say it’s rotated 360 degrees. Halfway, so that it’s facing the opposite direction is half of 360 (so 180).

    As an example, here’s how setting `secondRotation = 115` should look:

    ![](imgs/115_seconds.png)

*/

secondRotation = 0

/*:

 ## Calculating the rotation

 In order to figure out the rotation for the hands, you’re going to tell the computer to solve for the rotation, using an equation that we’ll give you and that you’ll translate into code. To get you started, we’ll walk you through setting the hour hand.

 The number of degrees the hour hand should move can be found using the following equation:

    `hourRotation` is `hours` divided by 12, multiplied by 360 degrees

 - note: This works because we want the hour hand to point to the same number on the clock as the hour. There are 12 numbers on the clock, so the 1 is located 1/12th of the way around the clock, the 2 is located 2/12ths of the way around the clock, and so on. We’ve noticed that, as a rule, an hour with the value `hours` is located `hours/12` of the way around the circle. We know that the total number of degrees in a circle is 360, or 360 x hours/12.

 To write that in code, we would say:

    hourRotation = hours / 12 * 360

 Remember, the * symbol is the Swift equivalent of the multiplication sign, and / is Swift’s division sign. In computer science speak, these are examples of operators.

 - callout(Try it out): Set `hourRotation` using this equation and check if it looks right!

*/



/*:

 To set the other hands, use the following equations:

    `secondRotation` is `seconds` divided by 60, multiplied by 360 degrees
    `minuteRotation` is `minutes` divided by 60, multiplied by 360 degrees

 - note: `60` is used in both equations since there are 60 seconds in a minute and 60 minutes in an hour.
 
 
 - callout(Challenge): Time to get that clock working!

*/



/*:

 Congratulations! That was a tricky one, but you did it. You have been exposed to a lot of new concepts: variables, constants, data types, operators and more... You have a lot of tools in your toolbox but we'll be adding more soon!

 That's all we have for this set of challenges. The next set of exercises will cover _functions_ or "blocks of code". This will allow you to reuse code you write and use code that others wrote! We'll also demystify how we randomized numbers throughout these challenges :)

*/
//: [Previous](@previous)






































//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = FixTheClockScene.setup(hours: Int(hours), minutes: Int(minutes), seconds: Int(seconds), hourRotation: Int(hourRotation), minuteRotation: Int(minuteRotation), secondRotation: Int(secondRotation))
PlaygroundPage.current.liveView = results
