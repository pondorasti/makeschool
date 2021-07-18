var express = require('express');
var router = express.Router();

var User = require('../models/user');
var Pet = require('../models/pet');

var jwt = require('jsonwebtoken');

// LOGIN FORM
// '/sessions/new'
router.get('/login', function(req, res, next) {
  res.render('users-login');
});

// LOGIN POST
// '/sessions'
router.post('/login', function(req, res, next) {
  // jwt.decode(req.token);
  console.log(req.body)
  User.findOne({ email: req.body.email }, function (err, user) {
    user.comparePassword(req.body.password, function (err, isMatch) {
      if (!isMatch) {
        return res.status(401).send({ message: 'Wrong email or password' });
      }
      var token = jwt.sign({ _id: user._id }, 'shhhhhhared-secret');
      res.send({ token: token });
    });
  })
});

// SIGN UP FORM
// '/users/new'
router.get('/sign-up', function(req, res, next) {
  res.render('users-sign-up');
});

// SIGN UP POST
// '/users'
router.post('/sign-up', function(req, res, next) {
  // Create User and JWT
  var user = new User(req.body);

  user.save(function (err) {
    if (err) { return res.status(400).send(err) }

    var token = jwt.sign({ _id: user._id }, 'shhhhhhared-secret');

    res.send({ token: token });
  })
});


module.exports = router;
