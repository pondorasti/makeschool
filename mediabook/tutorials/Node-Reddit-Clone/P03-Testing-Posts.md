---
title: "Testing Posts"
slug: testing-posts
---

So now we can create and show posts, but we are never done with code until we've written automated tests for it. So we'll have to setup our test environment and make a few controller- or route-level tests.

# Installing Mocha and Chai & Hello World Test

Mocha.js is a test framework for Node.js, and Chai.js is an assertion library that does the work of determining whether a test passes or fails. `chai-http` makes it easy for us to make test http requests to our server. Let's add them to our project and run our first test.

> [action]
> We're going to add these to our `devDependencies` in our `package.json` file because we don't need the testing libraries in production.
>
```bash
$ npm install mocha chai chai-http -D
```
>
> Note: `-D` is just a shorthand for `--save-dev`. Both save the package to our devDependencies
>
Now create a folder called `test` in the root of your project.
>
> Add a file to your new `test` folder called `index.js` and let's require our testing libraries and then create our first `hello world` style test.
> We can use `assert`, `expect`, or `should`. Check out this [Stack Overflow article](https://stackoverflow.com/questions/21396524/what-is-the-difference-between-assert-expect-and-should-in-chai) to get a better understanding of the differences. In this tutorial we will use `should`.
> Using destructuring, we will import `describe` and `it` from mocha in order to keep our linter happy.
>
```js
// test/index.js
const chai = require('chai');
const chaiHttp = require('chai-http');
const { describe, it } = require('mocha');
const app = require('../server');
const agent = chai.request.agent(app);
>
const should = chai.should();
>
chai.use(chaiHttp);
>
describe('site', function () {
  // Describe what you are testing
  it('Should have home page', function (done) {
    // Describe what should happen
    // In this case we test that the home page loads
    agent
      .get('/')
      .end(function (err, res) {
        if (err) {
          return done(err);
        }
        res.should.have.status(200);
        return done(); // Call done if the test completed successfully.
      });
  });
});
```

This test tests that the response should have a status of 200 - which if you recall your HTTP status codes, means the response is successful.

>[info]
> Notice we did **not** use `ES6` syntax for our anonymous functions in our tests. That is because using arrow functions is [discouraged in Mocha](https://mochajs.org/#arrow-functions), as they make it so that `this` cannot access the Mocha context.
>
> What is happening to `this` to cause the issue? Hint: it relates to scope.

Before we can run **any** of our tests, we're going to need to add a line to `server.js` that exports our `app` variable that `mocha` needs in order to successfully run our tests.

> [action]
> Add this line to the bottom of `server.js`:
>
```js
module.exports = app;
```

Now let's run the test.

> [action]
>First update your `package.json` file to have a test command:
>
```json
"scripts": {
  "test": "mocha --exit"
},
```
>
> Note: the `--exit` command exits the tests after they are done

In order for this test to run the server will have to be running on `localhost 3000`, so make sure you've killed `nodemon` before running your tests.

>[action]
> Now we can run our tests with:
>
```bash
$ npm run test
```

What was the result? Can you make the test fail?

# Testing /Posts/Create

Next let's make a test for the `/posts/create` route we made. We can make a new file in `test` called `posts.js`.

>[action]
> Create `/test/posts.js` with some boilerplate code that we'll need for testing
>
```js
// test/posts.js
const chai = require('chai');
const chaiHttp = require('chai-http');
const { describe, it } = require('mocha');
const agent = chai.request.agent(app);
>
// Import the Post model from our models folder so we
// we can use it in our tests.
const Post = require('../models/post');
const app = require('../server');
>
const should = chai.should();
>
chai.use(chaiHttp);
>
describe('Posts', function () {
  // Post that we'll use for testing purposes
  const newPost = {
    title: 'post title',
    url: 'https://www.google.com',
    summary: 'post summary'
  };
  it('should create with valid attributes at POST /posts/new', function (done) {
    // TODO: test code goes here!
  });
});
```

Let's think about what we want our test to...well, test. It can be helpful to think about test parameters in pseudocode so that we don't get bogged down in code just yet:

```js
// How many posts are there now?
// Make a request to create another
// Check that the database has one more post in it
// Check that the response is successful
```

Now let's take this pseudocode and make something of it! For these tests we're going to take advantage of a lot of `mongoose`'s built in functions, such as [estimatedDocumentCount](https://mongoosejs.com/docs/api.html#model_Model.estimatedDocumentCount).

> [action]
> Fill in the `it` statement to fulfill the needs of the pseudocode:
>
```js
it('Should create with valid attributes at POST /posts/new', function(done) {
  // Checks how many posts there are now
  Post.estimatedDocumentCount()
    .then(function (initialDocCount) {
      agent
        .post('/posts/new')
        // This line fakes a form post,
        // since we're not actually filling out a form
        .set('content-type', 'application/x-www-form-urlencoded')
        // Make a request to create another
        .send(newPost)
        .then(function (res) {
          Post.estimatedDocumentCount()
            .then(function (newDocCount) {
              // Check that the database has status 200
              res.should.have.status(200);
              // Check that the database has one more post in it
              newDocCount.should.equal(initialDocCount + 1)
              done();
            })
            .catch(function (err) {
              done(err);
            });
        })
        .catch(function (err) {
          done(err);
        });
    })
    .catch(function (err) {
        done(err);
    });
});
```

This is a good test, but there's one problem: **each time we run our test suite we will be creating this post**. We need to make sure we **delete** this post **after** we run the test. We can use `mongoose`'s [findOneAndDelete](https://mongoosejs.com/docs/api.html#model_Model.findOneAndDelete) function to easily help us with this, as well as Mocha's [after hook](https://mochajs.org/#hooks), which is used to clean up after tests have finished running.

> [action]
> Update your test to remove the `post` at the by utilizing mocha's `after` hook:
>
```js
it('Should create with valid attributes at POST /posts/new', function(done) {
>
...
>
});
>
after(function () {
  Post.findOneAndDelete(newPost);
});
```
>
> Also add `after` to your deconstruction of `require('mocha')` to rid yourself of any linter warnings

Now we have a test for the `/posts/create` route that should be green! Can you make it fail? How about if our `post` object doesn't have a title, url, or summary? Those are all required fields. What do you see if you change that and run the test? Does it fail? How do you know what made it fail?

When a controller or route test runs, it runs itself and it hits your server endpoint code locally. That means you can put `console.log` or `debugger` statements in either one to check various values.

# Now Commit

```bash
$ git add .
$ git commit -m 'Post tests implemented'
$ git push
```

Great test writing! With these tests written you've successfully **implemented more intricate tests for your CRUD app!** Now let's add some more complexity to this app. Onward!
