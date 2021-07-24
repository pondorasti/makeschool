# Animations

## [Slides](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/Slides/10-Animations/README.html ':ignore')

<!-- > -->

## Learning Objectives

By the end of this lesson, students should be able to:

- Explain the basics of UIKit animation and different options available to create special effects
- Identify properties that can be animated
- Animate views with the frame approach
- Animate views with Auto Layout
- Apply animations in a login screen

<!-- > -->

## UIKit + Animations

UIKit not only lets us build the user interface of our apps, it also gives us different APIs to animate views on the screen.

We can animate **any object that inherits from UIView**.<br>
We can give predefined actions to views:
- fade
- move
- resize
- change color

<!-- > -->

## Starting simple

The first technique we'll explore deals with animating frames. This will give us an idea of what parameters conform an animation and how modifying each element gives us a completely different result.

<!-- > -->

## Create a new playground

```swift
import UIKit
import PlaygroundSupport

class ViewController: UIViewController {

    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()

    let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()

    override func viewDidLoad(){
        super.viewDidLoad()
        bottomView.frame = CGRect(x: self.view.frame.size.width/2-25, y: self.view.frame.size.height/2, width: 50, height: 50)
        self.view.addSubview(bottomView)

        topView.frame = CGRect(x: self.view.frame.size.width/2-25, y: -50, width: 50, height: 50)
        self.view.addSubview(topView)
    }
}

let master = ViewController()
PlaygroundPage.current.liveView = master
```

<aside class = "notes">
This playground creates to squares that for now are outside the frame of the main view. We'll animate them to move inside the view.
</aside>

<!-- > -->

We'll start animating the square at the bottom, 400 pts up in a span of 1.5 seconds.<br>
Add the following after adding the view to the screen and then run the playground to see it come to life.

```swift
UIView.animate(withDuration: 1.5) {
    self.bottomView.center.y -= 200
}
```

<!-- > -->

`UIView.animate(withDuration:){}` is the method that will animate views.

We set the duration by entering it as a parameter and all the changes we make to the view inside the closure will be then animated by UIKit.

<!-- > -->

We can animate as many views as we want inside the animations closure.

**Animate the square at the top to be above the bottom square**

![gif1](assets/gif1.gif)

<!--
UIView.animate(withDuration: 1.5) {
    self.bottomView.center.y -= 200
    self.topView.center.y += 200
}
-->

<!-- > -->

Now let's try to make them move independently, one after the other.

```swift
UIView.animate(withDuration: 1.5, delay: 0.5, options: [], animations: {
  self.bottomView.center.y -= 200
},completion: nil)
```

<!--
UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseOut], animations: {
    self.bottomView.center.y -= 200
    },completion:  { (finished: Bool) in
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseOut], animations: {
            self.topView.center.y += 200
        },completion: nil)
    })
-->

<!-- > -->

This time the class method looks a little different:

- `withDuration`: How long the animation will take
- `delay`: How many second UIKit will wait before it starts the animation.
- `options`: Specify aspects of the animation to customize, for now pass an empty array `[]`
- `animations`: Closure expression to specify animations.
- `completion`: Closure to execute when the animation is complete.

<!-- > -->

**Animate the squares to move one after the other**

![gif2](assets/gif2.gif)

<!-- > -->

## What we did

We changed the view's center in order to move the views to a new location in the screen.

Here are more properties we can animate:
- bounds
- frame
- backgroundColor (gradually change color over time)
- alpha (fade in/fade out effects)
- transform (rotate, scale)

**Animate the squares to change color or alpha as they move**

<!--
UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseOut], animations: {
    self.bottomView.center.y -= 200
    self.bottomView.backgroundColor = UIColor.blue

},completion:  { (finished: Bool) in
    UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseOut], animations: {
        self.topView.center.y += 200
        self.topView.backgroundColor = UIColor.gray
    },completion: nil)
})
-->

<!-- > -->

## The options parameter

More options we can use to combine in our animations:

- `.repeat`: makes an animation loop forever
- `.autoreverse`: used with the previous to move animation forward and in reverse

<!-- > -->

![gif3](assets/gif3.gif)

<!-- > -->

## Organic movements

To make animations more realistic we can apply an effect in which the object builds momentum at the beginning and slows down towards the end. We call this **ease-in** and **ease-out**

- `.curveLinear`: no acceleration/deceleration
- `.curveEaseIn`: acceleration at the start
- `.curveEaseOut`: acceleration in the end
- `.curveEaseInOut`: acceleration in the start and end

**Experiment with this options in your playground**

<!--
UIView.animate(withDuration: 1.5, delay: 0.3, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
    self.topView.center.y += 300
    self.topView.backgroundColor = UIColor.gray
},completion: nil)
-->

<!-- > -->

## Bouncing effects

<iframe src="https://giphy.com/embed/xT0xeGxcmzPAdn9mzC" width="340" height="340" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/desktoppaints-jump-spring-xT0xeGxcmzPAdn9mzC"></a></p>

<!-- > -->

```swift
UIView.animate(withDuration: 1.0, delay: 0.2,
        usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.repeat], animations: {
            self.topView.center.y += 150
            self.bottomView.center.y -= 400
        }, completion: nil)
```

<!-- > -->

![bounce](assets/bounce.gif)

<!-- > -->

- `usingSpringWithDamping`: The amount of damping, reduction, or stiffness applied to the animation as it approaches its final state. The closer to 0, the bouncier it is.
- `initialSpringVelocity`: Controls the initial velocity of the animation.

**Modify these values so you get a better idea how they change the animation**

<!-- > -->

## Animations with Auto Layout

Up to now we have been animating views based on their frames. In reality, most of our views are being set up on screen using Auto Layout. So let's see how we can still make animations work with it.

<!-- > -->

#### The main idea

Views are set up with constraints.

To animate a view we need to:
1. Deactivate the right constraint
2. Update the constraint or create a new one
3. Activate the most recent constraint
4. Tell UIKit to animate the new layout

<!-- > -->

## In Class Activity

Follow [this guide](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/10-Animations/assignments/login.md) to achieve this login animation:

![login](assets/login.gif)

<!-- > -->

## Additional Resources

- [Animations Apple Docs](https://developer.apple.com/documentation/uikit/uiview/1622515-animatewithduration)
- [About CGAffineTransform](https://www.hackingwithswift.com/read/15/4/transform-cgaffinetransform)
- Book: iOS Animations by Tutorials.
- [Another approach to animations with UIKit Dynamics](https://medium.com/@raulriera/uikit-dynamics-in-the-real-world-ef0dfd924260)
- [Quick reference to animations](https://www.hackingwithswift.com/example-code/uikit/how-to-animate-views-using-animatewithduration)
