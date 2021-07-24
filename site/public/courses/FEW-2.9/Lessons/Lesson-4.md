# FEW 2.9 React Review

<!-- > -->

Your GraphQL Projects need a frontend!

<!-- > -->

Any type of front end client can connect to a GraphQL backend server. We will be using React.

<!-- > -->

React is a library for creating user interfaces. It is one of the most popular web frameworks.

<!-- > -->

Why use React?

<!-- > -->

It's efficient and has a great workflow, developer experience and community.

<!-- > -->

## Class Learning Objectives/Competencies

1. Build a React app
2. Create reusable components
3. Use JSX, State and Props
4. Use Hooks

<!-- > -->

## Review

<!-- > -->



<!-- > -->

## Overview

<!-- > -->

The React library has several core features let's take a look at those:

- Components
- JSX
- ReactDOM

<!-- > -->

## Creating a React App

<!-- > -->

Creat a React using: 

```bash
npx create-react-app <app-name>
```

This creates a new folder containing a complete React project. 

<!-- > -->

Let tour the project.

- public/
- src/
  - index.js
  - index.css
  - App.js
  - App.css

<!-- > -->

### Components

<!-- > -->

Components are the foundational building block of React Applications. Most often a component represents a view.

<!-- > -->

Components are composable. Components can be nested within other components. Complex components are made from smaller less complex components.

- Components must return [JSX](#jsx)
- Components can be built from a function or a class

<!-- > -->

This is a Component

```JS
function Header(props) {
 return (
  <h1>{props.title}</h1>
 )
}
```

<small>In it's simplest form a Component is a function that returns JSX.</small>

<!-- > -->

What's JSX? 

JSX is an extension of the JavaScript Lanaguage. 

JSX === JavaScript and XML. 

<!-- > -->

JSX provides a HTML like syntax that compiles to standard JS. For example: 

```js
<h1>{props.title}</h1>
```

Becomes: 

```JS
React.createElement("h1", null, props.title);
```

<small>The magic is that the first line looks exactly like what will be generated for the browser to display.</small> 

<!-- > -->

Why use JSX? 

- Looks like the HTML it will generate
- Easier to reason about

<!-- > -->

## JSX has it's own rules! 

<!-- > -->

1. Must have a top level node

```JS
// Good!
<div>
  <h1>Hello</h1>
  <p>World</p>
</div>
```

```JS
// Error!
<h1>Hello</h1>
<p>World</p>
```

<!-- > -->

If you don't want to create an extra tag use a fragment!

```JS
// Good!
<>
  <h1>Hello</h1>
  <p>World</p>
</>
```

<!-- > -->

Can't use `class`, use `className` instead!

```JS
// Good!
<div className="App">
  <h1 className="title">Hello</h1>
  <p>World</p>
</div>
```

```JS
// Error!
<div class="App">
  <h1 class="title">Hello</h1>
  <p>World</p>
</div>
```

<!-- > -->

A tag with no children must be self closing by adding a `/` be the closing `>`.

```JS
// Error!
<div class="App">
  <br />
  <img />
  <hr />
  <Game />
  <Map />
</div>
```

<!-- > -->

Values in JSX are strings (use double quotes!) Other values use `{}`.

```JS
<div>
  <img src={url} width={100} height={150} />
</div>
```

<small>Imagine `url` is a variable</small>

<!-- > -->

Any JS expression can be used in a JSX expression as long as it appears in the `{}`.

```JS
<div>
  <img 
    src={`${path}/${filename}`} 
    width={w * 0.5} 
    height={h * 0.5} 
    onClick={() => {
      ...
    }}
  />
</div>
```

<small>Move attributes to their own line for clarity.</small>

<!-- > -->

### Composing Components

<!-- > -->

Store components each in their own file. 

```JS
// Title.js

function Title() {
  return <h1>Hello World</h1>
}

export default Title
```

```JS
// App.js

import Title from './Title.js'

function App() {
  return <Title />
}
```

<!-- > -->

If you're returning more than one line of JSX wrap in `()`.

```JS
// App.js
import Title from './Title.js'

function App() {
  return ( // <-- (
    <div className="App">
      <Title />
    </div>
  ) // <-- )
}
```

<!-- > -->

## Props

<!-- > -->

Props are values passed to a component. 

When props change the component renders. 

Props come from outside the component and are passed into the the component.

<!-- > -->

Pass props to a component via attributes: 

```JS
// Imagine we're using the component somewhere
<Heading title="Hello" subtitle="world" />
```

```JS
// Heading.js
function Heading(props) {
  // { title: "Hello", subtitle: "world" }
  return (
    <>
      <h1>{props.title}</h1>
      <p>{props.subtitle}</p>
    </>
  )
} 
```

<!-- > -->

## State 

<!-- > -->

State presents values a component stores internally. 

When state change the component renders. 

<!-- > -->

Define state like this: 

```JS
import { useState } from 'react'

function Counter() {
  const [ count, setCount ] = useState(0)
  return (
    <>
      <h1>{count}</h1>
      <button 
        onClick={() => setCount(count + 1)}
      >Add 1</button>
    </>
  )
}
```

<small>Here `count` is increased by 1 with each click.</small>

<!-- > -->

## Controlled Component Pattern

<!-- > -->

The controlled component pattern is used to handle form elements. 

An input value is stored as state.

<!-- > -->

Controlled component pattern in action!

```JS
import { useState } from 'react'

function Counter() {
  const [ zip, setZip ] = useState('')
  return (
    <>
      <input 
        value={zip}
        onChange={(e) => setZip(e.target.value)}
      />
    </>
  )
}
```

<small>Here state holds the value set on the input and is updated when the input changes.</small>

<!-- > -->

## Inputs and forms

<!-- > -->

Forms are really important. They have some some behaviors that can make them a little confusing. 

<!-- > -->

Group all of your form elements in a form!

```JS
<form>
  <p>Send us a message</p>
  <input type="email" />
  <textarea></textarea>
  <label>
    Sing up for out news letter!
    <input type="checkbox" />
  </label>
  ...
</form>
```

<!-- > -->

Submit a form with a submit button!

```JS
<form>
  ...
  <button type="submit">Submit</button>
</form>
```

<small>A button with `type="submit" will submit a form!`</small>

<!-- > -->

Handle submitting a form with `onSubmit`

```JS
<form onSubmit={(e) => {
  // Handle your form submission here!
}}>
  ...
</form>
```

<small>Like other event handlers `onSubmit` receives an event object! (`e` in the sample above)</small>

<!-- > -->

Submitting a form will reload the current page, you need to prevent this in a React App!

```JS
<form onSubmit={(e) => {
  e.preventDefault() // prevent the page from loading!
  ...
}}>
  ...
</form>
```

<!-- > -->

## Connecting a Client to GraphQL

<!-- > -->

For the client side you'll be using Apollo GraphQL client.

<!-- > -->

The goal of this project is to create a client built with React that connects to your GraphQL OpenWeatherMap server. 

<!-- > -->

The server will run at locahost:4000 and the client will run on localhost:3000. 

You need so start **both** for the project to work locally. 

<!-- > -->

I find it easier to keep both projects in seprate folders.

<!-- > -->

## Apollo Client

<!-- > -->

**Apollo Client** is a comprehensive state management library for JavaScript that enables you to manage both local and remote data with GraphQL. Use it to fetch, cache, and modify application data, all while automatically updating your UI.

<!-- > -->

You will use Apollo Client in this project to handle transactions between your React project and your GraphQL server. 

<!-- > -->

Your Server needs to support CORS. Follow these steps to enable CORS for your Express server. 

- `npm install cors`
- In `server.js`
  - `const cors = require('cors')`
  - `app.use(cors())`

<!-- > -->

What's CORS?

Cross-Origin Resource Sharing is a mechanism that uses additional HTTP headers.

It uses these headers to tell a browser to let a web application running at one origin have permission to access selected resources from a server at a different origin.

<!-- > -->

Follow these steps to setup Apollo Client with React.

Create a new React project: 

`npx create-react-app weather-client`

Install dependencies: 

`npm install @apollo/client`

<!-- > -->

In `index.js` - setup Apollo client

```js
import { ApolloProvider, InMemoryCache, ApolloClient } from '@apollo/client'
// make an instance of the Apollo client
export const client = new ApolloClient({
  uri: 'http://localhost:4000/graphql',
  cache: new InMemoryCache()
});
```

<!-- > -->

Still in index.js Wrap your app in the ApolloProvider:

```js
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

The following can be used in any component that is a child of App!

Import your `client` and `gql`
```js
import { gql } from '@apollo/client'
import { client } from './index'
```

<!-- > -->

Now you're ready to make requests to your GraphQL server from your React project. 

- Here are a few ideas: 
  - The requests are async. You will need to handle them with Promise. 
  - You will need to render your components conditionally. 
  - Store the data you load on state. This will cause your components to render when state changes. 

<!-- > -->

Make a component to handle a request to the weather server. 

```JS
import { useState } from 'react'
import { gql } from '@apollo/client'
import { client } from './index'

function Weather() {
  return (
    <div className="Weather">
      <form>
        ...
      </form>
    </div>
  );
}

export default Weather
```

<!-- > -->

Add state to handle the form input and the weather data. 

```JS
function Weather() {
  const [ zip, setZip ] = useState('')
  const [ weather, setWeather ] = useState(null)

  return (
    <div className="Weather">
      <form>
        ...
      </form>
    </div>
  );
}
```

<!-- > -->

Add an input and submit button.

```JS
<div className="Weather">
  <form>
    <input 
        value={zip}
        onChange={(e) => setZip(e.target.value)}
      />
      <button type="submit">Submit</button>
  </form>
</div>
```

<!-- > -->

Add a function to handle requests to your GraphQL server. 

```js
function Weather() {
  ...
  async function getWeather() {
    try {
      const json = await client.query({
        query: gql`
          query {
            getWeather(zip:${zip}) {
              temperature
              description
            }
          }
        `
      })
      setWeather(json)
    } catch(err) {
      console.log(err.message)
    }
  }

  ...
}
```

<!-- > -->

Handle the submit event: 

```js
<form onSubmit={(e) => {
    e.preventDefault()
    getWeather()
  }}>
    <input 
    value={zip}
    onChange={(e) => setZip(e.target.value)}
  />
  <button type="submit">Submit</button>
</form>
```

<!-- > -->

Handle displaying the your weather data. 

```JS
<div className="Weather">
  
  {weather ? <h1>{weather.data.getWeather.temperature}</h1>: null}
  
  <form onSubmit={(e) => {
    e.preventDefault()
    getWeather()
  }}>
    ...
  </form>
</div>
```

<small>This conditional rendering technique looks at `weather`, if its truthy displays the h1, otherweise `null`</small>

<!-- > -->

All of the examples here may need some name changes to work with your server or components!

<!-- > -->

## Challenges

<!-- > -->

You will build a React App that fetches weather data from your GraphQL Weather server. It will be use the Apollo client for GraphQL for query.

<!-- > -->

**Challenge 0 - Weather Server**

Complete your GraphQL Express Weather server. 

- Be sure to add cors (see the instructions above)

<!-- > -->

**Challenge 1 - Create your React Project**

Follow the instructions above and get your React Project running. 

<!-- > -->

**Challenge 2 - Run your GraphQL Express Server**

Your Express project will run on port 4000 (or another port check!) and the React project will run on port 3000. 

- React and GraphQL servers need to be running on different ports.

<!-- > -->

**Challenge 3 - Add Apollo Client**

Add Apollo Client to your React Project. Follow the instructions above.

- Check the port! and the end point.
- The `uri: 'http://localhost:4000/graphql'` must match the port and endpoint that your server uses! 

<!-- > -->

**Challenge 4 - Create a Component**

This component will connect to the GraphQL Server. See the instructions above. 

- Import `gql` and `client`
- Set up your form and an async function to handle requests

<!-- > -->

**Challenge 5 - Handle your data with conditional rendering**

Handle data with conditional rendering. See the instructions above. 

The goal here is to display data after it's loaded and display nothing or alternate content when no data is available.

- Display the temperature

<!-- > -->

**Challenge 6 - Make a component to display the Weather**

React is all about components. Write a specialized component that is used just to display the weather data. 

Supply data as props. Display: 

- temp
- description
- and three or more properties!

<!-- > -->

**Challenge 7 - Handle Errors**

If you enter a zip code that doesn't exist you'll get an error or nothing will happen. You should handle this situation. 

- Check for an error, use the cod and message value from openweather map. Your Server should provide this! 
- Display the message when cod != 200.

<!-- > -->

**Challenge 8 - Style Your work**

This is an open ended challenge. Do as much work here as you like!

- Style the form
- Style the weather results
- Display an image for the weather

<!-- > -->

**Challenge 9 - Use Units**

Add radio button or other method to set the unit type: metric or imperial. And display the weather with that unit. 

- Add two radio buttons to the UI. 
- Send the unit to the server
- Server should request data in the unit from openweathermap

<!-- > -->

**Challenge 10 - Get the current location**

OpenWeatherMap supports getting the weather by location. You can get the geocoordinates with the browser API. 

Make a button that gets the coordinates. 

- https://developer.mozilla.org/en-US/docs/Web/API/Navigator/geolocation

<!-- > -->

**Challenge 11 - Add Weather by location to your GraphQL API**

Spends some time on your GraphQL server. Add a query type that gets weather by geolocation. 

<!-- > -->

**Challenge 12 - Get weather by geolocation**

Add a button to your React project that gets the geolocation from the browser and makes a reques to the GraphQL API. 

<!-- > -->

**Challenge 13 - Sub another API**

This is an openended stretch challenge. Substitute another API for the OpenWeatherMap API.

<!-- > -->

## After Class

Complete the challenges above and submit your work to GradeScope. 

<!-- > -->

## Resources

- <https://reactjs.org/tutorial/tutorial.html>
- [Component Lifecycle](https://reactjs.org/docs/react-component.html)
- [Hooks](https://reactjs.org/docs/hooks-intro.html)
- [Async/await](https://javascript.info/async-await)
- [Using Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [Array Destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
- <https://www.apollographql.com/docs/react/get-started/>

<!-- > -->