/**
 * Make sure to read through the readme for instructions
 */


// include express 
const express = require('express')
const cookieParser = require('cookie-parser');

// 2. TODO: Add required jsonwebtoken import here
const jwt = '';

// Starts the express app
const app = express();

//use cookie-parser to populate req.cookies
app.use(cookieParser());

// load environment variables in .env to the app
require('dotenv').config();



// Home Route with login button
app.get('/', (req, res) => {
    res.send(`
    <form action="/login" method="POST">
    Click Me to Log In <br>
    <button type="submit">Log In</button>
    </form>
    <a href="http://localhost:3000/protectedRoute">Protected Route</a>`)
});



app.post('/login', (req, res) => {
    let user = {
        username: 'makeSchoolBEW1.3',
        email: 'makeschoolbew@makeschool.com',

      }
      // 4. TODO: Set and declare the payload
      const payload = ''

    // 5. TODO: Create a token with jwt.sign() function here
    const token = ''

    // Set the token as a browser cookie
    res.cookie('nToken', token, { maxAge: 900000, httpOnly: true });
    res.redirect('/loggedIn');
})

const checkAuth = (req, res, next) => {
    
    const token = req.cookies.nToken;

    //6. TODO: Verify token(inclusde the right parameters in the jwt.verify function), then call next() function when it's done

    jwt.verify(/*pass the token as first argument*/, /*pass the secret key as its second argument*/, (err, decodedToken) => {
        if (err) {
            console.log('Error during authentication: Invalid signature')
            req.user = null
            res.send(`<p>You must be logged in first. Please click on the log in button <a href="http://localhost:3000/">here</a></p>`)
        } else {
            req.user = decodedToken
        }
        // call the next function
    })
}

// User  logged in route
app.get('/loggedIn', checkAuth, (req, res) => {
    res.send('I am logged In');
});


// Protected Route
app.get('/protectedRoute', checkAuth, (req, res) => {
    res.send(`<h1>I can access this route though it is protected because I am still logged In</h1>`);
});



// Server start and listens on port
app.listen(process.env.PORT, () => {
    console.log(`server started at port ${process.env.PORT}`);
  });