# Notes on Frame Rates
Understanding frame rates is critical to iOS game development.

By no means complete, here are few key items to help begin your comprehension of this sometimes complex topic.

## Target Frame Rates
The default frame rate value in iOS is 60 frames per second, which is equivalent to 16.67 ms per frame.

Most apps target this frame rate of 60 FPS, and you typically want your game to run at 60fps because it will make your game look and feel smooth.

However, there are technical considerations and real-time conditions related to frame rate that can affect your game app's performance.

## Changing Frame Rates
Your application should choose a frame rate that it can consistently maintain.

As a game runs, players progress through higher game levels, and game object complexity increases, you might notice a rapid decrease in the frame rate. Not only does the graphics processor have to deal with increasing amounts of geometry, the physics engine has to deal with an increasing number of collisions, which also negatively affects your frame rate.

To avoid jitter, apps that are consistently unable to complete a frame’s work within 16.67 ms should target a lower frame rate.

Ideally, you want at least 30 FPS.

## Updating
You’ll get the best results if you update your game at the same rate as the screen.

Updating every frame is the least efficient option, but it lets you change state often, which makes the game look smooth.

SpriteKit tries to draw frames as fast as possible, up to 60 FPS. By default, SpriteKit tries to call your `update(_:)` method 60 times per second (roughly every 16 milliseconds). However, if `update(_:)` takes too long, or if SpriteKit has to draw more sprites than the hardware can handle at one time, the frame rate might automatically decrease.

It it takes too long to update and render a frame of your game, SpriteKit can decide to call your  `update(_:)` method less often, and the frame rate will decrease.

## Device Support
Some physical iOS devices can easily support your game at 60 fps. But less-powerful devices, including the Simulator, cannot support that frame rate.

The Simulator runs on a Mac, which has a faster CPU and much more memory than an iPhone or iPad. But Macs have very slow GPUs and as such are extremely slow at simulated rendering. So you can’t count on accurate performance measurements from the Simulator on your Mac.

SpriteKit (and SceneKit) performs much better on physical devices than in the Simulator, so your frame rates will appear lower than expected when running your game in the Simulator.

## Checking Your App's Frame Rate
By default, SpriteKit displays your games frame rate in FPS in the bottom-right corner of the screen.

You'll want to keep an eye on your app's FPS often as you develop your game to ensure your game is performing as well as possible at each point.

As mentioned, you will get very different performance on the Simulator. Only pay attention to the FPS display on an actual device, as you will get a much higher FPS on a device than you will on the Simulator.


<!-- TODO: show image of FPS in game app  -->


## Related Terms
- **Frame Time** - This is the total amount of time it took to draw a single frame. A frame time of 16.7ms is required to achieve a frame rate of 60fps.
- **Delta Time** - The number of seconds since the last update was run. (The amount of time between frames becomes because game content changes frame by frame.) Note that even if your game runs at a smooth 60 FPS, there will always be some small variance in how often SpriteKit calls your `update(_:)` method. Thus, you need to take the delta time into account in your calculations.

## Best Practices
Tips to keep your game running fast:
1. Keep `update(_:)` fast - Since it’s called every frame, avoid slow algorithms in the `update(_:)` method .
2. Keep your the number of active nodes as low as possible. Remove nodes from the scene graph when they are offscreen and you no longer need them.
