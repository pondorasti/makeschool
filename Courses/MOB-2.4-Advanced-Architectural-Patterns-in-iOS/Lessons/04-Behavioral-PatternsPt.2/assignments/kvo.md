## In Class Activity

**TODO:** Complete and run the partially-implemented playground code below following the steps from Apple's *Using Key-Value Observing in Swift* document listed above.

__*Implementation Notes:*__

1. Your Subject class only needs to have:
  - A variable called `counter`, initialized to `0`, and modified with

```swift
@objc dynamic
```

2. Your Observer class needs this specific `init()` function:

```swift
  init(subject:Subject) {
        super.init()
        subject.addObserver(self, forKeyPath: "counter",
                            options: NSKeyValueObservingOptions.new, context: nil)
    }
```

**Partially-Implemented Playground Code**

```swift
import Foundation;

/* Step 1: Create a Subject class and Annotate a Property for Key-Value Observing */

//TODO: Create Subject class...


/* Step 2: Define an Observer class */
class Observer : NSObject {

    //TODO: Add init()

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        print("Notification: \(String(describing: keyPath)) = \(String(describing: change?[NSKeyValueChangeKey.newKey]!))");

    }
}
/* Step 3: Associate the Observer with the Property to Observe */
let subject =
let observer =

/* Step 4: Respond to a Property Change */
subject.counter += 11
subject.counter = 99

/* RESULTS - Should print:
Notification: Optional("counter") = Optional(11)
Notification: Optional("counter") = Optional(99)
*/

```
<!-- Instructor Note: Solution to Activity  is below Additional Resources
-->
