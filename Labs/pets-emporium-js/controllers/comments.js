var express = require('express');

var petRouter = express.Router();
// you need to set mergeParams: true on the router, if you want to access params from the parent router
var commentRouter = express.Router({mergeParams: true});

// you can nest routers by attaching them as middleware:
petRouter.use('/:petId/comments', commentRouter);

var Comment = require('../models/comment');
var Pet = require('../models/pet');

// CREATE COMMENT
commentRouter.post('/', function(req, res, next) {
  Pet.findById(req.params.petId).exec(function (err, pet) {
    var comment = new Comment(req.body);

    comment.pet = pet;

    comment.save(function (err) {
      if (err) { return res.status(400).send(err) }

      pet.comments << comment;
      pet.save();
      
      res.send(comment);
    });
  })
});

module.exports = commentRouter;
