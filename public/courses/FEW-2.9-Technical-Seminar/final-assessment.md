# FEW 2.9 Final Assessment

Your goal is to build a GraphQL Todo application. For this assignment, you will build a server that supports your GraphQL schema. You will write the schema, resolvers, and some queries that test query types in your schema. 

# Todo GraphQL

Your goal is to make a GraphQL todo app. It should be able to:

- display a list of todos
- create new todos
- and mark a todo completed or not completed

## Challenges

### Create a Server

- Setup a GraphQL server
- Enable Graphiql

### Create a Schema 

Write a schema that defines the following types:

**Type Todo**
- name 
- completed
- date 
- id

**Query**
- getAllTodos, should return a list of todos
- getTodo, should return a single todo
- getCompletedTodos, returns a list of completed todos
	- Stretch: can return completed or not completed todos

**Mutation**
- addTodo, creates a new todo, and returns that todo
- completeTodo, marks a todo complete and returns that todo

### Write a GraphQL Queries

Write queries to perform the following operations. 

**Test these in Graphiql and paste them into a readme in your project folder.** If I launch your project I should be able to test all of your queries. 

- List all todos
- Add a new todo: name: "Complete the final assessment"
- Show the: "Completed final assessment" todo 
- Complete the: "Complete final assessment" todo
- Show all completed todos
- Show all not completed todos

### Stretch Challenge: Subscriptions

Add subscriptions to your work. We need a subscriptions to tell us when a new todo is created and when a todo is completed.

**Schema**

**Subscription**
- newTodo => todo
- todoCompleted => todo

**Resolver**

Write a resolver to handle the two new query types.

**Query**

Write a query for each of the subscription types above. 

#### Stretch Challenge: Enum

Add an enum to prioritize your todos. 

**Schema**

- Define an enum with: High, Normal, and Low 
- Add a priority field to your Todo type
- Add a setPriority mutation
- Add a query to sort by priority

**Resolver**

Handle the new query types in your schema. You'll need to also update your data source. 

**Query**

Test the following queries and add them to your readme:  

- Display the priority when you list todos
- Set the "Complete final assessment" todo to "High" priority
- Sort todos by priority

## Submit your work 

Submit your completed work on GradeScope.

<!-- 

### Define a Schema

Enum Race 
- Human
- Dwarf
- Elf

Type Character
- name
- race
- power
- speed
- hp

Type Party 
- name 
- characters []

Query 
- getParty returns Party
- 

Mutation 
- createParty 
	- parameters name
	- returns Party
- creatCharacter returns Character
- addToParty return character

### Create a server 

- Setup GraphQL server 
- Define a resolver for your schema

### Write Queries 

Define the following queries

- get a party 
	- show 
 -->
