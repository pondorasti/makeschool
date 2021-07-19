# FEW 2.1 - Assignment 8 - Typescript 

## Description 

The goal of this assignment is to refactor one of your previous libraries into TypeScript and publish it to npm. 

### Why this assignment?

TypeScript is becoming more popular, and is extremely useful in large codebases. Knowing how to refactor, write, and publish TypeScript code will allow you to decide whether TypeScript is right for a project.

Writing TypeScript will also force you to think about the types you use in the code you write which will make a you a stronger programmer.

## Project requirements

So far you have created libraries using JavaScript, written unit tests, bundled and published your code. The goal of this assignment is to take on of the libraries you have written and convert the code to Typescript. 

### Getting Started

To get started you'll need to install TypeScript. Follow the instructions in [lesson 10](../lessons/lesson-10.md).

You'll want lint your TypeScript code. It's industry best practice! To do this you will need to install TSLint.

- `eslint --init`

### Refactor your lib

Choose one of your libraries to refactor with TypeScript. The Math lib is probably the best choice. Do the following.

- Refactor into TypeScript
- Transpile into JavaScript - you should have a .js file and a .d.ts file
- Bundle as umd and esm
- Publish to npm 
- Test your work 
  - With a browser project 
  - Node project 
  - React project

Use Coverage to find areas where your code hasn't been tested. Test these areas by writing new tests, modifying existing tests, and adding new assertions. 

### Deliverable

A link to a test repo with your test code using your updated npm package. 

Code reviewed by another student. 

### Due date

Class 10 Dec 8 - Submit to Gradscope

## Assessing the assignment

| Expectations | Does not meet | Meets | Exceeds |
|:-------------|:--------------|:------|:--------|
| Completion   | <100% of functions written | All functions written | Includes all stretch functions   |
| Quality      | code is sloppy and throws errors or shows linting errors |Well written few to no errors | Includes comments, and variable, parameter, and function names are self documenting  |
| Comprehension| Can't explain the code written | Can explain the code | Could write the code again from scratch |
| Tests        | <100% test coverage | 100% Test coverage | - |
| Best Practices | Does not use CI | Uses CI | - |
| Work ethic   | few massive commits | Commits outline progress | Clearly show progression of the work |
