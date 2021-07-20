import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Queues
let operationQueue = OperationQueue()
operationQueue.qualityOfService = .userInitiated

// Equivalent of GCD main queue
let mainOp = OperationQueue.main

// Using blocks with OperationQueue
// Scheduling one off tasks
// Cant observe individual operations, like with a completion handler for finished

operationQueue.addOperation {
    //Expensive op
    Thread.sleep(forTimeInterval: 3)
    print("Doing 1")
}

operationQueue.addOperation {
    Thread.sleep(forTimeInterval: 2)
    print("Doing 2")
}

operationQueue.operationCount

/*: 
    # BlockOperations
    # Can observe when operation is completed through completion blocks
*/

let downloadQueue = OperationQueue()

let downloadOperation = BlockOperation {
    // perform download here
    Thread.sleep(forTimeInterval: 2)
    print("downloading")
}
downloadOperation.queuePriority = .high

downloadOperation.addExecutionBlock {
    Thread.sleep(forTimeInterval: 2)
    print("parsing JSON")
}

let updateDBOperation = BlockOperation {
    // update DB here
    Thread.sleep(forTimeInterval: 4)
    print("update DB")
}

// update DB after download completes
updateDBOperation.addDependency(downloadOperation)
// add operations to queue to get them started
downloadQueue.addOperations([downloadOperation, updateDBOperation], waitUntilFinished: false)


//: Subclassing Operations

class MyOperation: Operation {
    
    override func main() {
        Thread.sleep(forTimeInterval: 3)
        if !self.isCancelled {
            print("MyOp Started")
            Thread.sleep(forTimeInterval: 5)
            print(Thread.current)
        }else {
            print("My Op Cancelled")
        }
    }
}

let myOp = MyOperation()

myOp.completionBlock = {
    print("MyOp Completed")
}

operationQueue.addOperation(myOp)

//myOp.cancel()

//: [Next Page] @(next)

