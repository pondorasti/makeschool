# React Express Front End Starter 

This project is a front end project meant to work with the Express backend [here](https://github.com/Product-College-Labs/react-express-server). 

The goal of this project is to provide a front end for a simple Express server. 

## Getting started 

This project is made up two parts. The React front end client and the Express backend server. 

Install and run this project: 

- `npm install`
- `npm start`

View the project at: [http://localhost:3000](http://localhost:3000)

### Proxy Server 

This project is viewed at http://localhost:3000 but it sends messages and communicates with the backend through it's proxy server on port: 4000. 

Look at [package.json](package.json). Line 10: 

`"proxy": "http://localhost:4000"`

Network requests made from this project will come from this address. 

Look at the Express server project. In `server.js` at the end of file you'll find: 

```JS
const port = 4000
app.listen(port, () => console.log(`LISTENING ON PORT ${port}`))
```

This project runs on port: 4000. 

You'll need to have both projects running at the same time! Launch the Express server first using terminal. Open another terminal navigate to this folder and launch this project. 

## Challenges (3hrs)

Your goal is to connect this project to the server project and challenges from the previous class. 

Study the example code. It makes a couple calls to the [react-express-server](https://github.com/Product-College-Labs/react-express-project). 

You should launch your express server from the previous class. It should be running on localhost:4000. This project should proxy to localhost:4000. The calls this project makes to your express may or may not work at this point, recall you changed the API. 

Your goal is to get this project connected to you express server and solve the challenges below. 

**Challenge 1:** 

Your first goal is ot get the demo project working with your express server and it's API. You've made changes to the API you may have to change this project to work with your server. 

You'll need to run both the server and the React Front end at the same time. Open each in a separate terminal. 

Launch the server: 

`nodemon server.js`

Launch the React front end:

`npm start`

This project uses fetch to call the route: `/random` and prints the returned JSON. You've modifed your server so you may need to modify this route. 

Look at 'App.js'. Here `getRandom()` does the work of making a request to the server. You need to examine this and make sure it's doing the following: 

- Calling the correct route
  - Keep your eye on the terminal for errors the catch block will print any error messages 
- Make sure you are passing the correct parameters. 
  - GET - query vars can be added to the URL
    - fetch('/random?q=99')
  - Params are part of the URL 
    - fetch('/random/dice/3/sides/6') 
  - Vars can also be passed via headers. For examples of this follow the docs here: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch

**Goal**: The goal of this challenge is to connect to the server and display values returned via JSON. Variables and parameters passed to the server can be hard coded in this step.  
  
**Challenge 2:**

Now that your page is displaying data from the serve it's time make parameters and variables passed to the server dynamic. 

Identify the values that need to be sent to the server. 

Create a form that allows these values to be input from your React front end. To do this you will need to create form elements using the [Controlled Component Pattern](https://reactjs.org/docs/forms.html).

The values from the form input elements should now be held on state within your component. The goal now is to incorporate these into your request with `fetch()`. How you do this depends on how your route handles data from a request, hopefully you identified this in Challenge 1. 

**Goal**: Use React to connect to the server, pass data to the server and receive a JSON response. 

**Challenge 3:**

Use your express server as an intermediary to another server. Many API servers work fine but there are times when they do not do everything we'd like them to do. 

Requesting data from one server and passing it through your server to transform the data to better fit your uses.

Create an endpoint on your server that will request data from a public API and return it as JSON. You can use the Open Weather Map API to keep things simple. 

**Your Express server will make the request to the API and respond with JSON.** 

**Why**? Using an intermediary or proxy server input a service and your endpoint allows you to modify and polish the data that is passed on. You can use this technique to aggrate data from several different services. 

In the case of Open Weather Map the JSON this service returns is a bit confusing. Using your Express server as a proxy you can transform the data into something easier for your front end to parse. 

Another use of an intermeidate server is to solve problems with CORS. 

**What to do**: 

Create an endpoint in your express project that returns the weather data from OpenWeatherMap. Use node-fetch to get the weather. Modify the JSON returned from OpenWeatherMap to a more concise and usable format. Return this modified data from your endpoint.

Your data should be formatted like this: 

```JavaScript
{
  temp: 70,
  short: "Short description",
  long: "A long and more detailed description of the weather",
  humidity: 10,
}
```

**Challenge 4:**

You've heard [Darksky.net](https://darksky.net/dev) is a pretty good API. Better than Open Weather Map! Modify your backend to use this service in place of OpenWeatherMap. 

Don't change the format of the JSON that you returned in the previous challenge. 

- Use the concept above to get the weather from the darkskys API. 

**What happened here**? If you finished this challenge you will have replaced data source but not have disrupted your frontend. Your proxy took care of any issues you might have had changing services. 

