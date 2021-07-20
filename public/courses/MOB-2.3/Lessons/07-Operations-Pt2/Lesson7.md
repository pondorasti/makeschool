# Operations (Part 2)

<!-- INSTRUCTOR NOTES:
- the Answer to question about maxConcurrentOperationCount is hidden below the question -->

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Initial Exercise                  |
| 0:20        | 0:20     | Overview  I -  How to implement Operation objects              |
| 0:40        | 0:15      | In Class Activity I       |
| 0:55      | 0:10      | BREAK                     |
| 1:05       | 0:25     | Overview  I -  OperationQueues              |
| 1:30        | 0:25      | In Class Activity II      |
| TOTAL       | 1:55      |                           |

## Learning Objectives (5 min)

By the end of this lesson, you should be able to...

1. Identify and describe:
- the difference between Synchronous and Asynchronous Operations
- how to subclass `Operation` to create custom concurrent and non-concurrent operations
- how to use `OperationQueues` to handle the scheduling and execution of `Operations`
- how to add operations to `OperationQueues` and how to manage their behavior

2. Implement basic examples of:
- non-current subclasses of the `Operation` class

## Initial Exercise (15 min)

1. Review solutions to "Assignment 2: Solve the Dining Philosophers Problem" (challenge) from previous class: https://github.com/raywenderlich/swift-algorithm-club/tree/master/DiningPhilosophers

- One or more volunteers present their solutions. Opens a class discussion.

## How to implement Operation objects (TT I) (20 min)

### Synchronous Versus Asynchronous Operations

Before we explore subclassing `Operation` objects, it will help to understand how Apple has defined the behavior of Synchronous and Asynchronous operations...

*Source:* https://developer.apple.com/documentation/foundation/operation </br>

#### Synchronous Operations

Unlike GCD, `Operation` objects run __*synchronously<sup>1</sup> by default.*__

In a synchronous operation:
- The operation object does not create a separate thread on which to run its task.
- When you call the `start()` method of a synchronous operation directly from your code, the operation executes __*immediately*__ in the __*current thread.*__
- By the time the` start()` method of such an object returns control to the caller, the task itself is complete.

**TIP:** If you always plan to use queues to execute your operations, it is simpler to define them as synchronous.

#### Asynchronous Operations
If you execute operations manually, though, you might want to define your operation objects as asynchronous.<sup>1</sup>

Defining asynchronous operations is useful in cases where you want to ensure that a manually executed operation does not block the calling thread.

An asynchronous operation object:
- Is responsible for scheduling its task on a __*separate*__ thread. The operation could do that by: </br>
&nbsp;&nbsp;&nbsp; - starting a new thread directly </br>
&nbsp;&nbsp;&nbsp; - calling an asynchronous method </br>
&nbsp;&nbsp;&nbsp; - submitting a block to a dispatch queue for execution </br>
- When you call the `start()` method of an asynchronous operation, that method may return before the corresponding task is completed. It does not actually matter if the operation is ongoing when control returns to the caller, only that it could be ongoing.

Defining an asynchronous operation requires more work because you have to monitor the ongoing state of your task and report changes in that state using KVO notifications.

**TIP:** When you add an operation to an operation queue, the queue ignores the value of the `isAsynchronous` property and __*always*__ calls the `start()` method from a separate thread.
- thus, if you always run operations by adding them to an operation queue, there is no reason to make them asynchronous.

> <sup>1</sup> REMEMBER &mdash; Asynchronous and Concurrent do *not* mean the same thing: </br></br>
Serial versus Concurrent is about the __*number of threads*__ available to a queue: </br>
> - __*Serial queues*__ only have a __*single thread*__ associated with them and thus *only allow a single task* to be executed at any given time.
> - __*Concurrent queues*__ can utilize as many threads as the system has available resources for. On a concurrent queue, threads will be created and released as needed. </br>
>
>Synchronous or Asynchronous is about __*waiting*__ &mdash; whether or not the queue on which you run your task has to __*wait*__ for your task to complete before it executes other tasks.
> - you can submit asynchronous (or synchronous) tasks to either a serial queue or a concurrent queue.


### Subclassing the Operation class
The `BlockOperation` class we explored in the previous lesson is handy for simple tasks.  

But for more complex tasks, or to create reusable components, you will need to create your own custom subclasses of the `Operation` class where each subclass instance represents a specific task.

And though the `Operation` class &mdash; and its related pre-defined subclasses (`BlockOperation` and `NSInvocationOperation`) &mdash; provide the *basic* logic to track the execution state of your operation and other Operations benefits, they were designed to be subclassed before they can do any useful work for you.

How you create your subclass depends on whether your operation is designed to execute concurrently or non-concurrently.<sup>1</sup>

**Non-Concurrent Operations** </br>
Non-Concurrent operations perform all of their work on the __*same thread*__, and when the `main()` method returns the operation is moved into the `Finished` state. The queue is then notified of this operation's state and removes the operation from its active pool of operations, freeing resources for the next operation to be executed.

For non-concurrent<sup>1</sup> operations, you typically override only one method:

```Swift  
  func main()
```
<!-- &nbsp;&nbsp;&nbsp;&nbsp; `main()` -->

The `main()` method performs the receiver’s __*non-concurrent*__ task.

The default implementation of the `main()` method does nothing; You must override `main()` and place in it the code needed to perform the intended task.

*Source:* </br>
https://developer.apple.com/documentation/foundation/operation/1407732-main

__*Things to note*__
- In your implementation, do not invoke `super`.
- Of course, you should also define a custom initialization method to make it easier to create instances of your custom class.
- Optionally, if you do define custom getter and setter methods, you must make sure those methods can be called safely from multiple threads.

__*Example: Non-Concurrent Operation*__

This simple (nonfunctioning) example illustrates subclassing the `Operation` class to create non-concurrent operation objects, including the requirement to override its `main()` method:

```Swift  
  class FilterOperation: Operation {
      let flatigram: Flatigram
      let filter: String

      init(flatigram: Flatigram, filter: String) {
          self.flatigram = flatigram
          self.filter = filter
      }

      override func main() {
          if let filteredImage = self.flatigram.image?.filter(with: filter) {
              self.flatigram.image = filteredImage
          }
      }
  }
```

*Source:* </br>
https://learn.co/lessons/swift-multithreading-lab

**Concurrent Operations** </br>
Concurrent operations can perform some work on a different thread. Thus, returning from the `main()` method can not be used to move the operation into its `Finished` state.

Because of this, when you create a concurrent operation, you are responsible for moving the operation between the `Ready`, `Executing` and `Finished` states.

If you are creating a concurrent operation, you need to override the following methods and properties at a minimum:
- `start()`
- `isAsynchronous`
- `isExecuting`
- `isFinished`

__*The `start()` method*__ <sup>2</sup> </br>
In a concurrent operation, your `start()` method:
- is responsible for starting the operation in an asynchronous manner. Whether you spawn a thread or call an asynchronous function, you do it from this method.

__*The `isAsynchronous` property*__ </br>
The `isAsynchronous` property of the `Operation` class tells you whether an operation runs synchronously or asynchronously with respect to the thread in which its `start()` method was called.

By default, this method returns `false`, which means the operation runs synchronously in the calling thread.

__*Note:*__ If you are implementing a concurrent operation, you are not required to override the `main()` method but may do so if you plan to call it from your custom `start() `method.

> <sup>2</sup> The `start()` method has additional responsibilities in a concurrent operation, which we will explore further in upcoming lessons. Same for the `isAsynchronous` property. For further details of both, also see the Apple source referenced below:

*Source:* </br>
https://developer.apple.com/documentation/foundation/operation

__*Example: Concurrent Operation*__

The (elided, non-functioning) code below illustrates the most basic steps needed to subclass `Operation` to create concurrent operation objects:

```Swift  
  class MyConcurrentOperation: Operation {
  override var isAsynchronous: Bool { return true }
  override var isExecuting: Bool { return state == .executing }
  override var isFinished: Bool { return state == .finished }

  ...

  override func start() {
    if self.isCancelled {
      state = .finished
    } else {
      state = .ready
      main()
    }
  }
  override func main() {
    if self.isCancelled {
      state = .finished
    } else {
      state = .executing
    }
  }
 }
```

## In Class Activity I (15 min)

### Part 1 - In Pairs (5 min)

Discuss, draw, and brainstorm this topic:
- What scenarios can you think of in which your code might benefit from submitting tasks to queues as objects (instead of closures)?

Volunteers to share with class.

### Part 2- Individually (10 min)

The code below is an incomplete effort to create a Non-Concurrent `Operation` subclass.

When successfully working, its output should be:

```Swift  
  MyOp Started
  MyOp Completed
```

**TODO**
1. Copy the code into a new playground.
2. Implement a `main()` method which simply prints "MyOp Started
3. In its `completionBlock`, print "MyOp Completed"

```Swift
  import UIKit
  import PlaygroundSupport

  PlaygroundPage.current.needsIndefiniteExecution = true

  // Queue
  let operationQueue = OperationQueue()
  operationQueue.qualityOfService = .userInitiated

  class MyOperation: Operation {

      //TODO: Create main()
  }

  let myOp = MyOperation()

  myOp.completionBlock = {
      //TODO: print "MyOp Completed"
  }

  operationQueue.addOperation(myOp)
```

## OperationQueues (20 min)
The easiest way to execute operations is to use an **operation queue,** which is particularly __*powerful*__ because it lets you control QoS levels, how many operations can execute simultaneously, and more...

Operation queues are instances of the `OperationQueue` class, and their tasks are encapsulated in concrete instances of the `Operation` class.

```Swift
  class OperationQueue : NSObject
 ```
You use instances of the `OperationQueue` class to (1) manage the scheduling and execution of an Operation and (2) to set the maximum number of operations that can run simultaneously on a given queue.

### How they work
Just as you'd submit a closure of work to a `DispatchQueue` for GCD, instances of the `Operation` class can be submitted to an `OperationQueue` for execution.

This means you can execute tasks concurrently, just like with GCD and `DispatchQueues`, but in an __*object-oriented*__ fashion.

Though both `OperationQueues` and `DispatchQueues` are high-level abstractions of the queue model built on top of GCD (a low-level C API), `OperationQueues` behave differently from `DispatchQueues` in distinct ways. Most notably:

1. **No Serial Queues** &mdash; By default, all `OperationQueues` operate concurrently; you *cannot* change their type to *serial* (thought there is a way to execute tasks in operation queues sequentially: by using dependencies<sup>2</sup> between operations).

3. **Developer Control** &mdash; As a developer, you can:
- set the `maxConcurrentOperationCount` for an operation queue
- `cancel` an operation, even if the operation is currently executing
- pause (suspend) an operation queue
- set the priority of an operation by setting the `queuePriority` property
- set the `qualityOfService` property to control how much of the system resources will be given to your operation
- specify an existing `DispatchQueue` as the `underlyingQueue`

2. **Determining Execution Order** &mdash; Unlike GCD and `DispatchQueues`, `OperationQueues` do *not* strictly conform to First-In-First-Out execution order.

&nbsp;&nbsp;&nbsp;&nbsp; An `OperationQueue` acts like a __*prioritized FIFO queue:*__
- Operations within an operation queue are organized according to their __*readiness, priority level,*__ and __*dependencies,*__<sup>2</sup> and are executed based on those criteria.
- You can set priority on individual operations. Those with the highest priority get pushed ahead, but not necessarily to the front of the queue &mdash; the iOS system determines when to actually execute an operation.
- Operations with the *same priority* get executed in the order they were added to the queue &mdash; unless an operation has dependencies,<sup>2</sup> which allow you to define that some operations will only be executed after the completion of the other operations they are dependent on.

> <sup>2</sup> *We'll cover Operation Dependencies in the next class.*

#### Readiness
If all of the queued operations have the same `queuePriority` and are ready to execute when they are put in the queue &mdash; that is, their `isReady` property returns `true` &mdash; they are executed in the order in which they were submitted to the queue. Otherwise, the operation queue *always* executes the one with the highest priority relative to the other ready operations.

> __*Important Note:*__ *Because changes in the readiness of an operation can change the resulting execution order, your code should never rely on these "queue semantics" to ensure a specific execution order; ultimately, the system will decide on execution order. Implementing dependent operations<sup>2</sup> is the most reliable way to guarantee execution order.*

#### Lifecycle Notes
After being added to an operation queue, an operation remains in its queue until it reports that it is finished with its task. You can’t directly remove an operation from a queue after it has been added.

Operation queues retain operations until they're finished, and queues themselves are retained until all operations are finished.

> Note that suspending an operation queue with operations that aren't finished can result in a memory leak.

#### Thread Safety
Operation queues use the `Dispatch` framework to initiate the execution of their operations. As a result, operations are always executed on a separate thread, regardless of whether they are designated as synchronous or asynchronous.

This means Operation queues are inherently thread safe: You can safely access a single `OperationQueue` object from multiple threads without creating additional locks to synchronize access to it.

### Creating OperationQueues
Creating an operation queue is simple; you declare it in your application as you would any other variable.

Here are three different examples of syntax used to create custom operation queues:

1. Formal, long-form approach:

```Swift
  let operationQueue: OperationQueue = OperationQueue()
```

2. Specifying a name and QoS level:

```Swift
  let myDefaultQueue = OperationQueue()
  myDefaultQueue.name = "My Default QoS Queue"
  myDefaultQueue.qualityOfService = .default
```

3. Creating a `private` queue:

```Swift
  private let myQueue = OperationQueue()
```

#### Things to note
- Your application is responsible for creating and maintaining any operation queues it intends to use.
- An application can have any number of queues, but there are practical limits to how many operations may be executing at a given point in time. Operation queues work with the system to restrict the number of concurrent operations to a value that is appropriate for the available cores and system load. Therefore, *creating additional queues does not mean that you can execute additional operations.*

### The main queue as OperationQueue
In addition to any custom `OperationQueues` you create, you can also access the `main queue` as an `OperationQueue`.

```Swift  
  Declaration
  class var main: OperationQueue { get }
```
*Source:* </br>
https://developer.apple.com/documentation/foundation/operationqueue/1409193-main

Syntax to access:

```Swift  
  let mainQueue = OperationQueue.main
```

This returns the default operation queue bound to the `main thread`.

This does not create a new `main queue` nor a new `main thread` &mdash; but it does allow you similar developer control advantages with the `main queue` as you would have with any other `OperationQueue` (some limitations do apply).

### Adding Operations to OperationQueues
Operation Queues allows you to add work in three separate ways:
1. Pass an Operation
2. Pass a closure
3. Pass an array of Operations

All three use the `addOperation(_:)` function from the `OperationQueue` class, which takes two forms:

```Swift
  func addOperation(_ op: Operation)
```
```Swift  
  func addOperation(_ block: @escaping () -> Void)
```

#### Examples:

Each example illustrates one of the three ways to add a task mentioned above:

1. Adding an `Operation` to an `OperationQueue`:

```Swift  
  // An instance of some Operation subclass
  let myBlockOperation = BlockOperation {
      // perform task here
  }

  someCustomQueue.addOperation(myBlockOperation)
```

2. Adding a task to an `OperationQueue` as a **code block**:

```Swift  
  myQueue.addOperation {
      // some code block/task
  }
```

3. Adding multiple `Operations` to an `OperationQueue`:

```Swift  
  let operationsArray = [Operation]()
  // Fill array with Operations

  myQueue.addOperation(operationsArray)  
```

### Managing OperationQueues

An operation queue executes operations that are ready, according to quality of service levels, and with respect to any dependencies<sup>2</sup>.

After being added to a queue, an operation remains in that queue until it is explicitly canceled or finishes executing its task.

Once you’ve added an `Operation` to an `OperationQueue`, you can't add that *same* `Operation` to any other `OperationQueue`. (But, because they are objects, you *can* execute multiple new instances of that same `Operation` subclass on other queues, as often as needed.)

But there are a number of ways you can influence how an operation queue executes operations.

In addition to those listed below, you can also:

- pause the queue
- choose which `DispatchQueue` to set as the `underlyingQueue` property

#### Waiting for completion: Two Ways

1. `waitUntilAllOperationsAreFinished` &mdash; Blocks the current thread until all of the receiver’s queued and executing operations finish executing.

If you find yourself needing this method, it is best to set up a private serial `DispatchQueue` in which you can safely call this blocking method.

> **TIP:** You must never call this method on the main UI thread.

2. `func addOperations([Operation], waitUntilFinished: Bool)` &mdash; Adds the specified operations to the queue.

Use this method if you don't need to wait for all operations to complete, but just a set (an array) of operations.

#### Quality of service

An `OperationQueue` behaves like a `DispatchGroup` in that you can add operations with different quality of service values and they'll run according to the corresponding priority.

The __**default*__ QoS level of an operation queue is `.background`.

If you set the `qualityOfService` property on the operation queue, keep in mind that it might be overridden by the QoS that you’ve set on individual operations managed by the queue.

#### Cancelling Operations

You do this by calling the `cancel()` method of the `operation` object itself or by calling the `cancelAllOperations()` method of the `OperationQueue` class.

- `.cancel()` &mdash; Advises the operation object that it should stop executing its task.
- `.cancelAllOperations()` &mdash; Cancels all queued and executing operations.

*See this source for more details:* </br>
https://www.hackingwithswift.com/example-code/system/how-to-use-multithreaded-operations-with-operationqueue

#### Maximum number of operations

By default, the dispatch queue will run as many jobs as your device is capable of handling at once.

But you can limit that number by setting the `maxConcurrentOperationCount` property on the dispatch queue.

The `maxConcurrentOperationCount` property sets the maximum number of queued operations that can execute at the same time.

```Swift
  var maxConcurrentOperationCount: Int { get set }
 ```

*Source:* </br>
https://developer.apple.com/documentation/foundation/operationqueue/1414982-maxconcurrentoperationcount

##### Example:

After setting this property to 2, you will only have at most two operations running at any given time in the queue.

```Swift  
  let queue = OperationQueue()
  queue.maxConcurrentOperationCount = 2

  let operation1 = BlockOperation(block: {
    ...
  })
  operation1.qualityOfService = .userInitiated

  let operation2 = BlockOperation(block: {
    ...
  })

  operation1.completionBlock = {
      ...
  }
  operation2.completionBlock = {
      ...
  }

  operation2.addDependency(operation1)

  queue.addOperation(operation1)
  queue.addOperation(operation2)
```

*Source:* </br>
https://medium.com/shakuro/nsoperation-and-nsoperationqueue-to-improve-concurrency-in-ios-e31ee79c98ef


**Q:**
The snippet below sets the `maxConcurrentOperationCount` property to 1.

- What would happen if you set the `maxConcurrentOperationCount` to 1?

```Swift
  let operationQueue: OperationQueue = OperationQueue()
  operationQueue.maxConcurrentOperationCount = 1
 ```

<!-- ANSWER:
If you set the maxConcurrentOperationCount to 1, then you’ve effectively created a serial queue.

After setting this property, you will only have at most one operation running at a time in the queue, which is more or less the definition of a serial queue, where one task only follows after another is complete. -->

## In Class Activity II (25 min)

Finding the answers to all the questions [in here](https://docs.google.com/document/d/1wpsHJTMJnTL_Qhcb5y3fFAfEfARt3YrtlWRPQB9JNzs/edit?usp=sharing) using this repo.

## After Class

1. Research:
- [`start()` - Apple docs](https://developer.apple.com/documentation/foundation/operation/1416837-start)
- [Dependencies - Apple docs](https://developer.apple.com/documentation/foundation/operation/1416668-dependencies)
- Cancelling (operations)
- Asynchronous Operations
- When and why would you use `OperationQueue.main` instead of `DispatchQueue.main`?
- `defaultMaxConcurrentOperationCount`
- `current` (queue) property
- `underlyingQueue` property (how to set it; what are implications and risks?)
- The "Maintaining Operation Object States" and the "Responding to the Cancel Command" sections in:
https://developer.apple.com/documentation/foundation/operation
- The "KVO-Compliant Properties" section in:
https://developer.apple.com/documentation/foundation/operationqueue


## Wrap Up (5 min)

- Continue working on your Course Project
- Complete reading
- Complete challenges

## Additional Resources

1. [Operation - Apple docs](https://developer.apple.com/documentation/foundation/operation)
2. [OperationQueue - Apple docs](https://developer.apple.com/documentation/foundation/operationqueue)
3. [maxConcurrentOperationCount - Apple docs](https://developer.apple.com/documentation/foundation/operationqueue/1414982-maxconcurrentoperationcount)
4. [main - Apple docs](https://developer.apple.com/documentation/foundation/operationqueue/1409193-main)
5. [Operation and OperationQueue - A Ray Wenderlich tutorial](https://www.raywenderlich.com/5293-operation-and-operationqueue-tutorial-in-swift)
6. [Basics of Operations and Operation Queues in iOS - an article](https://blog.infullmobile.com/basics-of-operations-and-operation-queues-in-ios-a8e7b02950c3)
