var express = require('express');
var hbs = require('express-hbs');
var db = require('sqlite');
var Promise = require('bluebird');
var cookieParser = require('cookie-parser');


var app = express();

app.engine('hbs', hbs.express4({
  partialsDir: __dirname + '/public/partials'
}));
app.set('views', __dirname + '/public');
app.set('view engine', 'hbs');

app.use(express.static('images'));
app.use(express.urlencoded({ extended: true })); // to support URL-encoded bodies
app.use(cookieParser('secretsecret'));

app.get('/', async (req, res, next) => {
  try {
    let posts = await db.all("SELECT * FROM Post");
    let login = req.signedCookies && req.signedCookies.logged;

    if (login) {
      let result = await db.get("SELECT name FROM User WHERE login = '"+login+"'");
      let is_admin = result && result.name && (result.name == 'Cool Admin');
      let msg = req.query.msg;

      res.render('index', {
        is_admin: is_admin,
        username: result && result.name,
        posts: posts,
        msg: msg,
      });
    } else {
      res.render('index', { username: null, bg_color: req.query.bg, posts: posts });
    }
  } catch (err) {
    next(err);
  }
});

app.post('/', async (req, res, next) => {
  // console.log(req.body);
  try {
    // const users = await db.all('SELECT * FROM User');
    // console.log(users);

    let login = req.body.inputEmail;
    let password = req.body.inputPassword;
    let result = null;
    let posts = await db.all("SELECT * FROM Post");

    if (login && password) {
      // console.log(login);
      // console.log(password);
      result = await db.get("SELECT name FROM User WHERE login = '"+login+"' AND password = '"+password+"'");
    }

    let is_admin = result && result.name && (result.name == 'Cool Admin');

    res.cookie('logged', login, { maxAge: 900000, signed: true });

    res.render('index', {
      is_admin: is_admin,
      username: result && result.name,
      posts: posts,
    });

  } catch (err) {
    next(err);
  }
});

app.get('/logout', (req, res, next) => {
  try {
    res.clearCookie('logged');
    res.redirect('/');
  } catch (err) {
    next(err);
  }
});

app.post('/posts', async (req, res, next) => {
  try {
    let title = req.body.inputTitle;
    let body = req.body.inputBody;
    let result = null;

    if (title && body) {
      result = await db.run("INSERT INTO Post (title, body) VALUES('"+title+"', '"+body+"')");
    }

    let msg = !!result ? 'Post created with success' : 'Error creating post';

    res.redirect('/?msg='+msg);

  } catch (err) {
    next(err);
  }
});

Promise.resolve()
  // First, try to open the database
  .then(() => db.open('./database.sqlite', { Promise }))
  // Update db schema to the latest version using SQL-based migrations
  .then(() => db.migrate({ force: 'last' }))
  // Display error message if something went wrong
  .catch((err) => console.error(err.stack))
  // Finally, launch the Node.js app
  .finally(() => app.listen(process.env.PORT || 3000));
