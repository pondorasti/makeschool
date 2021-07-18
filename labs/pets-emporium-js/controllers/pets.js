var express = require('express');
var router = express.Router();
var Pet = require('../models/pet');

// PETS NEW
router.get('/new', function(req, res, next) {
  res.render('pets-new');
});

// PETS SHOW
router.get('/:id', function(req, res, next) {
  Pet.findById(req.params.id).populate('comments').exec(function (err, pet) {

    res.render('pets-show', { pet: pet });
  });
});


// CREATE POST
router.post('/', function(req, res, next) {
  var pet = new Pet(req.body);

  pet.save(function (err) {
    if (err) { return res.status(400).send(err) }
    
    res.send(pet);
  });
});

module.exports = router;
