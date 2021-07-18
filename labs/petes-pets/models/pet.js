"use strict";

const mongoose = require('mongoose'),
        Schema = mongoose.Schema;

const PetSchema = new Schema({
    name            : { type: String, required: true }
  , species         : { type: String }
  , birthday        : { type: Date }
  , picUrl          : { type: String }
  , picUrlSq        : { type: String }
  , favoriteFood    : { type: String }
  , description     : { type: String }
},
{
  timestamps: true
});

module.exports = mongoose.model('Pet', PetSchema);
