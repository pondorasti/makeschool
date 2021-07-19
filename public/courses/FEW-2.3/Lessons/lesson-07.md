# FEW 2.3 - Lesson 7

## Making Network Requests

The example project uses `fetch()` to load JSON data from the OpenWeatherMap API. Take a look at the `handleSubmit()` method in App.js.

Read the comments here to follow the process. 

## Learning Objectives

1. Use fetch to load data
1. Display data based on application state
1. Use environment variables to handle seinsitive information
1. Define Promise it's uses and features 

<!-- > -->

## Video

Follow this class in these video lessons:

- https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

The videos are labeled "lesson 07 x" which corresponds to the class lesson numbers. 

## Brainstorming your final project

Start thinking of ideas for your final project. Your final project should use React and Redux. Beyond this you are free to do anything else you like, provided you can finish by the end of the term!

Here are a few ideas: 

- Use the Weather API as a starting place and expand this project to display a 5 day forcast and other weather data. 
- Use the Weather API project as a starting place but replace the weather API with another API. 
- Make a Chess board. 
- Make a Chess Timer
- Update one of your previous projects that doesn't use React to a React project. 
- Build a Frontend in React for a backend that you may have created for previous project. 
- Expand the Timers tutorial into a productivity app of some kind. It could be evolved into a pomodoro timer or a Todo list. The timers app could be expanded to track billable hours. 
- Create an expense tracker. 
- Pizza Builder
- Recipes App, could use an API...
- Try a tutorial
- Rubiks Cube

Check out these articles for more ideas: 

- https://www.upgrad.com/blog/react-project-ideas-topics-beginners/
- https://flatlogic.com/blog/6-stunning-react-js-project-ideas/
- https://www.freecodecamp.org/news/8-reactjs-project-ideas-to-start-learning-by-doing/

## .env

The .env or "dot" env file is used to store sensitive information, like API keys! The Create React Starter project has support for .env baked in. 

Look at Line 36 of App.js. 

`const apikey = process.env.REACT_APP_OPENWEATHERMAP_API_KEY`

Here you are getting a value stored in the dot env file stored in the key: `REACT_APP_OPENWEATHERMAP_API_KEY`. 

**Important!** User-defined keys must begin with "REACT_APP_"! 

Open '.env' and define `REACT_APP_OPENWEATHERMAP_API_KEY` with your openweathermap API key. Something like: 

`REACT_APP_OPENWEATHERMAP_API_KEY=YOUR_API_KEY_HERE`

Make sure your API key is set here. 

## Fetch

> Fetch is a browser API for fetching resources including resources across a network. 

Load JSON with `fetch` like this: 

```JS
// Call fetch
fetch('http://someurl.com').then((res) => {
    // Make a connection and handle the stream as JSON
    return res.json()
}).then((data) => {
    // handle JSON data here
    // ...
}).catch((err) => {
    // Handle error messages 
    console.log(err.message)
})
```

## Promise 

A Promise is object that is used to handle asynchornous actions. A Promise can be in one of three states: 

- Pending - The async operation has not completed yet
- Resolved - The async action resolved successfuly 
- Rejected - The Async action failed

Pair up and take a look at the examples here: 

https://javascript.info/promise-basics

Most often you'll use a Promise to handle network requests but Promises can also be returned when an operation in the browser happens on another thread or takes times to resolve. 

## Aync & await

Async and await are keywords that work worh Promise. You could say they are "syntactic sugar" on top of Promise.

Async marks identifies an asyncronous function. An async function always returns a Promise! 

Await only works within an async function. Use await at the beginning of any expression that would return a Promise. JavaScript will wait at that line until the Promise resolves. 

pair up and read a little more about async and await here: 

https://javascript.info/async-await

Try the code samples with your pair.

### Looking at a fetch request with async and await

The `await` key word only works in a function that marked with the `async` keyword. Imagine the code block above now in a function. The `await` keyword is used to resolve any promises you might have in your code. 

```JS
async function getWeather() {
    // Call fetch
    const res = await fetch('http://someurl.com')
    const data = await res.json()
    // handle JSON data here
    // ...
}
```

This is a lot shorter! 

Remember an `async` function always returns a promise! We didn't return a promise in the code above but this function will return a promise anyway! That means we might call this function and handle it's return value in this way:

```JS
async function getWeather() {
    // Call fetch
    const res = await fetch('http://someurl.com')
    const data = await res.json()
    return data
}

getWeather().then((data) => {
    // do something with data here!
})
```

### Handling Errors with Async Await

Error handlign with Async and await is done with a try catch block. In a nutshell a try block gives you the opportunity to handle errors with out crashing. Normally when an error is thrown it brings your application to halt. Think of of a try block as being a safe place where you can try something and if it fails isolate it from the rest of your program. With catch you an try something and if it fails catch the error. 

Pair up and read and try these examples: 

https://javascript.info/try-catch

```JS
async function getWeather() {
  try {
    // Let's try this
    const res = await fetch('http://someurl.com')
    const data = await res.json()
    return data
  } catch(err) {
    // If there is an error we end up here!
    console.log(err)
  }
}
```

If the code in the try block throws an error we end up in the catch block!

## After Class 

Continue working on assignment 3

If you are up to date with the current work. Try these stretch challenges: 

- The videos add a shopping cart to the product list. Currently each items shows +/- and clear. Challenge: add an input field that displays the quanity. Set this up so it's possible enter a new quantity into the input. 
- Currently the Product list is a single page. Add react Router. Use Router to display a "detailed" view showing the product. The product list can now show a short version of each product just the name and price. 
- Use Router to display the shopping cart. Add a show cart button that shows the count (total numebr of items in cart) and clicking the link displays the full cart. You can also solve this problem without Router using conditional rendering techniques. 

## Resources 

- https://javascript.info/promise-basics
- https://javascript.info/async-await