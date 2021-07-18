const User = require('./model/User');
const passport = require('passport');

/* Passport Local Authentication */

// make passport use local strategy. The createStrategy() is a helper method that comes from passport-local-mongoose
passport.use(User.createStrategy());

// sserialize and deserialize user instance
passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());
