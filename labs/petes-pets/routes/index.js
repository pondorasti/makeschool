const Pet = require('../models/pet');

module.exports = (app) => {

  /* GET home page. */
  app.get('/', (req, res) => {
    Pet.find().exec((err, pets) => {
      res.render('pets-index', { pets: pets });    
    });
  });
}
