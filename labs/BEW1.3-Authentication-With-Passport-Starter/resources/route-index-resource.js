const express = require('express');
const router = express.Router();
const connectEnsureLogin = require('connect-ensure-login');
const passport = require('passport');




// Define routes.

router.get('/',
    (req, res) => {
        res.render('home', { user: req.user });
    });

router.get('/login',
    (req, res) => {
        res.render('login');
    });

router.post('/login',
    passport.authenticate('local', { failureRedirect: '/login' }),
    (req, res) => {
        res.redirect('/');
    });

router.get('/logout',
    (req, res) => {
        req.logout();
        res.redirect('/');
    });


// connectEnsureLogin acting as route guard to make sure the routes can't be accessed if not logged in
router.get('/profile',
    connectEnsureLogin.ensureLoggedIn(),
    (req, res) => {
        res.render('profile', { user: req.user });
    });

router.get('/auth/github',
    passport.authenticate('github'),
    (req, res) => { });
router.get('/auth/github/callback',
    passport.authenticate('github', { failureRedirect: '/login' }),
     (req, res) => {
        res.redirect('/');
    });

module.exports = router;