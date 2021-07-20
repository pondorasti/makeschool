import UIKit
import PlaygroundSupport

/*: Tell the playground to continue running, even after it thinks execution has ended.
 You need to do this when working with background tasks. */

PlaygroundPage.current.needsIndefiniteExecution = true

let group = DispatchGroup()
let myGlobalQueue = DispatchQueue.global(qos: .userInitiated)

myGlobalQueue.async(group: group) {
    print("Start task 1")
    Thread.sleep(until: Date().addingTimeInterval(10))
    print("End task 1")
}

myGlobalQueue.async(group: group) {
    print("Start task 2")
    Thread.sleep(until: Date().addingTimeInterval(2))
    print("End task 2")
}

if group.wait(timeout: .now() + 5) == .timedOut {
    print("Hey, I've been waiting too long!")
} else {
    print("All tasks completed")
}

/*: Instruct Xcode that the playground page has finished execution. */
PlaygroundPage.current.finishExecution()
