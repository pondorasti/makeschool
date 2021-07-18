# Game mechanics and adding scenes to our game

Let's start __*adding game mechanics*__ to AstroJunk...

### In your game implementation...

So far, AstroJunk has no mechanism for Win/Loss (aka, Victory) conditions.

Applying what you've learned so far about working with SpriteKit scenes &mdash; and using ideas from the class discussion in today's initial exercise &mdash; you are to begin adding the first piece of a Win/Loss condition to your AstroJunk game.

**Output:**
The output or final product at the end of this in-class exercise will only be a new scene called "Game Over" that you will present when the user achieves either a Win or Loss state. Once the your new scene is presented, tapping anywhere on its screen/view should restart the game.

How the Win / Loss states are achieved will ultimately be up to you (and you will create these Victory Conditions as an After Class assignment later.)

But, for now, you only need to create a simple Boolean condition that will be used to invoke the presentation of your "Game Over" scene, present the scene, and restart the game when the new scene's view is touched.

**TODO:**

1. Create a new subclass of `SKScene` called `GameOverScene`

2. In your `GameScene` class, you will need a counter that will be incremented any time the spaceship captures a piece of space debris

  - When this flag increments to 3, invoke your new `GameOverScene`

3. In your new `GameOverScene` class, you will need to implement:

  - a Boolean flag named `won` representing whether the player has won the most recent game play or not

  - a `didMove(to:)` function with a conditional statement that shows a label stating "You Won!" when the `won` flag is true, or "You lose...", when the `won` flag is false

  - some function which will restart the game when the user taps the screen of the `GameOverScene`

If you want to change any of the mechanics, feel free to do so. The more customized, the better. This is just a starting point if you're missing inspiration at the moment.
