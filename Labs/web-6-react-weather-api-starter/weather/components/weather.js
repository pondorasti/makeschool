import React, { Component } from 'react'
import GeoLocation from './geolocation'
import WeatherView from './weather-view'

class Weather extends Component {
  constructor(props) {
    super(props)

    this.state = {
      weather: null
    }
  }

  fetchWeather(lat, lon) {
    const basePath = 'http://api.openweathermap.org/data/2.5/weather?'
    const apikey = 'yourapikeyhere'
    const units = 'imperial'
    const path = `${basePath}lat=${lat}&lon=${lon}&appid=${apikey}&&units=${units}`
    const options = { mode: 'no-cors' }

    // The DarkSky API doesn't allow CORS requests
    // fetch('https://api.darksky.net/forecast/yourdarkskyapihere/37.8267,-122.4233', options)
    fetch(path)
    .then(res => res.json())
    .then(weather => this.setState({ weather }))
    .catch(err => console.log(err.message))

    // If you are getting an error: ... No 'Access-Control-Allow-Origin' header
    // is present on the requested resource...
    // Try using Core Anywhere to proxy your request
    // See the example below.

    // https://stackoverflow.com/questions/43871637/no-access-control-allow-origin-header-is-present-on-the-requested-resource-whe/43881141

    // Use a proxy to skirt CORS issue
    // const darksky = `https://api.darksky.net/forecast/yourdarkskyapihere/${lat},${lon}`
    // const proxyurl = "https://cors-anywhere.herokuapp.com/";
    // const url = "https://example.com"; // site that doesn’t send Access-Control-*
    // fetch(proxyurl + darksky) // https://cors-anywhere.herokuapp.com/https://example.com
    // .then(response => response.json())
    // .then((weather) => {
    //   console.log(weather)
    //   // this.setState({ weather }) // Doesn't work with darksky API!
    // })
    // .catch(() => console.log("Can’t access " + url + " response. Blocked by browser?"))
  }

  render() {
    return (
      <div>
        <GeoLocation onLocation={(lat, lon) => {
          this.fetchWeather(lat, lon)
        }} />
        <WeatherView weather={this.state.weather} />
      </div>
    )
  }
}

export default Weather
