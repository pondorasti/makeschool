# Subscriptions Lab

<!-- > -->

## Learning Objectives 

- Write resolvers with parent
- Describe resolvers in terms of schema
- Use parent in resolvers
- Organizing your work

<!-- > -->

## Final Project Standup

<!-- > -->

In Groups conduct a standup focussing on the final project progress. Answer these questions: 

- What did you work on since Tuesday? 
- What Are you working on today? 
- What problems did you encounter?
- Do you have any blockers? 

<!-- > -->

## GraphQL Slack Solution

<!-- > -->

This the solution I came up with the Slack-like graphql challenges.

This is not a definitive solution. You may have your own ideas that's okay! 

<!-- > -->

Types: 

- Post
- Channel
- Query 
- Mutation
- Subscription

<!-- > -->

Post Type:

```python
type Post {
  message: String!
  date: String!
}
```

<!-- > -->

Channel Type: 

```python
type Channel {
	name: String!
	posts: [Post!]!
}
```

<!-- > -->

Query Type: 

```python
type Query {
  posts(channel: String!): [Post!]
  channels: [Channel!]!
}
```

<small>Q: why not `posts(channel: String!): [Post!]!`?</small>

<!-- > -->

Mutation type: 

```python
type Mutation {
  addPost(channel: String!, message: String!): Post
  addChannel(name: String!): Channel
}
```

<small>Q: Why not return `Post! or Channel!`?</small>

<!-- > -->

Subscription type: 

```python
type Subscription {
  newPost(channel: String!): Post
  newChannel: Channel!
}
```

<!-- > -->

Data Structure: 

```js
// Data Store
const data = {
  Main: [ { message: 'hello world', date: new Date() } ],
  Cats: [ { message: 'Meow', date: new Date() }],
  ...
}
```

<!-- > -->

## GraphQL Resolvers and Apollo

<!-- > -->

The resolver should match the structure your schema describes. 

<!-- > -->

At the top level 

```JS
const resolvers = {
	Post: { },
	Channel: { },
	Query: { },
	Mutation: { },
	Subscription: {	}
}
```

<!-- > -->

Wait? It looks like we included `Post` and `Channel`?

Yep! You can resolver a for every type. If you don't define a resolver *Apollo Server* will define a [default resolver](https://www.apollographql.com/docs/apollo-server/data/resolvers/#default-resolvers) for it! 

<!-- > -->

We can look at the schema to determine the shape of each resolver. 

<!-- > -->

Query Type: 

```python
type Query {
  posts(channel: String!): [Post!]
  channels: [Channel!]!
}
```


```JS
const resolvers = {
  ...
  Query: {
    posts: (_, { channel }) => { ... },
    channel: () => { ... }
  },
  ...
}
```

<!-- > -->

Mutation Type

```python
type Mutation {
  addPost(channel: String!, message: String!): Post
  addChannel(name: String!): Channel
}
```

```JS
const resolvers = {
  ...
  Mutation: {
    addPost: (_, { channel, message }) => { ... },
    addChannel: (_, { name }) => { ... }
  },
  ...
}
```

<!-- > -->

Subscription Type

```pyhton
type Subscription {
  newPost(channel: String!): Post
  newChannel: Channel!
}
```

```js 
const resolvers = {
  ...
  Subscription: {
    newPost: {
      subscribe: (_, { channel }) => { ... }
    },
    newChannel: {
      subscribe: () => { ... }
    }
  },
  ...
}
```

<!-- > -->

What about the base types? `Post` and `Channel`?

These Are not required, if they are returned from on eo fthe other types or if they return a primitive type like: String, Int, etc.

If you do need them they can declare a resolver for field! 

<!-- > -->

Channel Type

```pyhon
type Channel {
  name: String!
  posts: [Post!]!
}
```

```JS
const resolvers = {
  ...
  Channel: {
    name: (parent) => {
      return parent.name
    }
    posts: (parent) => {
      return parent.posts
    }
  },
  ...
}
```

<!-- > -->

Post Type 

```python
type Post {
  message: String!
  date: String!
}
```

```js
const resolvers = {
  ...
  Post: {
    message: (parent) => {
      return parent.message
    }
    date: (parent) => {
      return new Date(parent.date).toLocaleDateString()
    }
  },
  ...
}
```

<!-- > -->

What is happening there? 

The `parent` arguement provides the value from the previous/parent resolver.

Think of the resolver like a tree where values are passed from trunk to branch to leaf.

<!-- > -->

## Challenges

<!-- > -->

- Complete the Slack-Like server (see the challenges from lesson 8)
- Define some resolvers for your types and their fields
  - Use the Parent argument! 
- Use class time to finish up the any unfinished work
  - Previous assignments
  - Final project (Check the schedule below)

<!-- > -->

## After Class 

You should decide an what you are going to do for the final project

- React + Apollo Tutorial - Complete chapeters 3 and 4
	- [Queries: Loading Links](https://www.howtographql.com/react-apollo/2-queries-loading-links/)
	- [Mutations: Creating Links](https://www.howtographql.com/react-apollo/3-mutations-creating-links/)
- GraphQL Node Tutorial - Complete chapeters 3 and 4
	- [A simple query](https://www.howtographql.com/graphql-js/2-a-simple-query/)
	- [A simple mutation](https://www.howtographql.com/graphql-js/3-a-simple-mutation/)
- Your Custom project
	- Server - Build your data base
	- Client - Start your React Project and setup Apollo Client
- Stretch Challenge - Complete chapters 5 to 8 of the GraphQL Node tutorial (complete the entire tutorial if you can!)
	- [Adding a database](https://www.howtographql.com/graphql-js/4-adding-a-database/)
	- [Connecting The Server and Database with Prisma Client](https://www.howtographql.com/graphql-js/5-connecting-server-and-database/)
	- [Authentication](https://www.howtographql.com/graphql-js/6-authentication/)
	- [Realtime GraphQL Subscriptions](https://www.howtographql.com/graphql-js/7-subscriptions/)