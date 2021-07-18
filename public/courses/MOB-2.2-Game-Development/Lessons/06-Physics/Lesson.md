<!-- .slide: class="header" -->

# Physics

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/06-Physics/Lesson.html ':ignore')

<!-- > -->

## Agenda

- Learning objectives
- Play test games 🎮
- Physics in SpriteKit
- Physics playground
- Collisions & the Physics delegate 💥

<!-- > -->

## Learning Objectives

- Gain feedback from your game
- Experiment using physics and playgrounds
- Use physics bodies on current nodes
- Use physics to handle collisions in the game

<!-- > -->

## Physics in SpriteKit

So far we've created movement in our game using SKActions. They are easy to understand and implement.

There is another way to get the same result: using SpriteKit's physics engine.

It's a powerful engine built on top of an API called Box2D.

<!-- > -->

## Physics bodies

All nodes have a property called `physicsBody`.

Assign a `SKPhysicsBody` object to the `physicsBody` property of the SKNode to add physics simulation to the node.

When a scene processes a new frame, it performs physics calculations on physics bodies attached to nodes in the scene.

These calculations include gravity, friction, and collisions with other bodies

<!-- v -->

### Dynamic volume

Simulates a physical object with **volume** and **mass** that can be affected by forces and collisions in the system.

Use dynamic volumes to represent items in the scene that need to move around and collide with each other.

<!-- v -->

### Static volume

Similar to a dynamic volume, but its velocity is ignored and it is unaffected by forces or collisions.

It still has volume so other objects can bounce off it or interact with it.

Use static volumes to represent items that take up space in the scene, but that should not be moved by the simulation.

<!-- v -->

### Edge

An edge is a static volume-less body.

Edges are never moved by the simulation and their mass doesn’t matter.

Edges are used to represent negative space within a scene (such as a hollow spot inside another entity) or an uncrossable, invisibly thin boundary. For example, edges are frequently used to represent the boundaries of your scene.

<!-- v -->

## Using shapes

The physicsBody should have a shape and there are a few options available.

![bodies](assets/bodies.png)

<!-- v -->

```swift
let spaceShipTexture = SKTexture(imageNamed: "spaceShip.png")

// Spaceship 1: circular physics body
let circularSpaceShip = SKSpriteNode(texture: spaceShipTexture)
circularSpaceShip.physicsBody = SKPhysicsBody(circleOfRadius: max(circularSpaceShip.size.width / 2,circularSpaceShip.size.height / 2))

// Spaceship 2: rectangular physics body
let rectangularSpaceShip = SKSpriteNode(texture: spaceShipTexture)
rectangularSpaceShip.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: circularSpaceShip.size.width,height: circularSpaceShip.size.height))

// Spaceship 3: polygonal physics body
let polygonalSpaceShip = SKSpriteNode(texture: spaceShipTexture)
let path = CGMutablePath()
path.addLines(between:
  [CGPoint(x: -5, y: 37), CGPoint(x: 5, y: 37), CGPoint(x: 10, y: 20),
  CGPoint(x: 56, y: -5), CGPoint(x: 37, y: -35), CGPoint(x: 15, y: -30),
  CGPoint(x: 12, y: -37), CGPoint(x: -12, y: -37), CGPoint(x: -15, y: -30),
  CGPoint(x: -37, y: -35), CGPoint(x: -56, y: -5), CGPoint(x: -10, y: 20),
  CGPoint(x: -5, y: 37)])
path.closeSubpath()
polygonalSpaceShip.physicsBody = SKPhysicsBody(polygonFrom: path)

// Spaceship 4: physics body using texture’s alpha channel
let texturedSpaceShip = SKSpriteNode(texture: spaceShipTexture)
texturedSpaceShip.physicsBody = SKPhysicsBody(texture: spaceShipTexture,size: CGSize(width: circularSpaceShip.size.width,height: circularSpaceShip.size.height))
```

<!-- v -->

The shape of a physics body affects performance.

A circular physics body offers the best performance and can be significantly faster than other physics bodies. Best option! ⭕️

Rectangular and polygonal shapes improve collision accuracy with reduced speed.  🔲

Physics bodies created from the alpha channel of a texture offer the best fidelity at the highest performance cost. 😧

<!-- > -->

## Physics playground

[Starter playground](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/06-Physics/assets/PhysicsPlayground.playground.zip)

<!-- > -->

## Collisions

There are two kinds of interaction between physics bodies:

- **A contact**: used when you need to know that two bodies are touching each other.
- **A collision**: when one body strikes another body, SpriteKit automatically computes the results of the collision and applies impulse to the bodies in the collision.

<!-- v -->

### Category Bit Mask

A mask that defines which categories this physics body belongs to.

Every physics body in a scene can be assigned to up to 32 different categories, each corresponding to a bit in the bit mask. You define the mask values used in your game.

```swift
struct PhysicsCategory {
    static let None:      UInt32 = 0          // 0000000
    static let Ship:      UInt32 = 0b1        // 0000001
    static let Meteor:    UInt32 = 0b10       // 0000010
    static let Debris:    UInt32 = 0b100      // 0000100
    static let Edge:      UInt32 = 0b1000     // 0001000
}
.
.
ship.physicsBody!.categoryBitMask = PhysicsCategory.Ship
```

<!-- v -->

### Collision Bit Mask

A mask that defines which categories of physics bodies can collide with this physics body.

When two physics bodies contact each other, a collision may occur. This body’s collision mask is compared to the other body’s category mask by performing a logical AND operation. If the result is a nonzero value, this body is affected by the collision.

```swift
meteor.physicsBody!.collisionBitMask = PhysicsCategory.Ship | PhysicsCategory.Edge
```

<!-- v -->

### Contact Test Bit Mask

A mask that defines which categories of physics bodies cause intersection notifications with this physics body.

When two bodies share the same space, each body’s category mask is tested against the other body’s contact mask by performing a logical AND operation. If either comparison results in a nonzero value, an `SKPhysicsContact` object is created and passed to the physics world’s **delegate**.

```swift
meteor.physicsBody!.contactTestBitMask = PhysicsCategory.Ship
```

<!-- > -->

## SKPhysicsContactDelegate

Methods your app can implement to respond when physics bodies come into contact.

With the delegate we respond when two physics bodies with overlapping `contactTestBitMask` values are in contact with each other in a physics world.

```swift
func didBegin(_ contact: SKPhysicsContact) {}
func didEnd(_ contact: SKPhysicsContact) {}
```

<!-- > -->

## Physics world

How to set the delegate?

```swift
physicsWorld.contactDelegate = self
```

The physics world is the driver of the physics engine in a scene; it exposes the ability for you to configure and query the physics system.

Is where the contact detection happens.

We can configure: speed & gravity 👩🏻‍🚀

<!-- > -->

## An example

```swift
struct PhysicsCategory {
    static var player: UInt32 = 0b10 //2
    static var enemy: UInt32 = 0b100 //4
    static var rock: UInt32 = 0b1000 //8
}

player.physicsBody!.categoryBitMask = PC.player
player.physicsBody!.collisionBitMask = PC.enemy | PC.rock
enemy.physicsBody!.categoryBitMask = PC.enemy
enemy.physicsBody!.collisionBitMask = PC.player

func didBeginContact(contact: SKPhysicsCountact) {
    //1
    let collision: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

    //2
    if collision == PC.player | PC.enemy {
        //An interaction occurred between the player and enemy.
    }
}
```

<aside class="notes">
At 1) The variable collision is using bitwise OR, which is |. In this case, if the player touches an enemy, it gets the category of the player (bodyA) which is 2, and it gets the category of the enemy (bodyB), which is 4. So 2 (0b10) OR 4 (0b100) is equal to 6 (0b110) which is assigned to collision.
At 2) We check if the collision of 6 is equal to (PC.player | PC.enemy), which is true, therefore an interaction occurred between the player and enemy since it would be if 6 == 6.

Source: https://stackoverflow.com/questions/39063949/cant-understand-how-collision-bit-mask-works
</aside>

<!-- > -->

## Applying it to our game

Change the way you do collision detection to use the physics engine.
- Debug by showing the physics bodies
- Make sure the nodes are being removed

In case you already have it like this:
- Try changing the speed at which the elements are falling
- If your ship fires, try using an impulse for the lasers

<!-- > -->

## Sources & additional resources

- [Custom Physics body](https://github.com/WesleyEspinoza/skphysicsbody-path-generator)
- [Physics bodies](https://developer.apple.com/documentation/spritekit/sknode/getting_started_with_physics_bodies)
- [Collisions and contacts](https://developer.apple.com/documentation/spritekit/skphysicsbody/about_collisions_and_contacts)
- [Collision bit mask](https://developer.apple.com/documentation/spritekit/skphysicsbody/1520003-collisionbitmask)
- [Category bit mask](https://developer.apple.com/documentation/spritekit/skphysicsbody/1519869-categorybitmask)
- [Contact test bit mask](https://developer.apple.com/documentation/spritekit/skphysicsbody/1519781-contacttestbitmask)
- [SKPhysicsContact](https://developer.apple.com/documentation/spritekit/skphysicscontact)
- [Physics world](https://developer.apple.com/documentation/spritekit/skphysicsworld)
