# Inspecting and Debugging Your Code

## Minute-by-Minute

| **Time(min)** | **Activity**                              |
| ------------- | ---------------------------               |
| 5             | Intro & Objectives                        |
| 20            | TT on Crashes & Debugging concepts        |
| 25            | Work on challenge                         |
| 10            | Break                                     |
| 15            | TT on Crash logs & Crashlytics            |
| 25            | Work on challenge                         |
| 5             | Wrap up & Q&A                             |

## Class Learning Objectives/Competencies
By the end of this lesson, students should be able to:

- Identify and set breakpoints in code
- Find and track bugs using the debugger
- Use basic LLDB commands
- Use print statements for debugging
- Use the visual representation to look for solutions
- Integrate Crashlytics to a project and get a symbolicated crash report

# Why you should know this

When writing code, you will discover that as you write more code, the potential for bugs in your code increases. Bugs happen and it is expected we spend a lot of our time trying to find and fix bugs. It is just a normal part of being a programmer. Discovering and fixing bugs is a difficult task; it takes time, practice and a knowledge of a few tools to get good at it.

## Crashes
Crash: Sudden termination of  the app when it attempts to do something that it’s not allowed.

*Why do crashes occur?*

- Impossible fo the CPU to execute code (dividing by 0)
-  Operating system is enforcing a policy (the OS kills the app is it’s taking to long to launch or if it has a memory issue)
- Programming language is preventing failure  (trying to access an index out of bounds of an array)
- Developer is preventing failure (looking if a parameter is not nil)

## Debugging with Xcode

Today we will practice our debugging skills by identifying the tools Xcode provides us.

We will use the five (5) recommended steps provided by Apple to fix bugs:

**Discover** - Identify the problem. The first thing we should be able to do is to reproduce the bug. If we can't reproduce the problem, it's likely we don't understand it.

**Locate** - Determine where in the code the problem occurs.
- What line of code caused the error?

**Inspect** - Examine the control flow and data structures of the running code to find the cause of the problem.
- What is the value of current variables?
- What methods led to the error?

Generate a hypothesis.

**Fix** - Apply your insight into the cause of the problem to devise a solution, and edit the code.

**Confirm** - After editing, run the app and check it with the debugger to be sure the fix was successful.


## Concepts
- **Logic error**: a bug in a program that causes it to operate incorrectly, but it doesn't terminate the app (crash)

- **Runtime errors**: issues that occur while your application is running (these can be logic errors or errors that cause your application to crash)

- **Software bug**: an error or fault in a computer program or system that causes it to produce an incorrect or unexpected result, or to behave in unintended ways.

- **Static (or compilation) errors**: issues identified by the compiler that must be fixed prior to running your application, these are the ones that prevent you from building the app in Xcode.

- **Warning**: issues that might cause problems or have unintended side-effects on your running application, but they still let us build and run the app

## Debugging tools

### Print statements
We can make use of a simple tool like printing text to the console to examine the content of variables or print messages we consider useful.

`print("Useful message that will help in the future.")`

### Breakpoints
A **breakpoint** is a debugging tool that allows us to *pause* the execution of our program up to a certain moment. <br>
We use them to create pause points in our code that can help us investigate our code to see where bugs occur.

**How?**
Decide where we need to pause the execution of the code and click in the line number to create a breakpoint.<br>
- Blue means the breakpoint is active.<br>
- Grey means it is inactive.<br>

You can toggle between the 2 states by clicking the breakpoint.<br>
To remove the breakpoint click on it a drag it to the right, then release.

- Step in - Execute the current line of code and, if the current line is a routine, jump to the first line of that routine
- Step out - Complete the current routine and step to the next routine or back to the calling routine.
- Step over - Execute the current line of code and, if the current line is a function or method, step out to the next line in the current file


### Identifying elements

![debugArea](assets/debugArea.png)

### Inspecting variables

The variable view provides the primary way to inspect the state of variables when an app is paused.

The variable view lists each variable available in the context where the app is paused. Each variable has an identifying icon, the variable name, type, and value.

![variables](assets/variables.png)

![types](assets/types.png)


### LLDB (low level debugger)

We can type shortcut commands into the LLDB to help us set breakpoints at certain lines of code, set breakpoints at many points in the code, list all the breakpoints, and disable breakpoints.

`breakpoint set --selector viewDidLoad`<br>
`breakpoint list`<br>
`breakpoint disable`

We can also review the content of variables.

`po variableName`

### Visual representation
![bugs](assets/bugs.png)

## Baseline challenge

Clone this repo from Udacity, we'll use it to debug the app and fix it.<br>
`git clone https://github.com/udacity/ios-nd-debugging`

## Crashlytics

When we're working on Xcode and our app crashes, it is attached to the debugger, what happens is the program stops and Xcode takes us to the conflicting  line in our code.

![crash1](assets/crash1.png)

Unfortunately we are not always attached. When this is the case, the operating system catches the back trace in plain text, and saves it to disc in a human readable crash log.

![crash2](assets/crash2.png)

We can access the crash log and inspect the information.<br>

- Summary information
    - name
    - version
    - os
    - date and time
- Crash reason
- Error message (this section won't always be available, it is hidden in devices for privacy reasons but might show up on crash logs from simulators)
- Back traces
- Low level information
- Binary images (app executable and libraries)


When an app is released, you won't get the crash logs in a readable format. Instead you will get a lot of memory addresses and binary names. This is called an **unsymbolicated** crash log.

![crash3](assets/crash3.png)

There are different ways in which we can symbolicate the crash logs to read them better.

**How to get the crash logs?**
If you have Testflight beta testers or the app is already in production. You can get them using the Crashes Organizer on Xcode. *-> Window/Organizer/Crashes*

If you are not distributing your app yet. You can get the logs on your devices when you connect them to your computer. *-> Window/Devices and Simulators/View Device Logs*

And a solution for any case: **Crashlytics**. <br>
Crashlytics is a product from
[Firebase](https://firebase.google.com) now and it is a helpful tool to integrate in our projects. We can get a lot os insights from crashes happening in the wild. It is easy to set up and the site has detailed instructions on how to do it. <br>
If you are not getting your crashes symbolicated, the platform will tell you which dSYM files you need. A **dSYM** file stores the debug symbols for your app. Then is will symbolicate the crash log for us so we can see the conflicting line in our code.

**Why is the dSYM not uploading?** One reason might be the build of the app has bitcode enabled. **Bitcode** is an intermediate representation of a compiled program. Apps on iTunes Connect that contain bitcode will be compiled and linked on the App Store. Bitcode allows Apple to re-optimize the app binary in the future without the need to submit a new version of your app to the store.

Ways to get the dSYM file:
- If the app is on the App Store/Testflight, through the iTunes Connect console.
- If it is from a local simulator: `mdfind "com_apple_xcode_dsym_uuids == <UUID>"` <br>
The UUID will be given to you in the Crashlytics console.

## Challenge
Add your app to Crashlytics and make it crash to get a report on the dashboard.

## Additional resources
[Udacity course on debugging](https://www.udacity.com/course/xcode-debugging--ud774)<br>
[LLDB guide](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-basics.html#//apple_ref/doc/uid/TP40012917-CH2-SW1)<br>
[Debugging with Xcode](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/debugging_with_xcode/chapters/debugging_tools.html#//apple_ref/doc/uid/TP40015022-CH8-SW19)<br>
[Article on breakpoints](https://medium.com/yay-its-erica/xcode-debugging-with-breakpoints-for-beginners-5b0d0a39d711)
[WWDC Understanding crash logs](https://developer.apple.com/videos/play/wwdc2018/414/)<br>
[Firebase site](https://firebase.google.com)
