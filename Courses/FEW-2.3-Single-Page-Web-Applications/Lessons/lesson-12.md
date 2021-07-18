# FEW 2.3 - Lesson 12

# Final Project workshop

The goal this class is to take the work from last class and connect a React front end to your Express server.

## Learning Objectives 

- Use Proxy to connect two local servers
- Connect front end and back end systems
- Use your own API to excahnge JSON with server

## Introduction 

Frontend applications often need to communicate with backend applications. The goal in this lesson is to connect React with Express.

## Proxy

When you're testing your projects in development mode you're running a local server. This is true for the Express project and for the React project. 

To get make the two work together you'll need to have both servers running at the same time. In this case, they will both be running at a different address. The Express server [demo project](https://github.com/Product-College-Labs/react-express-server) runs on port 4000, the address: http://localhost:4000/. 

The [React demo project](https://github.com/Product-College-Labs/react-express-project) for this lesson runs on port 3000, at http://localhost:3000. 

While both projects are running you need to get the React Front end (running on port 3000) to make networks requests to your Express backend server on port 4000. This can be accomplished with a proxy.

Proxy is an option in package.json. 

`"proxy": "http://localhost:4000",`

---

**Important!** Intersting details

From what I can tell requests to root `/` are still sent to the default address. While requests any other address are sent to the proxy. For example in this project running on port 3000, with proxy 

- `/` -> `http://localhost:3000`
- `/about` -> `http://localhost:4000/about`
- `/random` -> `http://localhost:4000/random`

It doesn't mention this in the docs, that I could find, but seemed to be the case when I was testing. I did a little searching around on this and the answer I found was that this was "expected behavior". It could be specific to Create React App. 

https://docs.npmjs.com/misc/config#proxy


---


## Getting started

Download the demo project for this lesson [here](https://github.com/Product-College-Labs/react-express-project). Set up and then run the project: 

- `npm install`
- `npm start`


---


The demo project was created with Create React App and should open in a browser and be hosted at localhost:3000. You can check the address in the address bar. 

This is a simple starter project and doesn't do much. It's probably not doing anything at the moment. You should see an error in the console: 

> Failed to load resource: the server responded with a status of 500

A 500 error means something has gone wrong at the server. If the server isn't running that would explain it! 

Launch the server by opening a new terminal window and navigating to the directory that contains the Express project from the previous class. Launch the server. 

- `node server.js` or `nodemon server.js`

Refresh the React project in the browser. You should see the "about" message display and a random number. This data came from the server you just launched! 


---


### Tour the Demo Project 

Open the demo React project and look at 'package.json'. Look at line 10. 

`"proxy": "http://localhost:4000",`

Here is where the proxy server is set to 4000. 

Open the Express Project. Look at 'server.js'. Scroll to the bottom of the file. Find these lines: 

```js
const port = 4000
app.listen(port, () => console.log(`LISTENING ON PORT ${port}`))
```

Here is where the port for this application is set to 4000 and the server is launched with that port. 

From this point, when both applications are running, the React project will run at **localhost:3000** but it will make network requests to **localhost:4000**. The express project will be running at **localhost:4000** and respond to requests from there. 


---


## Planning your custom project

The goal from here to end of the term will be to define and create a custom project using React. Your custom project should use a backend created by you. You can also use an API from another service if you like. 

Connecting to a server and requesting data hinges on the API that is provided by the service. If you make the backend you get to define the API, if you are using a third-party service you must follow their API. 

A well-written API makes your job on the frontend easier. A poorly defined API makes your job more difficult. 

### What APIs have you used in the past

Pair and share your previous experiences with APIs. Answer these questions: 

- What APIs have you used? 
- Quickly describe them
    - What did the endpoints look like? 
    - What parameters did they take? 
- Rate the experience of using these APIs
    - When did it work well?
    - Were there any problems?

### What makes a good API? 

Pair and share the qualities of a good API design

- What makes a good API? 
    - Naming?
    - Parameters?
    - Other features?

## Challenges 

- Define your project
    - Provide a short description of the MVP product that you intend to create for the end of the term
    - Create a wireframe for the project
        - While drawing all of the boxes on the wireframe define the components you think you might need to build. 
    - Create a GitHub Repo for the new project
        - Use Create React App to create a new starter project

## Additional Resources

1. https://medium.com/@RossWhitehouse/setting-up-eslint-in-react-c20015ef35f7
1. https://blog.usejournal.com/how-not-to-design-restful-apis-fb4892d9057a
1. https://medium.com/@rkuris/good-apis-cd861b8b70a3
1. https://www.smashingmagazine.com/2018/01/understanding-using-rest-api/
1. https://techburst.io/6-apis-you-should-learn-in-2018-81aca1b06465
1. https://codeburst.io/6-interesting-apis-to-check-out-in-2018-5d6830063f29
