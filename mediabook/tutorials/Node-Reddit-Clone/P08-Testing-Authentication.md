---
title: "Testing Authentication"
slug: testing-authentication
---

So we can do authentication, but what if the next time we turn around, this feature breaks? How would we catch it? The answer is more automated tests!

So it is really fun to test things right!?

Maybe not so fun, but writing tests is a critical skill for a young engineer. At almost all companies, all code must have tests that go along with it. And at many companies, young engineers are tasked with writing tests and crushing bugs for their first few weeks, so knowing how to test well will make you a very hirable and quick-to-ramp employee.

# Testing Authentication

Testing RESTful routes for a regular resource is pretty straightforward. There might be some quirks, but pretty much you just `GET`, `POST`, `PUT`, and `DELETE` data and verify that the responses are successful.

With authentication, however, testing gets a little more complicated. You have to check that `JWTs` are creating, that passwords are correct, and then you have to be prepared to test authorization.

The biggest challenge is tracking the `cookie` set by the server when a user logs in. In order to handle this `cookie` we can use `chai`'s [request agent](https://github.com/chaijs/chai-http#retaining-cookies-with-each-request) functionality to track the cookie in our tests.

> [action]
> Create the file `test/auth.js`. Within, we'll require the libraries we're going to need.
>
```js
// test/auth.js
const chai = require('chai');
const chaiHttp = require('chai-http');
const { describe, it } = require('mocha');
const app = require('../server');
>
const should = chai.should();
>
chai.use(chaiHttp);
>
// Agent that will keep track of our cookies
const agent = chai.request.agent(app);
>
const User = require('../models/user');
>
describe('User', function () {
  // TESTS WILL GO HERE.
});
```

We can now write our first test that verifies that you cannot login if you haven't signed up yet.

> [action]
> Add this test within your `User` block:
>
```js
it('should not be able to login if they have not registered', function (done) {
  agent.post('/login', { email: 'wrong@example.com', password: 'nope' }).end(function (err, res) {
    res.should.have.status(401);
    done();
  });
});
```

Let's add a slightly more complex one: signing up a user!

> [action]
> Add this `signup` test to `test/auth.js`:
>
```js
// signup
it('should be able to signup', function (done) {
  User.findOneAndRemove({ username: 'testone' }, function() {
    agent
      .post('/sign-up')
      .send({ username: 'testone', password: 'password' })
      .end(function (err, res) {
        console.log(res.body);
        res.should.have.status(200);
        agent.should.have.cookie('nToken');
        done();
      });
  });
});
```

It's important to note that the server started by the `agent` will not automatically close following the completion of your tests. It's important that we close down the agent after the tests to ensure the program exits appropriately.

>[action]
> Add an `after` hook to your `auth` tests:
>
```js
after(function () {
  agent.close();
});
```
>
> Do not forget to add `after` to your require statement.

# Now Commit

```bash
$ git add .
$ git commit -m 'Implemented initial authentication tests'
$ git push
```

Before we go any further, try running your tests. Remember you need to kill `nodemon` first and then run `npm run test`.

Your `auth` tests should work fine, but notice that your `posts` test around creating a new post doesn't work anymore! This is because the way the test is currently written, you're not logged in and trying to post! Let's fix this before moving on.

# Updating Posts Tests

Let's revisit our `/test/posts` file and see what needs to be done in order to get it up and running again.

First, we want to make sure we're using the `agent` that we used in our last `auth` tests, otherwise we'll have no way to pass cookies (like the kind that pass login information)

>[action]
> Add the following line to the top of the file as the last `const`:
>
```js
const agent = chai.request.agent(app);
```

Now we need to make sure we have a user.

>[action]
> Add the following `user` below the `newPost const`:
>
```js
const newPost = {
...
}
>
// User that we'll use for testing purposes
const user = {
  username: 'poststest',
  password: 'testposts',
};
```

Next we need to add a `before` hook. Much like the `after` hook cleans up our tests, `before` sets up anything we need in order for the tests to run, before the tests actually run.

> [action]
> Underneath your new `user const`, add the following `before` hook that signs up a user:
>
```js
before(function (done) {
  agent
    .post('/sign-up')
    .set('content-type', 'application/x-www-form-urlencoded')
    .send(user)
    .then(function (res) {
      done();
    })
    .catch(function (err) {
      done(err);
    });
});
```
>
> Remember to require `before` from `mocha` at the top of the file

Almost finished, just have to clean up now. Much like we deleted the test post in our `after` hook, we have to also delete the test user now too, in addition to closing the `agent`.

> [action]
> Require your user model file at the top of the file 
>
```js
const User = require('../models/user');
```
>
> Replace your `after` hook with the following code block:
>
```js
after(function (done) {
  Post.findOneAndDelete(newPost)
  .then(function () {
    agent.close();
>
    User
      .findOneAndDelete({
        username: user.username,
      })
      .then(function () {
        done();
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

Try running your tests again. They should all pass now that the agent has the JWT cookie!

It's important to remember that when you add new functionality, it's helpful to go back and make sure your previous functionality (and tests) work as expected.

# Now Commit

```bash
$ git add .
$ git commit -m 'Fixed posts test'
$ git push
```

Let's finish up our other tests back in `test/auth`!

# Testing Login and Logout

What should we test next? Logging in!

Next, write a test that verifies that your login implementation works properly:

> [action]
> Add this `login` test to `test/auth.js`:
>
```js
// login
it('should be able to login', function (done) {
  agent
    .post('/login')
    .send({ username: 'testone', password: 'password' })
    .end(function (err, res) {
      res.should.have.status(200);
      agent.should.have.cookie('nToken');
      done();
    });
});
```

Can you make the test red (not pass) and then green (pass)?

Finally, we write a test to verify that the logout functionality works as expected.

> [action]
> Add this `logout` test to `test/auth.js`:
>
```js
// logout
it('should be able to logout', function (done) {
  agent.get('/logout').end(function (err, res) {
    res.should.have.status(200);
    agent.should.not.have.cookie('nToken');
    done();
  });
});
```

# Now Commit

```bash
$ git add .
$ git commit -m 'Implemented remaining authentication tests'
$ git push
```

You have successfully **implemented tests for authentication flows!** If you feel like your tests aren't strong enough, and want to make your tests more robust (you know you want to), check out the challenges below:

# Stretch Challenges

> [challenge]
>
> 1. Can you write another test to test that it is impossible to create a post if a user is not logged in?
>
> 1. Can you make all of your `auth` tests not pass, and then pass? What about your newly updated `post` test?
