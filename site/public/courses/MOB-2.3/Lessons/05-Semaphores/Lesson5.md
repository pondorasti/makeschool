# Semaphores

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:45      | In Class Activity I       |
| 1:05        | 0:10      | BREAK                     |
| 1:15        | 0:45      | In Class Activity II      |
| TOTAL       | 2:00      |                           |

## Why you should know this

Semaphores are a well known topic in every Operating Systems class. They help solving synchronization problems and it's simple to lay out how they work. They are a tool that comes with GDC, so even if we don't use them in our every day life, it's important to know how they can help us, when should we use them and they help strengthen our thought process.

## Learning Objectives (5 min)

1. Define what a semaphore is.
1. Understand how semaphores work.
1. Implement solutions to given scenarios using semaphores.
1. Use semaphores in Swift.

## Initial Exercise (15 min)

Review solution to **JankyTable app** assignment from last lesson.

- One or more volunteers present their solutions. Opens a class discussion.

## An intro to semaphores (15 min)

#### Semaphores in real life

A system of signals used to communicate visually:
- Flags
- Lights
- Or other mechanism

#### Semaphores in software
A data structure that is useful for solving a variety of synchronization problems. Semaphores were invented by Edsger Dijkstra.

#### A formal definition
When we create a semaphore, we can initialize its value to any integer.<br>
After that the only operations we are allowed to perform are:
 - increment (increase by one)
 - decrement (decrease by one)


We cannot read the current value of the semaphore.

When a thread decrements the semaphore, if the result is negative, the thread **blocks** itself and cannot continue until another thread increments the semaphore.

When a thread increments the semaphore, if there are other threads waiting, one of the waiting threads gets **unblocked**.

##### What does the initial value mean?
If the value is **positive**, then it represents the number of threads that can decrement without blocking. <br>If it is **negative**, then it represents the number of threads that have blocked and are waiting.<br> If the value is **zero**, it means there are no threads waiting, but if a thread tries to decrement, it will block.

##### Some things to note

- There is no way to know before a thread decrements a semaphore whether it will block or not.
- After a thread increments a semaphore and another thread gets woken up, both threads continue running concurrently. There is no way to know which thread, if either, will continue immediately.
- When we signal a semaphore, we don’t necessarily know whether another thread is waiting, so the number of unblocked threads may be zero or one.

##### Why semaphores?
- Semaphores impose constraints that help programmers avoid errors.
- Solutions using semaphores are often clean and organized, making it easy to demonstrate their correctness.
- Semaphores can be implemented efficiently on many systems, so solutions that use semaphores are portable and usually efficient.

#### Syntax
To make it easy to understand how semaphores work, for now we'll use pseudo code to implement semaphores.

```swift
sem = Semaphore(1)
```
Creates a new semaphore. The initial value of the semaphore is passed as a parameter to the constructor.

The semaphore operations:
```swift
sem.signal()
sem.wait()
```

### Signaling

The simplest use for a semaphore is signaling, which means that one thread sends a signal to another thread to indicate that something has happened.

Signaling makes it possible to guarantee that a section of code in one thread will run before a section of code in another thread; in other words, it solves the
serialization problem.
Assume that we have a semaphore named sem with initial value 0, and that
Threads A and B have shared access to it.

| **Thread A**    | **Thread B**  |
| -----------     | ------------- |
| statement a1    | sem.wait()    |
| sem.signal()    | statement b1  |

**Q:** What does statement represent?<br> <!-- The word statement represents an arbitrary program statement.-->
**Q:** Can you give a concrete example of what a1 and b1 can be?<br> <!-- a1 reads a line from a file, and b1 displays the line on the screen. -->
**Q:** What is the semaphore doing in this program? <!-- Guarantees that Thread A has completed a1 before Thread B begins b1.-->

*Whiteboard for scenarios*

**Q:** What happens when B gets to the wait statement first?<br>
<!-- If thread B gets to the wait statement first, it will find the initial value, zero, and it will block. Then when Thread A signals, Thread B proceeds. -->
**Q:** What happens when A gets to the signal statement first?

<!-- If Thread A gets to the signal first then the value of the semaphore will be incremented, and when Thread B gets to the wait, it will proceed immediately. Either way, the order of a1 and b1 is guaranteed. -->

**NOTE on naming semamphores** <br>
It is a good idea to give a semaphore a name that indicates what it represents.<br>
For example:<br>
`a1done.signal()` means *signal that a1 is done*  
`a1done.wait()` means *wait until a1 is done*

## In Class Activity I (20 min)

### Rendezvous
Generalize the signal pattern so that it works both ways. Thread A has to wait for Thread B and vice versa.

Given:

| **Thread A**    | **Thread B**  |
| -----------     | ------------- |
| statement a1    | statement b1  |
| statement a2    | statement b2  |

We want to guarantee that a1 happens before b2 and b1 happens before a2. Use semaphores to make this possible.

Hints:
- Be sure to specify the names and initial values of your semaphores.
- We don’t care about the order of a1 and b1. Either order should be possible.

**Part 1** - Individually write a solution for the problem above. Write it down.<br>
**Part 2** - Compare with a partner both solutions. See how they're similar or different.<br>
**Part 3** - A volunteer writes the answer on a whiteboard. Opens a class discussion.<br>

**Q:** Why is this problem called rendezvous? <!-- The idea is that two threads rendezvous at a point of execution, and neither is allowed to proceed until both have arrived.-->

<!--

Solution:

| **Thread A**       | **Thread B**      |
| -----------        | -------------     |
| statement a1       | statement b1      |  
| aArrived.signal()  | bArrived.signal() |
| bArrived.wait()    | aArrived.wait()   |
| statement a2       | statement b2      |

What about this?

| **Thread A**       | **Thread B**      |
| -----------        | -------------     |
| statement a1       | statement b1      |  
| bArrived.wait()    | bArrived.signal() |
| aArrived.signal()  | aArrived.wait()   |
| statement a2       | statement b2      |

Less efficient, since it might have to switch between A and B one time more than necessary. If A arrives first, it waits for B. When B arrives, it wakes A and might proceed immediately to its wait in which case it blocks, allowing A to reach its signal, after which both threads can proceed.

And this?

| **Thread A**       | **Thread B**      |
| -----------        | -------------     |
| statement a1       | statement b1      |  
| bArrived.wait()    | aArrived.wait()   |
| aArrived.signal()  | bArrived.signal() |
| statement a2       | statement b2      |

If A arrives first, it will block at its wait. When B arrives, it will also block, since A wasn’t able to signal aArrived. At this point, neither thread can proceed, and never will. This situation is called a deadlock.
-->

## Mutual Exclusion (10 min)
A second common use for semaphores is to enforce mutual exclusion. We have already seen one use for mutual exclusion, controlling concurrent access to shared variables. T

he mutex guarantees that only one thread accesses the shared variable at a time.

A mutex is like a token that passes from one thread to another, allowing one thread at a time to proceed. For example (can be done in real life): Tossing a ball around the class and only the person holding it can talk.

In order for a thread to access a shared variable, it has to “get” the mutex; when it is done, it “releases” the mutex. Only one thread can hold the mutex at a time.

**Q:** In the ball analogy, what is the shared variable? the mutex? the thread?


## In Class Activity II (20 min)

Add semaphores to the following example to enforce mutual exclusion to the shared variable count.

| **Thread A**           | **Thread B**      |
| -----------            | -------------     |
| count = count + 1      | count = count + 1 |  

Hint: Create a semaphore named mutex that is initialized to 1. A value of one means that a thread may proceed and access the shared variable; a value of zero means that it has to wait for another thread to release the mutex.

**Part 1** - Individually write a solution for the problem above. Write it down.<br>
**Part 2** - Compare with a partner both solutions. See how they're similar or different.<br>
**Part 3** - A volunteer writes the answer on a whiteboard. Opens a class discussion.<br>

**Q:** When do we call signal() and wait()?
<!-- Call wait() each time before using the shared resource. We are basically asking the semaphore if the shared resource is available or not. If not, we will wait.
Call signal() each time after using the shared resource. We are basically signaling the semaphore that we are done interacting with the shared resource. -->

<!--

Solution:

| **Thread A**       | **Thread B**      |
| -----------        | -------------     |
| mutex.wait()       | mutex.wait()      |  
| count = count + 1  | count = count + 1 |
| mutex.signal()     | mutex.signal()    |

Since mutex is initially 1, whichever thread gets to the wait first will be able to proceed immediately. Of course, the act of waiting on the semaphore has the effect of decrementing it, so the second thread to arrive will have to wait until the first signals.
-->

## DispatchSemaphore (10 min)
An object that controls access to a resource across multiple execution contexts through use of a traditional counting semaphore.

A dispatch semaphore is an efficient implementation of a traditional counting semaphore.

You increment a semaphore count by calling the signal() method, and decrement a semaphore count by calling wait() or one of its variants that specifies a timeout.

Two components:

A threads queue - used by the semaphore to keep track on waiting threads in FIFO order (The first thread entered to the queue will be the first to get access to the shared resource once it is available).

A counter value - used by the semaphore to decide if a thread should get access to a shared resource or not. The counter value changes when we call signal() or wait() functions.

*Flowchart*

## In Class Activity III (20 min)

```Swift
let semaphore = DispatchSemaphore(value: 1)
DispatchQueue.global().async {
    print("Person 1 - wait")
    semaphore.wait()
    print("Person 1 - wait finished")
    sleep(1) // Person 1 playing with Switch
    print("Person 1 - done with Switch")
    semaphore.signal()
}
DispatchQueue.global().async {
    print("Person 2 - wait")
    semaphore.wait()
    print("Person 2 - wait finished")
    sleep(1) // Person 2 playing with Switch
    print("Person 2 - done with Switch")
    semaphore.signal()
}
```

## Assignment

What's wrong with the code? 

```Swift
var array = [Int]()
DispatchQueue.concurrentPerform(iterations: 10){
    index in

    let last = array.last ?? 0
    array.append(last + 1)
    print(array)
}

```

Evaluation: Must submit a working code snippet to Gradescope. Graded on completion.

## After Class
1. Research:
  - Meaning of symmetric vs asymmetric solutions.
  - What is meant by "critical section" in a program.
  - Difference between Dispatch Groups and Semaphores?
  - Multiplex (challenge)
2. NSLock

3. Assignment: Solve the **Dining Philosophers Problem** (challenge):
  - https://github.com/raywenderlich/swift-algorithm-club/tree/master/DiningPhilosophers


## Wrap Up (5 min)

- Complete reading
- Complete challenges

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/1Q3YKFpPtePLoi2uEDt-z5hl7ct6qn3lMX380rUHg39I/edit?usp=sharing)
2. "The Little Book of Semaphores" by Allen B. Downey
3. [Dispatch Semaphore from Apple Docs](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)
4. [An article on semaphores](https://medium.com/swiftly-swift/a-quick-look-at-semaphores-6b7b85233ddb)
5. [Semaphore flowchart](https://medium.com/@roykronenfeld/semaphores-in-swift-e296ea80f860)
