// Style guide: https://github.com/airbnb/javascript

// Import All npm packages at the top.
const express = require('express');
const exphbs = require('express-handlebars');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const shortid = require('short-id');
const fileUpload = require('express-fileupload');
const path = require('path');

// Import local files
const Post = require('./models/post');

// Connect to mongoose
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/postimage', { useMongoClient: true });
mongoose.connection.on('error', console.error.bind(console, 'MongoDB connection Error:'))


// Define top level actions
const app = express();

// initialize middleware.
// Note! Middleware is applied in the order it is initialized order matters!
app.use(express.static('public'));
app.use(express.static('uploads'));
app.use('/uploads', express.static(__dirname + '/uploads'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(fileUpload());

// Set up template engine
app.engine('.hbs', exphbs({
  extname: '.hbs',
  defaultLayout: 'main'
}));
app.set('view engine', '.hbs');


// Controllers
require('./controllers/post-controller')(app);

// Start the App!
app.listen(3000, () => {
  console.log('Server running on port 3000')
});
