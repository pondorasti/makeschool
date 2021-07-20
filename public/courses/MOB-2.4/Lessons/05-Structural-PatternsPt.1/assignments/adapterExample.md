
# Adapter - Example

**The Problem**

In the following example: A Hobbit object can only `walk()`, but a Guardian object (__*code not listed*__) must `march()`. What if a Hobbit is promoted to guard the citadel?

Then the Hobbit must somehow be able to `march()` just as a Guardian object does.

<!-- > -->

**The Solution**

Use the Adapter pattern to adapt the Hobbit class to conform to the behaviors required of a Guardian.

<!-- > -->

```swift
import UIKit

// Adaptee
class Hobbit {
    func walk() {
        print("Hobbit is walking a few steps")
    }
}

// Target
protocol GuardianOfTheCitadel {
    func march()
}

// Adapter
extension Hobbit: GuardianOfTheCitadel {
    func march() {
        walk()
        print("Hobbit realizes he is a few steps behind the formation")
        walk()
    }
}

let hobbit = Hobbit()
hobbit.march()

/* This will print:
 Hobbit is walking a few steps
 Hobbit realizes he is a few steps behind the formation
 Hobbit is walking a few steps
 */
```

*[adapted example]( https://medium.com/jeremy-codes/adapter-pattern-in-swift-7332e178f112)*

<!-- > -->

## Add On To This Example

**TODO:** Assume we have another `protocol` for a `Warrior` who has an `attack` function.

How would we adapt a `Hobbit` to be a `Warrior`, where their `attack` function has them walk, swing a sword, then march?
