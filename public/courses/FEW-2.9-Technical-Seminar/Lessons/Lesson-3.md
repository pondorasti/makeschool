# FEW 2.9 GraphQL + Express

<!-- ![banner_image](./assets/public_api_banner.jpg) -->

<!-- > -->

## Learning Outcomes

By the end of today's lesson, you should be able to...

1. Build a GraphQL API over a Public API
1. Use GraphQL and Express
1. Define Resolvers for types

## Review

<!-- > -->

Pop Quiz!

<!-- > -->

Write a GraphQL schema for these types

**Monster Battle**

- Write the following in the GraphQL Schema language
  - Kaiju type, this is a giant monster like Godzilla
  - City type, what fields does a city have?
  - Battle type should include two monsters and a city
  - Query type that returns a battle
- Write the followeing in the graphql Query language!
  - Write a query that summons Godzilla and Mothra to battle in tokyo
    - print the a monsters name, and power
    - print a city's name and population

**Card Game**

- Use the GraphQL Schema language
  - Card type for a playing card
  - Hand type for a hand of cards
  - Query type that returns a hand of cards
- Write a query in the graphql query language
  - Write a query that gets a hand of cards 
    - print the value and suit of each card

**Users and Images**

- Use the GraphQL Schema language to generate these types
  - Image type should know the url and size an image
  - Location type needs latitude and longitude
  - Image type should include a location
  - User Type
  - User type needs a list of images
  - Query type that returns a User
- Use the graphQL Query language to query: 
  - Write a query that gets users images
    - Display the user name
    - Display the image url

<!-- > -->

## Overview

Today you will make a GraphQL service for a public API.

*Why?* This will give you a chance to practice the ideas from the previous class in a different context.

<!-- > -->

## GraphQL and Express

GraphQL is a specification and a langauge. It's not a framework or library of prewritten code. 

This means people are free to write libraries or frameworks that implement the GraphQL spec. 

<!-- > -->

You'll find GraphQL libraries written for most most of popular frameworks. Today you will use Express.js and GraphQL. 

<!-- > -->

### What do we need to use GraphQL with Express? 

- express-graphql npm package
- graphql npm package
- express npm package

<!-- > -->

### How do you set this up? 

- import the npm packages
	- express, graphql, express-graphql
- define your schema
- define your resolvers
- define a route to act as the GraphQL endpoint
	- Use graphqlHTTP to handle requests at this route
		- configure graphqlHTTP with your schema and resolvers

<!-- > -->

## Challenge

The challenge today is to build GraphQL front end for a public API. 

<small>Think of this as an interview question practice.</small> 

<!-- > -->

For this example you'll use https://openweathermap.org. 

<small>Q: Why are using OpenWeatherMap.org? A: It's free and easy. It's a good choice for a 2 hour assignment.</small>

<!-- > -->

**Challenge 1 - Setup Express and GraphQL**

Follow these steps to setup Express and GraphQL.

<!-- > -->

1. Create a new folder
1. Initialize a new npm project: `npm init -y`
1. Install dependancies: `npm install --save express express-graphql graphql`
1. Create a new file: `server.js`
1. Add `"start": "nodemon server.js"` to package.json

<!-- > -->

**Important!** Be sure to include a `.gitignore`. 

https://www.toptal.com/developers/gitignore/api/node

<!-- > -->

In `server.js` import your dependancies: 

```JS
// Import dependancies
const express = require('express')
const { graphqlHTTP } = require('express-graphql')
const { buildSchema } = require('graphql')
```

<!-- > -->

Start your schema: 

```JS 
const schema = buildSchema(`
# schema here
type Test {
	message: String!
}
`)
```

<!-- > -->

Set up your resolver

```JS
const root = {
	// resolvers here
}
```

<!-- > -->

Create an express app

```js
// Create an express app
const app = express()
```

<!-- > -->

Define a route/endpoint for your GraphQL API

```js
// Define a route for GraphQL
app.use('/graphql', graphqlHTTP({
  schema,
  rootValue: root,
  graphiql: true
}))
```

Be sure to set `graphiql` to true since this will enable the graphiql browser that you will be using 

<!-- > -->

Start your App 

```JS 
// Start this app
const port = 4000
app.listen(port, () => {
  console.log('Running on port:'+port)
})
```

<!-- > -->

Start your GraphQL server: 

`npm start`

Open graphiql: 

`http://localhost:4000/graphql`

<!-- > -->

**Challenge 2 - Get your API Key**

Go to https://openweathermap.org

1. Create an account at [openweathermap.org](https://openweathermap.org/).
1. After you make an account, click on your username, then on `My API Keys`. Enter an API key name, then click the `Generate` button to create your API key!

<!-- ![api_keys](../assets/api_keys.png) -->

<!-- > -->

**Quick Side Note for `.env` files**

Install dotenv: 

```
npm install dotenv
```

Having a `.env` file allows us to store our secrets (like an API Key) without it being exposed to the public on GitHub. Let's create that now so we can use our API Key in our project without exposing it!

1. In the folder containing the sample project, run `touch .env` in the terminal
1. Open the .env file, and place the following in it, replacing `MY_API_KEY` with your actual API Key:

```
OPENWEATHERMAP_API_KEY=__MY_API_KEY__
```

Save it when you're done. Alright, now we're ready to continue!

<!-- > -->

Be sure to initialize dotenv in your server.js:

```JS
// require dotenv and call cofig
require('dotenv').config()
```

Use your API key in your code with: 

```JS
const apikey = process.env.OPENWEATHERMAP_API_KEY
```

<!-- > -->

**Challenge 3 - Define Schema**

Define your schema

```JS 
type Weather {
	temperature: Float!
	description: String!
}

type Query {
	getWeather(zip: Int!): Weather!
}
```

<small>Define a weather type and a query type to get the weather.</small>

<!-- > -->

**Challenge 4 - Import node-fetch**

Import node-fetch to make network calls. You can also use Axios or other library of your choice. You need something to make network requests.

`npm install node-fetch`

Add import to server.js

`const fetch = require('node-fetch')`

<!-- > -->

**Challenge 5 - Define your Resolver**

Define your resolver: 

```JS
const root = {
  getWeather: async ({ zip }) => {
		const apikey = process.env.OPENWEATHERMAP_API_KEY
		const url = `https://api.openweathermap.org/data/2.5/weather?zip=${zip}&appid=${apikey}`
		const res = await fetch(url)
		const json = await res.json()
		const temperature = json.main.temp
		const description = json.weather[0].description
		return { temperature, description }
	}
}
```

<small>I used `fetch` here you substitute your HTTP client of choice here</small>

<!-- > -->

**Challenge 6 - Test your work in GraphiQL**

Try out a query and solve any errors that might pop up.

```JS
{
  getWeather(zip: 94010) {
    temperature
    description
  }
}
```

<!-- > -->

**Challenge 7 - Add units**

The weather API supports a unit of `standard`, `metric`, or `imperial`. Currently you should be getting the weather in Kelvin (standard) this is hard to understand better to allow a request to include the unit. 

<!-- > -->

Add an enum for the type to your schema.

```JS
enum Units {
	standard
	metric
	imperial
}
```

<!-- > -->

Use the unit in your getWeather query.

```js
type Query {
	getWeather(zip: Int!, units: Units): Weather!
}
```

<!-- > -->

Handle the unit in your resolver.

```JS
const root = {
  getWeather: async ({ zip, units = 'imperial' }) => {
		...
		const url = `https://api.openweathermap.org/data/2.5/weather?zip=${zip}&appid=${apikey}&units=${units}`
		...
	}
}
```

<small>Be sure add `units` to the query string!</small>

<!-- > -->

Test your work! Write a query: 

```JS
{
  getWeather(zip: 94122, units: metric) {
    temperature
    description
  }
}
```

<small>Notice that the enum value is NOT input as a string! Graphiql will code hint valid values! Go GraphQL introspection FTW!</small>

<!-- > -->

**Challenge 8 - Expand the API**

If you followed all of the instructions here your API should allow fetching the temperature and description. The OpenWeatherMap response provides a lot more information. The goal of this challenge is to expand the getWeather query type. 

<!-- > -->

Challenge, expand your query to include the following properties:

- feels_like
- temp_min
- temp_max
- pressure
- humidity

<!-- > -->

**Challenge 9 - Handle Errors**

The OpenWeatherMap API provides a cod property that includes an error code. If you provide a zip code that doesn't exist you'll get a JSON object with a code of 404 and a message property with a message string. It might look something like: 

```JSON
{ cod: '404', message: 'city not found' }
```

Notice that `'404'` is a string. If you get a successful request the JSON will look like this: 

```JSON 
{ ..., cod: 200 }
```

<!-- > -->

When COD is 200 it's a number! 

Think about the results that returned by your GraphQL API... What happens when you make a request like this: 

```
{
  getWeather(zip:99999) {
    temperature
  }
}
```

99999 is not a valid zip the JSON object from OpenWeatherMap will include `"cod": "404"` and `"message":"city not found"`. All of the other information will be missing. 

<!-- > -->

Think about the data types defined in your getWeather query Type...

In this case you won't have the temperature. But you will have a message. 

<!-- > -->

Your goal here is to return temperature, humidity, etc. sometimes, and include cod, and message sometimes. Don't overthink the solution (it may be easier than you first think). Talk it over with other students. 

Here's a clue: if you make a query for temperature with an invalid zip code then temperature should be null!

<!-- > -->

Here's what this situation might look like in code.

The Query might look like this: 

```JS
{
  getWeather(zip:99999) {
    temperature
    description
    feels_like
    temp_min
    temp_max
    pressure
    humidity
    cod
    message
  }
}
```

<!-- > -->

The results would look like this: 

```JS
{
  "data": {
    "getWeather": {
      "temperature": null,
      "description": null,
      "feels_like": null,
      "temp_min": null,
      "temp_max": null,
      "pressure": null,
      "humidity": null,
      "cod": 404,
      "message": "city not found"
    }
  }
}
```

<!-- > -->

## Stretch Challenges

Try as many of these stretch goals as you can!

- Expand the Weather API
  - Expand your the OpenWeatherMap other request parameters
    - Currently your API supports zip code but the current weather forecast supports
      - city name
      - city id
      - latitude and longitude
  - The example above uses the Current Weather API. OpenWeathermap also provides several other APIs that you can use. Make your GraphQL server support one of these: 
    - [Minute Forecast 1 hour*](https://openweathermap.org/api/one-call-api)
    - [Hourly Forecast 2 days*](https://openweathermap.org/api/one-call-api)
    - [Daily Forecast 7 days*](https://openweathermap.org/api/one-call-api)
    - [National Weather Alerts*](https://openweathermap.org/api/one-call-api)
    - [Historical weather 5 days*](https://openweathermap.org/api/one-call-api)
- Build a GrpahQL API on top another API (you choose the API)

<!-- > -->

## After Class

Finish up as many of the challenges and stretch challenges as you can. Submit your project on Gradscope. 

<!-- > -->

### Evaluate your work 

1. Build a GraphQL API over a Public API
1. Use GraphQL and Express
1. Define Resolvers for types

| - | Does not meet expectations | Meets Expectation | Exceeds Expectations | 
|:---:|:---:|:---:|:---:|
| Comprehension of Resolvers | Can't explain what a resolver is | Can describe a resolver | Could teach another student what a resolver is |
| Using express-graphql | Can't set up a simple server with express-graphql | Could set up a simple server using express-graphql | Could teach a new student how to set up a simple express-graphql server |
| Using Resolvers | Can't write a simple resolver | Could write a simple resolver | Could expand on the resolvers from the homework solution to add new features and functionality |

<!-- > -->

## Resources

- https://www.toptal.com/developers/gitignore/api/node
