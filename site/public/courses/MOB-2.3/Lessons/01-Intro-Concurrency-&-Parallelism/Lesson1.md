# Concurrency & Parallelism

<!-- INSTRUCTOR Notes:
1) instructions and other material for the game in Activity 1 are here:

https://drive.google.com/drive/u/0/folders/1NoSPe3pQJFEXBZmsHKLquYh1uzoWVWYK?ths=true

2) Solution for Activity II:
- is listed below the Activity -->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe:
- Why __*Concurrency*__ is important in iOS
- The relationships between __*processes,*__ __*threads,*__ and __*tasks,*__ and how they fit together at the launch of any iOS application
- The similarities and key differences between __*Parallelism*__ and __*Concurrency*__
- How you could have __*Concurrency without Parallelism*__ and vice-versa
- (at a very high level) Apple's primary API for managing Concurrency - __*Grand Central Dispatch*__ (GCD)
2. Identify:
- the __*five major challenges*__ associated with Concurrency


## Why you should know this

**Q:** Why do apps need concurrent activities?

**A:** To keep the UI responsive.

When you create a new iOS app, the app acquires its `main` thread. That `main` thread is responsible for running all of the code that powers the app's user interface.

As you add code on your `main` thread to perform large items of non-UI work &mdash; such as image processing or fetching and transforming data  &mdash; you will find that your UI's performance suffers drastically.

Your user interface will slow down, or maybe even stop altogether.

A common example:
- A table view that will not scroll properly while the app is downloading and transforming images; scrolling stutters and you might need to display multiple "busy" indicators of the expected images.

The concept of __*Concurrency*__ in iOS is about how to structure your app to avoid such UI performance issues by directing  slow, non-UI tasks to run somewhere other than on the UI thread (aka, the `main` thread).

Concurrency issues loom large in any list of the top mistakes made by iOS developers. They are also the underlying cause of the majority of negative app reviews.

Thus it is not surprising that questions on iOS concurrency are now a standard part of the technical interview process for iOS development jobs.

## Overview/TT I

### Terms & Concepts

Key concepts covered in this course will include:

- Process
- Thread
- Task
- Multi-Core Systems
- Concurrency
- Parallelism
- Queues (Serial, Concurrent)
- Synchronous vs Asynchronous
- Grand Central Dispatch (GCD)
- Background Tasks
- Quality of Service (QoS)
- Operations
- Dispatch Groups
- Semaphores
- Debugging
- Testing Strategies

...we will cover a few of the most essential concepts today...and the rest, we'll cover later in the course...

### Processes & Threads

**Process** &mdash; The runtime instance of an application. A process has its own virtual memory space (aka, virtual machine) and system resources (including port rights) that are independent of those assigned to other programs.

- A process always contains at least one thread (the main thread) and may contain any number of additional threads.

**Thread** &mdash; A *flow* of execution inside a process. A __*thread of execution*__ is the *smallest sequence* of programmed instructions that can be managed independently by the operating system's scheduler.

- Each thread comes with its own __*stack*__ space but otherwise shares memory with other threads in the same process.

- A thread defines a discrete mechanism, within a single process, for executing tasks.

- Threads can execute concurrently, but that is up to the operating system.

**Comparing Processes to Threads**

| Processes | Threads |
| ------------- | ------------- |
| Are typically independent | Threads exist as *subsets* of a process |
| Have separate address spaces | Threads share their address space with other threads in the same process |
| Carry considerably more state information than threads  | Multiple threads within a process share process state as well as memory and other resources  |


### Tasks

**Task** &mdash; A quantity of work to be performed.

A task is simply some work that your application needs to perform (i.e., some block of code to execute).

For examples, you could create a task to perform some calculations, blur an image, create or modify a data structure, process some data read from a file, convert JSON data, or fetch data from local/remote sources.


*Sources:* </br>
- Wikipedia
- Apple Concurrency Programming

#### Where do tasks run?

Tasks run on threads...

- The UI (and all UI-related tasks) runs on the Main thread, which is automatically created by the system.
- The system also creates other threads for its own tasks. Your app can use these threads...or create its own threads.


### Parallel Computing (Parallelism)

Parallel programming utilizes a shift from procedural tasks, which run sequentially, to tasks that run at the same time.

In Parallel Computing:

- Many calculations or the execution of processes are carried out __*simultaneously.*__

- A computational task is typically broken down into several very similar __*sub-tasks*__ that can be processed independently and whose results are combined after all tasks are completed.

> Note that there are several different forms of Parallel Computing: bit-level, instruction-level, data, and task parallelism.

<!--
### Concurrency & Concurrent Computing

**Concurrency** refers to the ability to decompose a program, algorithm, or problem into components or units that can be executed out-of-order or in partial order without affecting the final outcome.

Concurrency is the act of dividing up work.

This allows for parallel execution of the concurrent units, which can significantly improve overall speed of the execution in multi-processor and multi-core systems.

Concurrent Computing is an example of one of the four forms of Parallel Computing, [task parallelism](https://en.wikipedia.org/wiki/Task_parallelism), which focuses on distributing tasks — __*concurrently*__ performed by processes or threads — across different processors. -->


### Concurrency

**Concurrency** refers to the ability to __*decompose*__ a program, algorithm, or problem __*into smaller components or units*__ that can be executed out-of-order, or in partial order, without affecting the final outcome.

Concurrency is the act of dividing up work.

This __*allows for parallel execution*__ of the concurrent units, which can significantly improve overall speed of execution on multi-processor and multi-core systems.

### Multiple Processors / Cores

A recent trend in computer architecture is to produce chips with multiple cores (CPUs) on a single chip, a trend driven by concerns over excessive heat generated by increased power consumption.

With the advent of modern multi-core CPUs, Parallel Computing has become the dominant paradigm in computer architecture due to its potential to optimize performance.

Multi-core devices execute multiple threads at the same time via Parallelism.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![414px-Dual_Core_Generic.svg](assets/414px-Dual_Core_Generic.svg.png)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Diagram of a generic dual-core processor with CPU-local level-1 caches* </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *and a shared, on-die level-2 cache.*

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Source:* </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *CountingPine at English Wikipedia - Public Domain,* </br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; https://commons.wikimedia.org/w/index.php?curid=11894458

### Are Parallelism and Concurrency the same thing?

Parallel Computing is closely related to Concurrent Computing (in fact, Concurrent Computing is an example of *task parallelism.*)

Concurrency is about structure, while Parallelism is about execution.

Though both are frequently used together, and often conflated, the two concepts are distinct:
- it is possible to have __*parallelism without concurrency*__ (such as bit-level parallelism)
- it is also possible to have __*concurrency without parallelism*__ (such as multitasking by time-sharing on a single-core CPU).

<!-- Concurrency via context-switch doesn’t ruin the illusion because the switching happens quickly.  With true parallelism, the execution of concurrent tasks is snappier. Furthermore, a context-switch requires storing and restoring the execution state when switching between threads, which means additional overhead. -->

### What does it mean for a task to run concurrently?

Tasks run on threads.

But for threads to execute tasks *concurrently,* must multiple threads run at the same time?

__*Single-core devices*__ can achieve __*Concurrency*__ through __*time-slicing,*__ in which the OS uses "context switching" to alternate between multiple threads.

For a __*multi-threaded application*__ running on a traditional __*single-core chip,*__ the OS would run one thread, perform a context switch, then run another thread, as illustrated in the first diagram below where thread 1 (T1) pauses while threads 2 thru 4 run, then thread 1 resumes, etc.:

</br>

![figure_4.3](assets/figure_4.3.png) </br>

</br>

On a __*multi-core chip,*__ the threads could be spread across all available cores, allowing __*true parallel processing,*__ as shown here:

</br>

![figure_4.4](assets/Figure_4.4.png) </br>

*Source:* </br>
https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/4_Threads.html


## In Class Activity I (30 min)

### As A Class

&nbsp;&nbsp;&nbsp;&nbsp; Let's play the __*Movie Theatre Game*__...

<!-- Game description doc and Snack Order Lists are here:
https://drive.google.com/drive/u/0/folders/1NoSPe3pQJFEXBZmsHKLquYh1uzoWVWYK?ths=true
-->


## Overview/TT II

### Concurrency on iOS

#### How many cores on an iOS device?

There can be as many threads executing at once as there are cores in a device's CPU.

iPhones and iPads have been dual-core since 2011, with more recent models boasting as many as 12 cores per chip (see <sup>1</sup>).

With more than one core available, iOS apps are capable of running more than a single task at the same time. (Potentially, up to 8 tasks simultaneously, though this again is ultimately up to the operating system).

### Anatomy of a running iOS app

Below is a simplified diagram of the structure inside the `runtime process` (aka, `virtual machine`) of an iOS app at launch: the moment the user taps the app icon.

**(1)** When an iOS app starts, the system automatically creates the app's `main thread` and the corresponding `call stack` that the `main thread` manages.

**(2)** The `main thread` eventually (after executing required Cocoa Touch functions) allocates your app's `Application` object in its `stack frame`, which in turn executes its delegate methods on its `AppDelegate` object in their respective `stack frame`s, then the `AppDelegate` begins creating all of your app's user interface components and behavior.

From that point on &mdash; and until the `Application` object's lifecycle (*run loop*) ends &mdash; all UI-related code in your app will execute on the `main thread`.

- This behavior ensures that user-related events are processed serially in the order in which they were received.

- But unless specified otherwise, all non-UI code will also execute on the `main thread` (exceptions to this include frameworks such as `URLSession` in which some tasks run on non-UI threads by default).

**(3)** Meanwhile the system also creates additional threads (nonUI threads), along with their corresponding `call stack`s, making them available for use by your app.

</br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![iOS_runtime_process](assets/iOS_runtime_process.png) </br>
</br>

### How to apply Concurrency?

Splitting your app into logical "chunks" of code enables iOS to run multiple parts of your app across more than one core at the same time, which can greatly improve overall performance.

In general, look for opportunities to structure your apps so that some tasks can run simultaneously: Determine which pieces can run at the same time &mdash; and possibly in random order &mdash; yet still result in a correct implementation of your data flow for your users.

Tasks which are good candidates to run simultaneously from different threads typically fall into these categories:
- tasks that access *different* resources
- tasks that *only read* values from *shared* resources

> **Important Note:** Tasks which modify the *same* resource __*must not*__ run at the same time, unless the resource is `threadsafe` (we'll cover `thread safety` later in the course)

<!-- Tasks which access different resources, or read-only shared resources, can all be accessed via different threads to allow for much faster processing. -->


### Introducing to GCD

Most modern programming languages provide some form of Concurrency, but different languages use widely disparate mechanisms for handling it.

 Swift and iOS provide two APIs you can use to improve your app's performance through Concurrency:
 - **Grand Central Dispatch** &mdash; commonly known as GCD (also simply called  "[Dispatch](https://developer.apple.com/documentation/dispatch)" by Apple).
- **Operations** &mdash; which are built on top of GCD.

#### What is GCD?

__*Grand Central Dispatch (GCD)*__ is a low-level API for managing concurrent operations.

Named after Grand Central Station in New York City, GCD was released by Apple in 2009 to optimize application support for systems with __*multi-core processors*__ and other __*symmetric multiprocessing systems.*__

It is an implementation of __*task parallelism*__ based on the __*Thread Pool*__ design pattern.

The fundamental idea is to move the management of the thread pool out of the hands of the developer, and closer to the operating system.

GCD offers you an efficient mechanism for executing code concurrently on multicore hardware by submitting work to __*dispatch queues*__ managed by the system rather than working with threads directly.

> *In the next lessons, we will dig deeper into these two Apple concurrency frameworks, including learning more about the differences between GCD and Operations, as well as when to choose one over the other...*

### Challenges of Currency/Parallelism

By now, you've likely gotten the idea that Concurrency can significantly alleviate performance issues for you.

But it isn't free.

Concurrency presents its own specific development challenges.

In this course we will explore the following set of the most major challenges associated with Concurrency, along with standard approaches to avoid or resolve them:

- Deadlocks
- Race Conditions
- Readers-Writers Problem
- Thread Explosions
- Priority Inversion

## In Class Activity II (30 min)

Before we delve deeper into GCD in the next lesson, let's explore a simplified example of what implementing Concurrency __*without GCD*__ might entail...

### Part 1 - Individually

The code in the [Threads.playground](https://github.com/Make-School-Courses/MOB-2.3-Concurrency-Parallelism-in-iOS/blob/master/Lessons/01-Intro-Concurrency-%26-Parallelism/assets/Threads.playground.zip) below is incomplete. It is intended to create a second instance of the `Thread` class named "Background Thread" that executes the `calculation` function/closure.

**TODO:** Complete the code to match the output listed below it:

```Swift
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let calculation = {
    for i in 0...100 {
        print(i)
    }
}

let thread = Thread {

    //TODO: What must the thread do here to match the expected output listed below?
}

print("On thread: \(Thread.current) doing nothing")
//TODO: Give new thread its proper name, as in expected output...
thread.qualityOfService = .userInitiated

thread.start()

/* EXPECTED OUTPUT:
 On thread: <NSThread: 0x6000022d28c0>{number = 1, name = main} doing nothing
 On thread: <NSThread: 0x6000022fba00>{number = 3, name = Background Thread} doing work
 0
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 11
 ...
 100
 */
```

<!-- INSTRUCTOR NOTE:
Solution for Activity II is in this playground:

https://github.com/Make-School-Courses/MOB-2.3-Concurrency-Parallelism-in-iOS/tree/master/Lessons/01-Intro-Concurrency-%26-Parallelism/assets/Threads(solution).playground -->


### Part 2 - In Pairs

<!-- TODO: arrive at better questions here! -->


**TODO:** Trace down the source of the Foundation types `Thread`, `Thread.current`, and the `.start()` function.
- Is it easy to infer how to implement these properties and functions?

**Q:** Listed below is a selected portion of the output:
- What do the hexadecimal numbers next to `<NSThread: ` tell us and how could that information be useful?
- Where did the properties `number` and `name` come from?

```Swift
  On thread: <NSThread: 0x600003af0dc0>{number = 1, name = main} doing nothing
  On thread: <NSThread: 0x600003acc340>{number = 3, name = Background Thread} doing work
```
**Q:** This approach involved direct creation and management of threads.
- What drawbacks do you foresee with this approach, especially in more complex implementations?


## After Class
1. Research:
- Task Parallelism
- Bit-Level Parallelism
- Amdahl's Law and Gustafson's Law
- Call Stack, Stack Frames, and Stack Pointer
- The Heap
- Thread Pool design pattern
- Scheduler (for iOS thread scheduling)
- Run Loop
- Async/Await pattern (and Swift 5.0)
- Nonatomic (vs Atomic)
- Dispatch Queues
- Quality of Service (QoS) Priority - as defined by Apple for iOS/macOS

## Wrap Up 

- Complete reading / research

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/10N4toxHiXr6QAszM4aKvgtRAOsKR30b5fYe9RXfqa88/edit?usp=sharing)
2. [Parallel computing - wikipedia](https://en.wikipedia.org/wiki/Parallel_computing)
3. [Concurrency (computer_science) - wikipedia](https://en.wikipedia.org/wiki/Concurrency_(computer_science))
4. [Threads - an article](https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/4_Threads.html)
5. [Processes and Threads - Apple](https://developer.apple.com/documentation/foundation/processes_and_threads)
6. [Apple-designed_processors - Apple](https://en.wikipedia.org/wiki/Apple-designed_processors) <sup>1</sup>
7. [Dispatch - from Apple](https://developer.apple.com/documentation/dispatch)
8. [Grand_Central_Dispatch - wikipedia](https://en.wikipedia.org/wiki/Grand_Central_Dispatch) <sup>2</sup>
9. [The App LifeCycle - Apple](https://developer.apple.com/library/archive/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/TheAppLifeCycle/TheAppLifeCycle.html)
10. [Context switch - wikipedia](https://en.wikipedia.org/wiki/Context_switch)
11. [Thread safety - wikipedia](https://en.wikipedia.org/wiki/Thread_safety)
12. [Call Stack](https://en.wikipedia.org/wiki/Call_stack)

<!-- DETRITUS:  -->
<!-- Performance. Responsiveness. They're not sexy tasks. When done properly, nobody is going to thank you. When done incorrectly, app retention is going to suffer and you'll be dinged during your next yearly performance review.
There are a multitude of ways in which an app can be optimized for speed, performance and overall responsiveness. This book will focus on the topic of concurrency. -->

<!-- your app runs as smoothly as possible and that the end user is not ever forced to wait for something to happen. A second is a minuscule amount of time for most everything not related to a computer. However, if a human has to wait a
 raywenderlich.com 15
Concurrency by Tutorials Chapter 1: Introduction second to see a response after taking an action on a device like an iPhone, it feels like
an eternity. "It's too slow" is one of the main contributors to your app being uninstalled. -->

<!-- Scrolling through a table of images is one of the more common situations wherein the end user will be impacted by the lack of concurrency. If you need to download an image from the network, or perform some type of image processing before displaying it, the scrolling will stutter and you'll be forced to display multiple "busy" indicators instead of the expected image. -->
