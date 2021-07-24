/*:
 ![Make School Banner](./swift_banner.png)
 # Passing data to functions

 ## Function parameters

 Have you been wondering why there are parentheses after function calls? It's not just so they look different from variables. It's because you can sometimes pass data to functions!

 So far, we have been using hardcoded `moveFifty()` and `rotateNinety()` functions. While this works, wouldn't it be nicer to be able to say `move(steps: 75)`? Try it out below!

 - experiment: Can you move `25` units? `250` units? What about negative values?
 
 
 - experiment: Can you figure out how to rotate custom amounts? Can you rotate clockwise instead of counter-clockwise?
 
 
 - experiment: Can you combine these to draw a triangle (3 sides)? A pentagon (5 sides)? How about a hexagon (6 sides)?

*/



/*:

 ## Recap

 We can call both `move(steps: 50)` and `rotate(degrees: 90)` to get the same outcome as `moveFifty()` and `rotateNinety()`. You can put _any_ whole number in the parentheses and move custom amounts! The value we put in the parentheses is a _function parameter_. `steps` and `degrees` are both _function parameter names_.

 ## Pseudocoding

 Let's beef up our polygon drawing skills. Get out a pen and some paper. We'll be writing some pseudocode before we type out any Swift code.

 Go through the same exercise we did for squares but do it for triangles (3 sides), pentagons (5 sides), and hexagons (6 sides):

 - callout(Plan your code): Draw the polygon with pen and paper. How would you use the `move` and `rotate` functions to draw that polygon? Write out each step. Read back each line of code to yourself and "perform" each function by hand. Did it work?

 
 - callout(Hint): Here's a little hint for those of you who haven't thought about geometry in a while. The angle you rotate is called the polygon's exterior angle. The exterior angle is the angle formed from the extension of one side to the extension of another. 
 
    You can calculate a polygon's exterior angle with the equation exteriorAngle = 360 / numberOfSides. You'll notice `360 / 4 = 90` which was correct for a square -- try it out on a few other polygons to confirm this should work!
 
 ## drawTriangle, drawPentagon, drawHexagon

 Did you actually do the above exercise? If not, go back to _Pseudocoding_ and do it. Don't cheat yourself!

 - callout(Challenge): Once you have functioning pseudocode for each of the polygons, take the time to translate your planned procedures into Swift. Define the `drawTriangle`, `drawPentagon`, and `drawHexagon` functions below. Make sure to test them!
 
 
*/










//: [Previous](@previous) | [Next](@next)

















































//: ### This is setup code to make the live visualization work!
Pen.delay = 1
import PlaygroundSupport
import Foundation
let results = DrawingScene.setup()
PlaygroundPage.current.liveView = results
