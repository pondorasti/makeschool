# Instructions

---

**At the end of this activity you should have successfully implemented Authentication with passport Local Strategy** (_username and password_) **by completing the TODOs in `server.js` and `routes/index.js`**.

To install this starter code on your computer, clone the repository and install dependencies with

```shell
npm install
```

1. Create a **`.env`** file and include the values for port and private key. Check the **`.env-sample`** file for refrence\.

2. In `server.js` on **line 15** inside the the `passport.use()` method, configure passport local strategy\.

    - instiante the LocalStrategy object - `new LocalStrategy()`.
    - pass an anonymous function as its only argument - `new LocalStrategy(()=>{})`
    - pass username, password and cb(callback function) as the arguments in the anonymous function - `new LocalStrategy((username, password, cb) =>{})`
    - put the database query method implementation (`db.findByUsername()`) in the block of the localstrategy object. 
    - Your code should end up looking like this:

    ```javascript
    passport.use(new LocalStrategy((username, password, cb) => {
    db.findByUsername(username, (err, user) => {
        //code to verify user with password here
        // return callback function invoked with a user object - cb(null, user)
    }));
    ```

3. In `server.js`, with `passport.serializeUser()` function and using the `user.id` object, configure passport to serilaize users\.

4. In `server.js` on **line 46**, with `passport.serializeUser()` function and using the `user.id` object, configure passport to serilaize users\.

5. In `server.js` **line 82**, initialize passport with the `passport.initialize()` function\.

6. In `server.js` **line 83**, include the `passport.session()` function to restore authentication state from the session\.

7. Complete the logout route in `routes/index.js`. Use the `req.lgout()` method passport provides. See refrence [here](http://www.passportjs.org/docs/logout/)\.

8. Start the server. Make sure you are in the project's directory in our terminal:

``` shell
npm start
```

Open a web browser and navigate to <http://localhost:3000/> to see the code in action.

**Log in with either of these details:**

>username: **amy**,
>password: **strings**

**OR**

>username: **anne**,
>password: **secret**

## Stretch Challenge

- Try out using passport-github to do github oauth authentication with passport. See refrence [here](http://mherman.org/blog/2013/11/10/social-authentication-with-passport-dot-js/)
