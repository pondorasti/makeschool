# React Express Server Starter

This starter project is meant to work with the React front end [here](https://github.com/Product-College-Labs/react-express-project). 

The purpose of this project is to provide a backend for a React Frontend. 

This project provides a simple backend API that serves JSON on a couple routes. 

## Getting started

You'll need to install dependencies. 

- `npm install` 
- Run the project with node or ndoemon
  - `node server.js` or `nodemon server.js`

## API Documentation 

The API of the current project has two endpoints that return JSON. 

- `/about` 
	- returns - `{ about: 'description string' }`
	- Example - `/about`
- `/random` 
	- query - n: Int
	- returns - random number from 0 to n - 1
	- Example - `/random/?n=6` 

You should test the API for yourself to make sure everything is running. Follow the instructions above and launch the Express Server.

There are three end points and each returns JSON. Type these into the address bar of the browser or just click the links below: 

- [http://localhost:4000](http://localhost:4000) default route
- [http://localhost:4000/about](http://localhost:4000/about) returns the about text
- [http://localhost:4000/random/?n=6](http://localhost:4000/random/?n=6) returns random number between 0 and 5

Notice each of these endpoints returns JSON. The browser should display this. 

The last endpoint in the list above includes query params. Try changing the value here and check the results. 

- [http://localhost:4000/random/?n=6](http://localhost:4000/random/?n=20) Random number between 0 and 19
- [http://localhost:4000/random/?n=6](http://localhost:4000/random/?n=100) Random number between 0 and 99

Test some other values. Try some unexpected or values that you think would return unexpected results. 

## Challenges (3hrs)

Your goal is to add some features to this API. Currently the code stores some functions in `utils.js`. These are imported into `server.js` with: 

`const { random, randomD, randomRolls } = require('./utils')`

You can find this at the top of `server.js`. 

All of these functions are stubbed in currently. Your job is to fill these functions out and build their functionality and test them along the way. 

Run the tests to check your work. 

`npm test`

**Challenge 1** 

Currently the API endpoint '/random/?n=num' returns a random number from 0 to num. This has a problem since the numbers returned are decimal numbers, for example: `13.409162476456668`. Modify the code at the endpoint to return whole numbers. 

- The random function should return a **whole number**. 
- The number should range from 0 to n - 1
- Carefully craft an intuitive API
	- The API should read well and be self documenting
	- The JSON returned should be intuitive unambiguous

**Challenge 2** 

You need a function to simulate die rolls. Currently there is a stubbed function `randomD(n)`. This function takes a number n as a parameter. It should return a number from 1 to n. 

- `randomD(n)` should return a whole number 
- `randomD(n)` the range should be from 1 to n
- Define an API that returns the results as JSON
	- Your API should be intuitive and self documenting
	- The JSON returned should be intuitive

**Challenge 3** 

We need to a function to generate a series of die rolls. This function is stubbed in as `randomRolls(n, s)`, `n` is number of dice to roll, and `s` is number of sides possessed by each die. This function should return an **array of random numbers**. 

- `randomRolls(n, s)` should return an array
	- All elements should whole numbers
	- Each element should be value of 1 to `s`
- Add an API that works with this function
	- It should return JSON formatted with intuitive properties
	- Add a property that holds the total of all rolls

**Challenge 4** 

Modify the API to work with path rather than the query string. For example: 

- `/random/6` returns a value from 0 to 5
- `/random/die/6` returns value from 1 to 6
- `/random/dice/3/6` returns an array of 3 die rolls from 1 to 6

Think about the API carefully and design it to be both intuitive and self documenting as much as you can. Think of making this an API that you would find easy to use. 

**Stretch Challenges** 

- Make an API that returns Loto Numbers
- Make an API that returns from another API in a better format

