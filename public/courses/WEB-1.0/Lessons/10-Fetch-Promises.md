<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# WEB 1.0 - Network actions with JS

<!-- > -->

## Learning Objectives <!--3 min-->

- Use JS Promise to handle async actions
- Load data over the network with JS

<!-- > -->

<!-- 

Success Skills - 

- Revist the project planning todos and and estimates here. 
- Maybe add planning your day? 

 -->

### Why learn this?

Network and asynchronous operations are a big part of front end development in terms of how to send/recieve data in a timely manner that doesn't frustrate your users.

**Questions about asynchronous actions are some of the most common questions at interviews.**

<!-- > -->

## How does JavaScript work? <!--15 min-->

Read this:

[https://itnext.io/how-javascript-works-in-browser-and-node-ab7d0d09ac2f](https://itnext.io/how-javascript-works-in-browser-and-node-ab7d0d09ac2f)

Look for these topics in the article:

Pair and discuss the following questions:

1. What is a single threaded language?
1. How does JavaScript's runtime stack work?
1. What does it mean for a Web API to be asynchronous?
1. Describe the callback queue and event loop, and how they differ

**We'll go over as a group, so make sure you have answers for all in case you're called upon!**

<!-- > -->

## Loading data over the internet <!--5 min-->

In JS the tool used to load data over the internet is `fetch()`. 

This is a browser API.

The process of loading data is handled asynchronously.

A `Promise` is an object used to asynchronous actions.

<!-- > -->

### What is synchronous?

> adjective: **synchronous**
> 1. existing or occurring at the same time. "glaciations were approximately synchronous in both hemispheres"
> 2. ASTRONOMY (of a satellite or its orbit) making or denoting an orbit around the earth or another celestial body in which one revolution is completed in the period taken for the body to rotate about its axis.

<!-- > -->

### What is asynchronous? 

> adjective: asynchronous
> 1. (of two or more objects or events) not existing or happening at the same time.
> 2. COMPUTING•TELECOMMUNICATIONS of or requiring a form of computer control timing protocol in which a specific operation begins upon receipt of an indication (signal) that the preceding operation has been completed.

<!-- > -->

Word Origins:

Greek: **Sun** - together, **Khronos** - time

Greek: **Sunkhronus**

Synchronous together in time.

**Asynchronous**

"not coinciding in time," from **a-** (3) "not, without" + **synchronous** "existing or happening at the same time."

Asynchronous Not together in time.

<!-- > -->

**Promise**

- a declaration or assurance that one will do a particular thing or that a particular thing will happen.
- an indication that something specified is expected or likely to occur.

<!-- > -->

## Fetch and Promise <!--10 min-->

`fetch()`

https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch

The `fetch()` method returns a Promise, which is an object used to handle asynchronous operations.

https://medium.com/@kevinyckim33/what-are-promises-in-javascript-f1a5fc5b34bf

In short when a function returns a Promise you can call the promise's `then()` method and provide a callback function which the promise will execute if it completes successfully, you call the `catch()` method and provide a callback the promise will execute if it fails.

**Read the paragraph above again**

Example: 

```JS
const p = fetch('path/to/resource')
p.then(myCallback)
function myCallback(response) { ... }
```

<!-- > -->

We can shorten this by chaining the function calls. 

```JS
fetch('path/to/resource').then(myCallback)
function myCallback(repsonse) { ... }
```

<!-- > -->

It could be shorter: 

```JS
fetch('path/to/resource').then(function (repsonse) { ... })
```

<!-- > -->

Make it look nice:

```JS
fetch('path/to/resource')
  .then(function (repsonse) { ... })
```

<!-- > -->

When using fetch there are two stages. The first stage returns a response from the server this is **just a connection**. The second stage is where you stream your data. In this step, you are loading the data you have asked for. 

**Read the paragraph above again**

<!-- > -->

```JS 
fetch('someurl')
  // first promise
  .then(function(res) {
    // This response says "thanks for calling what do you need?
    return res.json() // You reply "I need some JSON"
  })
  // second promise
  .then(function(json) {
    // You receive the JSON here
  })
```

<!-- > -->

```JS
fetch('path/to/resource')
  .then(function (repsonse) {
    // tell the response object how to stream
    // I'd like to stream as JSON
    return response.json() // returns a promise!
  })
  .then(function(json) {
    // When this resolves your JSON data has loaded
    // do stuff with json here
  })
  .catch(function(err) {
    // If either of the two promises above fail
    // Handle the error here
  }) 
```

<!-- > -->

Let's look at that **without** the callbacks: 

Since fetch returns a Promise you can chain a call a method call at the end.

```JS
fetch().then().then()
```

<!-- > -->

Or like this. Adding a line return before the dot moving each method call to the next line makes it easier to read. 

```JS
fetch()
  .then() 
  .then()
```

<!-- > -->

Or, this is more verbose. Here I've assigned each Promise to a variable. 

```JS 
const p1 = fetch()
const p2 = p1.then()
p2.then()
```

<!-- > -->

**Pair up and draw the call stack**

Think back to the discussion of "How JavaScript works".

Draw a picture of how this works in JavaScript. Include: 

- CallStack 
- Web API

<!-- > -->

## Check for understanding <!--7 min-->

Write out the following on your own, then discuss with a partner in a breakout room. Finally, we'll discuss the questions as a class:

- What is the difference between synchronous and asynchronous
- What is a promise, and why do we use it?
- In your own words, describe what a callback is

<!-- > -->

## Challenge - Tenor <!--15 min-->

This challenge will be to remake the Tenor web site with JavaScript. Following the steps below will create a web page that loads images from the Tenor service. 

Create a new index.html file. You'll need a script tag at the bottom of the body. 

<!-- > -->

### Handle a submit event

Create a form at the top of the body to hold a search form. It will have an input and submit button.

```HTML
<form id="search-form">
  <input id="input-search" placeholder="Search">
  <button type="submit">Submit</button>
</form>
```

<!-- > -->

Handle a submit event by listening to a **form**. 

```JS
const searchForm = document.getElementById('search-form')
const inputSearch = document.getElementById('input-search')

searchForm.addEventListener('submit', submitSearch)

function submitSearch(e) {
  // The form was submitted!
}
```

<!-- > -->

Get the value input into the search form. In the `submitSearch` hanlder: 

```js 
function submitSearch(e) {
  // Get the value input in the search input
  const query = inputSearch.value
 
}
```

**Stretch challenge:** Use the event target here...

<!-- > -->

Call a function to fetch your data. You'll define this function in the next step.

```js 
function submitSearch(e) {
  const query = inputSearch.value
  fetchData(query)
}
```

<!-- > -->

## 10 min break

<!-- > -->

## Fetching data from Tenor <!--20 min-->

The Tenor service provides gif images. Make a free developer account and get an API key.

[https://tenor.com/developer/dashboard](https://tenor.com/developer/dashboard)

<!-- > -->

Make a function that will perform the search, add your API key and search term to the Tenor URL. 

```js
function fetchData(search = 'cats') {
  const api = 'yourApiKeyHere'
  const path = `https://api.tenor.com/v1/search?q=${search}&key=${api}`

} 
```

<!-- > -->

The code above creates a path string that points to the Tenor endpoint and contains the API key and search term. 

Write an outline of the nextworking code: 

```js
function fetchData(search = 'cats') {
  const api = 'yourApiKeyHere'
  const path = `https://api.tenor.com/v1/search?q=${search}&key=${api}`

  fetch(path).then().then().catch()
} 
```

<!-- > -->

Call `fetch()` with the path to the endpoint. You need two `then()`s and one `catch()`. 

Provide a callback to the first `then()`. This callback receives a response object as a parameter and returns a Promise from `res.json()`.

```JS
fetch(path)
  .then(function(res) { return res.json() })
  .then()
  .catch()
```

<!-- > -->

Now add a callback to the second `then()`. You're calling this on the second promise returned from `res.json()`. This callback will call the `handleData()` function which you'll implement below. This callback receives JSON data from Tenoir. You'll pass the JSON data as an argument to the callback

```JS
fetch(path)
  .then(function(res) { return res.json() })
  .then(function(json) { handleData(data) })
  .catch()
```

<!-- > -->

Now handle any errors with a callback in the catch callback. This callback receives an error object as a parameter and logs the `err.message` to the console.

```JS
fetch(path)
  .then(function(res) { return res.json() })
  .then(function(json) { handleData(json) })
  .catch(function(err) { console.log(err.message) })
```

<!-- > -->

### Handling the JSON response

In this step, you'll use the data returned from Tenor to display images in the browser. 

<!-- > -->

Write the `handleData()` function. This function takes a parameter that is JSON data loaded from the Tenor server. As a first step log it to the console and test your work.

```JS 
function handleData(json) {
  console.log(json)
}
```

<!-- > -->

Test your work, type something in the form and click Submit. Check the console. You should see something like: 

```js
[Log] { next: 19 results: (20) weburl: https://tenor.com/search/cats-gifs }
```

<!-- > -->

## Displaying Gifs <!--rest of class-->

The Tenor service provides a JSON object with an array of Objects. Each of these objects describes a gif image at several different sizes and proportions. To display the images you'll need to complete these steps: 

- find the data array
- define an empty Html str
- loop over the data array 
  - get the gif data
  - get the src URL for the gif 
  - get the width of the gif 
  - get the height of the gif
  - append an `<img>` tag to the HTML str
- Append the HTML str to the DOM

<!-- > -->

**Find the Data Array**

Get the data array from JSON. This an array of objects that each have a lot of properties.

```JS
function handleData(json) {
  // get the data array
  const data = json.results

}
```

<!-- > -->

**Define an HTML str**

You'll use this to build some HTML that will be appended to the DOM and display the images. 

```JS
function handleData(json) {
  const data = json.results
  // Define a string to hold some html
  let htmlStr = ''

}
```

<!-- > -->

**Loop over the array of data**

Create a for loop that counts to the length of the data.

```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  // Loop over the array
  for (let i = 0; i < data.length; i += 1) {
    // ...
  }
}
```

<!-- > -->

**Get Image data**

The data array holds gif data in many sizes and formats. You will get the object for: 'gif'. 

```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  for (let i = 0; i < data.length; i += 1) {
    // get the url to an image - we'll use the fixed_width_small
    const gif = data[i].media[0].gif

  }

}
```

<!-- > -->

**Get the src, width, and height**

**You will do this portion on your own:** The image object holds lots of information about the image. You need the url, width and height to make an `<img>` tag to display the image. 

Work with a partner on this. If you get stuck, use `console.log(data)` after you declar the `data` const to see what the JSON structure looks like. From there you can figure out how to get the properties you need!

<!--solution below-->
<!--
```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  for (let i = 0; i < data.length; i += 1) {
    const gif = data[i].media[0].gif
    // get the source, width, and height
    const src = gif.url
    const width = gif.dims[0]
    const height = gif.dims[1]

  }

}
```-->

<!-- > -->

**Append and img tag to the htmlStr**

Append an img tag to the htmlStr. This needs to be valid HTML to display the image. 

```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  for (let i = 0; i < data.length; i += 1) {
    const gif = data[i].media[0].gif
    const src = gif.url
    const width = gif.dims[0]
    const height = gif.dims[1]
    // add img tags to the htmlStr
    htmlStr += `<img src="${src}" width="${width}" height="${height}">`

  }

}
```

<!-- > -->

**Set the innerHTML of a DOM element to display the images**

Looking through the images you've built a string of HTML. You can now display these images by appending this data to the DOM. 

```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  for (let i = 0; i < data.length; i += 1) {
    const gif = data[i].media[0].gif
    const src = gif.url
    const width = gif.dims[0]
    const height = gif.dims[1]
    htmlStr += `<img src="${src}" width="${width}" height="${height}">`
  }

}
```

<!-- > -->

**Make a div to display the images**

Add a div the body of the document. 

```html
<div id="container">
  <!-- Gifs here -->
</div>
```

<!-- > -->

**Get a reference to div.container**

You'll need a reference to the div to be able to add the images. 

```JS 
const container = document.getElementById('container')
```

<!-- > -->

**Set the innHTML of div.container**

Make sure this step is after the loop. 

```JS
function handleData(json) {
  const data = json.results
  let htmlStr = ''
  for (let i = 0; i < data.length; i += 1) {
    const gif = data[i].media[0].gif
    const src = gif.url
    const width = gif.dims[0]
    const height = gif.dims[1]
    htmlStr += `<img src="${src}" width="${width}" height="${height}">`
  }

  // Set the innHTML of #container
  container.innerHTML = htmlStr
}
```

<!-- > -->

## Stretch Challenges 

Try these stretch challenges: 

CSS Styles 

- Style the form
  - Style the form container
  - Style the input element
  - Style the button
- Style the images. Here are two ideas to try:
  - Style the images using Flexbox
  - Flex direction row 
  - Flex wrap wrap
  - Style the images using CSS Grid
  - Set the grid Template Columns to a number of columns, 6 might be a good place to start

<!-- > -->

## After Class 

Work on the the next assignment: [Slide Show](../Assignments/09-JS-Slide-Show.md)! **This will be due next class!**
