/**
 * Make sure to read through the readme for instructions
 */

// include express 
const express = require('express')
const cookieParser = require('cookie-parser');

// load the json webtoken dependency
const jwt = require('jsonwebtoken');

//Start the express app
const app = express();

//use cookie-parser to populate req.cookies
app.use(cookieParser());

// load environment variables in .env to the app
require('dotenv').config();

app.get('/', (req, res) => {
    res.send(`
    <form action="/login" method="POST">
    Click Me to Log In <br>
    <button type="submit">Log In</button>
    </form>
    <a href="http://localhost:3000/protectedRoute">Protected Route</a>`)
});

app.post('/login', (req, res) => {
    // ... code to verify user
    let user = {
        username: 'makeSchoolBEW1.3',
        email: 'makeschoolbew@makeschool.com',

      }
      // Set and declare the payload
      const payload = {username: user.username}
    // Create the token
    const token = jwt.sign(payload, process.env.SECRET, { expiresIn: '2 days' })

    // Set the token as a browser cookie
    res.cookie('nToken', token, { maxAge: 900000, httpOnly: true });
    res.redirect('/loggedIn');
})

const checkAuth = (req, res, next) => {
    // ... code to check that 'nToken' cookie exists

    // Verify token, then call next() function when it's done
    console.log(req.cookies);
    const token = req.cookies.nToken;
    jwt.verify(token, process.env.SECRET, (err, decodedToken) => {
        if (err) {
            console.log('Error during authentication: Invalid signature')
            req.user = null
            res.send(`<p>You must be logged in first. Please click on the log in button <a href="http://localhost:3000/">here</a></p>`)
        } else {
            req.user = decodedToken
        }
        next()
    })
}

app.get('/loggedIn', checkAuth, (req, res) => {
    res.send('I am logged In');
});

app.get('/protectedRoute', checkAuth, (req, res) => {
    res.send(`<h1>I can access this route though it is protected because I am still logged In</h1>`);
});

//app.use(checkAuth)
app.listen(process.env.PORT, () => {
    console.log(`server started at port ${process.env.PORT}`);
  });