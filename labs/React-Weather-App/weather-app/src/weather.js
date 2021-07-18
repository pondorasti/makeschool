import React, { Component } from 'react'; // Import react and Component
import axios from 'axios';  // For testing did not use in this example

// Import child components
import SearchBar from './search-bar';     // An input component
import ShowWeather from './show-weather'; // Shows the weather

class Weather extends Component {
  /** ************************************
  / Contructor
  /
  / @params props - properties to configure this component
  ************************************* */
  constructor(props) {
    super(props);

    // Define some component state
    // Weather holds weather data
    this.state = {
      weather: null
    };
  }

  /** ************************************
  / On searach term
  /
  / @params term - the term to search
  ****************************************/
  onSearch(term) {
    this.fetchOpenWeather(term);
    // Not used in this example
    // this.getWeatherWithAxios(term);
    // this.fetchWeather(term);
  }

  /** ************************************
  / fetchOpenWeather
  /
  / @params city - Name of city to search for
  ****************************************/
  // Use openweathermap to load the weather data.
  fetchOpenWeather(city) {
    // Sing up up: http://openweathermap.org and get an api key
    const apikey = '2854c5771899ff92cd962dd7ad58e7b0';
    const path = `http://api.openweathermap.org/data/2.5/weather?appid=${apikey}&q=${city}`;
    // console.log("**** open weather map 1");
    // console.log(path);
    // fetch data from the api path.
    fetch(path).then((res) => {
      return res.json(); // convert the stream to json
    }).then((json) => {
      // console.log("**** open weather map 2");
      console.log(json);
      if (json.cod === "404") {
        this.setState({ weather: null }); // openweathermap did not return the weather
      } else {
        this.setState({ weather: json }); // Set weather as state
      }
    }).catch((err) => {
      console.log("**** Error open weather map");
      console.log(err, err.message);
    })
  }

  /** ************************************
  / showWeather
  ****************************************/
  showWeather() {
    // If the weather is loaded show the first component
    // otherwise show a div with a message
    if (this.state.weather) {
      return <ShowWeather weather={this.state.weather} />
    } else {
      return <div>No weather</div>;
    }
  }

  /** ************************************
  / render
  ****************************************/
  render() {
    return (
      <div>
        <h1>Weather App</h1>
        <SearchBar placeholder="City" onSubmit={(term) => {
          this.onSearch(term); // Handle onSubmit from the SearchBar here!
        }} />
        { this.showWeather() } {/* Show conditionally show a component */}
      </div>
    );
  }





  // Ignore everything below this line.

  getWeatherWithAxios(city) {
    const apikey = '2854c5771899ff92cd962dd7ad58e7b0';
    const path = 'api.openweathermap.org/data/2.5/weather?q=' + city;
    axios.get();
  }

  fetchWeather(address) {
    // These are for google map api and dark sky api not used in this example.
    const googleAPIKey = 'AIzaSyDvNBGcYSdyzczruvA6AAt7ylx-JHU_SY8';
    const apikey = '768e23ad0120d9dc9708dadcd7506083';
    const addressToGeo = `https://maps.googleapis.com/maps/api/geocode/json?key=${googleAPIKey}&address=`;

    const geoURL = addressToGeo + address;
    console.log(geoURL);
    fetch(geoURL).then((res) => {
      return res.json();
    }).then((json) => {
      console.log(">>> Geo json 1");
      console.log(json);
      if (json.status === 'ZERO_RESULTS') {
        console.log("ZERO Results");
      }

      const lat = json.results[0].geometry.location.lat;
      const lng = json.results[0].geometry.location.lng;

      const weatherURL = `https://api.darksky.net/forecast/${apikey}/${lat},${lng}`;
      console.log(weatherURL);
      return fetch(weatherURL, { mode: 'no-cors' });
    }).then((res) => {
      console.log(">>> Then Weather res 2");
      // console.log(res);
      return res.json();
      // return res.text();
      // return res.blob();
    }).then((json) => {
      console.log(">>> Weather json 3");
      console.log(json);
    }).catch((err) => {
      console.log(">>> Error");
      console.log(err.message);
    });
  }
}

export default Weather;
