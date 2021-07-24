# Testing Redux

Testing is import in large scale apps. In small apps
you may find that you write more test code than non
test code. 

## Testing with Jest

Jest is a test library made for React. 

Set up Jest by following the guide here: 

http://www.softwareishard.com/blog/testing/modern-react-component-testing-with-create-react-app-jest-and-enzyme/

**tl;dr**

- Install some tools
  - `npm install --save enzyme react-addons-test-utils`
  - `yarn install` 
- Run tests
  - `npm test`
  
## Why test?

Imagine having a system that lets' you know when things break,
and where they break without having to launch the application
and run it through all possible uses. 

Testing is standard procedure at major companies. You can 
expect questions about testing on applications and in 
interviews. 

### Types of tests

**Unit Tests**

Unit tests test individual software units. These are 
things like functions. You can call a function 
provide input and compare the output against an 
expected result. 

**Integration Tests** 

These are tests that test the integration of software
modules. These are tests that look at groups of 
software modules and how they work together.

Testing can be a tedious process. You will often find 
yourself writing more code for tests than code you 
are testing. 

Writing tests often requires a certain kind of creativity 
and outside the box thinking to identify what to test 
and edgecases that should be tested. 

Generally speaking unit tests are easier to write than 
integration tests. 

### How to Test

A testing framework is used to run tests and display 
the results. Mocha, Jasmine, Jest are all testing 
frameworks. 

React is a special case due to it's use of JSX and 
ES6. **Jest** and **Enzyme** are frameworks made for 
testing with React.

### What is a test?

A test is usally made up of a test case that contains 
one or more assertions. 

A test case might be written to test a function. 
The assertions might test the valued from the function
fall within the correct parameters. 

For example Action Creators are functions that return 
an object with a type and sometimes a payload. A test 
case for a particular action creator might make the 
following assertions:

- expect the method to return an object
- expect the object to have a type 
- expect the type to be type string
- expect the type to have a value that matches the action type
- expect the object to have a payload with a named property
- expect the property of the payload to have a value of type string
- expect the property on the payload to have the value passed into the function

Assertions can be pretty granular. Depending on what 
is being tested. In some cases more detail may not be helpful
in other cases the added detail can help identify 
problems when they occur.

### Write some tests

Write your tests in files named with '*.test.js'. The test framework 
will look for files with this naming scheme and run the test found there. 

Try it out for yourself with your actions. 

- Add a file with the name 'index.test.js' to the actions folder. 
- Import an action and an action creator into this file. 

`import { NEW_TIMER, addTimer } from './index';`

- Add a test. 

```JavaScript
describe('test actions', () => {
  
}
```

- Next add a test case

```JavaScript
describe('test actions', () => {
  it('should create an action with type NEW_TIMER', () => {
    const tested = addTimer();
    expect(typeof tested).toBe('object');       // tested should be an object
    expect(typeof tested.type).toBe('string');  // tested.type should be string
    expect(tested.type).toBe(NEW_TIMER);        // tested.type should equal NEW_TIMER
  });
}
```

Here the `it()` describes a test case, and the function block contains
the assertions for that test.


Redux Mock Store

- https://codeburst.io/deliberate-practice-what-i-learned-from-reading-redux-mock-store-8d2d79a4b24d

## Challenges 

Choose one of the tutorial projects or a project of 
your own and write tests. 

Test your Actions and Reducers. 

Stretch Challenge connect your project to Travis CI: 

https://github.com/Ryan-Gordon/Create-React-App-Travis

Deploy to GitHub Pages: 

https://medium.com/@bezgachev/6-simple-steps-to-automatically-test-and-deploy-your-javascript-app-to-github-pages-c4c32a34bcb1
