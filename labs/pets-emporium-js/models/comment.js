"use strict";

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var CommentSchema = new Schema({
    createdAt       : { type: Date }
  , updatedAt       : { type: Date }

  , body            : { type: String, required: true }
  , pet            : { type: Schema.ObjectId, ref: "Pet"}
});

CommentSchema.pre('save', function(next){
  // SET createdAt AND updatedAt
  var now = new Date();
  this.updatedAt = now;
  if ( !this.createdAt ) {
    this.createdAt = now;
  }
  
  next();
});

module.exports = mongoose.model('Comment', CommentSchema);