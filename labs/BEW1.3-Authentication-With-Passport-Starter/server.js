var express = require('express');
var passport = require('passport');
const exphbs = require('express-handlebars');
const router = require('./routes/index.js')
const LocalStrategy = require('passport-local').Strategy;
const GithubStrategy = require('passport-github').Strategy;
var db = require('./model/index');

require('dotenv').config()


// TODO: Configure the local strategy for use by Passport.
// Make sure you read instructions in the readme to follow through with the necessary steps

passport.use(
    /*instatiate the LocalStrategy object here. 
    It takes an anonymous function as its only argument.
    This function receives credentials(username and password) and cb(callback function) as  arguments -  */

    db.findByUsername(username, (err, user) => {
        if (err) {
            return cb(err);
        }
        if (!user) {
            return cb(null, false);
        }
        if (user.password != password) {
            return cb(null, false);
        }
        // Return the callback function wuth a user object here
        
    })
);

// TODO: Stretch Challenge- Implememt authentication with passport using GitHub Strategy
passport.use(new GithubStrategy());


// TODO: Configure passport to serialize users with user id.

/* In order to restore authentication state across HTTP requests, 
Passport needs to serialize users into and deserialize users out of the session. 
We would implement this by simply supplying the user id(user.id) when
serializing, and querying the user record by id from the database when
deserializing. */
passport.serializeUser()

passport.deserializeUser((id, cb)=> {
    db.findById(id, (err, user)=>{
        if (err) {
            return cb(err);
        }
        cb(null, user);
    })
})



// Create a new Express application.
var app = express();

// Configure view engine to render EJS templates.
app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');

/* Use application-level middleware for common functionality, including parsing, and session handling.*/

// use express.json and express.urlencoded methods to parse the request body
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// use expressionSession middleware to save the session cookie
const expressSession = require('express-session')({
    secret: 'secret',
    resave: false,
    saveUninitialized: false
});
app.use(expressSession);

// TODO: Initialize Passport and restore authentication state, if any, from the
// session.
app.use(/*include the passport.initialize() function here*/);
app.use(/*include the passport.session() function here*/);

// use app middleware to mount routes to express
app.use(router)


/* Error Handling */
// route to catch all requests on endpoints not defined
app.use('*', (req, res) => {
    res.status(404).json({
      success: false,
      message: 'Resource not found.',
      possibleCauses: [
        'Maybe you got the URL wrong',
        '...',
      ],
    });
  });
  

// eslint-disable-next-line no-unused-vars
app.use((err, req, res, next) => {
    res.status(500).json({
      err,
    });
  });
  
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`App listening on port ${port}`));