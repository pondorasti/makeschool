const express = require('express');
const exphbs  = require('express-handlebars');
const bodyParser = require('body-parser')
const methodOverride = require('method-override')

const app = express();

//VIEW ENGINER
app.engine('.hbs', exphbs({extname: '.hbs', defaultLayout: 'main'}));
app.set('view engine', '.hbs');

// BODYPARSER parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// METHOD-OVERRIDE
app.use(methodOverride('_method'))

// var events = [
//   { title: "I am your first event", desc: "A great event that is super fun to look at and good", imgUrl: "https://cdn.pixabay.com/photo/2018/05/31/12/02/celebration-3443810_1280.jpg" },
//   { title: "I am your second event", desc: "A great event that is super fun to look at and good", imgUrl: "https://cdn.pixabay.com/photo/2018/05/31/12/02/celebration-3443810_1280.jpg" },
//   { title: "I am your third event", desc: "A great event that is super fun to look at and good", imgUrl: "https://cdn.pixabay.com/photo/2018/05/31/12/02/celebration-3443810_1280.jpg" }
// ]

const models = require('./db/models');

require('./controllers/events.js')(app, models);
require('./controllers/comments.js')(app, models);
require('./controllers/rsvps.js')(app, models);


app.listen(process.env.PORT || 3000);
