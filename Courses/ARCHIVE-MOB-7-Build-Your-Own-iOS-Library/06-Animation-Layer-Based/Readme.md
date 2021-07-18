# Layer Based Animation

### Benefits of layers
Layers can have sublayers.
Just like views can have subviews, layers can have sublayers. You can use this for some cool effects!

Layer properties are animated. When you change the property of a layer, it is animated over time by default. You can also customize this animation behavior to your own timing.

Layers are lightweight. Layers are lighter-weight than views, and therefore they help you achieve better performance.

## Animations

There are a few ways to create animations, you can do them implicitly or explicitly.

### Implicit

Implicit animation, which updates the layer object’s data value

Every time you change some property of CALayer (we can say that UIView is just simple wrapper around CALayer), it doesn't happen instantly; instead, Core Animation smoothly animates a transition between the two values, and this happens automatically. Such animations are called implicit because you don't specify the way the animation happens - everything is taken care for you. If you ever wondered, the default animation time speed is 0.25 seconds.

### Explicit Animations

The explicit animation model requires an animation object to be created and initial and final values to be set. In this case, animation will happen smoothly, changing from one value to another and won’t begin until it’s added to a layer.

Explicit animations only produce the animations. At the end of the animation, Core Animation removes the animation object from the layer and redraws the layer using its current data values.
If you want the changes from an explicit animation to be permanent, you must also update the layer’s property.

Implicit and explicit animations normally begin executing after the current run loop cycle ends, and the current thread must have a run loop in order for animations to be executed. If you change multiple properties, or if you add multiple animation objects to a layer, all of those property changes are animated at the same time.


## Animation Objects

- CAAnimation
- CABasicAnimation
- CAKeyFrameAnimation

## GroupAnimations

We can group animations together using CAGroupAnimation. You can add animations and synchronize them.
<!-- ## Timing Animations
CATimingAnimation -->


## Animating along a path with CAKeyFrameAnimation

To animate a shape along a path, you will have to use a CAKeyFrameAnimation object.

<!-- ## CADisplayLink

A CADisplayLink object is a timer that allows your application to synchronize activity with the display’s refresh rate. You add a target and an action that are called whenever the screen’s contents update.
It’s the perfect opportunity to re-draw your path and update the shape layer. -->


## CAReplicatorLayer

Creates duplicate copies of layers with options to apply group transformations.

## Class Material

Playgrounds:
[Layer Animation](assets/layer-animation.playground)

## Challenges

| Bounce Loader| Sync Loader | Map Loader |
| :------------- | :------------- | :------------- |
| ![Animate challenge 1](assets/loading_bounce.gif) | ![Animate challenge 2](assets/spinning_loader.gif) | ![UIView Animate challenge 3](assets/map_loader.gif) |
