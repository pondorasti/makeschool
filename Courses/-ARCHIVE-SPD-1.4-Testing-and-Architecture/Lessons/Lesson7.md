# Developer Testing ([Lesson Slides](https://docs.google.com/presentation/d/1brpV_RmrRRxTO702EKH1SV1gpAnLDFRGDcPhs8sjnok/edit))

## Learning Outcomes

1. Define the different types of testing that can be utilized by developers
1. Describe common pitfalls in testing
1. Identify a project that needs improved tests

## Group Activity - What do you do...?

Go through the scenario presented, and decide which choice you would make. Debate your choice with someone who made a different choice

## TT - How to Approach Testing

- Test requirements
- Test designs
- Test edge cases/basis testing
- Test First or Test Last?
- Clean Tests/optimistic view

Ask class what percentage of time do you think should be spent writing tests for a typical project?

Typically, this is 8-25% of the total project time

## Activity - Definitions

Get with a partner and define each of the following types of tests:

1. Unit tests
1. Integration tests
1. System tests
1. Component tests
1. Regression tests

## TT - Different Types of Tests

### Unit

Unit testing is the **execution of a complete class, routine, or small program** that has been **written by a single programmer** or team of programmers, which is tested in isolation from the more complete system.

### Integration

**Combined** execution of **two or more classes, packages, components, or subsystems** that have been **created by multiple programmers or programming teams**. This kind of testing typically starts as soon as there are two classes to test and continues until the entire system is complete.

### Component

Execution of a class, package, small program, or other program element that involves the work of multiple programmers or programming teams, **which is tested in isolation from the more complete system.**


### System
Execution of the software in its final configuration, including integration with other software and hardware systems. **It tests for security, performance, resource loss, timing problems, and other issues** that can’t be tested at lower levels of integration.

### Regression

**Repetition of previously executed test cases** for the purpose of finding defects in software that previously passed the same set of tests.

## TT - Bag O' Tricks

- Remove tests that don’t add anything new
- Basis Testing: Test each statement in the code at least once!
- Test Data Flow and Control Flow
- Equivalence Partitioning: If two test cases flush out exactly the same errors, you need only one of them. 
- Creating test cases based upon guesses about where the program might have errors.
- Boundary Analysis (i.e. off by one)
- Test bad and good data, and be logical in choosing what counts as "bad" or "good"
- Hand-checks should be convenient - use easy numbers

## Break

## TT - Reducing Errors

Errors are not evenly distributed amongst a project. Find where your problematic areas are!

Errors can greatly vary. though structural, data, and functionality as implemented are the top three most common ones

Industry average experience is about 1–25 errors per 1000 lines of code for delivered software

Think about what you can do to reduce the number of errors in your code!

It's also important to reduce errors in test cases. You can do that through the following:

- Check your work
- Plan test cases as you develop your software
- Keep your test cases
- Plug unit tests into a test framework

## TT - Keeping Records

Keep the following records when fixing a bug:

- Administrative description of the defect (the date reported, the person who reported it, a title or description, the build number, the date fixed)
- Full description of the problem
- Steps to take to repeat the problem
- Suggested workaround for the problem
- Related defects
- Severity of the problem—for example, fatal, bothersome, or cosmetic 
- Origin of the defect: requirements, design, coding, or testing
- Subclassification of a coding defect: off-by-one, bad assignment, bad array index, bad routine call, etc
- Classes and routines changed by the fix 
- Hours to find the defect 
- Hours to fix the defect

### Project Health

You’ve seen which records we keep when filing a bug. For any given project, what kind of data would you track that relates to the health of your project? Does it differ from the above?





