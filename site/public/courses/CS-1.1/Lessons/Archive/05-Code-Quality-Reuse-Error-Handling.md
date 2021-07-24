# Code Quality, Reuse, and Error Handling

## [Slides](https://docs.google.com/presentation/d/12Njd_TwfxbXdjFYLLuxfUChu47ILU37_BsAXyqARlQc/edit?usp=sharing)

## Learning Objectives
By the end of this lesson, students will be able to:

1. Identify aspects of high quality code that improve readability
1. Give feedback to others to improve their code quality
1. Use functions to reuse code and improve modularity
1. Identify and handle errors and edge cases
1. Apply error handling to catch problems gracefully


## Code Quality
- Why code quality is important (5 min)
    - So that it can be read by yourself and others
- Think, pair, share on what you believe are key aspects of code quality (10 min)
- Teacher Talk on code readability and formatting (15 min)
  - **Variable naming and casing:** Important to have meaningful variable names and to pick a convential casing style (i.e. camelCasing).
  - **Line length and complexity:** One liners are for computers to read, not humans. Even a simple function can be made complex by trying to cram into one line. Showcase an example comparing one long line of code to a properly written function.
  - **Formatting and indentation:** While required in Python, other languages have no formatting and indentation requirements. Again, a computer doesn't see the difference, but your teammates will! Compare some poorly formatted HTML to properly formatted HTML
  - **Explanations in comments:** Commenting your code allows for others to be able to read and review functions you've written. A junior engineer should be able to look at your code (without knowledge of the codebase) and understand what's going on.

### Partner code review on [Mad Libs project]
(20 min)

Find a different partner from the think, pair, share and review each other’s Mad Libs repo.

Look for areas to improve the quality of you and your partner’s code. Work together to update your code and make sure it adheres to the code quality ideas previously discussed:

- Variable naming/casing
- Line length/complexity
- Formatting and Indentation
- Comments

### Break (10 min)


## Code Reuse and Modularity
- What is the DRY (Don't Repeat Yourself) principle (10 min)
    - If you’re writing the same code more than once, it should be a function!
- Helper Functions (5 min)
    - Smaller functions used to perform repeatable operations
    - Generally called within larger functions
    - These help maintain DRY code!
- Review the given function, describe where it violates the DRY principle, and describe how you would fix it (10 min)
- Partner code review for Spaceman (15 min)
    - Find another different partner, go through your Spaceman projects and review each other’s code.
    - Provide feedback to each other on how to improve the code quality of each other’s projects.
        - Is it DRY?
        - Is code being reused?
        - Would a helper function be of use?

## Error Handling
- Teacher Talk: Why and how to handle errors (10 min)
    - Discuss examples of App crashes, Broken features, bad User Experiences, and how it's the responsability of software engineers to make sure their products are of high quality
    - **Syntax Errors:** Errors from typos/incorrect syntax. Can avoid by using linters and by reading the error message to help find the source of the error
    - **Raising Exceptions:** A way to message an error and then immediately terminate the program
        - Not the most efficient, since would need to think of every error condition
    - **AssertionError:** Can provide a general message if a condition is not met, but has the same problems as Raising Exceptions. Can we do better?
    - **Try / Except / Else / Finally:** Review what each part does, and how it can provide a more structured approach to handling errors

### Resources
- Printable [code review rubric]

### Homework
- Complete your [Spaceman project]!
- **Optional Stretch Challenge:** Add error handling to your Spaceman project and improve code quality using the feedback you gained from the previous activity.
    - Submit links to your GitHub commit(s) in the progress tracker that show these improvements by next class


[code review rubric]: https://make.sc/code-review-rubric
[Mad Libs project]: https://make.sc/madlibs
[Spaceman project]: https://make.sc/spaceman
