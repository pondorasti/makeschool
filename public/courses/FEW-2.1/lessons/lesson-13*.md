<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Lesson 11

<small style="display:block;text-align:center">API Libraries</small>

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

# FEW 2.1 - FEW 2.1 - API Lib

The goal for this assignment is to make an Lib that works with an API. This time you'll use an object to solve the problem. 

## Why you should know this?

Working with Objects can have some advanatges. OOP is popular and has been around for a long time expect to work with it in some form. 

## Learning Objectives (5 min)

1. Use an Object to handle encapsulation
1. Use an Object to hold configuration

## Test Platform

At the beginning you wouldn't use an API. Take a look at this repo: 

https://github.com/Make-School-Labs/weather-api

The code here is a simple app that loads weather data. 

## Pair up and examine the code

Previously you looked at this problem from the perspective of creating a function that handles loading the data. This time you'll use an class and object. 

You can start from the start code or start from your previous code. 

## Make a Module

Currently the code is titghtly coupled. The `getWeather()` function contains code that is responsible for displaying the weather data in the page. 

Your first step is move this code into it's own module. 

## Make a Class

The second step is to create class that will encapsulate the `getWeather()` method.

```JS
class Weather {

  getWeather() {
    ...
  }
}
```

## Decouple the code

If you copied the code from the example you'll need to get everything that refers to DOM elements out of this class. The class should only return data. Rather than setting the `innerHTML` `getWeather()` should be returning an Object with the weather data.

There are a couple choices: use a callback or use a Promise. The choice is up to you. 

## Using the Class

Using get the `Weather` class you'll make an instance like this: 

```js
const w = new Weather()
```

Then call it's method: 

```js
w.getWeather(...)
```

If you used a promise it might look like: 

```JS
w.getWeather(...).then(...)
```

This is isn't too different from what you had before and seems like a little more work.

## Configuration

The Object allows for configuration. Objects have properties that they own. You can use these properties to store values used by the methods. 

What configuration does the Weather Object need? APIKey is a good choice, units (Fahrenheit or Celsius), the zip code or city name might also be a configuration prameter. There could be others. 

Where to set configuration? You can set configuration as properties, through the constructor or through a method. You should decide which works best for your application. 

Here are a few examples: 

```JS
const w = new Weather('yourapikey') // set in constructor
w.units = 'metric' // set as a property
w.setZip('94010') // set through a method
```

### Challenges 

Take a look at the second set of OOP challenges here: 

https://github.com/Make-School-Labs/weather-api#oop-weather

Do your best to solve these. 

## Wrap Up (5 min)

- Review
  - callbacks
  - Promise
  - async/await
  - After class 
    - Start the API Lib

## Additional Resources

1.

## After Class 

[API Lib Assignment](../assignments/assignment-09.md)

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |
