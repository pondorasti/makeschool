<!-- .slide: class="header" -->

# Actions

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/02-Actions/Lesson2.html ':ignore')

<!-- https://docs.google.com/document/d/1Qo3Llmfjttfu-LPMCjeuR4iRy2WWS_mG_Pt8Xa8nPh4/edit -->

<!-- > -->

## Agenda

- Actions
- Space Junk: more actions
- Break
- Collision detection
- Space Junk: collisions
- Touch events
- Space Junk: touches

<!-- > -->

## Why?

To give your game life, you'll want your nodes to move in various ways, to respond to touch events, and to emulate real-world reactions when two or more game elements bump into each other.

<!-- > -->

## Learning Objectives

1. Identify and describe the behavioral results and implementation steps of these `SKAction` types:
  - group, repeating (two variations), removeFromParent(), wait, run block
2. Identify and describe:
  - the main idea behind Collision Detection
  - how users can interact with game elements using Touch Events
3. Design strategies for debugging:
  - Collision Detection behavior
  - A game's Playable Area
4. Implement:
  - various actions (Scaling, rotation, etc.), collision detection, and touch events in a simple game app

<!-- > -->

<!--

## Review Exercise

To help you reinforce your learning and to confirm your understanding of the concepts presented so far...

Quiz...

<!--
Answers to quiz:

- H
- E
- A
- B (Frames Per Second)
- D, I (either is correct)
- G
- B (First Person Shooter)
- F
- C

-->

## Group Actions

`group(_:)` creates an action that runs a collection of actions **in parallel.**

Creating groups is very similar to creating sequences.

To create a group, you pass in a collection of `SKAction` objects to the `group(_:)` method:

```Swift  
  let groupAction = SKAction.group([action1, action2, action3])
```

<aside class="notes">
However, instead of running them one after the other, a group action runs them all at once.

When the group action executes, the collection of actions that comprise the group all start immediately and run in parallel.

The `duration` of the group action is the longest duration among the collection of actions. Thus, a group action does not complete until the longest-running action in its collection has completed.

If an action in the group has a duration less than the group’s duration, the action completes, then idles until the group completes the remaining actions. *(This matters most when creating a repeating action that repeats a group; we will cover repeating actions in next lesson)*
</aside>

<!-- v -->

Note that you can also combine groups and sequences.
- You can run two sequences at the same time by combining them into a group action
- You can also create sequences that contain group actions.

`group(_:)` action is also reversible; it creates a new group action that contains the reverse of each action specified in the group.

<!-- v -->

### Repeating Actions

In addition to the ability to chain actions together with `sequence(_:)` and `group(_:)`, you can create one action and have it execute some other action multiple times.

`SKAction` provides two built-in functions for repeating targeted (aka, *associated*) actions:

1. `repeat(_:count:)` &mdash; Creates an action that repeats another action a specified number of times.

2. `repeatForever(_:)` &mdash; Creates an action that repeats another action forever.

<!-- v -->

```Swift  
  let moveUp = SKAction.move(to: CGPoint(x: 50.0, y: 0.0), duration: 5.0)
  let moveDown = SKAction.move(to: CGPoint(x: -50.0, y: 0.0), duration: 5.0)

  // Execute move actions in sequence
  let moveUpAndDown = SKAction.sequence([moveUp, moveDown])

  // Repeat execution of sequence every 7 seconds
  let repeatUpDownMovement = SKAction.repeatForever(moveUpAndDown, count: 7)

  mySprite.run(repeatUpDownMovement)
```

<!-- v -->

Example of a `repeatForever(_:)` action:

```Swift  
  let moveUp = SKAction.move(to: CGPoint(x: 50.0, y: 0.0), duration: 5.0)
  let moveDown = SKAction.move(to: CGPoint(x: -50.0, y: 0.0), duration: 5.0)

  // Execute move actions in sequence
  let moveUpAndDown = SKAction.sequence([moveUp, moveDown])

  // Repeat execution of sequence FOREVER...
  let repeatUpDownMovement = SKAction.repeatForever(moveUpAndDown)

  mySprite.run(repeatUpDownMovement)
```

<aside class="notes">
Both of these repeating actions are reversible; reversing either one creates a new action that is the reverse of the specified action and then repeats it the same number of times or forever, respectively.
</aside>

<!-- > -->

*Repeating an action forever invites the obvious question: When will the repeated action stop? While there are several ways this can be achieved, stopping a `repeatForever(_:)` action can depend on your app's component makeup and specific behavioral needs. To start, we will go over the two built-in functions most commonly used for stopping actions...*

<!-- > -->

### Stopping Actions

Oftentimes you'll need to stop a node from running its actions.

There are two basic ways to stop actions while they are running:

1. By calling `removeAllActions()` &mdash; Stops __*all*__ actions currently running on the node.

2. Or by calling `removeAction(forKey:)` &mdash; Removes an action based on a unique key given to the action when the `run(_:withKey:)` is called. If an action is found that matches the key, it is removed from the node.

<aside class="notes">
`run(_:withKey:)` &mdash; Adds an identifiable action to the list of actions executed by the node. This method is identical to `run(_:)`, but the action is stored so that it can be retrieved later.
</aside>

<!-- v -->

<aside class="notes">
Example of using `removeAction(forKey:)` &mdash; Here, we create an action with a key as a unique identifier so that we can remove only the action that matches that identifier. (Note that we first use `action(forKey:) `to ensure that there is not an action with the "flying" identifier already running.)
</aside>

```Swift  
  func startPenguinFlying() {
    if penguin.action(forKey: "flying") == nil {
      penguin.run(
        SKAction.repeatForever(penguinAnimation),
        withKey: "flying")
  } }
  func stopPenguinFlying() {
    penguin.removeAction(forKey: "flying")
  }

```

<!-- v -->

### removeFromParent() Action

- Building up a massive list of nodes in a game is never good.
- Removing nodes from the scene graph when they are no longer needed is a critical factor in maintaining a highly-performant game.

<aside class="notes">
When nodes are no longer needed &mdash; when they finish moving, move offscreen or are otherwise no longer visible &mdash; they still get factored into physics calculations and might still require SpriteKit to check if they need to be redrawn.

And, over extended playing time, inactive nodes can build up, eventually consuming all available device memory, prompting iOS to automatically terminate your app.

From the user perspective, this will look as if your app crashed.

To keep your game running smoothly, remove nodes from the scene graph when they are no longer needed. Removing them will delete them from the scene, but you can always recreate them easily when needed.
<aside>

<!-- v -->

### removeFromParent() Action

__*Option 1:*__ Call the built-in `removeFromParent()` function on the `SKNode` object directly.

Note that in this function's declaration it returns nothing:

```Swift  
func removeFromParent()
```

Calling this function on the node itself will remove itself from its parent.

__*Example &mdash; Option 1:*__ Calling `removeFromParent()` on the `SKNode` object directly:

```Swift  
  let removeNode = spriteNode.removeFromParent()
```

<!-- v -->

__*Option 2:*__ Create a `removeFromParent()` action.

This `removeFromParent()` function creates and returns an `SKAction` object that removes the node from its parent:

```Swift  
class func removeFromParent() -> SKAction
```

When the action executes, the node is immediately removed from its parent.

This action is not reversible; the reverse of this action is the same action.

<!-- v -->

__*Example &mdash; Option 2:*__ Creating and using a `removeFromParent()` action:

```Swift  
  // Create move action
  let moveAction = SKAction.move(to: CGPoint(x: -dragon.size.width/2, y: actualY),
                                 duration: TimeInterval(actualDuration))

  // Create remove action
  let removalAction = SKAction.removeFromParent()

  // Run move action, then apply the removal action to dragon sprite
  dragon.run(SKAction.sequence([moveAction, removalAction]))
```

As you can see above &mdash; and have already seen in Lesson 1 &mdash; either of the two optional `removeFromParent()` functions can be used efficiently with `sequence` actions...


<!-- ...and we've already seen in Lesson 1 how this can be used efficiently with `sequence` actions:

```Swift  
  let moveUpAction = SKAction.moveBy(x: 0, y: 30, duration: 2)
  let moveDownAction = SKAction.moveBy(x: 0, y: -30, duration: 2)
  let removeAction = SKAction.removeFromParent()
  let sequenceAction = SKAction.sequence([moveUpAction, moveDownAction, removeAction])
  node.run(sequenceAction)
``` -->

<!-- > -->

### Wait action

The wait-for-duration action makes the sprite wait for a period of time before continue doing anything else. These actions will be the most useful when combined with a sequence action. We will simulate pauses in the game with this combo.

```Swift
let waitAction = SKAction.wait(forDuration:0.5)
```

After declaring the action we can include it in any sequence to create a delay.

<!-- > -->

### Run-block action
What if there is a piece of code you wrote that you want executed in the game? You can call it inside the run-block action and treat it as any other action. This means you can include it in a sequence too.

```Swift
let updateScores = SKAction.run(){
  //update some variables here
}
let sequence = SKAction.sequence([actionMove, updateScores, waitAction, actionMove])
```

<!-- > -->


## In Class Activity I

Next steps for the Space Junk game:

1. Use actions to control the creation of debris and meteors.

- Newly created debris and meteors should originate (be created at) random positions in the scene and should move from top to bottom.

- For falling elements, make them spin (rotate) as they fall. Try applying different spinning speeds to different elements.

Stretch: Add bombs to the game that grow and shrink while falling (pulsating).

<!-- > -->

## Collision Detection

<aside class="notes">
So far we know how to get sprite nodes on screen. We also know how to make them move. But nothing works as a playable game yet. And this is in greater part because we are not handling how objects interact with each other. This can be done using collision detection. We detect when objects collide with each other to then assess what action should follow. An explosion? Adding points to the score? Collecting power ups or lives? It’s our job to handle all these possibilities.
How it works
</aside>

There are several ways to handle collision detection. One of them is using the built-in physics engine and this one we’ll learn later in the course. Today we’ll use the easiest approach which is bounding-box collision detection.

<!-- v -->

### The main idea

1. We need a way to get all the elements in the scene into a collection or list so we can then check for collisions on each one. This is easy when we give every node a name at the moment of creation.

2. Then we can use the method `enumerateChildNodes(withName:using:)` to find all the nodes matching a name.

<!-- v -->

3. Once we have the lists, we can loop on them to check for collisions. Each node has a frame property representing the node’s location on screen. This frame is a rectangle so keep in mind that even when you have round sprites, the bounding box of all elements is a rectangle.

4. When you can have access to the frames, you can now use CGRect’s `intersects(_ :)` method to check for collisions.

<!-- v -->

### Trying it out

Playground demo + explanation

<!--
**Debugging**

- The problem with the update method.
- Bounding box bigger than sprite. Shrink the box using `insetBy(dx:dy:)`
-->

<!-- > -->

## In Class Activity II

Next steps for the Space Junk game:

- Include collision detection using the frame bounding box technique.
- Detect when the ship collides with either meteors or debris.
- Once the ship collides with objects, make the object disappear from the scene.
Debug the frame of the objects to make the collision as realistic as possible.

<!-- > -->

## Touch Events

We need a way to interact with the game. A way to control how elements move in the scene. We can achieve this control using touch events. There are several methods we use for this.

```Swift   
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}

```
<aside class="notes">
All of them handle different stages in the lifetime of a touch: Begins, Moves, Ends and Canceled. Inside the body of these methods you can access a set of touches. This is due to the fact that we can have multiple touches at the same time in a scene.
</aside>

<!-- v -->

We can access the first touch in the set.

`guard let touch = touches.first else{return}`

Or we can iterate through all of them.

```Swift
for touch in touches {
}
```

<!-- v -->

Every touch has a property called location which we can use to see where that touch happened in the scene.

`let location = touch.location(in: self)`

There’s a lot we can do with touches. Have a sprite follow our touches, activate special powers, shoot enemies, etc.

<!-- > -->

## In Class Activity III

Next steps for the Space Junk game:

- Using touches, handle how the spaceship moves. We need it to move either left or right. What’s the best approach we can take? Think about it and implement a solution.

<!-- > -->

## Playable area

The ship now moves across the screen. Depending on how you implemented the movement it might happen to you that the ship goes off the scene. But we need it to be visible all the time. You can fix this in many ways. You can have it bounce back or stay at the edge of the screen. It’s up to you.

Create a method to check the bounds of the game.

```Swift
func boundsCheckSpaceship() {
}
```

<!-- v -->

Then grab the value of the limit that corresponds to the bottom left and bottom right of the screen.

 ```Swift
 let bottomLeft = CGPoint(x: ship.size.width/2, y: 0)
 let bottomRight = CGPoint(x: size.width - ship.size.width/2, y: 0)
 ```

Use these values to compare them with the ship’s position to know what to do depending on what you want the game to behave.

**Q: Where should we call the method?**

<!-- v -->

## Stretch challenge

For the Space Junk game, debug the playable area (make it visible with a rectangle) and see if it works the same for multiple screen sizes.

<!-- > -->

# After Class

Assignments:
1. For you AstroJunk app: If you have not done so already, make sure that the active elements (SpriteKit nodes) in your app are each in their own separate classes.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i.e., you should have class files for your `Spaceship`, `Meteor`, and `Debris` elements

<!-- > -->

2. Review:
- [Accessing and Modifying the Node Tree - from Apple docs](https://developer.apple.com/documentation/spritekit/sknode/accessing_and_modifying_the_node_tree)
- [Controlling Actions Precisely by Using Names - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/controlling_actions_precisely_by_using_names)
- [SKTransformNode - from Apple docs](https://developer.apple.com/documentation/spritekit/sktransformnode)
- `removeChildren(in:)`
- `removeAllChildren()`

<!-- > -->

## Wrap Up

- Continue working on your current Space Junk game stretch challenge, etc.
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. [Action Initializers - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/action_initializers)
2. [`group(_:)` method - - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/1417688-group)
3. [`wait(forDuration:)` method - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/1417788-wait)
4. [`repeat(_:count:)` method - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/1417750-repeat)
5. [`repeatForever(_:)` method - from Apple docs](https://developer.apple.com/documentation/spritekit/skaction/1417676-repeatforever)
6. [SKNode > removeFromParent() - from Apple](https://developer.apple.com/documentation/spritekit/sknode/1483119-removefromparent)
7. [SKAction > removeFromParent() - from Apple](https://developer.apple.com/documentation/spritekit/skaction/1417748-removefromparent)
8. [How To Make a Game Like Space Invaders with SpriteKit and Swift: Part 2 - A tutorial from raywenderlich](https://www.raywenderlich.com/1163-how-to-make-a-game-like-space-invaders-with-spritekit-and-swift-part-2)
