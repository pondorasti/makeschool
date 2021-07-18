const mongoose = require('mongoose')
const Schema = mongoose.Schema

const UserSchema = new Schema({
    username: { type: String, required: true },
    password: { type: String, select: false },
    messages : [{ type: Schema.Types.ObjectId, ref: "Message" }]
  })

UserSchema.pre('findOne', function (next) {
    this.populate('messages')
    next()
})

UserSchema.pre('find', function (next) {
    this.populate('messages')
    next()
})
  
const User = mongoose.model('User', UserSchema)

module.exports = User