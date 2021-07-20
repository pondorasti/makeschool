# Operations (Part 1)

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:20      | Intro to Operations (TT I)                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |

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

1. Identify and describe
1. Define
1. Design
1. Implement

<!-- Define and describe:
- Operation
- Operation Queues
- Benefits and Challenges of using Operations and Operation Queues
- the difference between GCD and Operations and Operation Queues
- when to use GCD vs Operations vs Operation Queues
- Subclassing
- Block Operations -->


## Initial Exercise (15 min)

<!-- - Funny comic
- Prime the Pump (e.g. think and jot, think pair share, etc)
- Productivity Tip/Tool
- Review of current event (e.g. tech news relevant to your track/topic)
- Quiz on homework or topic(s) of past class
- Concept Test -->

## Intro to Operations (20 min)

### What are they?

`Operation` (formerly called `NSOperation`) is a class that allows you to encapsulate (wrap) a unit of work into a package you can execute at some time in the future.

`Operation` is an *abstract* class that represents the code and data associated with a single task.

Key attributes of Operations:
- Higher level of abstraction over GCD
- Object-oriented (vs functions/closures in GCD)
- Execute concurrently &mdash; but can be serial by using dependencies
- An Operation describes a single unit of work
- Offer more developer control (than GCD): </br>
&nbsp;&nbsp;&nbsp;&nbsp; - Can be cancelled  </br>
&nbsp;&nbsp;&nbsp;&nbsp; - Have priorities (veryLow, Low, normal, high, veryHigh)  </br>


### Why use them?
The Operation class offers a number of compelling benefits over GCD:

**Dependencies** &mdash; Dependencies enables developers to execute tasks in a specific order. An operation is ready when every dependency has finished executing.

By default, an operation object with dependencies is not considered ready until all of its dependent operation objects have finished executing. Once the last dependent operation finishes, the operation object becomes ready and able to execute.

**KVO-Compliant** &mdash; `Operation` and `OperationQueue` classes have a number of properties that can be observed using KVO (Key Value Observing).

This allows you to monitor the *state* <sup>1</sup> of an operation or operation queue.

**Pause, Cancel, Resume** &mdash; Operations can be paused, resumed, and cancelled.

Once you dispatch a task using Grand Central Dispatch, you no longer have control or insight into the execution of that task. The NSOperation API is more flexible in that respect, giving the developer control over the operation's life cycle.

**Developer Control** &mdash; `Operation` and `OperationQueue` classes also give you, as a developer, more control:

- For an `OperationQueue`, you can specify the __*maximum number of queued operations*__ that can run simultaneously. This makes it easy to (a) control how many operations run at the same time or (b) to create a serial operation queue.

- For subclasses of `Operation`, you can configure the __*execution priority*__ level of an operation in an operation queue. <sup>1</sup>

&nbsp;&nbsp;&nbsp; <sup>1</sup> *Details on operation state, KVO properties, and priority levels coming up later...*

### How do Operations work?
Because the Operation class is an abstract class, you do not use it directly. Instead, you subclass it or use one of the system-defined subclasses (`NSInvocationOperation` or `BlockOperation`) to perform the actual task.

There are two ways to execute operations:

**Operation Queues** &mdash; Typically, you execute operations by adding them to an operation queue &mdash; an instance of the `OperationQueue` class).

An operation queue executes its operations either __*directly*__ &mdash; by running them on secondary threads &mdash; or __*indirectly*__ using the `libdispatch` library (aka, GCD).

> *More on OperationQueues coming up...*

**Start method** &mdash; You can also choose *not* to use an `OperationQueue` and execute an operation yourself by calling its `start()` method directly from your code.

Because starting an operation that is not in the ready state triggers an exception, executing operations manually puts additional burden on your code to handle state changes if you choose to call an operation's `start()` method directly.

> *Note that later we'll see that the `isReady` property reports on the operation’s readiness.*

**Some things to note**

- Despite being abstract, the base implementation of `Operation` does include significant logic to coordinate the safe execution of your task. The presence of this built-in logic allows you to focus on the actual implementation of your task, rather than on the glue code needed to ensure it works correctly with other system objects.

- An operation object is a "single-shot object" &mdash; that is, it executes its task once and cannot be used to execute it again.

### How to use them?





<!-- TODO:  
- list states
- list priority levels
 -->




<!-- OUTLINE?
What are they?

Why use them? benefits

How they work

White board

Syntax examples

dependencies

BlockOperation

Compared to GCD... when to use them


-->



## In Class Activity I (30 min)

- I do, We do, You do
- Reading & Discussion Questions in small groups
- Draw a picture/diagram
- Complete Challenges solo or in pair
- Q&A about tutorials
- Pair up and code review
- Pair program
- Formative assessment
- Form into groups
- etc (get creative :D)

## Overview/TT II (20 min)

## In Class Activity II (30 min)



## After Class
1. Research:
-
2. Assignment:
-

## Wrap Up (5 min)

<!-- - Continue working on your current tutorial -->
- Complete reading
- Complete challenges

## Additional Resources

1. [Slides]()
2. [Operation - Apple docs](https://developer.apple.com/documentation/foundation/operation)
3. [OperationQueue - Apple docs](https://developer.apple.com/documentation/foundation/operationqueue)
4. [Queue Priority - Apple docs](https://developer.apple.com/documentation/foundation/operation/1411204-queuepriority)
5. []()
