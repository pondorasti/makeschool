## In Class Activity - Chain of Responsibility

Every UIResponder object has a method called `next()` which returns the next responder in the responder chain (or `nil` if there is no next responder). The next responder of a view is typically its view controller or its superview (if it has no view controller).

A responder object can choose *not* to handle an event simply by forwarding the event message to its *next responder.*

**Activity's objective**

Using the pre-made [TouchResponder starter app](https://github.com/Make-School-Labs/StarterApp-MOB-2.4-L03), add code to pass a double-tap touch event to the view's next responder object (the view controller). While you do this you will be exploring how the CoR patterns works in Swift.

#### Part 1: Tracing Framework Ancestry

1. Download the [TouchResponder starter app](https://github.com/Make-School-Labs/StarterApp-MOB-2.4-L03)

2. Open the `TouchableView.swift` file and __*Jump to Definition*__ `[Ctrl+Cmd+Click]` the `UIView` in the class declaration on line 16

```swift
class TouchableView: UIView {
```

This will open the `UIView` definition/header file in the `UIKit` framework and display the `UIView class's` structural declaration...

```swift
@available(iOS 2.0, *)
open class UIView : UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {
```

Notice how `UIView` extends the `UIResponder` class (and conforms to a long list of protocols).

- `[Ctrl+Cmd+Click]` on `UIResponder` to see how it is constructed:

```swift
  @available(iOS 2.0, *)
  open class UIResponder : NSObject, UIResponderStandardEditActions {

      open var next: UIResponder? { get }
```

Now take a peek at `UIResponder's` properties, especially `next: UIResponder?` variable...    

3. Repeat the same investigative process for the `ViewController` class.

**Answer this question after your investigation:** What does this tell you about the relationship between these two objects with respect to the Responder Chain?


#### Part 2: Handing Off Responsibility to the Next Responder

1. Reopen the `TouchableView.swift` file in the [TouchResponder starter app](https://github.com/Make-School-Labs/StarterApp-MOB-2.4-L03)

The `touchesBegan(_:_:)` function of the `TouchableView` class is currently set up to respond to all touches to its view.

2. Add a conditional statement which will, in the event a double-tap occurs, forward that event to the view's next responder.

Each Touch object captures the number of taps in its `tapCount` property.

**a)** For Double-Tap Events:

If the Touch object's `tapCount == 2`, then:
- Log that conditional state:

```swift
 print("Double Tap Began")
```

- Hand off the responsibility of handling the double-tap event **to next responder's `touchesBegan(_:_:)` function** and *log the identity of the next Responder*.

- Also in the event of a double-tap, log the identify of the view's next.next responder.

**b)** For Single Taps:

- Just log that state in the conditional's `else` block:

```swift
print("Single Tap Began")
```

<!-- Completed touchesBegan(_:_:) function:

 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        // To see the order of events, log this function name
        print(#function)

        let touch = touches.first!

        // handle double-taps
        if touch.tapCount == 2 {

            print("Double Tap Began")

            // 1) handoff to next responder and print identity of next responder
            next?.touchesBegan(touches, with: event)
            print(next as Any)

            // 2) print identity of next.next responder
//            next?.next?.touchesBegan(touches, with: event)
            print(next?.next as Any)

        } else { // handle touches that are not double-taps
              print("Single Tap Began")
        }

        /** location() function -- returns the current location of a UITouch object in the coordinate system of the specified view **/
        print(touch.location(in:self))
        print(touch.location(in:self.window!))
//        print(touch.location(in:nil))
    }
    -->

**c)** Use the Debug View Hierarchy Tool

- Set a couple of breakpoints to capture the double-tap condition, run the app, and tap on the view.

- When Xcode stops at your breakpoint, click on the View Debug Hierarchy icon:

![ViewDebugHierarchyicon](../assets/View_Debug_Hierarcy_icon.png)

- Experiment with sliders to examine their effect.

**Pay very close attention** to the hierarchy of views presented in your Navigation pane. This shows the relationships between the UIResponder objects that can currently participate in the view's Responder Chain (with the exception of the Application and AppDelegate options, which are not shown):

![Responder_chain_objects_in_view_debug_hierarchy](../assets/Responder_chain_objects_in_view_debug_hierarchy.png)


#### Part 3: Class Discussion

**Q** How does this Next Responder approach serve to decouple the sender from the receiver?

**Q:** In what ways could this CoR approach be useful in your own work?
