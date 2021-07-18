# Web 6 React Weather API Starter

These components load illustrate connecting to a web API. 
The example connects to OpenWeatherMap.

## Open Weather Map

The Open Weather Map API requires an API key. Register with 
with their service and replace the API key in components/weather.js
with your own. 

## GeoLocation 

GeoLocation is a native JavaScript API that provides location 
data from the device. 

*When testing I found this worked in Chrome but was blocked 
by Safari when using an HTTP connection.*

```
navigator.geolocation.getCurrentPosition((position) => {
  this.setState({
    lat: position.coords.latitude,
    lon: position.coords.longitude,
    status: "Location Found"
  })
  this.props.onLocation(this.state.lat, this.state.lon)
})
```

https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation

## Fetch 

Use Fetch to load weather data in JSON. 

```
fetch(path)
.then(res => res.json())
.then(weather => this.setState({ weather }))
.catch(err => console.log(err.message))
```

## Structure of the component 

Use a folder to organize related components. When a folder 
contains `index.js` this will be the default import. 

- weather : The default component
  - components : Contains components
    - geolocation.js 
    - weather-view.js 
    - weather.js : Imports GeoLocation and Weather View
  - index.js : Import Weather and Exports Weather
  
 Add weather folder and import the weather component:
 
 `import Weather from './components/weather/'`
 
## Challenges 
 
1. Create a new React project and import the weather components 
2. Register with OpenWeatherMap and generate an API Key. 
3. Replace `apikey` in `weather/components/weather.js` with your api key. 
4. Test your project and view the weather. 
5. Log the weather object to the console and examine it. 
6. Display `pressure`, 'temp_min' and `temp_max` in `weather-view.js` (WeatherView) component 
 
Stretch Challenges

1. Lookat the 5 day 3hr forcast here: https://openweathermap.org/forecast5
  - Switch the api call to use this instead. 
2. Display the 5 day forcast. 
  - Use a component for each daily weather report. 
3. Look up the DarkSkys API: https://darksky.net/dev
  - Switch the app over to the dark sky api. 
