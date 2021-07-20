# Debugging and Refactoring [Class Slides](https://docs.google.com/presentation/d/1i7lBoMglqXVfqv0meHhj0aHfLOFPTXPqARAl_YGFEgg/edit)

## Learning Outcomes

1. Compare and contrast the pros and cons of different debugging techniques.
1. Use breakpoints to debug code.
1. Apply debugging techniques in a project of their own.

## Activity - What is debugging?

In a notebook, write down the following incomplete sentence: 
		Debugging is _____________.

1. Fill in the blank. What does debugging mean to you?
1. Turn to your neighbor and discuss your answers!
1. After 5 minutes, we’ll share our answers with the class.

## TT - Debugging Process

**Debugging is IMPORTANT!! It's the single most important skill in programming** Half of your time will be dedicated to it.

Formal definition: Debugging is the process of finding and resolving defects that prevent correct operation of computer software or a system.

To effectively debug, you need to have a process as a base layer. From there you'll build experience, which will then in turn drive your intuition.

When you're starting out, follow these steps when debugging an issue:

1. Clear caches, reinstall dependencies, turn it off/on again, etc.
1. Use print statements
1. Ask for help! Use google, stack overflow, collegues, etc.


### Systematic Approach

Mastering debugging comes with some long term benefits such as gaining experience, learning how the system works, and boosting your confidence!

To get there, it helps to adapt a systematic approach to solving bugs:

1. Gather Information
1. Replicate the Issue
1. Identify the Culprit
1. Make a Change to Fix It & Test Again
1. Mitigate Future Occurrences

### Gather Information

- Expected vs Actual Behavior
- Error Messages
- Stack Traces
- Screenshots
- Environment Information
  - Operating System
  - Browser
- Date & Time 
- Logs

### Replicate the Issue
Figure out how to reproduce the issue  with 100% certainty!

### Identify the Culprit

- Be methodical
- Make 0 assumptions
- Understand the bug!

### Make a Change to Fix It & Test Again

- Attempt to Replicate Again
  - Make sure the steps are written down!
- No Temporary Workarounds
  - Add technical debt
  - Tend to introduce other issues
  - Rarely get replaced later on with true solutions 

### Mitigate Future Occurrences

- Add an automated test
- Share your new knowledge
  - Project documentation
  - Blog post
  - StackOverflow
- Submit a patch
  - Or merge your code upstream to master!

## Break

## Tools & Techniques

The two essential tools:

**Integrated Development Environment (IDE)**
- Minimum Features Required
  - Syntax Highlighting
  - Autocompletion
  - Fast code navigation 
  - Debugger

**Interactive Debugger**
- Pause code execution
- Step through the execution of the code
- Examine variables
- Explore call stack

Three essential techniques:

**Trace Backward**
- Do this when the error is thrown from a known location

**Trace Forward** 
- Start at beginning and go the opposite direction when the problem line isn’t known
- Use a debugger or logging

**Divide & Conquer**
- Identify different code sections
- Set breakpoints at the boundaries
- Isolate issue to one particular area
- Focus your efforts on that area

Don't forget to also get help or take a break. These will always help an engineer who's stumped on a bug!

## Interactive Debugging Demo

Lead a JavaScript/Node-related debugging section with some problematic code. The instructor will call out to the class to help debug as they move throughout the process

## Activity - Setting breakpoints

From the [given tutorials](https://docs.google.com/presentation/d/1i7lBoMglqXVfqv0meHhj0aHfLOFPTXPqARAl_YGFEgg/edit#slide=id.g590b58aaab_0_698), complete the one that matches your concentration!

## Resources

- Deck adapted from [Debugging Effectively](https://www.slideshare.net/colinodell/debugging-effectively-confoo-montreal-2019) (2019) 
