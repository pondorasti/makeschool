# Databases Pt. 1

## Agenda

1. Learning Objectives
1. Databases using Mongoose (20 Minutes)
1. Activity: Create an Events app (30 Minutes)
1. BREAK (10 Minutes)
1. Activity: Tutorial Time (50 Minutes)
1. Resources & Credits

## Learning Objectives

By the end of this class, students will be able to...

1. Use Mongoose models to represent data using a variety of types.
1. Use the `find`, `findOne`, etc. functions to query Mongoose objects.
1. Practice writing routes to return database objects.

## Databases using Mongoose (20 Minutes)

In this class, we will be using [Mongoose](https://mongoosejs.com/docs/models.html) models to represent our data.

Let's take a look at the syntax for creating models.

```js
const mongoose = require('mongoose')

var eventSchema = new mongoose.Schema({
    eventName: {type: 'string', required: true},
    dateTime: {type: 'Date', required: true},
})
var Event = mongoose.model('Event', eventSchema)
```

We can create a new Event object as follows:

```js
const myEvent = new Event({
    eventName: 'Make School Demo Night',
    dateTime: new Date(2020, 2, 6, 18, 30, 0) // March 6, 2020 at 6:30PM
})

myEvent.save() // Save to our Mongoose database
```

Filtering our models results in a `Promise` object which we will need to resolve:

```js
Event.findOne({ eventName: 'Make School Demo Night' })
.then(demoNightEvent => {
    console.log(demoNightEvent)
})
```

We can also update an existing model object:

```js
Event.findOneAndUpdate(
    { eventName: 'Make School Demo Night' }, // How to find the event
    {dateTime: new Date(2020, 6, 6, 18, 30, 0)} // What to change
)
.then(demoNightEvent => {
    console.log(demoNightEvent)
}
```

Or delete it:

```js
Event.findOneAndDelete({ eventName: 'Make School Demo Night' })
.then(result => {
    console.log('Successfully deleted.')
})
```

## Create a Messages API (30 Minutes)

Clone the [starter code](https://github.com/meredithcat/messages-api-starter) to get started with this activity. Open the directory in your terminal and run `npm install`. The starter code already includes code to set up the Mongoose connection; all we need to do is add the models and modify the routes.

To start off, visit your endpoints in Postman to see how you can interact with them. There are CRUD endpoints for the `User` resource and the `Message` resource - however, those resources haven't actually been written yet!

### User Model

Add the following code to `src/models/user.js`. For now, we'll be storing our passwords in plaintext, which is not very secure! We'll fix that in a future lesson.

```js
const UserSchema = new Schema({
  username: { type: String, required: true },
  password: { type: String, select: false }
})

const User = mongoose.model('User', UserSchema)

module.exports = User
```

Then modify the routes in `src/routes/user.js` as follows:

```js
const User = require('../models/user')

router.get('/', (req, res) => {
    User.find().then((users) => {
        return res.json({users})
    })
    .catch((err) => {
        throw err.message
    });
})

router.get('/:userId', (req, res) => {
    console.log(`User id: ${req.params.userId}`)
    User.findById(req.params.userId).then((user) => {
        return res.json({user})
    })
    .catch((err) => {
        throw err.message
    });
})

router.post('/', (req, res) => {
    let user = new User(req.body)
    user.save().then(userResult => {
        return res.json({user: userResult})
    }).catch((err) => {
        throw err.message
    })
})

router.put('/:userId', (req, res) => {
    User.findByIdAndUpdate(req.params.userId, req.body).then((user) => {
        return res.json({user})
    }).catch((err) => {
        throw err.message
    })
})

router.delete('/:userId', (req, res) => {
    User.findByIdAndDelete(req.params.userId).then(() => {
        return res.json({
            'message': 'Successfully deleted.',
            '_id': req.params.userId
        })
    })
    .catch((err) => {
        throw err.message
    })
})
```

### Activity: Message Model

Using the existing code as a reference, write the `Message` model and modify the routes to execute the CRUD operations on `Message` objects. A `Message` should have the required fields of `title`, `body`, and `author`.

### Connecting our Models

We want to specify that there is a one-to-many relationship between `Message` and `User` (that is, a user can have many messages, but a message can have only one author).

In `models/message.js`, add the following to the model definition:

```js
const MessageSchema = new Schema({
  // ...
  author : { type: Schema.Types.ObjectId, ref: "User", required: true },
})
```

Then in `models/user.js`, add the following:

```js
const UserSchema = new Schema({
  messages : [{ type: Schema.Types.ObjectId, ref: "Message" }]
})
```

Then, in `routes/message.js`, let's make sure that the `User` model is updated whenever we add a new message:

```js
/** Route to add a new message. */
router.post('/', (req, res) => {
    let message = new Message(req.body)
    message.save()
    .then(message => {
        return User.findById(message.author)
    })
    .then(user => {
        console.log(user)
        user.messages.unshift(message)
        return user.save()
    })
    .then(_ => {
        return res.send(message)
    }).catch(err => {
        throw err.message
    })
})
```

Let's try it out in Postman!

Finally, let's make sure that whenever we make a query for users, we see that user's messages as well. Add the following to `models/user.js`:

```js
UserSchema.pre('findOne', function (next) {
    this.populate('messages')
    next()
})

UserSchema.pre('find', function (next) {
    this.populate('messages')
    next()
})
```

## BREAK (10 minutes)


## Activity: Tutorial Time (50 Minutes)

Use this time to get caught up on the Reddit.js tutorial (or keep going, if you have already finished Part 3). Your instructor will come around to assist!

In the last 20 minutes, go over the tutorial Parts 1-3 as a class and discuss.

## Wrap-Up

Fill out our [Vibe Check form](https://make.sc/bew1.3-vibe-check) with any feedback you have for the class.

## Resources & Credits

1. [Mongoose Models](https://mongoosejs.com/docs/models.html)
1. [Mongoose Queries](https://mongoosejs.com/docs/queries.html)
1. [Mongoose: Working with Dates](https://mongoosejs.com/docs/tutorials/dates.html)
1. [JavaScript Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
1. [Moment.js](https://momentjs.com/)