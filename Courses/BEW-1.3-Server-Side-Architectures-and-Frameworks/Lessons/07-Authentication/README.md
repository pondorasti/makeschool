# Authentication with JWT (JSON Web Token)

## Learning Objectives

By the end of this lesson, students should be able to...

1. Explain session-based and token-based authentication using real-world analogies.
1. Describe the 3 parts of a JWT token and their purposes.
1. Write code in Node.js to create and verify JWT tokens using the `jsonwebtoken` NPM package.

## Definition of Terms (5 minutes)

Before we watch the video, let's go over some preliminary terminology that will aid in your understanding:

- A **cookie** is any piece of data, usually of type string, that is stored by your browser.
- A **token** is a piece of data passed between client and server, e.g. to validate a user's login state. Usually stored as a browser cookie.

As a class, explore a site such as [Amazon.com](https://amazon.com), as well as a local copy of the Reddit.js tutorial, to understand how cookies work.

## JWT Concepts Video (25 minutes)

Watch [this video](https://www.youtube.com/watch?v=soGRyl9ztjI) on JWT tokens. As you watch, write down definitions of the following terms:

1. Stateless Protocol
1. Session Token
1. JSON Web Token (JWT)

## Activity: Analogies (5 minutes)

Form groups of 3. With your group, come up with 2-3 _analogies_ for authentication. Decide if they are closer to **session tokens** or **JSON Web Tokens**. As a group, choose your favorite analogy.

**EXAMPLE**: Customer service works more like **session tokens**, because the customer is given a _ticket number_, which corresponds to data stored by the company that describes that user's history.

## JWT Format (15 minutes)

Here is an example of a JWT:

<img src="../Assets/jwt.png" width="300px">

It doesn't look much like JSON, does it? That's because it's _encoded_ JSON. We can _decode_ it at any time to get the JSON data back out!

A JWT token has the format of `xxxxxx.yyyyyy.zzzzzz`, where:

- `xxxxxx` is the "header" - typically includes information like the type of token
- `yyyyyy` is the "body", such as the user's login information (username or email).
- `zzzzzz` is the "signature". The signature is formed using the header, the body, and the secret key stored on the server. If the header or body of the token are tampered with, then the signatures will not match.

Explore the [JWT Format](https://jwt.io/) tool as a class to understand how the three parts work together to form the token.

## BREAK (10 minutes)

## Using JWT with Node.js (20 minutes)

To use JSON web tokens, we can use the `jsonwebtoken` NPM package:

```js
const jwt = require('jsonwebtoken');
```

We can create a token with the `jwt.sign()` function:

```js
app.post('/login', (req, res) => {
    // ... code to verify user

    // Create the token
    const payload = { username: user.username }
    const token = jwt.sign(payload, process.env.SECRET, { expiresIn: '60 days' })

    // Set the token as a browser cookie
    res.cookie('nToken', token, { maxAge: 900000, httpOnly: true })
    res.redirect('/')
})
```

Then, we can write a _middleware function_ to verify that the user is logged in, using `jwt.verify()`:

```js
const checkAuth = (req, res, next) => {
    // ... code to check that 'nToken' cookie exists

    // Verify token, then call next() function when it's done
    const token = req.cookies.nToken
    jwt.verify(token, process.env.SECRET, (err, decodedToken) => {
        if (err) {
            console.log('Error during authentication: Invalid signature')
            req.user = null
        } else {
            req.user = decodedToken
        }
        next()
    })
}

app.use(checkAuth)
```

## Work Time (30 minutes)

Work on your [Reddit.js](https://www.makeschool.com/academy/track/reddit-clone-in-node-js) tutorial or your [API Project - Phase 2](Projects/02-Custom-API-Project).

## Wrap-Up

Fill out our [Vibe Check form](https://make.sc/bew1.3-vibe-check) with any feedback you have for the class.

## Resources & Credits

1. [JWT Authentication video](https://www.youtube.com/watch?v=soGRyl9ztjI)
1. [Structure of JWT video](https://www.youtube.com/watch?v=_XbXkVdoG_0)
1. [jsonwebtoken NPM Package](https://www.npmjs.com/package/jsonwebtoken)
1. [Using Cookies Documentation](https://sailsjs.com/documentation/reference/response-res/res-cookie)
