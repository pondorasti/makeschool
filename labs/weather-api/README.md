# weather-api
 
This repo contains some starter code that works with the [Open Weather Map API](https://openweathermap.org). 

Your goal is to work out the challenges listed below. 

## Learning Objectives 

- Implement callbacks to handle asynchromnous actions 
- Use functions to create callbacks
- Design functions and Objects that implement callbacks
- Use Promise to handle asynchronous actions
- Use aysnc and await to handle Promises
- Describe Promise it use and function

## Weather Lib

Take a look at index.html. Open this page in a web browser. Read the code contained in the script tag. Before you begin the challenges below you must understand how the starting project works.

- Talk about discuss the code with another student
- Describe what is happening in the starter code
- Make a small change to the code to test your understanding or 

Imagine you want to turn the code in index.js into a library that could be used by anyone who wanted to use the OpenWeatherMap API in any project they might create. Currently there are a couple big problems. 

You are going to adress each of the problems listed below. Check with the instructor as you solve each problem to review your work. 

The challenges below do not go straight to the best possible solution. Instead they work through the problem in steps solving each and refactoring along the way. 

### Challenge 1

The `getWeather()` function is contained `index.html` to be portable it needs to be in a separate file. This will allow anyone to import it into any project.

What to do: 

1. Make a new .js file
1. Move the `getWeather()` function into your new file. 
1. Export the `getWeather()` function from your file. 

The API key is contained in the function. To be useful anywhere the API Key needs to come from outside the `getWeather()` function. 

What to do: 

1. Add a parameter to `getWeather(apikey, zip)` 
1. replace the API Key in the function with the `apikey` parameter variable. 
1. In index.html add the api key in the function call. 

Along the way here you should make your own API Key at: https://openweathermap.org

### Challenge 2

When the call to `fetch()` resolves the second promise it sets the temperature and description on elements in the DOM. For this code to be useful in any project the code that is specific to these HTML references must to be removed from `getWeather()` and be handled by a callback. 

What to do: 

1. `getWeather(apikey, zip, callback)` should take a callback as a parameter.
1. In `getWeather(apikey, zip, callback)`  execute the callback when fetch resolves the weather data api request.  
1. Pass the weather data to the callback function as an argument.
1. In index.html define a callback function as the second parameter. It should receive a parameter that will be the JSON data sent from openweathermap. 
1. Inside the callback function you just defined set the innerHTML of the two elements to display the temperature and description. 

The goal of this challenge is to use a call back to handle the weather data in your developer code.

Test your code it should work as it did before but now the code that loads the weather data is separated from rest of the web page.

### Challenge 3

At this point you are getting an idea of how callbacks work. A `Promise` is an object that was invented to simplify and streamline asynchronous code.  

The goal of this challenge is to refactor the `getWeather()` function to return a Promise instead of using a callback. 

What to do: 

1. Refactor your `getWeather(apikey, zip)` to return a Promise. Remove the callback parameter. Fetch works in two stages and returns a promise at each stage. You can return the second promise to solve this problem. The second promise is returned from: `res.json()` 
1. Refactor your code in index.html to handle the promise returned from `getWeather()`

### Challenge 4

The `async` and `await` keywords are used with Promise to streamline your code. 

The `async` key word is used in front of a function for example: 

```JS
async function getWeather(...) { ... }
// or 
const getWeather = async (...) => { ... }
```

A function marked with `async` returns a Promise, **even if the code inside the doesn't explicity return a Promise.** 

**The `await` key word can only be used in `async` functions.** Use `await` on any line of code with a Promise to wait for that Promise to resolve. For example: 

```JS
async function getWeather(...) {
  const res = await  fetch(...) // waits here until the promise resolves
  const json = await res.json() // waits here until the promise resolves
  return json // returns json wrapped in a Promise
}
```

What to do: 

1. Declare `getWeather()` as an async function.
1. Refactor the code in the `getWeather()` function to use: `async` and `await`

This change should not affect the code in index.html. You won't have to make any changes there. 

### Challenge 5

What other improvements can you make?

Take a look at the JSON returned from openweathermap.org it's pretty confusing. How would you improve on this? Returing a more organized and better labeled Object would be a big improvement.

1. In `getWeather()` resolve the promise from `res.json()`. Create a new JS Object and and assign it properties from the weather JSON. Return your object at the end of the function. 
1. You will need to edit the code in index.html to handle this new format for the data. 

The goal here is to improve on the existing system. A good place to start is the JSON data that is returned from the API.

Feel free to make any other improvements you might think of. 

### Challenge 6

The open weather map API takes unit as a param maybe we can pass that into the `getWeather()` function.

1. Add a parameter to `getWeather()` that takes the the temperature unit as a string. This should be a string: 'metric' or 'imperial'. You can define one of these values as the default value.  
1. Use the unit in the call the openweathermap.org end point.

The goal is to add a parameter to the `getWeather(url, zip, unit)` function that takes the unit.

### Challenge 7

The OpenWeatherMap API provides a few different API options that fetch the weather for zip codes, city names, and geolocation. Your code would be more useful if it supported these options. 

You'll either need to create a separate function for each, or use a parameter to idenitfy which method you are using to get the data.

Currently the `getWeather(apikey, zip, unit)` takes apikey, zip code, and unit. 
 
- get weather by zip - `getWeatherByZip(zip, unit)`
- get weather by city - `getWeatherByCity(city, unit)`
- get weather by geolocation - `getWeatherByGeo(coords, unit)`

The goal of this challenge it expand the existing system to accept the zip, city name, or geolocation to fetch the weather. You can solve this by creating new functions, by passing new parameters to the existing function.

To solve this problem you'll need to look at the [OpenWeatherMap api docs](https://openweathermap.org/current).  

Here is a list of the URLs OpenWeatherMap uses: 

- By city name
  - api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  - api.openweathermap.org/data/2.5/weather?q={city name},{state code}&appid={API key}
  - api.openweathermap.org/data/2.5/weather?q={city name},{state code},{country code}&appid={API key}
- By city ID
  - api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
- By geocoordinates
  - api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
- By zip code 
  - api.openweathermap.org/data/2.5/weather?zip={zip code},{country code}&appid={API key}

These all begin with:

- api.openweathermap.org/data/2.5/weather?

You can use this to your coding advantage by storing this portion of the url in variable and assembling the rest of the url based on which method is called.

## Stretch Challenge: OOP Weather

This set of challenges takes the ideas from the previous challenges with the goal of creating an Class that creates a Weather Object can retrieve weather data. 

Why create a class? If you needed to get weather for more than one location it might be good to create an instance of an object to handle the weather for each location. Picture a web site or app that that managed the weather for a list of locations. 

Using a function covers some most of the use of requesting and returning weather data. Sometimes you'll need something more. Using a class will allow you to create a persistent data structure with the ability to hold it's own configuration.

### Challenge 1

The goal of this challenge is to create a class that will make an object that can get the weather data. Imagine the class is Called Weather and it works in this way.

```JS
const w = new Weather('yourapikey')
w.getWeather('zipcode').then( ... )
```

What to do: 

1. Refactor your code into a class that contains the `getWeather()` function you wrote earlier as a method. It should work like the sample code shown above. 

The difference here is that line 1 makes a new **Object**. You'll use the methods and properties of the object to configure and fetch the weather. 

Properties might be values that your object holds for configuration. 

```JS 
w.apikey = '1234567890'
w.zip = '94010'
w.units = 'metric'
// or 
w.useMetric = true
```

Your object will also have methods that execute the code that fetches the weather. 

```js 
w.getWeatherForZip('94010')
w.getWeatherForCity('San Francisco')
w.getWeatherForLocation()
```

This could be expanded into many other methods. If configuration information like: zip, city, or apikey are already set and held in a property on the object these don't need to be passed here.

How this all fits together is up to you.

Here is a starting point:

```js 
class Weather {
  constructor(apikey) {
    this.apikey = apikey
  }
}
```

Your goal is to define a class that will get the weather data. Define the properties of that class.

### Challenge 2

Your class needs methods. Write a method that will load the weather data. You can handle this however you think is best. 

Here is a rough idea: 

```js 
class Weather {
  constructor(apikey) {
    this.apikey = apikey
  }

  getWeather() {
    fetch()
    ...
  }
}
```

`getWeather()` now a method of the class can use either a callback or a promise, It's up to you. 

The configuration of API Key should be stored by the class. This way future calls to the method won't need it. 

The zip code could be passed into the method as a parameter or set as a property of the class. It's up to you! In the first case you need to supply it with each call, in the second you only need to supply it once but you'll need to set it again when you want weather from a new location.

### Challenge 3

The current weather data from OpenWeatherMap can provide weather for: 

- city name
- city id
- geo coordinates
- zip code

You should support all of these. An easy way would be to create a method for each. The API can handle each of these type of requests with different query vars. 

- `weatherForCity()`
- `weatherForId()`
- `weatherForGeo()`
- `weatherForZip()`

It would be good to use a helper method to handle fetching data. The methods above would put the URL together and pass it to the helper. 

### Challenge 4

The weather changes through out the day. It might be good to have a method that provides us with periodic updates. 

The goal of this challenge is write a method that will do that. This method should take a call back. Alternatively you could use an event listener. 

The method should also take a number of milliseconds which will set the time between updates.


