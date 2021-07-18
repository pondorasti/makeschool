# FEW 2.9 Advanced queries 


More ideas: 

- Variables 
- Fragments
- Directives 

## GraphQL Query Language

The GraphQL query language has wide variety of features. Let's review them. 

**Types**

Types are the things you can query. Some types are query or mutation types. These are the types that define the root of a query. Things like: getPost, pserson, or allFilms. Others define resource types. These are things like: name, id, species, and title. 

Here: name and eyecolor are fields

```python
{
  person(personID:5) {
    name
    eyeColor
  }
}
```

**Arguments**

Are arguments are the value you supply to a query type. Arguments are the values you pass to a function. In a graphQL query they are the values we supply to Query and Mutation types. 

Here: name and species are arguments. Note! that an argument always has a type. In this case both arguments are strings. 

```python
{
  pet(name:"Frango", species:"Cat") {
    ...
  }
}
```

**Alias**

Since the response from a query also defines the shape of JSON response. You can run into a problem when you use the same query type. 

For example the following produces a problem in the response: 

```python
{
  person(personID: 1) {
    name
  }

  person(personID: 2) {
    name
  }
}
```

```json
{
  "data": {
    "person": {
      "name": "Luke"
    }, 
    "person": { 
      "name": "C3PO"
    }
  }
}
```

Here the two fields with the name "person" clash!

To fix this use an alias. The alias appears before the query type. 

```python
{
  personA: person(personID: 1) {
    name
  }

  personB: person(personID: 2) {
    name
  }
}
```

```json
{
  "data": {
    "personA": {
      "name": "Luke"
    }, 
    "personB": { 
      "name": "C3PO"
    }
  }
}
```

The alias is used fro the name of the field in the JSON response. 

**Fragments**

A fragment provides a reusable unit to use in queries where you may repeat code. 

Imagine you have to compare two characters and they have a many fields to compare: 

```python
{
  personA: person(personID: 1) {
    name
    eyeColor
    species {
      name
      language
    }
    homeworld {
      name
      diameter
    }
  }

  personB: person(personID: 2) {
    ...
  }
}
```

You can see this would create a long query with much duplciate code. 

A fragment will cleant his up. A fragment is defined with a name and a type.

```python
fragment description on Person {
  name
  eyeColor
  species {
    name
    language
  }
  homeworld {
    name
    diameter
  }
}
```

Here the name is `description` and the type is `Person`. All of the fields below would have to be valid for the `Person` type. 

Use a fragment by prefixing its name with `...`:

```python
{
  personA: person(personID: 1) {
    ...description
  }

  personB: person(personID: 2) {
    ...description
  }
}
```

**Operation Name**

Any query can be assigned an operation name. This is a name for the query. 

Here the name of the query is `CompareTwoPeople`:

```python
query CompareTwoPeople {
  personA: person(personID: 1) {
    ...description
  }

  personB: person(personID: 2) {
    ...description
  }
}
```

Use an operation name to make your queries less ambiguous and your code easier to understand. 

**Operation Type**

GraphQL supports three operation types: 

`query`, `mutation` and `subscription`

**Vartiables**






## Variables





Using variables with GraphQL

A query will often provide values to define and refine the expected results. GraphQL queries can define variables that may appear anywhere inside of a Query. This saves you the trouble of concatenating a long query string, and makes it easy to track variables used in a query by keeping them in one location. 

The following query looks for the first 15 market place listings via the GitHub API.

```GraphQL
query {
  marketplaceListings(first:15) {
    edges {
      node {
        id
        name
        shortDescription
      }
    }
  }
}
```

An obvious extension is to set a variable for the number of listings. 

```GraphQL
query MarketplaceListings($first: Int!) {
  marketplaceListings(first:$first) {
    edges {
      node {
        id
        name
        shortDescription
      }
    }
  }
}
```

Here a variable is defined like this: 

`MarketplaceListings($first: Int!)`

<!-- > -->

- React + Apollo Tutorial - Complete chapeters 9, 10, and 11
  - [Realtime Updates with GraphQL Subscriptions](https://www.howtographql.com/react-apollo/8-subscriptions/)
  - [Pagination](https://www.howtographql.com/react-apollo/9-pagination/)
  - [Summary](https://www.howtographql.com/react-apollo/10-summary/)
- GraphQL Node Tutorial - Complete chapeters 9 and 10
  - [Filtering, Pagination & Sorting](https://www.howtographql.com/graphql-js/8-filtering-pagination-and-sorting/)
  - [Summary](https://www.howtographql.com/graphql-js/9-summary/)
- Your Custom project
	- Server - Solve problems and add subscriptions
	- Client - Add CSS!
- Stretch Challenge - React + Apollo tutorial chapters 
  - [Routing](https://www.howtographql.com/react-apollo/8-subscriptions/)
  - [Pagination](https://www.howtographql.com/react-apollo/9-pagination/)
  - [Summary](https://www.howtographql.com/graphql-js/9-summary/)