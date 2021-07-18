<!-- .slide: class="header" -->

# Intro to iOS Game Development

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/01-Intro-iOS-Game-Development/Lesson1.html ':ignore')

<!-- > -->

## Agenda

- Learning objectives
- iOS development history
- Sprites
- Frames
- Game activity
- Movement with vectors
- Movement with actions
- Game activity

<!-- > -->

## Learning Objectives

- Identify SpriteKit's role in iOS game development
- Create and position nodes
- Describe how Frames, Frame Rate, and the Game Loop relate to each other
- Move nodes with actions

<!-- > -->

## Why building games with iOS

For a game developer, there’s no better platform. The development tools are well-designed and easy to learn. Plus, the App Store makes it incredibly simple to distribute your game to a massive audience — and get paid for it!

<!-- > -->

## Let's read about the history of games in iOS

[Notes](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/01-Intro-iOS-Game-Development/assignments/Intro.md)

<!-- > -->

## Nodes (Sprites)

Nodes are the building blocks of SpriteKit.

A **node** is an object that can be put inside a scene.

Nodes in SpriteKit are commonly referred to as **sprites**

`SKNode` is the base class of all nodes.

All onscreen assets will be an `SKNode` or a subclass of it.

<!-- v -->

Example subclasses of `SKNode`:
- `SKScene` - an object that organizes all of the active SpriteKit content.
- `SKShapeNode` - renders a shape defined by a Core Graphics path
- `SKVideo` - displays video content
- `SKLabel` - displays a text label

<!-- v -->

### Node Properties

- `position` (CGPoint)
- `xScale` (CGFloat): representing the horizontal scale of a node
- `yScale` (CGFloat): similar to xScale but it acts in the vertical direction instead
- `alpha` (CGFloat): representing the node's transparency
- `hidden` (Bool): value determining whether or not the node should be visible
- `zRotation` (CGFloat): representing the angle, in radians, that the node should be rotated
- `zPosition` (CGFloat): used to determine which nodes should be displayed on top of other nodes in the scene

<aside class="notes">
SpriteKit offers many different node types, but they all share a common set of key properties inherited from `SKNode`.

A few of the most important properties of `SKNode` and its subclasses that you can manipulate.

https://code.tutsplus.com/tutorials/spritekit-from-scratch-fundamentals--cms-26326
</aside>

<!-- v -->

#### SKSpriteNode

The most common `SKNode` subclass that you will use is the `SKSpriteNode` class.

An `SKSpriteNode` is a type of node that can display either a colored rectangle, or an image.

<!-- v -->

#### SKScene
An instance of the `SKScene` class represents an active scene of content in SpriteKit.

A scene is the **root node** in a tree of SpriteKit nodes. This tree of nodes provides content that the scene animates and renders for display.

<!-- v -->

#### Positioning

The position of a sprite is controlled by its `position` property, which is a CGPoint (a simple struct that has two properties of its own: x and y).

```Swift  
  public struct CGPoint {
    public var x: CGFloat
    public var y: CGFloat
    // ...
  }
```

<!-- v -->

By default, SpriteKit positions sprites so they are centered at `(0, 0)`, which in SpriteKit represents the bottom left.

**Important Note**
Unlike the coordinate systems in UIKit and AppKit, where **0** on the y-axis is at the **top-left**, in SpriteKit, **0** on the y-axis is at the **bottom-left** of the screen:

![XandY_in_spritekit](assets/XandY_in_spritekit.png)

<aside class="notes">
*Source:* </br>
https://hackernoon.com/swift-spritekit-basics-94b1798ab639
</aside>

<!-- v -->

**Simple Example:**

Basic example of how to write code to create a sprite and set its `position` property:

```Swift  
  // create sprite
  let myCoolSprite = SKSpriteNode(color: SKColor.red,
                          size: CGSize(width: 64, height: 64))

  // set sprite's position                        
  myCoolSprite.position = CGPoint(x: 100, y: 100)
```

<!-- v -->

#### Positioning Notes

1. When you set the position of a sprite, by default you are positioning the center of the sprite (but this can be changed by setting the sprite's `anchorPoint`).

2. A sprite’s position is within the coordinate space of its parent node. The position of any node is determined relative to the position of the `anchorPoint` of its parent.

- This means that you can add sprites as children of other sprites.
- If you do this, the child sprites will move with their parents.

<!-- > -->

## Creating A Sprite

To create a sprite and display it to your users:

1. create an instance of `SKSpriteNode`

2. configure its `size` and `position` properties

3. add it to an `SKScene` object

Sprites are not visible unless they are inside an `SKScene` object, which means you need to add them as children of the scene itself by calling the `addChild(_:)` method (which comes with any `SKNode` object) on the `SKScene` object in which you want your sprite to appear.

<!-- For any nodes that you want in your scene, you need to add them as children of the scene itself using the `addChild(_:)` method which comes with any `SKNode` object. -->

<!-- v -->

#### Simple Example: Creating a Sprite

```swift  
// create sprite
  let myCoolSprite = SKSpriteNode(color: SKColor.red,
                          size: CGSize(width: 64, height: 64))

  // set sprite's position                        
  myCoolSprite.position = CGPoint(x: 100, y: 100)

  // add sprite as a child of a scene
  myScene.addChild(myCoolSprite)
```

<aside class="notes">
Example illustrates creation of a simple, colored rectangle sprite. All you need to create it is to provide the desired size and color of the rectangle and then add it as a child to the scene you want

Assume that the `myScene` object is an instance of `SKScene` previously declared outside of the code snippet shown.
</aside>

<!-- > -->

## Warm up

Create a simple sprite in the middle of the screen in a new Xcode project.

<!-- > -->

## Frame Rate & the Game Loop

When we think about "real-time" game behaviors, you might imagine objects such as players (avatars), vehicles, and other things which move around the screen in what appears to be continuous motion.

What is really happening is that the screen is redrawing itself every 1/60th of a second. And every time the screen redraws, the locations on screen of some or all of the objects change slightly.

If done quickly enough, it can fool the human eye into believing that everything is continuously moving.

<!-- v -->

**Frames**

Concept borrowed from movie and video production.

In an iOS game app, each individual picture drawn on screen is called a **frame**, just as each individual still image in a movie, animation or video is called a frame.

![horse_in_motion_frames](assets/horse_in_motion_frames.png)

<!-- v -->

**Frame Rate**

Games typically try to draw frames at either 30 or 60 times per second and aim to keep that rate consistent so animations appear smooth.

This rate at which the screen is redrawn is called the **frame rate.** Measured in **frames-per-second (FPS)**, frame rate is the measure of the total number of consecutive frame redraws done in one second.

If the frame rate is low, your game is likely performing poorly for your user.

<!-- v -->

Understanding frame rates in iOS game development is a critical factor in optimizing your game app's performance. This is a topic of considerable depth and complexity, of which only some small concepts might be relevant to your specific game.

Read the [Notes on Frame Rates](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/01-Intro-iOS-Game-Development/assignments/frame_rates.md) as introductory background.

Write down what you consider are the 3 most important take aways.

<!-- > -->

**The Game Loop**

Like most game engines, SpriteKit runs an endless rendering loop, often called a "game loop", to update and render (redraw) the screen.

![game_loop_frame-cycle_functions](assets/game_loop_frame-cycle_functions.png)

*Source:* </br>
https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events

<!-- v -->

Steps in rendering each scene typically include:
1. Updating the scene & its objects
2. Evaluate actions
3. Simulate physics
4. Apply constraints
5. Render the scene

<!-- v -->

To optimize game performance factors, including frame rate, you'll want to interact with the game loop to manage node behavior within a scene.

Example: Objects that move out of sight still consume memory, which impacts performance. The game loop offers an excellent point at which to evaluate status and remove objects no longer needed.

<!-- v -->

**The `update(_:)` function**

The `update(_:)` function tells your app to perform any app-specific logic to update your scene. You override it to perform per-frame game logic.

It is called exactly once per frame *before* any actions are evaluated and any physics are simulated.

<!-- v -->

Because it is called each frame, it provides an excellent opportunity to interact with the game loop and update the positions of your nodes (sprites).

```swift  
override func update(_ currentTime: TimeInterval) {

    //TODO: Update nodes in this scene

}
```

<!-- > -->

## Creating the AstroJunk app
Read and follow the [Space Junk](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/01-Intro-iOS-Game-Development/assignments/activity_1_space_junk.md) instructions for creating your first app, AstroJunk. 🛰 🚀

<!-- > -->

## Movement

#### The 2D Coordinate System

In 2D graphics, we deal with space that only has two dimensions: the X and Y axes.

![2D_coordinate_system](assets/2D_coordinate_system.png) </br>

<aside class="notes">
- X axis - Horizontal, left-to-right axis.
- Y axis - Vertical axis. Runs from bottom to top.

We call this the "2D Coordinate System"
</aside>

<!-- v -->

To describe a specific location, known as a *point*, in a 2D coordinate space, you only need to provide two numbers:

- X coordinate - the distance the location point is from the origin on the horizontal axis
- Y coordinate - how far away it is from the origin on the vertical axis

We typically write coordinates in parentheses: `(x coordinate, y coordinate)`

<!-- v -->

A point 7 units to the right of the origin and 4 units above it is written: `(7,4)`

The central point of a coordinate system used in graphics is called the *origin.*

The coordinates for the origin point itself are written `(0,0)`, which is the same as saying that it is "zero units away from the origin point on both the the x and y axes".

<!-- > -->

### Movement with 2D Vectors

**In Mathematics and Physics** a *vector* is a geometric object that has *magnitude* (or *length*) and *direction.*

Vectors are frequently represented by a line segment with a definite direction, or graphically as an arrow, connecting an initial point `A` with a terminal point, `B`:

![vector](assets/vector.png)

<aside class="notes">
Vectors play an important role in physics: the velocity and acceleration of a moving object and the forces acting on that object can all be described with vectors.
</aside>

<!-- v -->

**In Computer Programming** in its most simplified definition, a *vector* is a complex value (or data structure) that is composed of two or more simple values (components).

In game apps, we commonly use vectors to describe two things:
- on-screen positions (i.e., coordinates)
- velocities

Some programming languages represent 2D vectors as simple arrays. But in iOS, it is useful and very common to represent a 2D vector as a `CGPoint`.

<aside class="notes">
Because the `x` and `y` coordinates behind a `CGPoint` are both of type `CGFloat`, `CGPoint` lends itself readily to calculations with other `CGFloats`. `CGPoint` is used so frequently to describe vectors in iOS that Apple created `CGVector` which, under the hood, is nearly identical to `CGPoint`. This allows you to extend `CGVector` to suit your app's particular vector-related requirements.
</aside>

<!-- v -->

**Position (or Point) Vectors**
In a 2D system such as UIKit or SpriteKit, you use a coordinate point to describe the position of a view or a sprite on the x and y axes:

```Swift  
  let spritePosition = CGPoint(x: 3, y: 5)
```

An empty 2D vector — one with only zeros for each coordinate — can be written in two ways:

```Swift  
  var velocity = CGPoint(x: 0, y: 0)
```

...or...

```Swift  
  var velocity = CGPoint.zero
```

<!-- v -->

**Velocity Vectors**

Vectors can also be used to store *velocities.*

A velocity represents how far a location changes over time.

A 2D velocity vector represents a *direction* and a *length* (aka, its *magnitude*).

<!-- v -->

For example:
- If an object is moving 4 units to the right and 6 units upward every second, you could write its velocity as `[4, 6]`.
- Then, every second, you could add the object’s velocity to its current position.

![velocity_vector](assets/velocity_vector.png)

<aside class="notes">
Graph depicting a velocity vector from point `[0, 0]` to point `[4, 6]`
</aside>

<!-- v -->

**Direction**

Note that in the graph above, we drew a straight line from the origin point `[0, 0]` to a second point at `[4, 6]`.

The line from the origin point to the second point gives us the **direction** of the vector.

<!-- TODO: question for class: Where would the line be (i.e., what would the vector's direction be) if the vector were `[-4,6]` -->

<!-- v -->

**Calculating Vector Length**

For the object above with the velocity vector of `[4, 6]`, what distance will it have travelled in any given second?

To calculate the *length* (aka, *magnitude*) of a vector, you must:
- square each component of the vector,
- add up the squares of each component,
- and take the square root of the result

 ![calculate_vector_length_formula](assets/calculate_vector_length_formula.png)

<!-- v -->

```Swift
  let vector = CGPoint(x: 5, y: 7)
  let length = sqrt(vector.x * vector.x + vector.y * vector.y)

  // 8.602325267042627
 ```

<!-- v -->

**Vector Translation**

When you want to move an object closer to or farther away from its origin point, you add its position and velocity vectors together.

To add two vectors together &mdash; which is known as __*vector translation*__ &mdash; you simply add the respective components of each vector.

<!-- v -->

In other words:
- you sum the `x` coordinates of both vectors
- then the `y` coordinates

This results in a new position for your object.

```Swift  
  let startingPosition = CGPoint(x: 1, y: 4)
  let velocity = CGPoint(x: 2, y: 3)

  let newPosition = CGPoint(x: startingPosition.x + velocity.x,
                            y: startingPosition.y + velocity.y)

  // newPosition coordinates: [3, 7]
```

<!-- v -->

> For a good start in learning more about how to work with vectors in your game apps: </br>
> • Experiment with the code in the [Vector playground](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/tree/master/Lessons/01-Intro-iOS-Game-Development/playgrounds/Vector.playground) </br>
> • Study the resources listed in Additional Resources

<!-- > -->

## Movement with Actions

The manual approach to moving a node by setting its position over time gives you power and control over movement.

But you can move, change, rotate or scale a sprite's position over time incrementally &mdash; and much more easily &mdash; using SpriteKit __*actions*__.

Usually, with only a single line of code.

SpriteKit __*actions*__ also let you easily create combinations of movements by chaining actions together.

<!-- v -->

## SKAction

`SKAction` is a powerful class used to bring nodes to life.

Instances of `SKAction` are used to change the structure or content of a node in some way. They represent an animation that is executed by a node in the scene.

You can use `SKAction` objects to make *any* node in the scene perform an action. An action is something that changes one or more properties &mdash; like position, size, transparency, color, etc. &mdash; of *any* node in your scene &mdash; including the scene node itself. <sup>6</sup>

Actions can also change the node tree, play sounds, or even execute custom code.

<!-- v -->

Example uses:
- to change a node’s position (or other property) over time
- to change the behavior of the scene itself, such as performing a fadeout

You can also combine several actions together in:
- A sequence action
- A group action
- A repeating action

<aside class="notes">
When the scene processes its nodes, the actions associated with those nodes are all processed.
</aside>

<!-- v -->

### How to Implement

To apply an action to a node, you need to:

1. Create an instance of `SKAction`
2. Run it by calling one of the built-in `run(_:)` functions found on the node itself, passing in the action instance just created

<!-- v -->

__*Creating Actions*__

To create a SpriteKit action, call one of the many built-in static constructors (factory methods) of the `SKAction` class.

In this example, we use the `moveBy(x:y:duration:)` function built-in to `SKAction` to create an action which will make a sprite move `2` units along the x-axis and `3` units along the y axis in `1` second:

```Swift  
let simpleMoveAction = SKAction.moveBy(x: 20, y: 300, duration: 1)
```

<aside class="notes">
Notice that this is essentially the same motion that we applied above when we created position and velocity vectors, then added them together.
But in only 1 line of code...
</aside>

<!-- v -->

__*Running Actions*__

Once you've created your desired action, you can run it on *any* `SKNode` object by invoking one of the node object's various `run(_:)` functions:

```Swift  
  myNode.run(simpleMoveAction)
```

And, if you want to apply the same action to multiple nodes, you can create your `SKAction` once, then call a `run(_:)` method on each of the several nodes for which you would like to perform the same action.

<!-- > -->

## Move Actions
There are several methods on `SKAction` that allow you to easily create an action that moves a node relative to its current position.

The simplest is [`move(to:duration:)`](https://developer.apple.com/documentation/spritekit/skaction/1417768-move), which Creates an action that moves a node to a new position:

```Swift  
  class func move(to location: CGPoint,
         duration: TimeInterval) -> SKAction
```

<!-- v -->

Example:

```Swift  
  let newPosition = CGPoint(x: 100, y: 100)
  let moveBottomLeftAction = SKAction.move(to: newPosition, duration:3.0)
  node.run(moveBottomLeftAction)
```

<!-- v -->

And there are a few noteworthy variations of this basic move action:

1. `moveTo(x:duration:)` &mdash; Creates an action that moves a node horizontally.
2. `moveTo(y:duration:)` &mdash; Creates an action that moves a node vertically.

These let you specify a change in *only one* axis &mdash; either the x- or the y-position &mdash; but not both. This can save you keystrokes.

3. `moveBy(x:y:duration:)` &mdash; Creates an action that moves a node relative to its current position.

<aside class="notes">
Instead of moving a node to particular point, `moveBy(x:y:duration:)` lets you move it by an offset from its current position, wherever it is at any given time. For example, the offset could be some multiple of the size of the object allowing you to move different size objects by amounts relative to their respective sizes.

Important Note:
This pattern of having `<action>To` and `<action>By` function variations appears in many of the [Action Initializers](https://developer.apple.com/documentation/spritekit/skaction/action_initializers) on `SKAction`.
Feel free to use whichever variation works best and most conveniently for you, but remember that `<action>By` functions are preferred because they are __*reversible*__ (more on reversible actions later).
</aside>

<!-- > -->

## Sequence Actions

Many actions are designed to take place over time and to be executed by themselves.

But what if you wanted some actions to occur immediately or in combination with one or more other actions?

What if you wanted to run your own custom code or to remove a node from a scene on completion of some other action?

<!-- v -->

The real power of `SKAction` lies in how easily you can combine actions together with `sequence(_:)` or `group(_:)`.

A `sequence` is an `SKAction` that runs other actions, one after another.

`SKAction.sequence(_:)` creates an action that runs a collection of actions sequentially.

<!-- v -->

It takes an array of `SKActions`, each separated by commas, and it runs them one after the other in listed order.

When the `sequence` action executes, the first action in the sequence starts and runs to completion. Subsequent actions in the sequence run in a similar fashion until all of the actions in the sequence have executed.

<!-- v -->


To create a sequence action, use `SKAction.sequence(_:)`, which takes an array of `SKAction` objects:

```Swift  
  let sequenceAction = SKAction.sequence([action1, action2, action3])
```

<!-- v -->

```Swift  
  let moveUpAction = SKAction.moveBy(x: 0, y: 30, duration: 2)
  let moveDownAction = SKAction.moveBy(x: 0, y: -30, duration: 2)
  let removeAction = SKAction.removeFromParent()
  let sequenceAction = SKAction.sequence([moveUpAction, moveDownAction, removeAction])
  node.run(sequenceAction)
```
<aside class="notes">
In the example, the node is moved up the x-axis by `30` points, then down the y-axis by `30`, then removed from the scene:
</aside>

<!-- v -->

The sequence action is one of the most useful and commonly used actions in iOS game development.

It is also reversible, it creates a new sequence action that reverses the order of the actions.

<!-- > -->

## Adding movement to our game

Continue working on your AstroJunk app, adding movement to all nodes created so far

At end of this activity, the state of your game should be described as:
- the ship should be moving along the X axis. But when it moves, it will not stop when it hits the screen edge &mdash; it will go off screen if moved too far to the left or right
- all sprites/nodes should have their intended motions implemented
- but no collision detection will be implemented (at this point in development, when they collide, nothing will happen)

<aside class="notes">
 __*If you get stuck*__ &mdash; Review key material above, especially the [Vector playground](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/tree/master/Lessons/01-Intro-iOS-Game-Development/playgrounds/Vector.playground), if Understanding how to work with vectors is an obstacle to your progress.
</aside>

<!-- > -->

# After Class

Assignments:
1. Continue working on your AstroJunk app (if not caught up with today's 2 in-class activities)

3. Useful links & concepts

<aside class="notes">
- The "Nodes that Draw" section in [Nodes for Scene Building - Apple docs](https://developer.apple.com/documentation/spritekit/nodes_for_scene_building)
- The "Use a Scene Delegate Instead of Subclassing a Scene" section in [Responding to Frame-Cycle Events](https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events) and [SKSceneDelegate](https://developer.apple.com/documentation/spritekit/skscenedelegate) and [Subclassing Scenes Versus Assigning a Delegate](https://developer.apple.com/documentation/spritekit/skscene/subclassing_scenes_versus_assigning_a_delegate)
- [preferredFramesPerSecond - Apple Docs](https://developer.apple.com/library/archive/documentation/3DDrawing/Conceptual/MTLBestPracticesGuide/FrameRate.html)
- Delta Time
- `SKEffectNode`
- The `SKWarpable` Protocol
- `SKTexture`
- `anchorPoint`
- `SKView`
- `SKRenderer`
- `WKInterfaceSKScene`
- `GCVector`
- How do you set frame rate in SpriteKit?
- How do you normalize a vector?
- Game Types:
  - RPG, FPS, Open World
</aside>

<!-- > -->

## Wrap Up (5 min)

- Continue working on your AstroJunk app assignments from today's class
- Complete reading and review assignments

<!-- > -->

## Additional Resources

2. [SpriteKit - Apple Docs](https://developer.apple.com/documentation/spritekit)
3. [Introducing SpriteKit - A Tutorial](https://code.tutsplus.com/tutorials/introducing-spritekit--cms-28648)
4. [OpenGL ES - wikipedia](https://en.wikipedia.org/wiki/OpenGL_ES)
5. [OpenGL ES: The Standard for Embedded Accelerated 3D Graphics - The Khronos Group (developers consortium)](https://www.khronos.org/opengles/)
6. [About OpenGL ES - Apple Docs](https://developer.apple.com/library/archive/documentation/3DDrawing/Conceptual/OpenGLES_ProgrammingGuide/Introduction/Introduction.html)
7. [Metal - Apple Docs](https://developer.apple.com/metal/)
8. [Cocos2d - Cocos2d (developers consortium)](http://cocos2d.org)
9. [SKNode (class) - Apple Docs](https://developer.apple.com/documentation/spritekit/sknode)
10. [Responding to Frame-Cycle Events - Apple Docs](https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events)

<!-- > -->

11. [Key frame - wikipedia](https://en.wikipedia.org/wiki/Key_frame)
12. [State (pattern) - from Game Programming Patterns](https://gameprogrammingpatterns.com/state.html)
13. <sup>1</sup> [Persistence of vision: how does animation work? - an article](https://www.futurelearn.com/courses/explore-animation/0/steps/12222)
14. [Coordinate system - wikipedia](https://en.wikipedia.org/wiki/Coordinate_system)
15. [Vector_(mathematics_and_physics) - wikipedia](https://en.wikipedia.org/wiki/Vector_(mathematics_and_physics)) [Vector_space - wikipedia](https://en.wikipedia.org/wiki/Vector_space) [Euclidean_vector - wikipedia](https://en.wikipedia.org/wiki/Euclidean_vector)
16. [Vector Algebra - an article](https://www.mathsisfun.com/algebra/vectors.html)
17. [Pythagoras' Theorem - an excellent resource for understanding vectors, etc.](https://www.mathsisfun.com/pythagoras.html)

<!-- > -->

18. [Practical use of Vector Math in Games - an article](https://www.gamedev.net/articles/programming/math-and-physics/practical-use-of-vector-math-in-games-r2968/)
19. [SKAction (class) - Apple Docs](https://developer.apple.com/documentation/spritekit/skaction)
20. [Action Initializers - Apple Docs](https://developer.apple.com/documentation/spritekit/skaction/action_initializers)
21. [Getting Started with Actions](https://developer.apple.com/documentation/spritekit/getting_started_with_actions#2982305)
22. [`sequence(_:)` (function) - Apple Docs](https://developer.apple.com/documentation/spritekit/skaction/1417817-sequence)
23. [First-person shooter - wikipedia](https://en.wikipedia.org/wiki/First-person_shooter)
