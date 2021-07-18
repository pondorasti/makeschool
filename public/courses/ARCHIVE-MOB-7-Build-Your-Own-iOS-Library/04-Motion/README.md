# Motion

UIKit provides a few ways to make things move. The number and variety of options makes animation
with UIKit a bit of a jungle. To understand animation in UIKit it helps to work through the
available options methodically and consider why each option exists. I will try and do that here.

First let's look at what motion is on the computer. Animation can be broken down into a few
categories. Being able to examine a break down and identify which features are required to create
a particular effect is the first step to success.

**Motion Graphics**

Motion graphic animation is generally where you are moving objects on the screen. In generally you
are changing an object's center, or frame, or using a transform to rotate or scale an object.

**Drawing**

Here is a short reference for the tools that might apply for different types of animation. In this
case you are drawing a shape like you are tracing a path.

**Frame based**

This is the classic animation where you are showing a series of images one at a time like the frames
of a movie.

**Special Effects**

Everything else falls here. Particle systems are a good example. Particles can be used to create
rain, stars, fairy dust, fire and more. Bluring, and other filter effects would also fall in this
category.

- Move and tranform objects on the screen.
    - Imagine objects sliding, rotating, scaling, and fading.
    - Use: frame, center, transform, and UIView.
- Draw an object.
    - Imagine lines be being drawn, and shapes that morph.
    - Use: UIBezierPath, Core Graphics, and CABasicAnimation
- Cycle through frames or video.
    - Imagine a flipbook of images each shown in succession.
    - Use: UIImage and UIImageView, AV
- Special effects.
    - Particles, filter effects and more. The tools used here are hard to nail down.
    - Use: CAParticleLayer, Open GL (there is a specialized layer for this...), Blur and vibrancy
    effects.

The section will focus on UIView.animate(). This method has a few options that allow you to animate
most to things you will want to animate. It also provides a simple interface that easy to work with.

Here is a link to some video tutorials:

- https://www.youtube.com/watch?v=f1OWrFO_ayQ&list=PLoN_ejT35AEhGkIbBFjn6ACfNfIyQa4Od&index=9

## UIView Animation

UIView provides a helper method that makes it easy to create simple aniamtions. Using UIview.animate()
Is the easiest way to create animation. This doesn't allow you to animate every property but it does
cover all of the most common things you will want to animate. This is a tool you can grab at any time
make something slide, fade, rotate or scale into view.

UIView.animate() is a high level tool that exposes a few options, and presents any easy to access
API. That said UIView.animate() has some limits.

Limited to these properties:

- frame: Modify this property to change the view’s size and position relative to its superview’s coordinate system. (If the transform property does not contain the identity transform, modify the bounds or center properties instead.)
- bounds: Modify this property to change the view’s size.
- center: Modify this property to change the view’s position relative to its superview’s coordinate system.
- alpha: Modify this property to gradually change the transparency of the view.
- backgroundColor: Modify this property to change the view’s background color.
- contentStretch: Modify this property to change the way the view’s contents are stretched to fill the available space.
- transform: Modify this property to scale, rotate, or translate the view relative to its center point. Transformations using this property are always performed in 2D space. (To perform 3D transformations, you must animate the view’s layer object using Core Animation.)

**Constraints** views that use constraints present an intersting problem. Constraints are a system
that automatically set the size and position of an object on the screen. What happens when another
system tries to position that object somewhere else? This can be a problem. When you need to
animate an object tat has constraints applied to it there a couple strategies you can consider:

- Animate the constraint rather than the object.
- Don't use constraints, size and position your object programatically.

### UIView.animate() Examples

> An example of UIView.animate()

### UIView.animate() Challenges

| | | |
| :------------- | :------------- | :------------- |
| ![UIView Animate challenge 1](uiview-animation-1.gif) | ![UIView Animate challenge 2](uiview-animation-2.gif) | ![UIView Animate challenge 3](uiview-animation-3.gif) |
| ![UIView Animate challenge 4](uiview-animation-4.gif) | ![UIView Animate challenge 5](uiview-animation-5.gif) | |



<!-- - ![UIView Animate challenge 1](uiview-animation-1.gif)
- ![UIView Animate challenge 2](uiview-animation-2.gif)
- ![UIView Animate challenge 3](uiview-animation-3.gif) -->
<!-- - ![UIView Animate challenge 4](uiview-animation-4.gif)
- ![UIView Animate challenge 5](uiview-animation-5.gif) -->
    - This last example was created by anmating only the frame property! I almost exclusively used
    CGRect methods: insetBy() and offsetBy().
