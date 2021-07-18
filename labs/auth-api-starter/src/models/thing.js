const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// TODO: Replace this with actual model

const ThingSchema = new Schema({
  name: { type: String }
})

Thing = mongoose.model('Thing', ThingSchema);

module.exports = Thing;