# FEW 2.9 GraphQL and React

Lab day to get the React GraphQL Weather app off the ground. 

## What to do

The React GraphQL Weather project is due next week. Use today to get the project started if you're behind or identify problems and questions that need answers. Use the check list below. These are short descriptions here look for more details on how to solve these in Lesson-4. 

- Server - Your server is built around express-graphql. It needs to get the weather data from OpenWeatherMap.org and return that data from a GraphQL end point. 
	- Credentials - Sing up at OpenWeatherMap.org confirm, confirm your account and get your API key. 
	- Setup your server.js. 
		- Import your dependencies
		- Set up your server boilerplate code
			- Be sure to import cors and add cors as middleware.
		- Define your schema
		- Test your server
			- Launch your server and open the endpoint in a browser
			- Test some graphql queries. When you're happy this is working move on to the client!
- Client - Your client will be built in React. It needs to connect to your graphql weather server and display data returned from it. 
	- Create a React Project: `npx create-react-app weather-client`
	- Import your dependencies. 
	- In index.js setup ApolloClient
		- Import your dependencies
		- Define a new instance of ApolloClient
			- Be sure the uri is set to the graphql endpoint defined in your server. 
		- Wrap your app in the ApolloClient and include your client.
	- Make a component to handle the weather data. 
		- Make a new file Weather.js
			- Add a function Weather, and export it. 
			- Your component needs a form to handle inputing a zip code and submitting the data to your server. Add an input and a button. 
			- Use state to handle the zip code input. Define a state var and a setter function with useState.
			- Use state to handle the weather data your compone will load. Use useState to define a var and a setter function. 
			- Import gql and client in your component.
			- Handle a form submit by add an onSubmit handler. 
				- Be sure to use the event object to prevent the default behavior! This prevents submit events from refreshing the browser. 
			- Add a function to handle network requests to your graphql server and call this function from your form submit handler. 
				- Declare yout weather fetching function as async
				- Use client.query() to send a graphql query. Test your query with the Graphiql before using it here.
					- Use the await key word here! 
				- When the data resolves use your setter function to set the weather data on your state variable. 
			- In your component you'll want to display the weather data when it is loaded.
				- Use a ternary operator in an expression in your JSX return value. Use this to display the weather data. 
					- A good strategy is make a component dedicated to displaying your weather data. Pass the weather data to this component as props. 

## Challenges 

Refer to challenges in lesson 4 details on the complete project client + server. Check lesson 3 for details on challenges for the server.

Server Challenges: 

- **Challenge 1 - Setup Express and GraphQL**
- **Challenge 2 - Get your API Key**
- **Challenge 3 - Define Schema**
- **Challenge 4 - Import node-fetch**
- **Challenge 5 - Define your Resolver**
- **Challenge 6 - Test your work in GraphiQL**
- **Challenge 7 - Add units**
- **Challenge 8 - Expand the API**
- **Challenge 9 - Handle Errors**

Client Challenges:

- **Challenge 0 - Weather Server**
- **Challenge 1 - Create your React Project**
- **Challenge 2 - Run your GraphQL Express Server**
- **Challenge 3 - Add Apollo Client**
- **Challenge 4 - Create a Component**
- **Challenge 5 - Handle your data with conditional rendering**
- **Challenge 6 - Make a component to display the Weather**
- **Challenge 7 - Handle Errors**
- **Challenge 8 - Style Your work**
- **Challenge 9 - Use Units**
- **Challenge 10 - Get the current location**
- **Challenge 11 - Add Weather by location to your GraphQL API**
- **Challenge 12 - Get weather by geolocation**
- **Challenge 13 - Sub another API**

## Stretch Challenges 

Anyone working on the stretch challenges. If you are working on the geolocation challenge the browsre will not let you use geolocation from an `http` connection it wants an `https` connection. You'll to provide this from both the lient and the server. 

**Setup https on your express server**

Install mkcert follow the instructions here: 

https://github.com/FiloSottile/mkcert

tl;dr: 

```
brew install mkcert
mkcert -install
```

This will create the files `localhost-key.pem` and `localhost.pem`. These should be in your root directory. **Do not share or commit these to gihub!** Note the path to these files, its used in the nect step. 

Set up in your express server: 

```JS
// https 
const fs = require("fs");
const https = require("https");
const homedir = require('os').homedir();
const key = fs.readFileSync(`${homedir}/localhost-key.pem`, 'utf-8');
const cert = fs.readFileSync(`${homedir}/localhost.pem`, 'utf-8');
```

The path to `localhost-key.pem` and `localhost.pem` is from the home directory. You may need to adjust this. 

Change how you start your server with `app.listen`: 

```JS
// Start this app
const port = 4000
// app.listen(port, () => {
//   console.log('Running on port:'+port)
// })
https.createServer({ key, cert }, app).listen(port);
```

**Start your React APP with HTTPS**

This is easier than it sounds! Quit your React app and restart with: 

```
HTTPS=true npm start
```

**Note! When you do this you'll see a scary warning screen that reads something like: 

> Your connection is not Private
> Attackers might be trying to steal your information from localhost (for example, passwords, messages, or credit cards). Learn more
> NET::ERR_CERT_AUTHORITY_INVALID

Normally we want to heed these warnings but in this it's your app running locally so it's okay! 

Depending on your browser you'll need to click through to your site. In Chrome there is an "Advanced" button followed by the link "Proceed to localhost (unsafe)". You can click that to vidsit your React site on HTTPS. 

















<!-- 

## Learning Objectives 

1. 


- After Class/In classs activity
	- https://www.howtographql.com/react-apollo/0-introduction/
	- You can check your work agains the completed to tutorial here if you run into a problem: 
		- https://github.com/howtographql/react-apollo
- hackernews-react-apollo tutorial notes
	- Pay close atttention to the tutorial code snippets. The highlighted changes are not always correct! 
		- Stretch goal: make a pull request on the soruce repo for the tutorial if you see a mistake!
	- You'll be running two separate node projects from within the hackernews-react-apollo folder
		- in the root folder it will be the react project
		- in server folder will be the express server
	- Some instructions will ask you to switch folders in the terminal!
	- To run `yarn dev` in the *server* folder and launch the react app you'll need two terminals
	- Getting Started > Exploring the server
		- When you get here the tutorial asks you to run some commends to create some new posts. For this to work you'll need to be logged in and authorized. Create a user (if you haven't already)

```graphql
mutation {
  signup(email:"test@test.com", password:"test", name:"test") {
    user {
      name
      id
    }
  }
}
```
Now log in to this user account: 
```graphql
mutation {
  login(email:"test@test.com", password:"test") {
    user {
      name
    }
    token
  }
}
```
Copy the token and add the following to the HTTP Headers tab (lower left)
```graphql
{
  "Authorization":" Bearer <paste-token-here>"
}
```

	- Mutations: Creating Links > Writing the Mutation
		- I ran into a  problem here: `Unhandled Rejection (Error): Argument id for data.postedBy.connect.id must not be null. Please use undefined instead.` I'm guessing this is becuase you're not logged in and can't provide a user id which seems to be required for the database. 
		- I didn't find a good solution to allow posts without authenticating, and this is really the behavior that we want, for now I skipped the errors and continued with the tutorial. 
	


## After Class 

Time to start working on the frontend of hacker news!

Start working on the React + Apollo tutorial: <https://www.howtographql.com/react-apollo/0-introduction/>

- Complete the following chapters by next class: `Introduction`, `Getting Started`, `Queries: Loading Links`
















# Apollo

Apollo is a client that works with GraphQL. It can send requests and receive responses from a GraphQL endpoint. 

Apollo also has a library of React components that make it easy to integrate with React front ends. 

## Getting started 

Add Apollo to a React front end. 

- Import dependencies 
	- npm install --save graphql apollo-boost react-apollo graphql-tag

## In Class 

Review the tutorial. Look at its features and requirements. 


## Bonus Lesson: React Hooks!

Using state with functional components 

`const [state, setState] = useState(defaultValue)`
-->
