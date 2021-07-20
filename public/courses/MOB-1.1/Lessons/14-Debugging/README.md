<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->

<!-- .slide: class="header" -->
# Inspecting and Debugging Your Code

## [Slides](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/Slides/14-Debugging/README.html ':ignore')

<!-- > -->

## Learning Objectives
By the end of this lesson, students should be able to:

- Identify and set breakpoints in code
- Find and track bugs using the debugger
- Use basic LLDB commands
- Use print statements for debugging
- Use the visual representation to look for solutions

<!-- > -->

## Why you should know this

When writing code, you will discover that as you write more code, the potential for bugs in your code increases.

Bugs happen and it is expected we spend a lot of our time trying to find and fix bugs. It is just a normal part of being a programmer.

Discovering and fixing bugs is a difficult task; it takes time, practice and a knowledge of a few tools to get good at it.

<!-- > -->

## Crashes
**Crash**: Sudden termination of  the app when it attempts to do something that it’s not allowed.

<!-- v -->

*Why do crashes occur?*

- Impossible for the CPU to execute code (dividing by 0)
-  Operating system is enforcing a policy (the OS kills the app if it’s taking to long to launch or if it has a memory issue)
- Programming language failure (trying to access an index out of bounds of an array)

<!-- > -->

## Debugging steps

There are 5 recommended steps provided by Apple to fix bugs:

<p class="fragment fade-in">Discover</p>
<p class="fragment fade-in">Locate</p>
<p class="fragment fade-in">Inspect</p>
<p class="fragment fade-in">Fix</p>
<p class="fragment fade-in">Confirm</p>

<aside class="notes">
**Discover** - Identify the problem. The first thing we should be able to do is to reproduce the bug. If we can't reproduce the problem, it's likely we don't understand it.

**Locate** - Determine where in the code the problem occurs.
- What line of code caused the error?

**Inspect** - Examine the control flow and data structures of the running code to find the cause of the problem.
- What is the value of current variables?
- What methods led to the error?

Generate a hypothesis.

**Fix** - Apply your insight into the cause of the problem to devise a solution, and edit the code.

**Confirm** - After editing, run the app and check it with the debugger to be sure the fix was successful.
</aside

<!-- > -->

## Concepts
- **Logic error**: a bug in a program that causes it to operate incorrectly, but it doesn't terminate the app (crash)

- **Runtime errors**: issues that occur while your application is running (these can be logic errors or errors that cause your application to crash)

<!-- v -->

- **Software bug**: an error or fault in a computer program or system that causes it to produce an incorrect or unexpected result, or to behave in unintended ways.

- **Static (or compilation) errors**: issues identified by the compiler that must be fixed prior to running your application, these are the ones that prevent you from building the app in Xcode.

- **Warning**: issues that might cause problems or have unintended side-effects on your running application, but they still let us build and run the app

<!-- > -->

## Debugging tools

### Print statements
We can make use of a simple tool like printing text to the console to examine the content of variables or print messages we consider useful.

`print("Cancel button pressed")`

<!-- > -->

### Breakpoints
A **breakpoint** is a debugging tool that allows us to *pause* the execution of our program up to a certain moment. <br>
We use them to create pause points in our code that can help us investigate our code to see where bugs occur.

<!-- v -->

**How?**
Decide where we need to pause the execution of the code and click in the line number to create a breakpoint.<br>
- Blue means the breakpoint is active.<br>
- Grey means it is inactive.<br>

You can toggle between the 2 states by clicking the breakpoint.<br>
To remove the breakpoint click on it a drag it to the right, then release.

<!-- v -->

- **Step in** - Execute the current line of code and, if the current line is a routine, jump to the first line of that routine
- **Step out** - Complete the current routine and step to the next routine or back to the calling routine.
- **Step over** - Execute the current line of code and, if the current line is a function or method, step out to the next line in the current file

<!-- > -->

### Identifying elements

![debugArea](assets/debugArea.png)

<!-- > -->

### Inspecting variables

The variable view provides the primary way to inspect the state of variables when an app is paused.

The variable view lists each variable available in the context where the app is paused. Each variable has an identifying icon, the variable name, type, and value.

![variables](assets/variables.png)

<!-- v -->

![types](assets/types.png)

<!-- > -->

### LLDB (low level debugger)

We can type shortcut commands into the LLDB to help us set breakpoints at certain lines of code, set breakpoints at many points in the code, list all the breakpoints, and disable breakpoints.

`breakpoint set --selector viewDidLoad`<br>
`breakpoint list`<br>
`breakpoint disable`

<!-- v -->

We can also review the content of variables.

`po variableName`

<!-- > -->

### Visual representation
![bugs](assets/visual.png)

<!-- > -->

## Activity in Pairs

For this last activity pair up with someone who you've never worked with during the term.

Go to [this project](https://github.com/amelinagzz/RPS-Debugging/tree/master). And check the readme file to see the instructions.

Use the techniques we learned today. See how many bugs you can fix in **25 minutes**.

<!-- > -->

## Additional resources
[Udacity course on debugging](https://www.udacity.com/course/xcode-debugging--ud774)<br>
[LLDB guide](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-basics.html#//apple_ref/doc/uid/TP40012917-CH2-SW1)<br>
[Debugging with Xcode](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/debugging_with_xcode/chapters/debugging_tools.html#//apple_ref/doc/uid/TP40015022-CH8-SW19)<br>
[Article on breakpoints](https://medium.com/yay-its-erica/xcode-debugging-with-breakpoints-for-beginners-5b0d0a39d711)<br>
[WWDC Understanding crash logs](https://developer.apple.com/videos/play/wwdc2018/414/)<br>
