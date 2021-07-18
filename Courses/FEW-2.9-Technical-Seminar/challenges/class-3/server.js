// ===========================================
// Import dependencies

const express = require('express')
const graphqlHTTP = require('express-graphql')
const { buildSchema } = require('graphql')

// ===========================================
// Build a schema
// Look at the Mutation type. This type takes
// subject and content as args and returns
// a post type

// TODO Challenge #2: add a new type for a User. a Uesr should have an id, name,
// age, and list of favorite topics (topics are strings)

// TODO Challenge #3: create two new queries: one that takes in an id
// and returns a single user, and another that returns all users.
// Next, add a mutation for adding a user, where name, age, and list of favorite
// topics are required fields.
const schema = buildSchema(`
  type About {
    message: String
  }

  type Post {
    subject: String
    content: String
    date: String
    id: Int
  }

  type Query {
    getAbout: String
    getPosts: [Post]
    getPost(id: Int): Post
  }

  type Mutation {
    createPost(subject: String, content: String): Post
  }
`)


// ====================================
// Fake DB. This example stores all of it's
// data in an object this will be lost when
// the server is stopped.

// For the example this will store an
// array of posts

const fakeDB = []


// ====================================
// This class represents a post

class Post {
  constructor(subject, content) {
    this.subject = subject
    this.content = content
    this.date = new Date().toLocaleString()
    this.id = fakeDB.length
  }
}

// TODO Challenge #4: add a class for User based on the schema you created


// ====================================
// This root object provides resolver functions
// Resolvers return the data asked for by queries

const root = {
  // Simple resolver returns a string
  getAbout: (args, req) => {
    return 'Hello World'
  },
  // Resolver returns an Object with fields
  getPosts: () => {
    return fakeDB
  },
  // This resolver receives params from the query
  getPost: ({ id }) => {
    // runs some code here...
    // then return an object
    return fakeDB[id]
  },
  // TODO Challenge #1: write a resolver function createPost
  // inputs: subject (string), content (string)
  // hint: our fakeDB is an array, how could we push a post to it...?
  // hint 2: look at the scheme for guidance
  createPost: ({ subject, content }) => {
    // TODO
  }

  // TODO Challenge #5: write your resolvers for getting a single user,
  // getting all users, and for creating a new user
}

// ====================================
// Create and express app and configure middleware

const app = express()
app.use((req, res, next) => {
  console.log('ip:', req.ip)
  next()
})

// Use the graphql browser
app.use('/graphql', graphqlHTTP({
  schema,
  rootValue: root,
  graphiql: true
}))

// Launch the app on port 4000
app.listen(4000, () => {
  console.log('Running GraphQL at localhost:4000')
})
