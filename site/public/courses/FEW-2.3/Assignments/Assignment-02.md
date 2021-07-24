# Class - FEW 2.3 - Assignment 2

## Description 

With this project you'll connect to the OpenWeatherMap API and display the weather data. You'll use the controlled component pattern to handle user input. 

- Controlled Controlled Component Pattern. This pattern is used with form elements. 
- Conditional Rendering pattern. This is a collection of coding patterns that render components or not render them based on props or state. 

## Why this assignment?

The controlled pattern component is important since you'll use it every time you use form elements like input fields, check boxes, and radios buttons. All of these are essential to web applications. 

Conditionally rendering components is an important front end development it opens up lots of possiblities to the user interfaces you create with React.

## Getting Started

Make a new react project with: 

`npx create-react-app weather-api`

## Project requirements

Follow the video tutorials here. Start at video: "Single Page Applications - Lesson 03 1"

https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

Follow the video tutorial to buid the app.

## Challenges 

1. Create a default React app
1. Register and get an API key from openweathermap
1. Create a Weather component
1. Create a form to enter the zip and unit
1. Your form should use the [controlled component pattern](https://reactjs.org/docs/forms.html) and store form values on state
1. Fetch the weather data for the entered zip code
1. Use components to display the weather data
1. Use [conditional rendering](https://reactjs.org/docs/conditional-rendering.html) to display the data after it is loaded

### Stretch Challenges 

After you have completed the challenges above try these challenges. You can give any or all of these challenges a try and you don't have to do them in any order. 

1. Add some CSS styles to give the project your look at style
1. Expand the data that is displayed. The tutorial shows the temperature, description and feels like values. You can expand this to show:
  - humidity
  - pressure
  - wind speed
  - ...add any other properties...
1. One of the properties included with the weather data is the `icon`. It's located at: `data.weather[0].icon`. This property is a string with a value like: `"04d"`. This value maps to an image for the weather condition! You can check the images against this [page](https://openweathermap.org/weather-conditions). You can display the images by either: 
  - Displaying the OpenWeatherMap icon. Inspect their page to find the urls used. 
  - Map icon code to your own icons or images. Where can you find images?
    - Use google and find images
    - Use icons from an icon set like one of these: 
      - https://erikflowers.github.io/weather-icons/
      - https://fontawesome.com/v5.15/icons?d=gallery&p=1&q=weather
      - https://www.iconfinder.com/weather-icons?price=free

### Due date

Class 6 - June 8, Submit your work on GradeScope

### Resources

This video playlist covers all of the material from class. The material for this assignment starts at video lesson 3. 

- https://www.youtube.com/playlist?list=PLoN_ejT35AEhmWcDTI6M--ha_E4lTyAtx

## Assessing the assignment

| - | **Does not meet expectations** | **Meets expectations** | **Exceeds expectations** |
|:-------------|:---------------------------|:-------------------------|:---------------------|
| **Completed** | Did not complete | Completed challenges 1-3 | Completed challenges 4+ |
| **Functional** | Is not functional | Displays the weather data and handles errors | Displays the temp in F and C along description and atmospheric conditions and has some CSS styles |
| **Code quality** | Indentation and spacing is _inconsistent_ | Uses _consistent indentation and spacing_ | Well written and well commented, variable and function names are self commenting |
| **Code Architecture and Structure** | All code is in App.js | Uses 3 components | Uses 5 or more components, components are specialized and perform formatting and display of data based on props |
| **Work Ethic** | Did not commit when working on project | Initial commit at class and commit while working | Commits show 3 hours and clearly documents process | 
