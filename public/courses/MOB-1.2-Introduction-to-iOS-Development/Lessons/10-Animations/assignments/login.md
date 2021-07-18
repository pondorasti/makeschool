# An animated login

#### Downloading the starter code

Download and open [this project](https://github.com/amelinagzz/animations-starter) to explore the contents. If you run the app you'll see a login screen.

We want to animate it as soon as the user gets to this screen.

#### Following the main idea

To animate a view we need to:
1. Deactivate the right constraint
2. Update the constraint or create a new one
3. Activate the most recent constraint
4. Tell UIKit to animate the new layout

In order to manipulate constraints, we should store them in variables, this is something we haven't done before. But we need it now to have a reference to all the constraints we need to change.

We want the title of the app to appear from within the box image. This is an upwards movement.

We can only modify the constant property of a constraint. So we will do a new constraint instead.

Add the following constraint declarations as global variables to the class.

```swift
var titleConstraintStart: NSLayoutConstraint!
var titleConstraintEnd: NSLayoutConstraint!
```

Now find the code portion that sets the constraint of the title. We are doing this to store the constraint for `centerYAnchor` in the variable `titleConstraintEnd` we declared before. This will be the final position after the animation completes.

```swift
titleConstraintEnd = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60)
```

But we will not activate the constraint just yet. Instead, we will create a new constraint for the starting position, store it in the variable `titleConstraintStart` and activate that one.

```swift
titleConstraintStart = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor, constant: 5)
titleConstraintStart.isActive = true
```

Run the app and see how the starting position of the label is inside the box. Let's animate that change now.

In the life cycle of a view controller, the moment we get to see the screen can be represented by the method `viewDidAppear`. Here is where we will trigger the animation.

Go to that method, deactivate the starting constraint and activate the final constraint.

```swift
titleConstraintStart.isActive = false
titleConstraintEnd.isActive = true
```

Now we will use the animation method we learned before but instead of making changed to frames directly, we well just tell UIKit to update the layout of the view. This will automatically updates frames based on the new or modified constraints.

```swift
UIView.animate(withDuration: 1.0) {
    self.view.layoutIfNeeded()
}
```

Run the app and se if we are getting close.

You should see the movement now but the text is always the same size so it doesn't look like it's growing.

To achieve that look we are going to use a class called `CGAffineTransform`. We will say that the scale of the label will start at 0 and then animate to 1.

Add the following line after setting the constraints for the label:

```swift
appNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
```

And then this one inside the animation closure.

```swift
self.appNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
```

**On your own, try doing the same for the alpha value of the label. Make it start at 0 and animate to 1.**

## Challenge 1

Animate the button **after the title label sets into place**.

## Challenge 2

Add a **spring effect** to the title when it moves.

## Challenge 3

Add a spring effect to the login button **when tapped**.

The end result of all the above should be this:

![login](assets/login.gif)

## Additional notes

When you get the chance, take a moment to see how the project is using a custom font and how we need to add the font file to the project (also including it in the .plist file)

Also, see how there is a custom class for the textfields to make them look different than the default style.
