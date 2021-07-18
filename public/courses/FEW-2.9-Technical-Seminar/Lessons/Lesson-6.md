# FEW 2.9 GraphQL Mutations 

Mutations are queries that make changes or you could say mutate data.

<!-- > -->

## Learning Objectives

1. Describe mutations
1. Define mutation queries
1. Use Mutations
1. Describe Resolvers
1. Write resolvers

<!-- > -->

## Warm up - What do you really know?

Want to really learning something? Try this: https://fs.blog/2021/02/feynman-learning-technique/

<!-- > -->

Richard Feynman's learning technique breaks down into 4 steps: 

1. Pretend to teach a concept you want to learn about to a student in the sixth grade.
2. Identify gaps in your explanation. Go back to the source material to better understand it.
3. Organize and simplify.
4. Transmit (optional).

<!-- > -->

Pair up and teach your partner GraphQL. Your partner will be your rubber duck. Follow steps 1 and 2. Try and explain these ideas: 

1. What is GraphQL?
2. How is different from REST?
3. The GraphQL query language
4. The GraphQL schema language
5. What is a resolver?

<!-- > -->

**Step 1:** Explain GraphQL to your partner as if they were in sixth grade. No big words or jargon. Break the ideas down to plain language anyone could understand. 

<!-- > -->

**Step 2:** Identify what you know and where the gaps in your knowledge are. The gaps will be in the areas where you struggle to explain a concept. 

<!-- > -->

## Mutations

<!-- > -->

So far you've been using queries to get things from your GraphQL server. This is like a GET request with a REST 😴 server. 

**Mutations** ⚒️ are used to make changes at your GraphQL server. This is like a POST, PUT, or DELETE request with a REST server.

<!-- > -->

Mutations should probably have a name that describes what they do: 

```python
newUser
createUser
makeUserAccount
addUser
```

<!-- > -->

Define a mutation in your schema with type Mutation: 

```python
# Schema
type Mutation {
	...
}
```

<small>starts with `type Mutation`</small>

<!-- > -->

Usually a Mutation will take some parameters and resolve to a type. For example you might supply a username and password and resolve/return a User type. You might provide a url and description and Resolve to a Post type. 

<!-- > -->

Here is an example in code.

```python
# Schema
type Mutation {
	createUser(name: String!): User!
	post(url: String!, description: String!): Link!
}
```

<small>Mutations often return the thing they create, User, or Link in this example.</small>

<!-- > -->

When making a mutation **query** you start with the word "mutation"

```python
# Query 
mutation {
	createUser(name: "Jo") {
		name
		id
	}
}
```

<!-- > -->

Note! Queries start with the key word Query. But we've been omitting it. 

```python
# Query
query {
	getUsers {
		name
	}
}
```

<!-- > -->

## Mutation Challenges 

<!-- > -->

Using your code from assignment 2, solve the following challenges.

Note! The challenges here will use an "in memory" data source so the data will only exist while the server is running.

Use the second homework assignment to complete the challenges below. You'll be adding new features that existing code. 

<!-- > -->

**Challenge 1 - Serve a list of things**

You have a list of things, Pets were used in the examples. You need a mutation that adds a new pet. It should return the pet that was just created. You'll need to include all of the fields that make the type. 

<!-- > -->

For example if the Pet type looked like this: 

```JS
type Pet {
	name: String!
	species: String!
}
```

So the mutation might look like this: 

```python
type Mutation {
	addPet(name: String!, species: String!): Pet!
}
```

<!-- > -->

Now you need a resolver to return the array. For the petList it might look like:

```JS
const root = {
  ...
	addPet: ({ name, species }) => {
		const pet = { name, species }
		petList.push(pet)
		return pet
	}
}
```

Test your work with query. Run your server, open Graphiql in your browser and test your mutation. 

<!-- > -->

```python
mutation {
  addPet(name:"Ginger", species:"Cat") {
    name
  }
}
```

Try test all of your things to see if the new was added to the list. 

<!-- > -->

**Challenge 2 - Update**

We need full CRUD functionality! So far you have "Create". What about "Update"? Try that out.

To do this you'll need to make a query that supports all of the field a type has.

<!-- > -->

Add a new mutation to your scema. It should include all of the fields but they can be null except the id. It should return the type. 

```python
type Mutation {
	...
	updatePet(id: Int!, name: String, species: String): Pet
} 
```

<!-- > -->

Add a resolver. Your resolver should look at the fields and update the values when the field is NOT undefined! 

```JS
const root = {
  ...
  updatePet: ({ id, name, species }) => {
		const pet = petList[id]  // is there anything at this id? 
		if (pet === undefined) { // Id not return null
			return null 
		}
    // if name or species was not included use the original
		pet.name = name || pet.name 
		pet.species = species || pet.species
		return pet
	}
}
```

<!-- > -->

Test your work with a query. 

- Update an element in your list
- Try changing only one field
- Try updated an id that is out of range 

<!-- > -->

**Challenge 3 - Delete**

Make a mutation to delete an element. It should include an id and return the thing that was deleted. 

Write the mutation in your schema. 

Write a resolver to support the mutation.

<!-- > -->

Test your work. 

- Write a query that deletes an item from your list
  - You should get the deleted item and be able to display its fields
- Try deleting an id that doesn't exist it should return null

<!-- > -->

**Challenge 4 - Mutation Queries**

Write queries that cover all of the CRUD operations you have implemented. Include these in a read me with your project. You should have a query for: 

1. Creating new item
1. Reading a item from your list
1. Updating an item
1. Deleting an item

<!-- > -->

**Challenge 5 - Code Review**

Code review your work with another student. This is an important step in the development process. Code is not pushed to the master branch unless it's been reviewed! 

<!-- > -->

### Stretch Challenges

<!-- > -->

**Challenge 6 - Other lists**

If you've implemented a second list add CRUD operations for that list. 

<!-- > -->

## After Class

<!-- > -->

Compelete the challenges above and submit them to GradeScope. 

<!-- > -->

### Evaluate your work

<!-- > -->

| - | Does not meet expectations | Meets Expectations | Exceeds Expectations |
|:---:|:---:|:---|:---:|
| Comprehension | Can't describe GraphQL mutations | Can describe GraphQL mutations | Could describe potential use cases for GraphQL mutations beyond the examples provided |
| Mutation Queries | Can't write a mutation query | Can write mutation queries | Can write mutation queries that expand on the challenge solutions |
| Mutation Resolvers | Can't write a Mutation resolver | Can write a mutation resolver | Could write mutation resolvers that expand upon the solutions to the challenges |

<!-- > -->

## Resources

- https://odyssey.apollographql.com