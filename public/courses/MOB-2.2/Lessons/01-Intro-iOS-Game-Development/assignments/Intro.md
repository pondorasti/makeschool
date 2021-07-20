# iOS Game Development - An Evolution

If you wanted to make a game app in the early days of iOS, your only option was OpenGL ES (and later, Metal). OpenGL ES (along with Metal) is the lowest-level graphics API available on iOS.

Because OpenGL ES is notoriously difficult to learn, it was a huge obstacle for many beginning iOS game developers.

Third-party game development frameworks for iOS built on top of OpenGL emerged in response.

**Cocos2D**
The most popular of these third-party frameworks was Cocos2D. Most of the top game apps in the App Store at the time were made with Cocos2D.

Cocos2D was an excellent framework. But because it was neither written nor supported by Apple, developers often had issues integrating it with other Apple frameworks or when new versions of iOS were released.

### SpriteKit

With iOS 7, Apple released SpriteKit to provide developers a new framework for making 2D games and graphics.

SpriteKit is a general-purpose framework for drawing shapes, particles, text, images, and video in two dimensions. It takes care of low-level graphics tasks like creating OpenGL contexts and managing textures, allowing you to focus on game-related tasks like showing your game’s sprites on the screen.

To minimize the learning curve for experienced Cocos2D developers, Apple designed the SpriteKit API to be very similar to Cocos2D; only without the Cocos2D's shortcomings note above. SpriteKit contains similar element types to Cocos2D, including the same sprites, actions and scenes familiar to Cocos2D developers.

And SpriteKit adds many features of its own on top of the basic set borrowed from Cocos2D.

A short list of SpriteKit's supported features includes:

- Textured Sprites
- Physics Engine (for collisions, events, forces & gravity, simulations)
- A 2D Coordinate System
- Particles Editor (to create fire, smoke, and more...)
- Scene Editor
- Tilesets
- Camera
- Sound & Videos
- Shape Creation
- Special Effects for Images


While SpriteKit is for 2D games, Apple's SceneKit framework was created in response to the demand for a 3D game development framework. There is also a 3rd-party framework, Unity, that is worth your awareness as it is extremely popular for iOS (and non-iOS) game development. Unity allows you to develop in either 2D or 3D, borrowing concepts and paradigms from both SpriteKit and SceneKit. Though there will not be time in the course to cover Unity, we will introduce SceneKit to you later on.


<!--
Physics
SpriteKit has a built-in physics engine that makes handling complex physics scenarios a breeze. Built on top of the popular Box2D framework, it allows you to respond to collisions and contact events, apply forces and gravity, and build very complex physics simulations using joints, such as pins and springs. You can use the scene editor to visually add physics to the nodes, or you can add physics programmatically.

Coordinate System
In SpriteKit, the coordinate (0,0) is located at the bottom left of the screen instead of the top left, which you may be used to if you've worked with Flash, Corona, HTML5 Canvas, and many other game frameworks. Having the origin at the bottom left is an OpenGL convention, and SpriteKit follows it because SpriteKit uses OpenGL under the hood.

Particle System
SpriteKit has a very powerful particle engine which can be used to simulate particle systems such as fire and smoke. There is also a built-in particle editor where you can visually lay out particle systems. If you prefer to stick with code, you can program these systems from the ground up using nothing but code. -->


### Why SpriteKit?

**Powerful, Yet Easy-to-Use**

SpriteKit is well-designed and easy-to-use. Especially for beginners.

It leverages Metal to achieve high-performance rendering, but it offers a simple programming interface to make it easy to create high quality 2D games and other graphics-intensive apps, without your needing to worry about the complexities of graphics APIs such as OpenGL and Metal.

In addition, SpriteKit offers a rich array of extra functionality (see the short list of supported features above) to enhance 2D game development.

**Apple Support**

SpriteKit works the same on iOS, macOS, tvOS and watchOS, which makes porting your game from one platform to another incredibly easy.

SpriteKit is fully supported by Apple and kept up to date with iOS. Apple has also heavily optimized it for creating 2D games efficiently on iOS.

SpriteKit is the clear choice for 2D game development on iOS.

**2D is Essential**

On some level, nearly every game, even very sophisticated 3D games, use 2D elements, such as in the game's interface or its menu system.

And 2D games are a lot easier to make, for a number of reasons, including:
- Artwork is far less complicated
- Programming is faster, requires less math

Because you don’t need to worry as much about lighting, or about how elements will look from multiple angles, it’s often simpler to create a great-looking scene with 2D images than it is to create a 3D version of the same scene.

All of this allows you to focus on creating awesome gameplay, and in terms of both gameplay and graphics, you will end up with a much easier to manage game.

For a beginner, 2D is definitely the best way to get started.

For an advanced game developer, making a 2D game is still much faster than making a 3D game.

And creating a game that limits itself to 2D graphics is a good way to keep your game simple.

If you just want to make something simple for Apple platforms only, SpriteKit is definitely the way to go.
