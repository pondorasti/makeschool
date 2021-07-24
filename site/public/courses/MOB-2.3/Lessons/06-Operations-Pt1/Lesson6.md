# Operations (Part 1)

<!-- INSTRUCTOR NOTES:
1) Activity 1:
- Solution to Part 2 is below the Exercise -->

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:25      | Initial Exercise                |
| 0:30        | 0:20      | Intro to Operations (TT I)                  |
| 0:50        | 0:10      |   BREAK  |
| 1:00        | 0:30      |  In Class Activity I        |
| 1:30       | 0:20      | Operation Lifecyle Events (TT II)               |
| TOTAL       | 1:50     |                           |

## Why you should know this

From the start of this course, we've called out that Grand Central Dispatch (GCD) and Operations are the two built-in APIs from Apple that you use in iOS to manage concurrent tasks (as opposed to working with threads directly).

We have also mentioned that...

- Both technologies are designed to encapsulate units of work and dispatch them for execution.
- Operations are build on top of GCD.
- Apple advises developers to use the highest level of abstraction that is available (which is Operations).
- Most developers implement a combination of GCD and Operations, depending on which suits their specific requirements.

But Operations are not without their own challenges and pitfalls.

As a developer, you need to know:

- The benefits Operations offer &mdash; as well as their challenges and pitfalls.
- The differences between GCD and Operations.
- Under which circumstances might Operations be a better solution than GCD.

## Learning Objectives (5 min)

1. Identify and describe:
 - The **benefits** of using Swift Operations for concurrency
 - The `Operation` class and its two pre-defined subclasses: `NSInvocationOperation` and `BlockOperation`
 - Block Operations
 - Operation Lifecycle Events
2. Implement:
- basic `BlockOperation` examples

## Initial Exercise (25 min)

### Part 1:
Review solutions to **JankyTable app** from Lesson 4...

- One or more volunteers present their solutions. Opens a class discussion.

### Part 2: [Optional]
Review solutions to *Assignment 2: Solve the Dining Philosophers Problem (challenge)* from previous class:
https://github.com/raywenderlich/swift-algorithm-club/tree/master/DiningPhilosophers

- One or more volunteers present their solutions. Opens a class discussion.

## Intro to Operations (20 min)

### What are they?
What if &mdash; instead of sending simple, individual tasks for execution on a queue &mdash; you could send a more complex and *reusable* "package"?

**The `Operation` Class** </br>
`Operation` (formerly called `NSOperation`) is an __*abstract*__ class that allows you to encapsulate (wrap) a unit of work into such a package that you can submit for execution at some time in the future.

Subclasses of `Operation` can represent the code *and* data associated with a single task.

```Swift  
  class Operation : NSObject
```

**Key Attributes** </br>
- An Operation describes a single unit of work
- A higher level of abstraction over GCD
- Object-oriented (vs functions/closures in GCD)
- Execute concurrently &mdash; but can be serial by using dependencies
- Offer more developer control (than GCD)

### Why use them?
Instead of sending a task as a closure or function (as in GCD), operations allow you to create and submit tasks as pre-defined, reusable objects &mdash; objects in which you can implement helper methods, dynamically pass input parameters to set up the task, and much more...

In addition, the `Operation` class offers a number of compelling benefits over GCD:

**Reusability** </br>
Instances of concrete `Operation` subclasses are "once and done" tasks. This means that once an `Operation` object is added to an `OperationQueue`, the same object cannot be added to any other `OperationQueue`; the specific task represented by that particular object cannot be executed twice.

But, because an instance of `Operation` is an actual Swift object representing a unit of work, you can easily submit that unit of work multiple times by creating and sending new objects of that same `Operation` subclass, if needed.

**Dependencies** </br>
Dependencies enables developers to execute tasks in a specific order.

By default, an operation object with dependencies is not considered ready until all of its dependent operation objects have finished executing. Once the last dependent operation finishes, the operation object becomes ready and able to execute.

**KVO-Compliant** </br>
`Operation` and `OperationQueue` classes have a number of properties that can be observed using KVO (Key Value Observing).

This allows you to monitor the *state* <sup>1</sup> of an operation or operation queue.

**Developer Control** </br>
Using GCD, once you dispatch a task, you no longer have control or insight into the execution of that task.

The `Operation` and `OperationQueue` classes are more flexible in that respect, giving the developer control over the operation's life cycle:

- **Max Number of Operations** &mdash; For an `OperationQueue`, you can specify the __*maximum number of queued operations*__ that can run simultaneously. This makes it easy to (a) control how many operations run at the same time or (b) to create a serial operation queue.

- **Execution Priority Levels** &mdash; For subclasses of `Operation`, you can configure the __*execution priority*__ level of an operation in an operation queue. <sup>1</sup>

- **Pause, Resume, Cancel** &mdash; `Operations` can also be __*paused, resumed, and cancelled.*__

<sup>1</sup> *Details on operation state, KVO properties, and priority levels coming up later...*

### How do Operations work?

#### Creating Operations
Because the `Operation` class is an abstract class, you do not use it directly. Instead, you subclass `Operation` or use one of the system-defined subclasses (`NSInvocationOperation` or `BlockOperation`) to perform the actual task.

- `NSBlockOperation` &mdash; Use this class to initiate operation with one or more blocks. The operation itself can contain more than one block and the operation will be considered *finished* when all blocks have completed execution.
- `NSInvocationOperation` &mdash; Use this class to initiate an operation that consists of invoking a selector on a specified object.

#### Executing Operations
There are two ways to execute operations:

1) **Operation Queues** &mdash; Typically, you execute operations by submitting them to an operation queue &mdash; an instance of the `OperationQueue` class &mdash; to be processed based on the priority of each operation submitted.

- An operation queue executes its operations either __*directly*__ &mdash; by running them on secondary threads &mdash; or __*indirectly*__ using the `libdispatch` library (aka, GCD). </br></br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![Operation-Queue](assets/Operation-Queue.png) </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Diagram showing an OperationQueue with three operations enqueued.* </br>
</br>

> &nbsp;&nbsp;&nbsp; *More on OperationQueues in later lessons...*  

</br>

2. **The start() Method** &mdash; You can also choose *not* to use an `OperationQueue` and execute an operation yourself by calling its `start()` method directly from your code.

- Because starting an operation that is not in the ready state triggers an exception, executing operations manually puts additional burden on your code to handle state changes if you choose to call an operation's `start()` method directly.

> &nbsp;&nbsp;&nbsp; *Note that later we'll see that the `isReady` property reports on the operation’s readiness state.* </br>

**Some things to note**

1. An `Operation` object is a "single-shot object" &mdash; that is, it executes its task once and cannot be used to execute it again. (Though new objects of the same class can be instantiated and submitted for execution.)
2. Unlike GCD, operations run __*synchronously*__ by default &mdash; that is, they perform their task in the thread that calls their `start()` method. (You can get them to run asynchronously, but this requires much more work.)
3. Despite being abstract, the base implementation of `Operation` includes significant logic to coordinate the safe execution of your task.
- This allows you to focus on the actual implementation of your task, rather than on the glue code needed to ensure it works correctly with other system objects.

### BlockOperation
Before implementing your own custom subclasses of the `Operation` class, let's examine the behavior of one of the two built-in subclasses of `Operation` provided by Apple: `BlockOperation`

```Swift  
  class BlockOperation : Operation
```

`BlockOperation` can be thought of as a *bridge* between GCD `DispatchQueues` and `Operations` because:
- it manages the __*concurrent*__ execution of one or more closures on the default global queue.
- as an actual `Operation` subclass, it lets you take advantage of all the other features of an operation: cancelling a task, reporting task state, specifying dependences between tasks, using KVO notifications, etc.

If you simply need to execute a small bit of code or to call a method &mdash; if you find that you have a need for a simpler, GCD-like closure &mdash; you can use `BlockOperation` (or `NSInvocationOperation`) instead of subclassing `Operation`.

In addition, a `BlockOperation` object can be used to execute several blocks at once without having to create separate operation objects for each. When executing more than one block, the operation itself is considered finished only when all blocks have finished executing.

In this way, a `BlockOperation` can also behave like a GCD `DispatchGroup`.

> Note that Block operations __*execute concurrently*__. To run them serially, you must submit them to a private dispatch queue or set up dependencies instead.

**Simple Example**

Here is an extremely simplified example of how to create and submit an instance of an `Operation` subclass &mdash; in this class, an instance of `BlockOperation` &mdash; to an `OperationQueue` for execution:

At 1) &mdash; an instance of `BlockOperation` called `myBlockOperation` is created.

At 2) &mdash; `myBlockOperation` is added to an `OperationQueue` for execution by the queue.

```Swift  
  // An instance of an Operation subclass
  let myBlockOperation = BlockOperation { // 1) create BlockOperation
      // perform task here
  }

  queue.addOperation(myBlockOperation) // 2) add myBlockOperation to a queue
```

> Not shown here: (1) Creation of the OperationQueue (2) execution details.


## In Class Activity I (30 min)

### Part 1 - BlockOperation started by an OperationQueue

Here is a simple example of a `BlockOperation` that:
- is made up of multiple code blocks
- is started by the OperationQueue

Let's look at what is going on here...

- At 1), we create a `printerOperation` as our `BlockOperation` object.
- At 2), then we add blocks of code to the `printerOperation` that will be part of the operation.
- At 3), after adding all of blocks, we set a `completionBlock` on the operation, which will be executed after the operation finishes.
- At 4) we create an `OperationQueue` object that will call `start()` on our operation object
- ...and at 5) we add our `printerOperation` object to the queue

```Swift  
  import Foundation

  let printerOperation = BlockOperation() // 1) create printerOperation as BlockOperation

  // 2) add code blocks to the operation
  printerOperation.addExecutionBlock { print("I") }
  printerOperation.addExecutionBlock { print("am") }
  printerOperation.addExecutionBlock { print("printing") }
  printerOperation.addExecutionBlock { print("block") }
  printerOperation.addExecutionBlock { print("operation") }

  printerOperation.completionBlock = { // 3) set completion block
      print("I'm done printing")
  }

  let operationQueue = OperationQueue() // 4) Create an OperationQueue
  operationQueue.addOperation(printerOperation) // 5) add operation to queue
```

*Source:* https://blog.infullmobile.com/basics-of-operations-and-operation-queues-in-ios-a8e7b02950c3


**TODO:** Run the code as a playground a few times and observe results...

**Q:** What did you notice about the order in which the submitted blocks execute? </br>
**Q:** How about the completionBlock's execution order?

### Part 2 - BlockOperation with manual start()

**Required Resources** </br>
1. The [BlockOperation_ex2.playground](https://github.com/Make-School-Courses/MOB-2.3-Concurrency-Parallelism-in-iOS/blob/master/Lessons/06-Operations-Pt1/assets/BlockOperation_ex2.playground.zip) </br> is required. You __*must download*__ this playground as it is dependent on a playground Source file contained within it.

**Assignment Notes** </br>
The following code is incomplete. It is intended to break a phrase into separate words (aka, "tokens"), and send each token as a separate block to a simple `BlockOperation` object called `tokenOperation`.

Like Part 1 above, this `BlockOperation` object will consist of multiple blocks when executed.

Unlike Part 1, the `BlockOperation` object will not be sent to an `OperationQueue` &mdash; you will need to execute the operation's `start()` function manually.

```Swift  
  import Foundation

  let phrase = "Mobile is the greatest!"
  let tokenOperation = BlockOperation()

  for token in phrase.split(separator: " ") {
      tokenOperation.addExecutionBlock {
          print(token)
          sleep(2)
      }
  }

  // TODO: create completionBlock

  duration {
      //TODO: start the operation
  }
```

**TODO:** Complete the code so that it executes without error and, when all operations are done, it prints out the following from its `completionBlock`:

```Swift  
  All operations completed!
```

**Note:** The full output should resemble that which is listed below. Though the order in which the tokens are executed will vary, the `completionBlock` will always print last.

```Swift  
  Mobile
  the
  greatest!
  is
  All operations completed!
```


<!-- SOLUTION TO PART 2: -->
<!-- ```Swift  
  import Foundation

  let phrase = "Mobile is the greatest!"
  let tokenOperation = BlockOperation()

  for token in phrase.split(separator: " ") {
      tokenOperation.addExecutionBlock {
          print(token)
          sleep(2)
      }
  }

  tokenOperation.completionBlock = {
      print("All operations completed!")
  }

  duration {
      tokenOperation.start()
  }
``` -->


## Operation Lifecyle Events (Overview/TT II) (20 min)

An `Operation` object has a *state machine* that represents its lifecycle.

During its lifetime, an `Operation` object can exist in any of the following states depicted here:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![Operation_states](assets/Operation_states.png) </br>

</br>

**Pending** &mdash; When being added to a queue it is in Pending state. In this state, it waits for its conditions.

**Ready** &mdash; As soon as all of them are fulfilled it enters the Ready state and in case there is an open slot it will start executing.

**Finished** &mdash; Having done all its work, it will enter the Finished state and will be removed from the OperationQueue.

**Cancelled** &mdash; In each state (except Finished) an Operation can be cancelled.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Source:* </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; https://medium.com/flawless-app-stories/parallel-programming-with-swift-operations-54cbefaf3cb0


<!-- TODO: need to show example of creating an Operation and adding it to a Queue here: -->


#### Operation state properties

`Operation` objects maintain state information internally to:
- determine when it is safe to execute
- notify external clients of the progression through the operation’s life cycle

The KVO key paths (properties) associated with an operation's state at various stages of its lifecycle are:
- **isReady** &mdash; Lets clients know when an operation is ready to execute. When it has been instantiated and is ready to run, it will transition to the `isReady` state. `true` when the operation is ready to execute now or `false` if there are still unfinished operations on which it is dependent.
- **isExecuting** &mdash; Once the `start()` method is invoked, your operation moves to the `isExecuting` state. This property must report `true` if the operation is actively working on its assigned task or `false` if it is not.
- **isCancelled** &mdash; Informs clients that the cancellation of an operation was requested. If `true`, the app calls the cancel method, then it will transition to the `isCancelled` state, before moving onto the `isFinished` state.
- **isFinished** &mdash; Lets clients know that an operation `finished` its task successfully or was `cancelled` and is exiting. If it was not canceled, then it will move directly from `isExecuting` to `isFinished`. Marking operations as `finished` is critical to keeping queues from backing up with `in-progress` or `cancelled` operations.

These properties give you the ability to know what state your operation is in at any given point in its lifecycle.

Your custom subclasses of the `Operation` class inherit these lifecycle (state) properties and can use them to ensure the correct execution of operations in your code.

**Some things to note**
1. Each of the state key paths (properties) listed above are *read-only* Boolean properties of the `Operation` class.
- You can query them at any point during the execution of the task to see whether or not the task is executing, finished, etc..
2. The `Operation` class handles all of these state transitions for you.
- There are only two you can directly manipulate: </br>
&nbsp;&nbsp;&nbsp; - `isExecuting` state &mdash; Can *influence* this condition by starting the operation. </br>
&nbsp;&nbsp;&nbsp; - `isCancelled` state &mdash; By calling the `cancel()` method on the object.


## After Class
1. Research:
- [Concurrent Versus Non-concurrent Operations - Apple docs](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationObjects/OperationObjects.html#//apple_ref/doc/uid/TP40008091-CH101-SW1)
- `NSInvocationOperation` object
- Passing Data Between Operations
- [KVO-Compliant Properties: (of the `Operation` class) - Apple docs](https://developer.apple.com/documentation/foundation/operation)
- [completionBlock - Apple docs](https://developer.apple.com/documentation/foundation/operation/1408085-completionblock)
- [Tips for Implementing Operation Objects - Apple docs](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationObjects/OperationObjects.html#//apple_ref/doc/uid/TP40008091-CH101-SW35)

2. Assignment:
- Resume your solution to the issues with **JankyTable app** from Lesson 4.
- Resume/start the *Assignment 2: Solve the Dining Philosophers Problem (challenge)* from previous class:
https://github.com/raywenderlich/swift-algorithm-club/tree/master/DiningPhilosophers


## Wrap Up (5 min)

- Complete reading
- Complete challenges

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/1Pyiey3qo-y8ZUUgv4Peh_xFT0FBQcWGKRLg6cjNrSSI/edit?usp=sharing)
2. [Operation - Apple docs](https://developer.apple.com/documentation/foundation/operation)
3. [OperationQueue - Apple docs](https://developer.apple.com/documentation/foundation/operationqueue)
4. [Queue Priority - Apple docs](https://developer.apple.com/documentation/foundation/operation/1411204-queuepriority)
5. [4 Ways To Pass Data Between Operations With Swift - an article](https://marcosantadev.com/4-ways-pass-data-operations-swift/)
6. [BlockOperation - Apple docs](https://developer.apple.com/documentation/foundation/blockoperation)
7. [Blocks Programming Topics - Apple docs](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html#//apple_ref/doc/uid/TP40007502)
x. []()
x. []()
