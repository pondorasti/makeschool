var express = require('express');
var router = express.Router();

var Pet = require('../models/pet');

/* GET home page. */
router.get('/', function(req, res, next) {
  Pet.find().exec(function (err, pets) {
    res.render('pets-index', { pets: pets });
  })
});

module.exports = router;
