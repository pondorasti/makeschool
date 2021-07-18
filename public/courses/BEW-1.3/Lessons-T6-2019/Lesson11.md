# Day 11: Testing Authentication & Authorization

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:20      | Initial Exercise          |
| 0:25        | 0:20      | Overview                  |
| 0:00        | 0:25      | In Class Activity I       |
| 0:00        | 0:10      | BREAK                     |
| 0:00        | 0:40      | In Class Activity II      |
| 0:00        | 0:00      |                           |
| TOTAL       | 0:80      |                           |

## Learning Objectives (5 Minutes)

## Initial Exercise (20 Minutes)

### Reading (10 Minutes)

Please read this article on [How to Test NodeJS Apps using Mocha, Chai and SinonJS](https://scotch.io/tutorials/how-to-test-nodejs-apps-using-mocha-chai-and-sinonjs). Primarily focusing on a modern-day approach to testing in JavaScript, this article contains quite a bit of review with regards to what we covered on [Day 9](Lesson09.md). Keen eyes will also note that this article  **introduces more advanced topics** that we'll **dive into during today's lesson**!

### Reflection (10 Minutes)

Answer the following questions in your notes:

1. What is a **mock**?
2. What is a **stub**? How is a **mock different from a stub**?
3. What is a **spy**?

If you **finish the reflection early**, further **discuss, compare, and contrast** your answers **with your peers**.

## Overview / TT (20 Minutes)

### Integration Testing

#### Setup and Syntax

Picking up where we left off on [Day 9](Lesson09.md), Mocha will remain our test runner of choice. Remember, by default, Mocha will run all tests present in the `test` directory of your project. If no `test` directory exists, you should manually create one, placing the `*.js` files containing your tests within that directory.



#### Fixtures

#### Promises

## In Class Activity I (25 Minutes)

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

8. **Challenge**: Using the provided code as a guide, can you **create a more sophisticated function**, then **write the corresponding test(s)**?
    1. Create a **new file** in the `test` directory to contain your function and test(s): `challenge.test.js`.
    2. Write a **custom function** to test.
    3. Write a **Sinon stub** to **encapsulate your test cases**.
    4. Write at **least two test cases** that ascertain that your new custom function works!

## BREAK (10 Minutes)

## In Class Activity II (40 Minutes)

### Example: Testing Controllers

1. `app.js`

    ```js
    const express = require('express');
    const app = express();
    const PORT = env.process.PORT || 8080;

    app.get('/', (req, res) => {
        res.send({
            message: 'Hello, world!'
        });
    });

    app.listen(port, () => {
        console.log(`Listening on localhost:${port}`);
    })

    module.exports = app;
    ```

1. `app.tests.js`
    ```js
    const chai = require('chai');
    const expect = chai.expect;
    const chaiHttp = require('chai-http');
    const app = require('../app.js');

    chai.use(chaiHttp);

    // Describe is like a container for our tests.
    describe('Hello World Route Test', () => {

        // Test Case 1
        it('Returns a 200 Response', (done) => {
            chai.request(app)
                .get('/')
                .end((error, response) => {
                    if (error) done(error);
                    expect(response).to.have.status(200);
                    done();
                });
        });

        // Test Case 2
        it('Returns a "Hello World" message', (done) => {
            chai.request(app)
                .get('/')
                .end((error, response) => {
                    if (error) done(error);
                    expect(response.body).to.be.deep.equal({
                        message: 'Hello, world!'
                    });
                    done();
                });
        });
    });
    ```

### Challenges

## After Class

Continue to practice Test Driven Development by **implementing authentication and authorization test cases** for your [Custom API Project](../Projects/02-Custom-API-Project.md).

## Additional Resources

* [SinonJS Documentation](https://sinonjs.org/releases/v6.3.3/) - Latest **official documentation** for SinonJS.
* [2018: Stubs, Spies, and Mocks in JavaScript](https://www.harrymt.com/blog/2018/04/11/stubs-spies-and-mocks-in-js.html) - Blog post on **how to use Stubs, Spies and Mocks for JavaScript tests**.
* [GitHub: JS Mocking Demo Repo](https://github.com/harrymt/js-mocking-demo) - **Example repository** containing **working code** that **integrates `Mocha`, `Chai`, and `SinonJS`**.
* [GitHub: Mocha, Chai and SinonJS Example Repo](https://github.com/joykare/testing-node-apps) - The **commits** on this repo are **very descriptive**. You can **use them to see different testing scenarios** in action.
* [GitHub: `chai-as-promised` Library](https://github.com/domenic/chai-as-promised) - **Chai as Promised** extends Chai with a fluent language for **asserting facts about promises**.
* [Stubbing HTTP Requests with Sinon](https://mherman.org/blog/stubbing-http-requests-with-sinon/)
* [Stubbing Node Authentication Middleware with Sinon](https://mherman.org/blog/stubbing-node-authentication-middleware-with-sinon/)
* [VSCode Extension: Mocha Sidebar](https://marketplace.visualstudio.com/items?itemName=maty.vscode-mocha-sidebar)
