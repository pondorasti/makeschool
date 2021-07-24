# API app

Your goal is to make an app that uses an API. Keep it simple since 
this is a short project. You can expand on this one for the final
project if you like. 

The goal of this project is to create a React app that consumes
an API. 

## Forms and Controlled Components

Form elements are handled differently in React. Controlled components
are used to handle form elements in React. They have a very specific 
pattern. 

Read the article here and discuss this with a partner. 

https://reactjs.org/docs/forms.html

### Answer these questions

**Q:** Why use this pattern? 

**Q:** What is the pattern, how does it function? 

**Q:** Which form elements does the pattern apply to? 

**Q:** Are there any form elements that the pattern doesn't apply to? 

**Q:** Outline some use cases where this pattern might prove to convenient?

## Fetch 

Use the JavaScript fetch API to fetch internet data. Use fetch to make 
API network requests. 

## Organizing components by re-exporting

Consolidate related files into a directory, or subdirectory. You can 
re-export these files from the base directory. For example: 

- components 
  - weather 
    - components 
      - geolocation.js
      - weather-view.js
      - weather.js
    - index.js
    
The weather directory contains a set of components that 
manages a sysytem to display weather data. The components 
that collaborate are imported from weather/components/ into
index.js, and exported again. 

```JavaScript
// index.js
import Weather from './components/weather'
import GeoLocation from './components/geolocation'
import WeatherView from './components/weather-view'

export { GeoLocation, WeatherView }
export default Weather
```

Import these from index.js with:

```JavaScript
import Weather, { GeoLocation, WeatherView } from './components/weather/'
```

Notice `GeoLocation` and `WeatherView` were default exports from 
their source files, but only `Weather` is the default export from 
`component/weather`.

Since we are importing from `index.js` we don't need to include the file 
name in the path. 

`... from './components/weather/'`

http://exploringjs.com/es6/ch_modules.html

### JavaScript APIs 

As a bonus problem challenge yourself to use a JavaScript API. 
JavaScript offers many 'native' APIs. 

Here is a list of a few you might want to try: 

- AudioContext
- Crypto
- Gamepad
- MIDIAccess
- SpeechRecognition

### CORS

CORS (Cross Origin Resource Sharing). The purpose of CORS is to 
prevent Javascript code from making requests against a different origin 
(e.g., different domain) than the one from which it was served.

While this is a great security feature it can also prevent requests to 
legitimate trusted domains. 

https://spring.io/understanding/CORS

## Challenges 

https://github.com/Product-College-Labs/web-6-react-weather-api-starter





