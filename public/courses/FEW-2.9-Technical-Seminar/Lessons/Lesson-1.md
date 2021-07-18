# FEW 2.9 GraphQL Intro

Welcome to FEW 2.9

<!-- > -->

# Why you should know this?

GraphQL represents a new way to work with network transactions. It provides many benefits over REST.

<!-- > -->

## Class Learning Objectives

1. Compare REST with GraphQL
1. Define RESTful routes
1. Describe the benefits of GraphQL
1. Compare and contrast REST and GraphQL
1. Write GraphQL Queries

<!-- > -->
## Warm Up (5 mins)

ELI5 (Explain Like I'm 5). Choose one of these to explain

- How do Web Pages work?
- How do web browsers work?
- What are Web APIs?

<!-- > -->
## What makes the web work? 

REST 😴 and SOAP 🧼

These are two different approaches to online data transmission. These describe how data is passed around over the internet. 

<!-- > -->

### SOAP 🧼

Simple Object Access Protcol 

is the official standard maintained by the W3C. SOAP uses XML exclusively!

```xml
<book>
  <isbn>1929394</isbn>
  <author>Secret Agent Man</author>
  ...
</book>
```

<small>xml: Extensible Markup Language</small>

<!-- > -->

### REST 😴

Representational State Transfer 

is an architectural 🏛 principal and guidelines <br> for creating public APIs.

<small>Wikipedia says: REST is a software architectural *style*...</small>

<!-- > -->

## How does REST 😴 work?

A REST API is an API that follows REST-ful Routing. REST-ful routing is a set of conventions for implementing CRUD on an HTTP server. 

<!-- > -->

These conventions are common rules around the type of **HTTP request** and the **URLS** that are used for reading, updating, creating or deleting data on a server.

<!-- > -->

| URL | HTTP Method/Type | Operation |
| ----------- | ----------- |----------- |
| /posts | POST | ??? <!--Create new post-->|
| /posts| GET | ??? <!--Read all posts--> |
| /posts/10 | PUT | ??? <!--Update post 10--> |
| /posts/23 | DELETE | ??? <!--Delete post 23--> |
| /posts/5 | GET | ??? <!--Read post 5--> |
| /users/2/posts | POST | ??? <!--Create a post for User 2--> |

<small>What would be the operations for each of these routes? What do they do?</small>

<!-- > -->

Here's a real API. 

The Star Wars API (SWAPI) uses the following routes: 

- https://swapi.dev/api/people/<id>
- https://swapi.dev/api/films/<id>
- https://swapi.dev/api/species/<id>
- https://swapi.dev/api/vehicles/<id>
- https://swapi.dev/api/starships/<id>

<!-- > -->

Unlike REST 😴 a GraphQL 😎 server would use a single ☝️ endpoint to serve all of it's resources. 

The SWAPI (REST) had 5 endpoints! 

<!-- > -->

**Compare REST and GraphQL**

- REST 😴 - Multiple endpoints 🖐
- GrapQL 😎 - Single endpoint ☝️

<!-- > -->

### Try out REST 😴 with the SWAPI server (REST).

<!-- > -->

Try the people 👯‍♀️ endpoint.

- https://swapi.dev/api/people/1 - Luke
- https://swapi.dev/api/people/3 - R2D2
- https://swapi.dev/api/people/4 - Vader
- https://swapi.dev/api/people/5 - Leia

**Challenge: find C-3PO, Han Solo, Chewbacca and Boba Fett**

<!-- > -->

Use the planets 🪐 endpoint.

- https://swapi.dev/api/planets/1 - Tatooine
- https://swapi.dev/api/planets/3 - Yavin VI
- https://swapi.dev/api/planets/4 - Hoth
- https://swapi.dev/api/planets/5 - Dagobah
- **Challenge: find Alderaan, Bespin, and Endor**

<!-- > -->

## Try it with GraphQL 😎

<!-- > -->

With GraphQL 😎 you will send a query that might look like this: 

```JS
{
  posts {
    title
  }
}
```

Or this: 

```JS
{
  users {
    name
  }
}
```

<!-- > -->

A query begins with: 

```JS
{
  ...
}
```

<!-- > -->

Next add a type and any parameters for that type. In this case person is our type and personID is the parameter:

```js
{
  person(personID: 5) {
    ...
  }
}
```

<!-- > -->

Add fields that you want. Note that person() returns a Person type and we can only include fields that exist on Person!

```js
{
  person(personID: 5) {
    name
    eyeColor
    ...
  }
}
```

<!-- > -->

### Try out GraphQL 😎 with SWAPI! 

To do this you'll use GraphiQL. It's a web page that let's you write GraphQL queries and see the results.

<!-- > -->

First, open the GraphiQL browser: 

http://graphql.org/swapi-graphql

- Type a Query in the left side
- Click the ▶️ button at the top 
- Look 👁 at the results on the right
- Try the following queries...

<!-- > -->

### Challenge: Get characters with GraphQL 😎

```JS
# Leia 
{
  person(personID: 5) {
    name
  }
}
```

<small>Challenge: change the id to find Luke, Han, R2, C3PO and Vader</small>

<!-- > -->

## Over Fetching

Over fetching occurs when you make a request and receive more 🗑 data than you need. 

This happens often. Think of all of those fields that you never use. 🤔 

<!-- > -->

Look at the results that are returned with <br> the REST response vs the GraphQL 😎 response. 

**What's the difference? 🤔**

<!-- > -->

The REST API returns the following when you use the /people route:

```JS
{
	"name": "Luke Skywalker",
	"height": "172",
	"mass": "77",
	"hair_color": "blond",
	"skin_color": "fair",
	"eye_color": "blue",
	"birth_year": "19BBY",
	"gender": "male",
	"homeworld": "https://swapi.dev/api/planets/1/",
	"films": [
		"https://swapi.dev/api/films/2/",
		"https://swapi.dev/api/films/6/",
		"https://swapi.dev/api/films/3/",
		"https://swapi.dev/api/films/1/",
		"https://swapi.dev/api/films/7/"
	],
	"species": [
		"https://swapi.dev/api/species/1/"
	],
	"vehicles": [
		"https://swapi.dev/api/vehicles/14/",
		"https://swapi.dev/api/vehicles/30/"
	],
	"starships": [
		"https://swapi.dev/api/starships/12/",
		"https://swapi.dev/api/starships/22/"
	],
	"created": "2014-12-09T13:50:51.644000Z",
	"edited": "2014-12-20T21:17:56.891000Z",
	"url": "https://swapi.dev/api/people/1/"
}       
```

<!-- > -->

With GraphQL 😎 we only received: 

```JS 
{
  "data": {
    "person": {
      "name": "Luke Skywalker"
    }
  }
}
```

<small>If we needed more we could ask for more!</small>

<!-- > -->

If we *only* wanted the `name` field the GraphQL 😎 <br> query would have saved some bandwidth! 🗜

<!-- > -->

Describe the fields you want in the query: 

```JS
{
  person(personID: 4) {
    name
    eyeColor # includes eye color
  }
}
```

<small>Challenge: Get Vader's, height, and eyeColor</small>

<!-- > -->

**Compare REST with GraphQL**

- GraphQL 😎 - we describe what we want <br> in our query and server returns 🎁 data that matches the query. 
- REST 😴 - you get everything (often **over fetching**)

<!-- > -->

## Under Fetching 🥚

Under fetching 🥚 occurs when you don't get all of the data you need in a single request and have to make another request to get the data you require. 

<!-- > -->

**Challenge:** Use REST to find Leia's homeworld. 🌍

- https://swapi.dev/people/5
- Get the people results find the homeworld 
- Call the homeworld endpoint to get the homeworld

<!-- > -->

### Challenge: 

Use the REST API to find: 

1. Find Chewbacca's homeworld. 
1. Find R2-D2's homeworld
1. Find Han's homeworld

<!-- > -->

**What happened? 🧐**

Each time you found a person, *you had to make a second request* to find their  homeworld. <br> 
<small>(under fetching)</small>

Along the way you loaded *more* data than you needed.<small>(over fetching)</small>

<!-- > -->

**Try it with GraphQL 😎**

```JS
{
  person(personID: 4) {
    name
    homeworld {
      name
    }
  }
}
```

<small>Here in a single query we get the character's name and the name of the homeworld.</small>

<!-- > -->

### Challenge: 

1. Get R2-D2's name and homeworld
1. Get Leia's name and homeworld
1. Get Han's name, height, and homeworld
1. Get R2's name, eyecolor, homeworld and it's diameter

<!-- > -->

**Compare REST with GraphQL**

- REST 😴 - over or under fetches
- GraphQL 😎 - fetches only what you ask for in a single ☝️ query!

<!-- > -->

## GraphQL vs REST

**Pair and discuss the pros and cons of REST and GraphQL.**

Tell your partner everything that was just covered. Think how this might improve your work or where there might be problems. 

<!-- > -->

- **REST** 😴
  - Requires multiple endpoints. Makes for a complex API.
    - Harder to make changes to your API. 
  - Often over fetches providing more data than you need eating bandwidth
  - Often under fetchs, requiring more complex queries and more bandwidth. 

<!-- > -->

- **GraphQL** 😎
  - Uses a single endpoint.
    - Easier to manage
    - More tolerant to changes
  - Fetches only what you ask for
    - Prevents over fetching 
    - Prevents under fetching
    - Saves bandwidth

<!-- > -->

- **GraphQL** 😎 provides other benefits!
  - Type safety 🛡
  - Introspection 🔎

<!-- > -->

## Core features of GraphQL

<!-- > -->

- Query Language
  - Query
  - Mutation
  - Subscription
- Schema Definition Language
  - Strong Typing
  - Introspection

<!-- > -->

**So, What is GraphQL** 🤔

<!-- > -->

> GraphQL is an open-source data query and manipulation language for APIs, and a runtime for fulfilling queries with existing data.

<small>From wikipedia</Small>

<!-- > -->

### Aliases 

<!-- > -->

Since the query describes the structure of what is returned sometimes you need to change the names. 

<!-- > -->

Consider a scenario where you need two people: 

```JS 
{
  person(personID:2) {
		name    
  }
  
  person(personID:3) {
    name
  }
}
```

<small>(Doesn't work!)</small>

<!-- > -->

The results would have a problem

```JS
{
  "data": {
    "person": { <-- Duplicate field!
      "name": "C-3PO"
    },
    "person": { <-- Duplicate field!
      "name": "R2-D2"
    }
  }
}
```

<small>(Hypothetical results from the previous query)</small>

<!-- > -->

Use an **alias** to solve the problem!

```JS 
{
  personA: person(personID:2) {
		name    
  }
  
  personB: person(personID:3) {
    name
  }
}
```

<small>(personA and personB are aliases, you could use any name for these!)</small>

<!-- > -->

The result would look like this: 

```JS
{
  "data": {
    "personA": {
      "name": "C-3PO"
    },
    "personB": {
      "name": "R2-D2"
    }
  }
}
```

<small>(Results from the previous query)</small>

<!-- > -->

## After Class

- Watch the videos here: https://www.howtographql.com
  - Introduction
  - GraphQL is the better REST
  - Core Concepts
  - Big Picture (Architecture)
- Answer the questions in assignment 1 on GradeScope.
  - For each question provide the GraphQL query that would provide what was asked for. 

<!-- > -->

### Evaluate your Work!

1. Compare REST with GraphQL
1. Define RESTful routes
1. Describe the benefits of GraphQL
1. Compare and contrast REST and GraphQL
1. Write GraphQL Queries

| -   | Does not meet | Meets | Exceeds |
|:---:|:-------------:|:-----:|:-------:|
| Understanding | Can't describe GraphQL | Could describe GraphQL it basic features and usage | Can confidently describe GraphQL and suggest use cases |
| Comprehension | Can't compare GraphQL and REST | Could compare GraphQL and REST and identify the features unique to each | Can contrast GraphQL and REST and posit use cases suitable for each |
| GraphQL Query Language | Can't write a query with graphQL | Can write a graphQL Query | Can see a path to writing GraphQL queries for a wide variety of operations |

<!-- > -->

## Additional Resources

- https://www.howtographql.com
- https://swapi.dev/
- http://graphql.org/swapi-graphql