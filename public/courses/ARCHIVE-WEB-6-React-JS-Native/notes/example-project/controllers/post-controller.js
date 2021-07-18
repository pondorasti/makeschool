const shortid = require('short-id');

const Post = require('../models/post');

module.exports = (app) => {
  // Define some routes

  // Index route show all posts
  app.get('/', (req, res) => {
    console.log("get / index");
    Post.find({}).then((posts) => {
      res.render('index.hbs', {
        pageTitle: 'Index',
        posts
      });
    }).catch((err) => {
      console.log(err);
    });
  });

  // /new post route
  app.post('/new', (req, res) => {
    console.log("get /new");
    const body = req.body;
    const imageFile = req.files.image;
    const fileNameArray = imageFile.name.split('.');
    const fileExtsion = fileNameArray[fileNameArray.length - 1];
    const filePath = `./uploads/${shortid.generate()}.${fileExtsion}`;
    imageFile.mv(filePath, (err) => {
      if (err) {
        console.log(err);
        return;
      }
      const post = new Post({
        ...body,
        path: filePath,
        originalFileName: imageFile.name
      });
      post.save().then((post) => {
        console.log("post added");
        res.redirect('/');
      }).catch((err) => {
        console.log(err);
      });
    })
  });
}
