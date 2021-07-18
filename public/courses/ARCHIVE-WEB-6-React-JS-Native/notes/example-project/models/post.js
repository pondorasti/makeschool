const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const PostSchema = new Schema({
  name: String,
  path: String,
  originalFileName: String
});

const Post = mongoose.model('post', PostSchema);

module.exports = Post;
