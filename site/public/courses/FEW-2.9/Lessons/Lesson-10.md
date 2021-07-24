## Slack Clone Client with Apollo Client

<!-- > -->

The goal of this class will be to set up a React client using Apollo Client and connect it to the Slick-Like GraphQL server. 

<!-- > -->

## Standup 

Check in with your final project progress. 

- What did you accomplish since last Wednesday
- What are you going to accomplish between now and wednesday
- Do you have any blockers?

<!-- > -->

## Learning Objectives 

<!-- > -->

1. Writing GraphQL Queries with Variables
1. Using variables with GraphQL queries
1. Use Apollo Client with React
1. Use `useLazyQuery` to load data

<!-- > -->

## Query Variables

<!-- > -->

The GraphQL query language provides a syntax for adding variables to a query. This allows you to write queries that have placeholders for values that need to be generated. This syntax is more convenient and less prone to errors than building queries by concatenating strings.

<!-- > -->

Here is an example: 

```
query PersonByID ($index:ID) {
  person(personID:$index) {
    name
  }
}
```

Here the variable is `$index` it has a type of `ID`.

<!-- > -->

Variables begin with `$` and are defined after the operation name. Variables are defined in the form of `$name: type`.

```
query SomeQuery ($index:Int, $name: String, $price: Float) {
  ...
}
```

<!-- > -->

Use the values where they are needed in your query: 

```
query SomeQuery ($index:Int, $name: String, $price: Float) {
  newThing(index: $index, name: $name, price: $price) {
    ...
  }
}
```

<!-- > -->

The type of a variable must match the type it supplies a value for! 

```
query SomeQuery($index:Int!) {
  someQuery(index: Int!) {
    ...
  }
}
```

Notice the `!` The parameter has `!` so the variable must have it also! 

<!-- > -->

Variables can have default values: 

```
query SomeQuery ($type: String = "star", $rating: Int = 4) {
  rateThing(type: $type, rating: $rating) {
    ...
  }
}
```

<!-- > -->

So where are the values? 🤔

<!-- > -->

Values are defined outside of the query in a separate dictionary that is passed along with the query. 

<!-- > -->

```
query SomeQuery ($name:, $age: Int) {
  queryPeople(name: $name, age: $age) {
    ...
  }
}
```

In Graphiql variables are set in the lower right corner in the section labeled: Query Variables

```
{
  "name": "Luke",
  "age": 23
}
```

<small>You'll define them in the JSON format.</small> 

<!-- > -->

Read about variables here: 

https://graphql.org/learn/queries/#variables

<!-- > -->

### Practice GraphQL Query Variables

<!-- > -->



<!-- > -->

## Building the Slack Client

<!-- > -->

The goal is to build a client to interact with your simple Slack-like GraphQL server. 

You will likely need to adjust this to fit your server. The code snippets supplied here show the general pathway to setting up the client.

<!-- > -->

### Create your react App

Create the default project:

```
npx creat-react-app slack-client
cd slack-client
```

<!-- > -->

### Import Dependencies

<!-- > -->

Import your dependencies:

```
npm install @apollo/client graphql
```

<!-- > -->

Needed for subscriptions:

```
npm install subscriptions-transport-ws
```

Setup a connection to the GraphQL server. 

<!-- > -->

### Setup index.js

<!-- > -->

in src/index.js

Import dependencies.

```JS
// Dependencies
import { ApolloProvider, InMemoryCache, ApolloClient, split, HttpLink } from '@apollo/client'
import { getMainDefinition } from '@apollo/client/utilities';
import { WebSocketLink } from '@apollo/client/link/ws';
```

<!-- > -->

Create an instance of HttpLink. This is used to get GraphQL results over a network. This is specifically for an HTTP connection and will be used for all `Query` and `Mutatation` requests. Notice the address here starts with `http`. It must match your server's GraphQL endpoint!

```js
// Used for Query and Mutation Queries
const httpLink = new HttpLink({
  uri: 'http://localhost:4000/graphql'
});
```

https://www.apollographql.com/docs/react/api/link/apollo-link-http/#gatsby-focus-wrapper

<!-- > -->

Create a new instance of `WebSocketLink`. This is used to handle GraphQL Subscriptions which are sent over a WebSocket protocol. Notice this uses the same endpoint as your GraphQL server but begins `ws`.

```js
// Use for Subscription Queries
const wsLink = new WebSocketLink({
  uri: 'ws://localhost:4000/graphql',
    options: {
    reconnect: true
  }
});
```

https://www.apollographql.com/docs/react/api/link/apollo-link-ws/#gatsby-focus-wrapper

<!-- > -->

The next step is to create a split link. This will handle by `http` and `ws` communications routing `Query` and `Mutation` queries through the `httpLink` and `Subscription` queries through the `wsLink`.

```js
// Routes Queries to the http:// or ws:// depending on the type
const splitLink = split(
 ({ query }) => {
  const definition = getMainDefinition(query);
  return (
    definition.kind === 'OperationDefinition' &&
    definition.operation === 'subscription'
  );
  },
  wsLink,
  httpLink,
);
```

https://www.apollographql.com/docs/react/api/link/introduction/#directional-composition

<!-- > -->

Here you make the Apollo Client instance. Notice we use the `splitLink` since it will route the query to the `http` or `ws` endpoint. 

```js
// make an instance of the Apollo client
export const client = new ApolloClient({
  link: splitLink,
  cache: new InMemoryCache()
});
```

https://www.apollographql.com/docs/react/why-apollo/#gatsby-focus-wrapper

<!-- > -->

Last wrap your app with the ApolloProvider component.

```js
// Lets share the client with child components
ReactDOM.render(
  <React.StrictMode>
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>
  </React.StrictMode>,
  document.getElementById('root')
);
```

<!-- > -->

## Define a Query 

<!-- > -->

Try a couple queries in your App.js to test your system. 

To get started launch your server in one terminal. 

Launch the react project in another. 

<!-- > -->

Define a query. Save this to a file somewhere. 

queries/PostsForChannel.js

```
import { gql } from '@apollo/client'

export default gql`
query PostsForChannel($channel: String!) {
  posts(channel: $channel) {
    message
    date
  }
}`
```

<small>Notice we used a variable here! You may need to adjust this to work with your server. Remember you test this in the Graphiql browser.</small>

<!-- > -->

### Setup App.js

<!-- > -->

In App.js:

```
import { useLazyQuery } from '@apollo/client'
```

The `useLazyQuery` hook is used for queries that will only be run when triggered. More on this coming up!

<!-- > -->

Import your Query: 

```
import PostsForChannel from './queries/PostsForChannel'
```

You may need to adjust this to fit your file structure. 

<!-- > -->

If you're starting with the default App.js delete everything. 

```
function App() {
 
}
```

The next blocks will all be added inside the `function App() {}`

<!-- > -->

Setup the `useLazyQuery` hook. 

```
const [loadPosts, { called, loading, data }] = useLazyQuery(
  PostsForChannel,
  { 
    variables: { channel: 'Main'},
  }
)
```

<!-- > -->

```
const [loadPosts, options] = useLazyQuery()
```

- `loadPosts` - the function that executes your query
- `options` - an object with properties that describe the query ([read more](https://www.apollographql.com/docs/react/api/react/hooks/#options))

<!-- > -->

Setup the `useLazyQuery` hook. 

```
const [loadPosts, { called, loading, data }] = useLazyQuery(
  PostsForChannel,
  { 
    variables: { channel: 'Main'},
  }
)
```

Options: 

- `called` - True is the query has been executed
- `loading` - True if the query is running and no data has been returned
- `data` - The data returned from the query 

<!-- > -->

The `useLazyQuery(query, options)` uses the following parameters: 

- `query` - is the graphql query to execute
- `options` - an object with options configure the query ([read more](https://www.apollographql.com/docs/react/api/react/hooks/#options))

<!-- > -->

Important options: 

- `variables` - Use a JS Object here to set query variables!
- `fetchPolicy` - Set this to "network-only" to always fetch data from the network. Otherwise, data comes from the Apollo Cache. 
- `pollInterval` - In milliseconds. Use this to poll for updated results.

<!-- > -->

You might rewrite the `useLazyQuery` hook above as: 

```js
const [loadPosts, { called, loading, data }] = useLazyQuery(
  PostsForChannel,
  { 
    variables: { channel: 'Main'},
    fetchPolicy: "network-only",
    pollInterval: 3000
  }
)
```

<!-- > -->

The next step to display some information. If no data has been loaded we will display a button to load the data. If the data is in transit display a message "Loading...", and if the data has been loaded display the data. 

<!-- > -->

Display a message if something is loading. 

```js
if (called && loading) {
  return <div>loading...</div>
}
```

<!-- > -->

If the query hasn't beed executed display a button that will begin the query:

```JS
if (!called) {
  return <button onClick={() => loadPosts()}>Load Posts</button> 
}
```

<!-- > -->

Last, display the data!

```JS
return (
  <div className="App">
    {data.posts.map(post => {
      const { message, date } = post
      return <p>{message} {date}</p>
    })}
  <button onClick={() => loadPosts()}>Load Posts</button> 
  </div>
);
```

<small>Here I'm mapping my data and displaying a p tag with message and date. This could be a component. Notice the button at the end, this could be used to load more posts.</small>

<!-- > -->

## Challenges

Try these challenges! 

**Challenge 1** [Create a new React project](#Create-your-react-App)

**Challenge 2** [Import the dependencies](#Import-Dependencies) to connect the project to your Apollo Server.

**Challenge 3** [Setup Apollo Client in index.js](#Setup-indexjs)

**Challenge 4** [Define a Query with a variable](#Define-a-Query)

**Challenge 5** [Set up App.js and run a query](#Setup-Appjs)

**Challenge 6** If everything is working and you have one query working. Try another query. Create a new file for the query and try something like loading channels. 

## After Class 

You should decide what you are going to do for the final project

- React + Apollo Tutorial - Complete chapters 5 and 6
  - [Routing](https://www.howtographql.com/react-apollo/4-routing/)
  - [Authenication](https://www.howtographql.com/react-apollo/5-authentication/)
- GraphQL Node Tutorial - Complete chapters 5 and 6
  - [Adding a Database](https://www.howtographql.com/graphql-js/4-adding-a-database/)
  - [Connecting The Server and Database with Prisma Client](https://www.howtographql.com/graphql-js/5-connecting-server-and-database/)
- Your Custom project
  - Server - Solve problems and add subscriptions
  - Client - Solve problems displaying data from the server
- Stretch Challenge - Complete the GraphQL Node tutorial and start the React + Apollo tutorial. 
  - [Filtering, Pagination & Sorting](https://www.howtographql.com/graphql-js/8-filtering-pagination-and-sorting/)
  - [Summary](https://www.howtographql.com/graphql-js/9-summary/)
  - [Introduction](https://www.howtographql.com/react-apollo/0-introduction/)
  - [Getting started](https://www.howtographql.com/react-apollo/1-getting-started/)
  - [Queries: Loading Links](https://www.howtographql.com/react-apollo/2-queries-loading-links/)

