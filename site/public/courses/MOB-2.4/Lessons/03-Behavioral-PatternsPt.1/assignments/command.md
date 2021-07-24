## Command Pattern - Activity

**TODO:** Below is a simple example of the Command pattern which models a real-world television remote control device. **Complete the implementation so that sending commands to turn the TV on or off work successfully.**

```swift
import UIKit

// Receiver
class TelevisionControl {
   func turnOn() {
       print(“Turning On TV”)
   }
   func turnOff() {
     print(“Turning Off TV”)
   }
}

// Command
protocol TelevisionCommand {
   func execute()
}

class TurnOnTelevision: TelevisionCommand {

  // TODO: Complete implementation...

}

class TurnOffTelevision: TelevisionCommand {
   public let televisionControl: TelevisionControl

   public init(_ televisionControl: TelevisionControl) {
       self.televisionControl = televisionControl
   }
   public func execute() {
       self.televisionControl.turnOff()
   }
}

// Invoker
class RemoteControl {

   // TODO: add missing properties

   public let televisionControl: TelevisionControl

   // TODO: create Init()

   func execute(_ command: TelevisionCommand) {

      // TODO: complete execute() function
   }

}

let televisionControl = TelevisionControl()
let remoteControl = RemoteControl(televisionControl: televisionControl)
let turnOffTelevision = TurnOffTelevision(televisionControl)
remoteControl.execute(turnOffTelevision)
```

<!-- Completed classes for Activity II:
// Invoker
class RemoteControl {

   // Complete Invoker implementation...

   public let televisionControl: TelevisionControl

   public init (televisionControl: TelevisionControl) {
    self.televisionControl = televisionControl
   }

   func execute(_ command: TelevisionCommand) {
       command.execute()
   }

}

class TurnOnTelevision: TelevisionCommand {
   public let televisionControl: TelevisionControl

   public init(_ televisionControl: TelevisionControl) {
       self.televisionControl = televisionControl
   }
   func execute() {
       self.televisionControl.turnOn()
   }
}
 -->
