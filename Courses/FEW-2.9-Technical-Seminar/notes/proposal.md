# GraphQL Class Proposal

This is a proposal for a senior seminar. To run in term 3 2018. 

## Overview 

GraphQL is an open source data query and manipulation language for APIs, and runtime for fulling data requests. 

Graph QL is a language and a specification and can be used with a variety of server technologies. 

As a clientside language GraphQL allows a client to describe a request, including providing query parameters, and what it expects in return. 

As a server side specification GraphQL describes how a server should fullfill a query. The GraphQl spec can be implemented in any serverside technology for example SQL or Node. 

### Advantages 

Reduces a routes to a single endpoint. With REST you will need an endpoint for each of many different types of requests. With GraphQL you would use a **single endpoint for all requests**.

Removes over and under fetching of data. With REST data returned from a request is usually a fixed dataset and includes a full range of data. Using GraphQL you can **specify exactly what you want returned**. 

With REST there is a need to define an end point for each type of request at the server. With GraphQL all requests are written at the client. This makes product iteration faster. 

- Develop applications faster since you can create new routes by just writing code on frontend. 
- Using a single endpoint simplifies your work. 
- Make more effecient applications by avoiding over fetching and under fetching data. 

Runs everywhere: Can be deployed via now, up, AWS Lambda, Heroku etc.

## Core Concepts 

The GraphQL language uses a JS like syntax. Below are some examples of the code you would write in the GraphQL language. 

### SDL (Schema Definition Language)

Strong Schemas make for more robust and reliable systems. 

```
type Post {
  title: String!
  author: Person!
}
```

### Query 

Queries written on the frontend make for faster more effecient development. 

```
{
  allPosts {
    title
  }
}
```

Nested data can be requested in a query. 

```
{
  allPosts {
    title
		comments {
			subject
		}
  }
}
```

Queries can have parameters

```
{
  allPosts(first: 2) {
    title
  }
}
```

Mutations are for CRUD

```
mutation {
  createPost(title: "Learn GraphQL", content: "...") {
    title
    content
  }
}
```

### Subscriptions

GraphQL supports real time updates with Subscriptions. 

### Backend technologies

GraphQL integrates with all of the technologies you are familiar with: React, Node, Elixir, Ruby, Python, and more. 

On the clientside GraphQL queries are written as strings and so work with any frontend technology. 

## Class Projects 

- Hackernews Tutorial 
- Contractor Project
- Custom Project 

## Syllabus

- Intro
  - What is GraphQL?
  - Benefits
  - REST vs GraphQL
  - Vocabulary
  - GitHub GraphQL API Server
    - https://developer.github.com/v4/
- Getting started
  - Writing a Query
    - Formatting a query
    - Passing arguments
    - Required arguments
- GraphQL Schemas
  - Schemas
  - Types 
  - Querying a Schema
- Handling Data

### Other possible topics

- Queries and Mutations
- Schemas and Types 
- Validation
- Execution
- Best Practices
- Thinking in Graphs
- Authorization
- Pagination
- Caching
  
https://graphql.org/learn/

| Class |          Date          |  Topics    |
|:-----:|:----------------------:|:----------:|
|  Wk 1 |  Intro                 | [Lesson 1] |
|  Wk 1 | Getting Started        | [Lesson 2] |
|  Wk 2 | Schemas                | [Lesson 1] |
|  Wk 2 | Thursday, November 1             | [Lesson 1] |
|  Wk 5 |  Tuesday, November 6             | [Lesson 1] |
|  Wk 6 | Thursday, November 8             | [Lesson 1] |
|  Wk 7 |  Tuesday, November 13            | [Lesson 1] |
|  Wk 8 | Thursday, November 15            | [Lesson 1] |
|       |  Tuesday, November 20            | **Don Rags** |
|       | Thursday, November 22            | **Fall Break** |
|  Wk 9 |  Tuesday, November 27            | [Lesson 1] |
|  Wk 10| Thursday, November 29            | [Lesson 1] |
|  Wk 11|  Tuesday, December 4             | [Lesson 1] |
|  Wk 12| Thursday, December 6             | [Lesson 1] |
|  Wk 13| Tuesday, December 11             | Final Exams |
|  Wk 14| Thursday, December 13            | Final Class (presentations, etc) |
