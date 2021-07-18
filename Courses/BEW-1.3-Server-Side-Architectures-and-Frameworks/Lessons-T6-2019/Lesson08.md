# Day 8: Authentication with JWT in Node

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------  | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:25      | TT/Overview               |
| 0:30        | 0:10      | BREAK                     |
| 0:40        | 0:75      | Challenges                |
| 1:55        | 0:05      | Intro HW: API Project     |
| TOTAL       | 2:00      |                           |

## Objectives (5 Minutes)

1. Compare and contrast session based authentication and JSON Web Token (JWT) authentication.
2. Use `express-jwt` to add JWT authentication to an express server.

## Overview (25 Minutes)

### Background

Typically, legacy web technologies use the Cookie-Session method of authentication; however, there is a better way to do communicate authentication. This new way will work better with advanced **Single Page Application** technology like **React**, **Angular**, and **Vue** --- as well as with authentication in **Mobile Apps**. We're going to use an encrypted chunk of JSON called a **JSON Web Token** or JWT
(pronounced ''*jot*'') to communicate logged in/logged out status between the client and server.

![cookie-token-auth](cookie-token-auth.png)
> Reference [auth0.com](https://auth0.com/blog/2014/01/07/angularjs-authentication-with-cookies-vs-token/)

![jwt-diagram.png](jwt-diagram.png)

### Why Use JWT

Aren't you tired of worrying about keeping track of all these things?

1. **Sessions** - JWT **doesn't require sessions.**
2. **Cookies** - JWT allows you to simply **save the token to the client**.
3. **CSRF** - Send the **JWT instead of a CSRF token**.
4. **CORS** - Forget about it! **If the JWT is valid, the data is on its way**.

Additional benefits:

1. **Speed** - Don't have to look up the session.
2. **Storage** - Don't have to store the session.
3. **Mobile Ready** - Apps don't let you set cookies --- but, they _can_ save auth tokens.
4. **Testing** - Logging in is no longer a special case in tests --- just send the token!

### Authentication Process

1. A client **sends a request for authentication**, including credentials.
    - Typical scenario: logging in.
    - The credentials supplied are **username and password**.
2. The **server receives credentials**:
    - The token is a **hash**.
    - It also contains a **secret string or key**.
    - The **secret key can only be unencrypted by the server**.
3. The **client includes the token whenever requesting restricted resources**.
4. The **server verifies the token with each request**.

### JWT FTW

A **JWT is pretty easy to identify**. It is **three strings separated by `.`**:

```js
  aaaaaaaaaa.bbbbbbbbbbb.cccccccccccc
```

Each part has a different significance:

![jwt](jwt.png)

### Example

#### Header

The header typically consists of two parts: **the type of the token**, which is JWT, and the **hashing algorithm being used**, such as HMAC SHA256 or RSA.

```js
const header = {
  "typ": "JWT",
  "alg": "HS256"
}
```

This JSON is `Base64Url` encoded to form the first part of the JWT.

#### Payload

The second part of the token is the **payload**, which **contains the claims**. Claims are statements about an entity (typically, the user) and additional data. There are **three types of claims**: **registered, public, and private claims**.

```js
const payload = {
  "exp": 1300819380,
  "name": "Chris Sevilleja",
  "_id": "3sfas687a789dadf998"
  "admin": true
}
```

#### Signature

To create the signature, you have to **take the encoded header, the encoded payload, a secret, the algorithm specified in the header**, and **sign that**.

If you want to use the HMAC SHA256 algorithm, the signature will be created in the following way:

```js
const encodedString = HMACSHA256(base64UrlEncode(header) + "." + base64UrlEncode(payload), 'aSuperSecretSecretString');
```

> **REMEMBER** The 'secret' acts as an encryption string known only by the two parties communicating via JWT. Protect your secrets!

#### JSON Web Token

The **output is three Base64-URL strings separated by dots** that can be easily passed in HTML and HTTP environments, while being more compact when compared to XML-based standards such as SAML.

The **following shows a JWT that has the previous header and payload encoded**, and it is **signed with a secret**.

```js
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzY290Y2guaW8iLCJleHAiOjEzMDA4MTkzODAsIm5hbWUiOiJDaHJpcyBTZXZpbGxlamEiLCJhZG1pbiI6dHJ1ZX0.03f329983b86f7d9a9f5fef85305880101d5e302afafa20154d094b229f75773
```

### Recap

JSON Web Token (JWT) is a method of representing claims between two parties. Think of it like a receipt that is recognized by the issuer.

In short, JWT a is a format made of three parts:

- algorithm
- payload
- secret key

The token is hashed/encrypted as a string of characters that can only be decrypted by a computer that has access to the secret key.

## Challenges (75 Minutes)

1. **Make a Controller** Create a new controller file called `auth.js` and require it in your main server file.
1. **GET route** - In that new file, create a GET route to `/sign-up`.
1. **Wire up the front end** in your templating language of choice --- for example, Handlebars.

    Create the form, and use vanilla JS and `fetch` to execute an AJAX call when the form is submitted. Need more info? Click [here to learn more about `fetch`](https://scotch.io/tutorials/how-to-use-the-javascript-fetch-api-to-get-data).

    Example code provided below:

    ```html
    <form action="/sign-up" method="POST" onsubmit="return false;">
      <input type="text" size="30" value="" placeholder="username" required>
      <input type="password" size="30" value="" placeholder="password" required>
      <input type="submit" value="Sign In" onclick="signupViaAjax()">
    </form>
    ```

    ```js
    function signupViaAjax() {
      fetch("/sign-up")
        .then(function(data) {
          // Here you get the data to modify as you please
        })
        .catch(function(error) {
          // If there is any error you will catch them here
        });
    }
    ```
1. **POST route** - Now, create a POST route to `/sign-up` and console log if you are receiving the form data in `req.body`.
1. **Create User Model** - Once you are receiving the form data, create a `User` model in `models/user.js` and require it at the top of your `auth.js` file. Here is boilerplate code for the model (REMINDER: do not just copy and paste this code into your project. Read each line and figure out what each line does before using it.). (HINT: You will need to install the [bcryptjs](https://www.npmjs.com/package/bcryptjs) package to your project for bcrypt to work.)
    ```js
    const mongoose = require("mongoose"),
      bcrypt = require("bcryptjs"),
      Schema = mongoose.Schema;

    const UserSchema = new Schema({
      createdAt: { type: Date },
      updatedAt: { type: Date },
      email: { type: String, unique: true, required: true },
      password: { type: String, required: true },
      first: { type: String, required: true },
      last: { type: String, required: true }
    });

    UserSchema.pre("save", function(next) {
      // SET createdAt AND updatedAt
      var now = new Date();
      this.updatedAt = now;
      if (!this.createdAt) {
        this.createdAt = now;
      }

      // ENCRYPT PASSWORD
      var user = this;
      if (!user.isModified("password")) {
        return next();
      }
      bcrypt.genSalt(10, function(err, salt) {
        bcrypt.hash(user.password, salt, function(err, hash) {
          user.password = hash;
          next();
        });
      });
    });

    UserSchema.methods.comparePassword = function(password, done) {
      bcrypt.compare(password, this.password, function(err, isMatch) {
        done(err, isMatch);
      });
    };

    module.exports = mongoose.model("User", UserSchema);

    ```

1. **Create the user** - Now use the `User` model to create a new user in your `/sign-up` POST route. e.g.

    ```js
    const newUser = new User(req.body);

    newUser.save(function (err) {
        if (err) console.log(err);
        // saved!
    });
    ```

1. **Create and Sign the JWT** - Now add the package [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken) to your project and require it at the top of `auth.js`. Now, if the user saves successfully, use `jsonwebtoken` to create and sign a JWT and send it back to the client. Console log your token on the client.

    ```js
    const jwt = require('jsonwebtoken');

    ...
    const token = jwt.sign({ _id: user._id }, 'shhhhhhared-secret');
    ...
    ```

1. **Save the token as a cookie** - Use bower to install [js-cookie](https://github.com/js-cookie/js-cookie) to your client and reference it in your `<head>` with a `<script>` tag. Now you can use the `Cookie` object anywhere in your front end scripts. Use it to save a cookie called `token` of the data returned.

    ```js
    Cookies.set('token', data.token);

    // IF YOU'D LIKE TO REDIRECT NOW, ADD THIS:
    window.location.href = "/";
    ```

1. **Tell server look at cookies for JWT** - Add the [express-jwt](https://github.com/auth0/express-jwt) and the [cookie-parser](https://www.npmjs.com/package/cookie-parser) libraries to your server and include them in your main server file. Use this code to use this middleware and tell it to look at the cookie for a token. Once you save the cookie saved, can you see your cookie in "Application" tab of the Chrome web tools?

    ```js
    const cookieParser = require('cookie-parser');
    ...

    app.use(cookieParser());
    app.use(
      jwt({
        secret: "shhhhhhared-secret",
        getToken: function fromHeaderOrCookie(req) {
          //fromHeaderOrQuerystring
          if (req.headers.authorization && req.headers.authorization.split(" ")[0] === "Bearer") {
            return req.headers.authorization.split(" ")[1];
          } else if (req.cookies && req.cookies.token) {
            return req.cookies.token;
          }
          return null;
        }
      }).unless({ path: ["/", "/login", "/sign-up"] })
    );
    ```

1. **Test a Secure a Route** - Make a new route called `/bananas`, and have it send back the text "I love bananas". Now navigate to it without being logged in. **What happens when you navigate to `/bananas` in your browser?**
1. **Repeat the above process** for the **`/login` route**.
1. **Stretch Challenge**: Can you **create a link/button** that, _when clicked_, **logs the user out**?

## After Class

Read through the requirements, and begin brainstorming ideas for your  [Custom API Project](../Projects/02-Custom-API-Project.md).

## Additional Resources

- [jwt.io](http://jwt.io/)
- [scotch.io tutorial](https://scotch.io/tutorials/the-anatomy-of-a-json-web-token)
- [JWT Express Node Mongoose](http://blog.matoski.com/articles/jwt-express-node-mongoose/)
- [Can JWT be used for sessions?](https://medium.com/@yuliaoletskaya/can-jwt-be-used-for-sessions-4164d124fe23)
- [JWT: Where to Store Tokens](https://auth0.com/docs/security/store-tokens)
