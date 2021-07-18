const express = require('express')
const router = express.Router()
const User = require('../models/user')

/** Route to get all users. */
// GET localhost:3000/users/
router.get('/', (req, res) => {
    User.find().then((users) => {
        return res.json({users})
    })
    .catch((err) => {
        throw err.message
    });
})

/** Route to get one user by id. */
// GET localhost:3000/users/:userId
router.get('/:userId', (req, res) => {
    User.findOne({_id: req.params.userId})
    .then(result => {
        res.json(result)
    }).catch(err => {
        throw err.message
    })
})

/** Route to add a new user to the database. */
router.post('/', (req, res) => {
    // POST localhost:3000/users/
    let user = new User(req.body)
    user.save().then(userResult => {
        return res.json({user: userResult})
    }).catch((err) => {
        throw err.message
    })
})

/** Route to update an existing user. */
// PUT localhost:3000/users/:userId
router.put('/:userId', (req, res) => {
    User.findByIdAndUpdate(req.params.userId, req.body).then(() => {
        return User.findOne({_id: req.params.userId})
    }).then((user) => {
        return res.json({user})
    }).catch((err) => {
        throw err.message
    })
})

/** Route to delete a user. */
// DELETE localhost:3000/users/:userId
router.delete('/:userId', (req, res) => {
    User.findByIdAndDelete(req.params.userId).then((result) => {
        if (result === null) {
            return res.json({message: 'User does not exist.'})
        }
        return res.json({
            'message': 'Successfully deleted.',
            '_id': req.params.userId
        })
    })
    .catch((err) => {
        throw err.message
    })
})

module.exports = router

