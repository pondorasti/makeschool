
<!-- .slide: class="header" -->

# Working With Scenes

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/04-Working-with-Scenes/Lesson4.html ':ignore')

<!-- https://docs.google.com/document/d/1Qo3Llmfjttfu-LPMCjeuR4iRy2WWS_mG_Pt8Xa8nPh4/edit -->

<!-- > -->

## Agenda

- Class project progress check-in
- Game mechanics
- Working with scenes
- Catch up with project

<!-- > -->

## Learning Objectives (5 min)

1. Identify and describe:
- What Game Mechanics are and how to implement them
- The functional relationship between the `SKView` and `SKScene` classes, and how to use them to create new scenes
- How to create transitions between game scenes using `SKTransition`

2. Implement in your running class project, AstroJunk:
- Game Mechanics, including a Game Over Scene that reacts to Win/Loss conditions (Victory Conditions)

<!-- > -->

## Game Mechanics

Discuss:

**Topic 1:** Read about[game mechanisms](https://en.wikipedia.org/wiki/Game_mechanics). What stood out most prominently in your mind when you read Wikipedia's definition of the term, "Game mechanics"?

**Topic 2:** Think about the current state of your AstroJunk game....

**Q:** What game mechanisms are the most obviously missing from AstroJunk so far?

**Q:** What game mechanics would you add to AstroJunk first? (i.e., what would add the most value to the game? Does the order that you develop game mechanisms matter?)


<!--
- the idea is to review Game Mechanics, and to get students thinking about what is missing from AstroJunk at this point, as a lead in to TT1 and later in-class activities
- some of the most obviously missing mechanisms now:
- a way to rack up points for either (a) asteroid or bomb hits (b) debris that has slipped by the ship (could add up to negative points), and/or (c) positive points accrued when the ship collects debris
...all of these are prerequisites to developing a GameOver scene and/or its Win/Loss conditions.
- Victory conditions (Loss avoidance, Victory points, Combination conditions, etc. <sup>1</sup>) - as mentioned above, this is missing, but Win/Loss is also dependent on some sort of score accrual (i.e., Victory points and/or Loss avoidance)...
- game Levels
- also, what "juice" can b added? Sound effects? explosions on collision? other?
-->

<!-- > -->

## Working with Scenes

Up to now, you've been working with game environments comprised of only a single scene.

This is fine for learning how to add basic functionality like elements and actions.

But to really delight and engage your users, you'll want them to have more opportunities to interact with your game than a single scene can provide.

<!-- v -->

You've probably also noticed that most games come with a very common set of standard features which often include:

![loading](assets/loading.PNG)

<aside class="notes">
A Loading scene: Scene to display while other content is loading.

<!-- v -->

![loading](assets/menu.PNG)

<aside class="notes">
Menus: Might include showing the game's logo, starting a new game or resuming a paused one, navigation to some other scene, showing game data such as high scores or game rules, or choosing what kind of game (mode) the user wants to play.
</aside>

<!-- v -->

![loading](assets/gameover.PNG)

<aside class="notes">
Victory / Loss Conditions: Most games respond to "Game Over" or other win/lose conditions by presenting choices (scenes) to the user based on the win/lose state or when gameplay ends.
</aside>

<!-- v -->

![loading](assets/levels.PNG)

<aside class="notes">
Game Levels: A great way to engage users is to offer them the ability to progress to a new level through mastery of previous levels; each level is typically represented by its own scene (or set of scenes).

Learning how to work with scenes can really add depth and dimension to the user experience.
</aside>

<!-- > -->

## Building Blocks

Scenes are the basic building blocks of games. Typically, you design self-contained scenes for the parts of your game, and then transition between these scenes as necessary. For example...

[Apple Doc](https://developer.apple.com/documentation/spritekit/sktransition)

<!-- v -->

Creating new scenes or transitioning between scenes is easy if you understand the basic components SpriteKit uses to construct scenes.

We've introduced some of those components already, but let's examine the core building blocks in more detail...

<!-- v -->

### View Controllers

Of course, view controllers and their lifecycle methods play a key role in bringing your scenes to life.

But remember: In an iOS game app, the view you will be presenting is *not* the usual `UIView` that the view controller manages, it is a subclass of `SKView`, which has specific game scene behaviors built into it.

<!-- v -->

### SKScene

`SKScene` is a subclass of `SKEffectNode`, which is a subclass of `SKNode`.

As the root node in a tree of SpriteKit nodes (`SKNode`), an `SKScene` object organizes all of the active SpriteKit content, animating and rendering all of that content for display.

```Swift
class SKScene : SKEffectNode
 ```

<!-- v -->

### SKView
To display a scene, you present it from an `SKView` object.

```Swift  
class SKView : UIView
```

`SKView` is a subclass of `UIView` that renders a SpriteKit scene, but it has powerful game-based features above and beyond what `UIView` has,

<!-- v -->

An`SKView` allows you to:

1. control the timing of the view's screen updates, including pausing a scene
2. configure toggles that have performance implications which are unique to your app
3. display metrics in the bottom corner of the view for debugging purposes.
  For examples:
    - `showsFPS`	&mdash; Displays a count of the current frame rate in Frames Per Second in the view.
    - `showsNodeCount` &mdash; Displays a count of the current number of SKNodes being displayed in the view.
    - `showsPhysics` &mdash; Displays a visual representation of the `SKPhysicsBodys` in the view.

<!-- v -->

#### presentScene()

You present a scene by calling the `presentScene(_:)` method on the scene's `SKView` object.

```Swift  
func presentScene(_ scene: SKScene?)
```
When the `presentScene(_:)` method is called, the new scene immediately replaces the current scene, if one exists.

<!-- v -->

### SKScene's Lifecycle Methods
`SKScene` comes with several functions you can override to be notified when the scene is loaded or presented, or it changes size.

Of these `SKScene` lifecycle methods, the one you will likely use the most is the `didMove(to:)` function which tells you when the scene is presented by a view.

```Swift  
func didMove(to view: SKView)
```

When you present a scene (by calling `presentScene(_:)`, for example), SpriteKit calls your scene's `didMove(to:)` method before it presents your scene in a view.

<aside class="notes">
Thus, `didMove(to:)` offers you a good place to do some initial setup of your scene’s contents.
</aside>

<!-- > -->

### Creating Scenes

1. Create a new subclass that derives from `SKScene`
  - Be sure that you import `SpriteKit`

2. Implement its desired behavior. This can include (but is not limited to):
  - `init(size:)` &mdash; or a custom initializer
  - `update(_:)`
  - `didMove(to:)` and/or other `SKScene` lifecycle methods
  - Functions for Touches or Movement

<!-- v -->

3. Then load and present it at the desired place in your code
  - New scenes are often loaded in either a ViewController's lifecycle method or in some function in the default `GameScene` class, including its `update(_:)` or `SKScene` lifecycle methods. But where your new scene is loaded and presented depends on your app's own requirements.

>*HINT: For ideas on methods to implement in your new scene, review any overridden methods in the default `GameScene` class that is provided as part of Xcode's SpriteKit game app template.*

<!-- v -->

**Example:** </br>
The code snippet below is of a newly-created subclass of `SKScene` called `NewScene` which has several stubbed-out functions depicting a simple, standard implementation of a new SpriteKit scene.

```Swift
import Foundation
import SpriteKit

class NewScene: SKScene {

    override init(size: CGSize) {
        // do initial configuration work here
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    override func didMove(to view: SKView) {
        /*
         Use this method to implement any custom behavior for
         your scene when it is about to be presented by a view.
         For example, you might use this method to create the scene’s contents.
        */
    }
}
```

<!-- v -->

...and here is a basic example of how one could instantiate and present an instance of `NewScene` in some ViewController's `viewWillAppear()`:

```Swift
override func viewWillAppear(_ animated: Bool) {
     let myNewScene = NewScene()
     myNewScene.size = self.view.bounds.size
     if let spriteView = self.view as? SKView { // cast self.view as an SKView before calling presentScene()
         spriteView.presentScene(myNewScene)
     }
 }
```

<!-- > -->

#### The scaleMode Property
Because your scene might appear on screens of different sizes (i.e., iPhone, iPad, etc.), it is important to determine how the scene should be sized to fit into the `SKView` for different devices.

How the `SKView` scales the scene is determined by its `scaleMode` property.

```Swift  
var scaleMode: SKSceneScaleMode { get set }
```

<!-- v -->

Under the hood, the `scaleMode` property is backed by the `SKSceneScaleMode` enum, which offers these cases:

- `.fill`
- `.aspectFill`
- `.aspectFit`
- `.resizeFill`

The default value is `SKSceneScaleMode.fill`.

<aside class = "notes">
*See these links for more on the `scaleMode` property or `SKSceneScaleMode`:*
- https://developer.apple.com/documentation/spritekit/skscenescalemode
- https://developer.apple.com/documentation/spritekit/skscene/scaling_a_scene_s_content_to_fit_the_view
</aside>

<!-- > -->

### Changing Scenes (Transitions)
While the simple, direct manner outlined above works fine for presenting some new scene objects, most game scenes will benefit from more dramatic transitional effects.

<!-- v -->

#### SKTransition
`SKTransition` is an object used to perform an animated transition to a new scene.

It affords you the option of using a transition to animate the change from an old scene to a new scene, which provides continuity so that the scene change is not quite so abrupt.

```Swift  
class SKTransition : NSObject
```

*Source:* https://developer.apple.com/documentation/spritekit/sktransition

<!-- v -->

**Example:** </br>
A simple example showing `scaleMode` property and a `crossFade` transition:

```Swift  
myNewScene = NewScene(size: size)
myNewScene.scaleMode = .aspectFill

let crossFade = SKTransition.crossFade(withDuration: 0.5)
view?.presentScene(myNewScene, transition: crossFade)
```

<!-- > -->

#### Creating Scenes with Custom `init()`
Another common pattern for setting up your scene is to create a custom initialization method in your new game scene class.

In the example below, we added a custom initializer that takes just one extra parameter: a Boolean that should be `true` if this is the first time the player played the game and `false` if it is not. We store this value in a property named `firstTime`.

<!-- v -->

```Swift  
class GameLoadingScene: SKScene {
  let firstTime:Bool
  init(size: CGSize, firstTime: Bool) {
    self.firstTime = firstTime
    super.init(size: size)
  }
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
```

<!-- v -->

...and we could use this Boolean flag to make conditional decisions at key points in the scene's lifecycle, such as in the `didMove(to:)`, or elsewhere, when the scene is presented:

```Swift  
override func didMove(to view: SKView) {
  if (!firstTime) {
    // If not first time, start regular game
  } else {
    // If players first time, do first time things (i.e., explain rules, offer video explaining gameplay, etc.)
  }
}
```

<!-- > -->

## In Class Activity

Keep working in your game adding:

- game mechanics
- other scenes

[Instructions](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/04-Working-with-Scenes/assignments/activity.md)

<!-- INSTRUCTOR NOTE: The `touchesBegan(_:with:)` function might be the best place for this (but not the only appropriate function) -->

<!--
INSTRUCTOR NOTE - here is what the new GameOverScene could look like:

class GameOverScene: SKScene {
  let won:Bool
  private var stateLabel : SKLabelNode?

  init(size: CGSize, won: Bool) {
    self.won = won
    super.init(size: size)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

override func didMove(to view: SKView) {
  var background: SKSpriteNode
  if (won) {
    stateLabel.text = "You Win"
  } else {
    stateLabel.text = "You Lose"
  }
  background.position =
    CGPoint(x: size.width/2, y: size.height/2)
  self.addChild(background)
  // More here...
} -->

<!-- TODO: create and add graphics to show the Win and Loss graphics for the GameOverScene-->

<!-- TODO:  challenge: add debugging steps to the SKView object? -->

<!-- > -->

## After Class

1. **Challenge** &mdash; Add the following to your AstroJunk game's Game Over scene:
  - A __*menu*__ that, on winning the game, offers the user the option of choosing:
    - "Replay" or "Restart" &mdash; which replays the previous level of game just played
    - "Next Level" &mdash; which offers the user a new level of the game to play (this means you will have to create at least one additional level)
    - "High Scores" &mdash; presenting the user with a list of highest scores so far.

2. Get sound files
   For next lesson, you will need to have sound files for your game on hand:
    - background music
    - sound effects for game events such as collisions, Win and Loss conditions, etc.

    **TODO:**
    - Find out what audio file types are supported in iOS apps
    - Find them, and have them ready to insert into them in your game


<!-- TODO: get URLS to illustrate adding menus, etc -->

<!-- Often, it’s best to start a game with an opening or main menu scene, rather than throw the player right into the action. The main menu often includes options to start a new game, continue a game, access game options and so on. -->

<!-- > -->

2. Review:
  - The "Enabling Visual Statistics for Debugging" section of [SKView - from Apple docs](https://developer.apple.com/documentation/spritekit/skview)
  - [SKSceneDelegate - from Apple docs](https://developer.apple.com/documentation/spritekit/skscenedelegate)
  - [Gameplay - wikipedia](https://en.wikipedia.org/wiki/Gameplay)
  - [Scaling a Scene's Content to Fit the View - from Apple docs](https://developer.apple.com/documentation/spritekit/skscene/scaling_a_scene_s_content_to_fit_the_view)
- SpriteKit's Scene Editor [Introduction to the SpriteKit Scene Editor - a tutorial by Ray Wenderlich](https://www.raywenderlich.com/620-introduction-to-the-spritekit-scene-editor) and [Creating a Scene from a File - Apple docs](https://developer.apple.com/documentation/spritekit/skscene/creating_a_scene_from_a_file)

<!--
TODO: Create a new scene (which?) using SpriteKit Scene Editor?
https://developer.apple.com/documentation/spritekit/skscene/creating_a_scene_from_a_file -->


<!-- possible tutorial to review ...about adding menus...
https://www.makeschool.com/academy/track/build-ios-games/clone-angry-birds-with-spritekit-and-swift-3/main-menu -->

<!-- > -->

## Wrap Up

- Pay close attention to After Class assignments
- Continue developing AstroJunk by completing today's assignments and activities after class
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

2. [Game mechanics - wikipedia](https://en.wikipedia.org/wiki/Game_mechanics)
3. [SKView - Apple Docs](https://developer.apple.com/documentation/spritekit/skview)
4. [SKTransition - Apple Docs](https://developer.apple.com/documentation/spritekit/sktransition)
5. [Drawing SpriteKit Content in a View - Apple Docs](https://developer.apple.com/documentation/spritekit/drawing_spritekit_content_in_a_view)
6. [Nodes for Scene Building - Apple Docs](https://developer.apple.com/documentation/spritekit/nodes_for_scene_building)
7. [scaleMode - Apple Docs](https://developer.apple.com/documentation/spritekit/skscene/1519562-scalemode)

<!-- v -->

8. [SpriteKit – Understanding SKScene scaleMode - an article](https://infinitecortex.com/2014/01/spritekit-understanding-skscene-scalemode/)
9. [`didMove(to:)` - Apple Docs](https://developer.apple.com/documentation/spritekit/skscene/1519607-didmove)
10. [Transitioning Between Two Scenes - Apple Docs](https://developer.apple.com/documentation/spritekit/sktransition/transitioning_between_two_scenes)
11. [Kerbal Space Program - wikipedia](https://en.wikipedia.org/wiki/Kerbal_Space_Program)
12. [Game studies - wikipedia](https://en.wikipedia.org/wiki/Game_studies)
13. [Asteroids (video game) - wikipedia](https://en.wikipedia.org/wiki/Asteroids_(video_game))
