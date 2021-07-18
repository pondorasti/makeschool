const express = require('express')
const messageRoutes = require('./message.js')
const userRoutes = require('./user.js')

const router = express.Router()

router.use('/messages', messageRoutes)
router.use('/users', userRoutes)

module.exports = router