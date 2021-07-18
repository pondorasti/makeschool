# TDD Quick Start

This project contains some simple tests that are run by Mocha and Chai. The concepts here cover the idea of TDD.

## Step by Step

### Step 1: Install Dependencies

To run tests, first install `mocha` and `chai` as `devDependencies`.

```bash
$ npm install --save-dev mocha
$ npm install --save-dev chai
```

### Step 2: Update `scripts` in `package.json`

The following two scripts run tests on all files in all folders named `*.test.js`. Tests are run from commands in `package.json`.

Edit the `scripts` section of your project's `package.json` file:

```json
"test": "mocha **/*.test.js",
"test-watch": "nodemon --exec 'npm test'"
```

### Step 3: Run Tests

With the above added to `package.json`, you can run tests by executing the following command:

```bash
$ npm test
```

Or, simply monitor those tests with `nodemon` by running:

```bash
$ npm run test-watch
```

## Additional Implementation Details

### Async Operations

Testing async operations is a little more difficult than testing synchronous operations. Async actions requires our tests to wait for a reply.

NOTE: If an operation takes longer than 2 secs Mocha will time out and mark the test as failing!

You can extend the time for tests by adding the timeout flag when calling mocha. Add the following flag to your `test` script in `package.json`: `--timeout 5000`

#### `done()`

When testing async operations your test blocks will take `done` as a parameter. Those functions **must call `done()`** when they complete whatever it is they are doing.

##### Example

```js
it('Should return an array of posts', (done) => {
  Post.find({}).then((posts) => {     // Searches for all Posts
    expect(posts).to.be.an('array');  // Expects posts to be an array
    done();                           // On success, call done with no arguments.
  }).catch((err) => {
    done(err);                        // On failure, call done, and provide the error as an argument.
  });
});
```

Calling `done()` tells mocha to move on to the next test. Calling `done(error)` with an error tells mocha the error failed and prints the error.

### Promises and Mocha

Mocha understands and works with Promises. When testing async code, you can **return a promise, omitting the `done` parameter and `catch()` call** at the end.

#### Example

```js
it("Should return an array of posts", () => {
  return Post.find({}).then(posts => {
    // Searches for all Posts
    expect(posts).to.be.an("array"); // Expects posts to be an array
  });
});
```

### `describe()`

You can group tests with the `describe` block. The `describe` block runs tests as a group, and on output, provides a report on the group.

#### Example

```js
describe('testing posts', () => {
  it('should fetch an array of posts');
  it('should add a post');
  it('should remove a post');
});

describe('testing users', () => {
  it('should fetch an array of users');
  it('should add a user');
  it('should remove a user');
});
```

#### Output

```bash
testing posts
  - should fetch an array of posts
  - should add a post
  - should remove a post

testing users
  - should fetch an array of users
  - should add a user
  - should remove a user
```

This will be effected by the reporter! `nyancat`, sadly, does
not make much use of `describe`. Additionally, describe blocks can be nested for further semantic separation.

### Hooks: `before`, `beforeEach()`, `after()`, `afterEach()`

Mocha provides [methods that run before and after tests](https://mochajs.org/#hooks).

These are:

- `before()` - Runs before **all** tests.
- `beforeEach()` - Runs before **each** test.
- `after()` - Runs after **all tests**.
- `afterEach()` - Runs after **each** test.

One might use these functions to accomplish:

- Creating records used in tests.
- Removing records created for tests.

#### Example

```js
let testPost;

before(() => {
  testPost = new Post({ name: "TESTING" });
  return testPost.save();
});

after(() => {
  return testPost.remove();
});
```

The code above creates a new `Post` object **before** the tests run. The new `Post` object is subsequently removed after tests are complete.
