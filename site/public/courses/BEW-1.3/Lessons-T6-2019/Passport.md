# Authentication with Passport.js

## Why You Should Know This

[Passport.js](http://www.passportjs.org/) is an industry-standard authentication library that facilitates authentication via several different protocols including `OAuth`, `Auth0`, and more!

## Learning Objectives (5 Minutes)

1. Identify and describe different Passport.js strategies for authentication.
2. Contrast and compare Passport.js authentication strategies to JWT authentication.
3. Apply a Passport.js strategy of your choice to your Custom API project.

## Overview / TT (30 Minutes)

* Describe the [features](http://www.passportjs.org/features/) that Passport.js provides.
* Demonstrate the plethora of pre-written [strategies](http://www.passportjs.org/packages/) available for authentication.
* Walk through Passport.js implementation using the [documentation](http://www.passportjs.org/docs/) and the accompanying starter pack for today's activity.

## BREAK (10 Minutes)

## In Class Activity (60 Minutes)

1. **Copy** provided [starter pack](https://github.com/Make-School-Courses/BEW-1.2-Authentication-and-Associations/tree/master/Lessons/passport) code into a new repository.
2. **Integrate** a `User` model:
    * **TUTORIAL**: Use [this guide](https://medium.freecodecamp.org/learn-how-to-handle-authentication-with-node-using-passport-js-4a56ed18e81e) to assist you in your quest!
    * **PROTIP**: Try the `passport-local-mongoose` strategy located [here](https://github.com/saintedlama/passport-local-mongoose).
3. **STRETCH**: Try a **different authentication strategy**, like **Facebook** or **GitHub**.
4. Use [Postman](https://getpostman.com) to **test the included `login`, `signup` and `secure` routes** in `controllers/api.js`.
5. If you **finish early**, **integrate** an **authentication** strategy in your **Custom API** project.

## Additional Resources

* **[passport-examples](https://github.com/mjhea0/passport-examples)**: A collection of examples using multiple authentication strategies.
* **[Express and Passport Sessions - Deep Dive](https://www.airpair.com/express/posts/expressjs-and-passportjs-sessions-deep-dive)**: Extra documentation regarding the interaction between the Express and Passport libraries.
