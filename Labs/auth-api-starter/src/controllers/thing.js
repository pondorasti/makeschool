const express = require('express')

const Thing = require('../models/thing.js')

const router = express.Router(); // eslint-disable-line new-cap

// GET /api/thing
router.get('/', (req, res) => {
  Thing.find().then(things => {
    res.send({ things })
  })
})

// TODO: Add more routes.


module.exports = router;
