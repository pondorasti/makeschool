# Advanced Testing with Chai

## Agenda

1. Learning Objectives (5 minutes)
1. Overview: Behavior Driven Development (15 minutes)
1. Activity: BDD Practice (30 minutes)
1. BREAK (10 minutes)
1. Advanced Testing Concepts: Mocks, Stubs, & Spies (20 minutes)
1. Activity: Sinon Spies Practice (30 minutes)
1. Wrap-Up (5 minutes)

## Learning Objectives

1. Use BDD techniques to write human-readable unit tests for existing functions, as well as yet-to-be-written functions.
1. Define testing terminology, including stubs, spies, & mocks, and use it to write tests

## Overview: Behavior Driven Development (BDD) (15 minutes)

Previously, we discussed the benefits of **TDD** (_Test Driven Development_), which is the practice of writing unit tests _before_ writing the code that they describe. 

**BDD** (_Behavior Driven Development_) is an extension of TDD that focuses on communication and collaboration. Imagine putting your tests into words. BDD suggests that names assigned to unit test be whole sentences starting with a conditional verb "should" for example. Taken further, these sentences should describe adding value to the product. For example:

> It displays the a notification when a new post is created.

Some software libraries incorporate BDD into their interfaces. For example:

```javascript
user.should.have.properties("first", "last", "age");
```

You can see this is code but it also is clearly read in english describing important product features. BDD will manifest for us first in libraries like `Expect.js` and `Should.js`. These make assertions in code around BDD syntax like: `should.have.properties()` and `expect().to.be()` or similar.

On your own, read over the [Chai BDD Documentation](https://www.chaijs.com/api/bdd/). For each of the following chains, write down: 1) what it does, and 2) _why_ it is helpful to use in a test:

- `.not`
- `.deep`
- `.nested`
- `.own`
- `.ordered`
- `.any`
- `.a`
- `.include`

Then, reflect on your answers with with a partner. We'll go over your answers as a class.


## Activity: BDD Practice (50 minutes)

Clone the [TDD/BDD Challenge](https://github.com/droxey/tdd-bdd-challenge) repository and complete the challenges contained in `tests/utils.test.js`. Feel free to work with a partner.

## BREAK (10 minutes)

## Advanced Testing Concepts: Mocks, Stubs, & Spies (35 minutes)

### Activity (20 Minutes)

Please read this article on [How to Test NodeJS Apps using Mocha, Chai and SinonJS](https://scotch.io/tutorials/how-to-test-nodejs-apps-using-mocha-chai-and-sinonjs). Primarily focusing on a modern-day approach to testing in JavaScript, this article contains quite a bit of review with regards to what we covered on [Day 9](Lesson09.md). Keen eyes will also note that this article  **introduces more advanced topics** that we'll **dive into during today's lesson**!

As you read, follow the steps in the article to create BDD-style tests for a route using spies, stubs, and mocks.

### Reflection (15 Minutes)

Answer the following questions in your notes:

1. What is a **mock**?
2. What is a **stub**? How is a **mock different from a stub**?
3. What is a **spy**?

If you **finish the reflection early**, further **discuss, compare, and contrast** your answers **with your peers**.

## Activity: Sinon Spies Practice (30 minutes)

### Sinon Setup / Challenges

1. Create a **new Node project**:

    ```bash
    mkdir new-project && cd new-project
    npm init
    ```

2. **Install Mocha, Chai, and Sinon** dependencies:

    ```bash
    npm install --save-dev mocha chai chai-http
    ```

3. Open `package.json` and **add the following line** to the `scripts` configuration to ensure `mocha` is used when executing the `npm test` command:

    ```json
    "scripts": {
        "test": "mocha"
    }
    ```

4. **Create a new `test` folder** inside your Node project, and **create a file** named `sample.test.js` inside:

    ```bash
    mkdir test && touch sample.test.js
    ```

5. **Paste the following code** into the blank `sample.test.js` file:

    ```js
    // FILE: sample.test.js

    // TODO: Challenge - add the 2 required imports here.

    function greaterThanFive(num) {
        if (num > 5) return true;
        return false;
    }

    describe('Example Sinon Stub', () => {
        it('should pass', (done) => {
            const greaterThanFive = sinon.stub().returns('something');
            greaterThanFive(0).should.eql('something');
            greaterThanFive(0).should.not.eql(false);
            done();
        });
    });
    ```

6. **Challenge**: Can you **add the code required** at the top of `sample.test.js` to **import the referenced external libraries**, making the above test case run properly?

7. **Run the tests** to ensure they pass.

    ```bash
    $ npm test

    Example Sinon Stub
    ✓ should pass
    ```

## Wrap-Up (5 minutes)

Complete today's challenges and finish any remaining tests for your APIs project. Submit Phase 2 of your API project on [Gradescope](https://gradescope.com).

Fill out our [Vibe Check form](https://make.sc/bew1.3-vibe-check) with any feedback you have for the class.

## Resources & Credits

1. [Chai BDD](https://www.chaijs.com/api/bdd/)
1. [Chai Assert](https://www.chaijs.com/api/assert/)
