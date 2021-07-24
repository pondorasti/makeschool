# Class 1 - Introduction

## What is the assignment?

[**Smove**](https://itunes.apple.com/us/app/smove/id968818637?mt=8)

Smove is a simple game with a simple mechanic that
is fun to play.

**Why**

Smove provides an easy mechanic that relies on core
concepts required in games.

- Coordinates
- Sprites
- Actions

These are core ideas in SpriteKit you can use them to
create many different types of games. These are
foundational for your understanding and success with
SpriteKit.

**What**

In games Sprites represent the game Objects you see
the screen. Sprites are core to games.

In SpriteKit sprites can move, animate their textures
rotate and more.

## Making Smove

Review the concepts of

How would you make Smove?

Idenitify Sprites?

How to calculate the size and position?

How to place sprites?

What types of actions?

##  What is SpriteKit

SpriteKit is the 2d game framework provided by Apple.
SpriteKit supports physics, animation, sound, and all
of the features you would expect to find in typical
2d games.

SpriteKit organizes projects into Scenes. A scene can
be a game, or a single level for a game, or a menu.

Nodes are the source elements for game objects. Nodes
are stored in a tree structure with the scene as the
root node.

SKNode is the building block for all game content.

### Navigating a SpriteKit project

A SpriteKit scene is rendered in a UIView/SKView.
In most cases you won't need storyboard though
you will have a single view controller with a
view that displays your SpriteKit scenes.

## Nodes, Scenes, Sprites, Actions

Make something with Sprites and Actions.

The minimum features required to make a game would be
a Scene, one or more sprites, some actions.

A scene is the root object for all sprite kit objects.

A sprite draws an object into a scene.

Actions make things happen. Actions can animate objects
play sounds, they add behavior to game objects.

- Make a scene
  - Set the bounds `GameScene(size: CGSize)`
  - Set relevant options
  - Present `view.presentScene(scene)`

- Make a Sprite
  - Set the size and color `SKSpriteNode(color: UIColor, size: CGSize)`
  - addChild `addChild(sprite)`
  - Set any relevant properties
    - `sprite.position.x`, `sprite.position.y`
    - `sprite.zRotation`

- Use an action
  - Make an action

## Smove

Take look at smove.

Break it down into problems to solve.

- Define Game Objects
  - Name the game Objects
- Define methods
  - What steps will be required to set up game
  - What is required to run the game?

## Assignment - Sushi Neko tutorial

- [Sushi Neko Tutorial](https://github.com/soggybag/Sushi-Neko-SpriteKit-Swift3)

### Vocabulary

- **SpriteKit** - 2d Game Framework from Apple.
- **Scene** - The root node for the currently game content.
- **Sprite** - An object that displays on the screen.
- **Node** - An object in a hierarchical structure. Nodes
can be parents and have children.
- **SKNode** - The SKNode class is the fundamental building
block of most SpriteKit content. SKNode's keep track of
their position, scale, and rotation and define common methods
for all nodes.
- **SKSpriteNode** - A node that draws a rectangular texture,
image or color. This is the basic building block for most
game objects.
- **SKScene** - The root node for all Sprite Kit objects
displayed in a view. Your games will be made up multiple
scenes each defined as an SKScene. SKScene performs a
similar function to UIViewController in UIKit.
- **SKAction** - An object that is executed by an SKNode to
change its structure or content. Actions can do a wide
variety of things, too much to list it all here.
Typically actions animate sprites, play sounds, they
add behaviors to game objects.

### Resources

- SKNode: https://developer.apple.com/documentation/spritekit/sknode
- SKSpriteNode: https://developer.apple.com/documentation/spritekit/skspritenode
- SKShapeNode: https://developer.apple.com/documentation/spritekit/skshapenode
- SKScene: https://developer.apple.com/documentation/spritekit/skscene
