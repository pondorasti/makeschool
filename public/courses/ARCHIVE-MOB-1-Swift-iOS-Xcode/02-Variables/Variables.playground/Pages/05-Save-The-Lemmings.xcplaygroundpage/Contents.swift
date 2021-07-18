/*:
 ![Make School Banner](./swift_banner.png)
 # Save the Lemmings

 This microgame is about saving the lemmings (in particular, just one). We admittedly had a bit too much fun making this, but the gist is this: a lemming will walk up to the sign in the center of the screen, and, unless the sign reads `Danger` that lemming will jump off the cliff, to certain doom.

 Your job is to make the sign say `Danger`, so that no lemmings perish.

 Look at the line below. It creates a variable named `signText` of type `String` with the value `"This is not a sign."`

*/

var signText: String = "This is not a sign."

/*:

 If you look at the microgame, you'll notice that everything in between the pair of double quotes (`"`) appears on the sign.

 - callout(Try it out!): Try updating the `signText` variable so that the sign shows your name. Remember to use double quotes (`"`) around your new _String_!

*/



/*:

 You should have entered something like `signText = "Your name here"` above.

 Just as before, you’ve set a variable, only this time, the variable was `String` type, not `Int`!

 ## This new type is called String type

 _String_ type represents what you might think of as words or sentences. _Strings_ are an ordered set of characters (also called "strings" of characters) -- like "Potato Salad", "$100", or "yippie ki-yay!".  In Swift, we can write strings as characters with double quotes (`"`) at the beginning and end, as you saw here.

 - note: Keep in mind that number characters can be used _in_ Strings.  That means that something like `"22"` (with quotes) is a String, not an Int.  Writing it without quotes as `22`, though, it is an Int. All variables are created with a specific type and can only store that type.  Our variable `signText` is `String` type. The compiler will be unhappy if you try to store an `Int` to a `String` variable... Let's experiment a bit, set text equal to the String `"22"`.  You should see a `22` in the middle of your sign, as you expect.

*/



/*:

 Now try taking out the quotes on the above line and see what happens...

 ![](imgs/string_int_error.png)

 - note: Make sure to put the quotes back in!

 ## Type errors

    Cannot assign value of type 'Int' to type 'String'

 This is another compiler error. It happened because the compiler has noticed you’re trying to change the type of this variable, which, in Swift, is not allowed.  This variable was defined as a String when it was created, not as an Int.

 - callout(Challenge): With what you know now, make the sign say "Danger" and watch the lemmings survive!

*/



/*:

## A quick thought experiment

 As one more exercise in understanding Strings, we’re going to teach you how to make a string that contains double quotes inside it.  Let’s try putting the string:

    ""Danger" zone"

 on the sign.  Before even typing anything, you probably notice that’s confusing to look at.  Your eyes are having the same difficulty a computer would; how is that just one String?  Double quotes are used to mark the beginning and end of a string, so we see two Strings:

    ""

 and

    " zone"

 and the "naked"

    Danger

 is just floating out there. In Swift, we can remedy this by changing the string to be:

    "\"Danger\" zone"

 Store the above `String` in the `signText` variable so that the sign will show it!

*/



/*:

 ## Escape characters

 The character combination backslash double quote ( `\"` ) is interpreted in a string as just a double quote ( `"` ).  In fact, Swift always expects backslash in a string to be followed by another character and be used for some kind of special syntax, so in order to just add a backslash to your string, you’ll need to use the special syntax backslash backslash ( `\\` ).

 ### Double quotes are important!

 As a last note, remember that Strings are not variables and variables are not Strings, so writing:

    Danger

 is different than writing:

    "Danger"

 - important: Variables can store data of type `String`, like the variable `signText` does. But they cannot change data types once created -- `signText` can only store `String` types, not `Int` types.

 Let’s go on to the next challenge!

*/
//: [Previous](@previous) | [Next](@next)






































//: This is special code required to make the mini-game work. You do NOT need to understand it right now.
import PlaygroundSupport
let results = SaveTheLemmingsScene.setup(stringForSign: signText)
PlaygroundPage.current.liveView = results
