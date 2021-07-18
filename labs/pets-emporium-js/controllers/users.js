var express = require('express');
var router = express.Router();
var User = require('../models/user');

// USERS
router.get('/', function(req, res, next) {
  User.find().exec(function (err, users) {

    res.render('users-index', { users: users });
  });
});

module.exports = router;
