# Space Junk Removal

## Your Assignment
Your client, Intergalactic Rubbish Removal, Inc., is on a mission to rid the cosmos of the massive accumulation of [space junk](https://en.wikipedia.org/wiki/Space_debris).

To gain support for their cause, they have commissioned you to create a free iOS game app to illustrate to children of all ages the process and pitfalls of collecting space garbage.

### Requirements/characteristics
The final released version of the game will have the following characteristics:

1. App Name: AstroJunk
2. Protagonist (user entity) &mdash; User will pilot a single spaceship: an interstellar garbage scow
3. Game Type &mdash; game will be similar to a **Fixed Shooter**<sup>1</sup> game (ie, like the classic Space Invaders game):
- Ship is restricted to movement along the X axis
- Target objects move in only one direction (top to bottom) and only originate (descend) from the top of the screen
- Each level of the game is contained within a single screen
3. Game Play:
- The objective of the game is to collect as many pieces of floating space junk as possible, while avoiding collisions with hostile objects (meteorites or alien bombs)
- Points are awarded for each piece of debris captured, and the total score tabulated and presented on screen
- If pilot fails to avoid a hostile object, the collision of the object with the ship will result in the ship exploding &mdash; and Game Over!

<!-- TODO: rewrite this as a User Story? -->

### TODO: For this phase of the game

For this __*first released version*__ of AstroJunk, you are to:

1. Create the basic SpriteKit game app project in Xcode

2. Applying the concepts covered so far, you must also create all sprites/nodes required for the game including:

- background scene
- meteorites
- space debris
- space ship

At this point, these will be static nodes only, since we have not covered motion yet, none of these sprites need to be able to move at this point...

You can go online and search for cool free graphics. Or just use [these](../assets/gameAssets.zip) for now and change them later if you want.

### Example

How the game will look and behave at this point.
![gameStage1](../assets/game.png)


## Additional Resources

1. [Fixed Shooter Game - wikipedia](https://en.wikipedia.org/wiki/Shoot_%27em_up#Fixed_shooters) 
2. [Space Invaders - wikipedia](https://en.wikipedia.org/wiki/Space_Invaders)
