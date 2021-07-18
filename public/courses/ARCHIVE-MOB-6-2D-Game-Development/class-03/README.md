# Class 3 - Physics Intro

2d physics is a common feature of many games. 
People understand motion that resemebles the motion and interaction 
of everyday objects on a 2d plane. 

## Physics Simulation

Physics in SpriteKit is a simulation that is run independant of what you see 
in the screen. Imagine mathematical world where bodies are affected by 
gravity move and collide. 

**What is a body?**

A body is a shape that defines an object in the physics simulation. Most often 
bodies will be rectangles and circles. The circle is the most efficient shape. 
You can also create bodies with more complex shapes. 

Every sprite has a physicsBody property. When a sprite has a physics body it 
inheits the x, y, and zRotation from the physics body in the phsysics 
simulation.

Or think about it like this. As a physics body moves and collides with other 
bodies in the simulation it passes it's position and rotation to the sprite
it's assigned to. 

## Vocabulary 

- Box2d - A library of code written in C++ that simulates 2d physics. SpriteKit
uses a modifed version of this. 
- Phsyics - The real world interaction of physical objects. This includes wind 
gravity and collisions. 
- Body - A physics body is an programming object that represents an object in 
the physics simulation. 