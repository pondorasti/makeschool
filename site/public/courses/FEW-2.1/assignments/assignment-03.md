# FEW 2.1 - Assignment 3 - String Lib Tests

## Description 

The goal of this assignment is to write unit tests for your String Lib. 

## Slides

https://docs.google.com/presentation/d/1aBUDlkov4Bg3BHjALA3u6NQPDSsLvHNwgO-pzNvcl-4/edit?usp=sharing

### Why this assignment?

Testing is part of the Agile development process. Expect to see at companies large and small. Using tests improves code quality. 

## Project requirements

You need to write tests that guarantee that your functions are working correctly. 

What should you test? For each function think of an input and what you expect the output to be. Test this! Consider possible edge cases. For any of the functions that deal with a string the empty string `""` is probably an edge case. Also a single character might also be an edge case. Strings with special characters, and strings beginning with a space or ending with a space. 

https://www.freecodecamp.org/news/a-beginners-guide-to-testing-implement-these-quick-checks-to-test-your-code-d50027ad5eed/

### Setup 

Be sure to import jest: 

- `npm install jest`

Add a `.gitignore` to your repo You don't want to upload your entire node modules folder to your github. 

Use the generator here 

- https://www.toptal.com/developers/gitignore

Search for 'node'. 

### Notes on Testing String Functions

- `capitalize()`
  - What to test? 
    - Test a string with no spaces. The first letter should be uppercased.
    - Test a string starting with an uppercase. Nothing should change. 
    - Test the empty string, nothing should change.
    - Test a long string with spaces, only the first character should change. 
  - "hello" -> "Hello", "WORLD" -> "WORLD", "" -> "", "foo bar" -> "Foo bar" 
- `allCaps()`
  - What to test? 
    - Test a string, all letters should be upper case. 
    - Test a string with spaces, all letters should uppercase, spaces unaffected. 
    - Test the empty string. 
    - Test a string with punctuation. 
  - "hello" -> "HELLO", "WORLD" -> "WORLD", "" -> "", "foo bar" -> "FOO BAR", "What!" -> "WHAT!" 
- capitalizeWords()
  - What to test? Test any series of strings with spaces. Test the empty string. 
    - Test a string with one word
    - Test a string with two or more words
    - Test the empty string
    - Test a string with uppercased words (these shouldn't change)
  - "hello" -> "Hello", "WORLD" -> "WORLD", "" -> "", "foo bar" -> "Foo Bar"
- oddCaps()
- evenCaps()
- removeExtraSpaces()
- kabobCase()
- snakeCase()
- camelCase()

If you've added any extra functions you should write tests for those also. 

For more complex functions you might include more than one test case. **Your job is to think of what can go wrong and write a test to catch those situations.**

### Check coverage

Use Jest coverage to check how much of your code is covered by tests. Use this identify possible areas that were not covered by tests. 

### Deliverable

`test.js` file in your GitHub Repo with all of the written test cases. 

I should be able to run the test suite in your repo and see the results in the console. 

### Due date

Class 4 - Wed, April 8

## Assessing the assignment

| Expectations | Does not meet | Meets | Exceeds |
|:-------------|:--------------|:------|:--------|
| **Completion** | < 100% of all functions tested | 100% of functions tested  | All test cases are clearly labeled |
| **Quality** | Tests run with errors or run without but don't test thoroughly | Tests cover edge cases and test a variety of possible input including the empty string, strange characters, and unexpected input | Tests are well thought out and cover all possible scenarios |
| **Comprehension** | Can't explain testing its uses and implementation | Can explain the code and implement tests in future projects | Could apply the concepts from this assignment in a wide variety of future projects |
| **Work ethic** | Few massive commits | Commits outline progress | Commit messages clearly document progress |




