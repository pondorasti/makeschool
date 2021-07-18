# Reddit Project

Your job is to create a clone of Reddit following the tutorial [here](https://www.makeschool.com/online-courses/tutorials/reddit-clone-in-node-js/technical-planning).
Or better yet follow the tutorial from GitHub [here](https://github.com/MakeSchool-Tutorials/Node-Reddit-Clone).

## Pair Programming

Pair programming is a great way to work; it's especially useful when you
are stuck with a problem. You should find someone to pair with when you
have an issue you can't seem to solve, or when you're not sure how to
approach a step. **You should be pairing at least once a week!**

## Reddit Tutorial

The tutorial doesn't provide detailed instructions each step ---
it relies on the notion that you've completed the previous tutorials and will draw on that information.

The tutorial starts with a list of features that you need to implement.

**You should try and implement as many of these features as you can on
your own.**

Here is a list of all steps needed to complete the Reddit project.
These also appear in the tutorial.

- Create a post
  - Make a posts#new route (`/posts/new`) and template (`posts-new.handlebars`)
  - Add form to `posts-new` template
  - Make `create` posts route and check that form data is sending to new route
  - Add `Post` model with mongoose
  - Confirm posts are saving to database
- Show all posts
  - Make the root route (`/`) go to the posts#index route render a `posts-index` template
  - Style the template and loop over the `posts` object
  - Make route to posts#show route (`/posts/:id`)
  - Style the template and display the `post` object
- Show one post
- Comment on posts
  - Make a new comment form in the posts#show template
  - Make a create route for comments
  - Associate comments with posts
  - Display comments
- Create subreddits
  - Add a `subreddit` attribute to our post resource
  - Navigate to view all the posts of the same subreddit
- Create a post on a subreddit
- Show all subreddits
- Sign up and Login
  - Make `/sign-up` route, template and form
  - Make POST `/sign-up` route and logic
  - Make `User` model
  - Encrypt users' passwords
  - Create JWT and add Cookies
  - Demonstrate that user is logged in and password is encrypted
  - Make `/login` route, template and form
  - Make POST `/login` route and logic
- Associate posts, comments with their author
  - Check authentication and make `req.user` and `currentUser` objects
  - Add `author` attribute to comments and posts
  - Save the user as the author of posts
  - Display the author's username on posts and comments
- Make comments on comments
  - Make comments embedded documents instead of reference.
  - Make comments on posts work.
  - Make comments embedded inside comments.
  - Test comments on comments are working.
- Vote on a post
  - Make vote form
  - Add jQuery AJAX scripts
  - Write vote up and vote down routes
  - Add new attributes to `Post` model
  - Update DOM with response
  - Restrict to 1 vote per user
  - Let people 'undo' their vote
- Sort posts by # of votes

## Techincal Notes

### Libraries

You will need these libraries to get started:

- express
- express-handlebars
- mongoose
- body-parser

#### express-handlebars

Setting up express handlebars with shorter extension (.hbs rather than
.handlebars) name is convenient and requires less typing. The code
below initializes express handlebars with the extension `.hbs`. All of
your templates would not be named:

`main.hbs` or `posts.hbs` etc.

```JavaScript
// Set up Handlebars with express
app.engine('.hbs', exphbs({
  extname: '.hbs',                  // Set the file extension
  defaultLayout: 'main',            // Set a default template
}))
```

#### mongoose

Initialize mongoose with the code below.

```JavaScript
mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/redditclone', { useMongoClient: true })
mongoose.connection.on('error', console.error.bind(console, 'MongoDB connection Error:'))
mongoose.set('debug', true)
```

Note the `redditclone` is the name of the database. This can be any name you like.

The last line turns on mongoose debugging. Use this for testing.
