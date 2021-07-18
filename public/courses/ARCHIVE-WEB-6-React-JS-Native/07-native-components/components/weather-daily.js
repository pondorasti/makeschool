// Import default components
import React, { Component } from 'react';
import { Text, View, StyleSheet, ScrollView, Image } from 'react-native';

// Define a stateful component
export default class WeatherDaily extends Component {
  // Initialize your component
  constructor(props) {
    super(props);
    // Define State for this component.
    // We'll set weather and position to null at default since there is no data yet.
    this.state = {weather:null, position:null};
    // Start the system by calling get location.
    console.log('Get location');
    this.getLocation();
  }

  getLocation() {
    // Get the location. You MUST set permission in info.plist!
    // Get the location with GPS getCurrentPosition(success, error, options)
    // ! Success and Error return JSON !
    navigator.geolocation.getCurrentPosition(
      (position) => {
        var initialPosition = JSON.stringify(position);
        console.log("- Get initial position");
        this.setState({position});
      },
      (error) => alert(JSON.stringify(error)),
      {enableHighAccuracy: true, timeout: 20000, maximumAge: 1000}
    );

    // Watch the position. navigator.geolocation.watchPosition(callBack)
    this.watchID = navigator.geolocation.watchPosition((position) => {
      var location = JSON.stringify(position);
      console.log("-- Watching Position update");
      console.log(position.coords);
      this.getWeather(position.coords.latitude, position.coords.longitude);
      this.setState({position});
      navigator.geolocation.clearWatch(this.watchID);
    });

  }


  componentWillUnmount() {
    // Clean up geolocation when this component is removed.
    navigator.geolocation.clearWatch(this.watchID);
  }

  getWeather(lat, lon) {
    // This example uses the Dark Sky API https://darksky.net/dev/
    // We need an API with HTTPS or we have to set up App Security in info.plist
    // Get your API Key
    const appkey = "768e23ad0120d9dc9708dadcd7506083";
    const url = "https://api.darksky.net/forecast/"+appkey+"/";
    const path = url+lat+","+lon+"?lang=x-pig-latin";

    // Execute a network request. Fetch is promise based.
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
    // Below fetch returns a promies which passed to json() which returns another promies.
    // https://developer.mozilla.org/en-US/docs/Web/API/Body/json

    fetch(path)
      .then((response) => response.json())
      .then((responseJson) => {
        console.log("Reponse JSON");
        // Print JSON to the console as a guide.
        console.log(responseJson);
        // Set state to weather data parsed from JSON.
        this.setState({weather:responseJson});
      })
      .catch((error) => {
        // Handle an error.
        console.error(error);
      });
  }

  formatDate(ts) {
    var date = new Date(ts * 1000);
    var hours = date.getHours();
    var minutes = "0" + date.getMinutes();
    var seconds = "0" + date.getSeconds();
    return
  }

  render() {
    // Display the weather data in this component.
    // You'll need to check for data first since the data comes over the network.

    // Check position.
    var position = this.state.position;
    if (position != null) {
      position = `longitude: ${position.coords.longitude} latitude: ${position.coords.latitude}`;
    }

    // Check the weather. Be sure to check the console, and look at JSON output.
    var weather = {}
    if (this.state.weather != null) {
      const temp        = this.state.weather.currently.apparentTemperature;
      const cloudCover  = this.state.weather.currently.cloudCover;
      const summary     = this.state.weather.currently.summary;
      const windSpeed   = this.state.weather.currently.windSpeed;
      const dailySummary = this.state.weather.daily.summary;

      weather.temp = `${temp}`;
      weather.cloudCover = `${cloudCover}`;
      weather.summary = `${summary}`;
      weather.dailySummary = `${dailySummary}`;
    }

    // Get daily data
    // Make an array to hold daily info rendered to JSX
    var daily = [];
    // Check that the daily data exists
    if (this.state.weather != null) {
      // Get the data
      let data = this.state.weather.daily.data;
      // Map data to JSX
      daily = data.map((obj, i)=>{
        const temp = obj.apparentTemperatureMax;
        const icon = obj.icon;
        const percip = obj.precipProbability;
        const summary = obj.summary;
        return (
          // Put it all in a view, don't forget a unqiue key for each!
          <View key={i} style={styles.box}>
            <Text>{temp}</Text>
            <Text>{icon}</Text>
            <Text>{percip}</Text>
            <Text>{summary}</Text>
          </View>
        );
      });
    }


    // Display stuff.
    return (
      <View style={styles.container}>
        <ScrollView automaticallyAdjustContentInsets={true}>
          <Image source={require('../images/partly-cloudy-day.png')} />
          <Text style={styles.heading}>Hello Milo!</Text>
          <Text style={styles.small}>Position: {position}</Text>
          <Text style={styles.huge}>{weather.temp}</Text>
          <Text style={styles.medium}>{weather.cloudCover}</Text>
          <Text style={styles.large}>{weather.summary}</Text>
          {/* Render the array of daily JSX stuff here.*/}
          {daily}
        </ScrollView>
      </View>
    );
  }
}

// Create a stylesheet...
const styles = StyleSheet.create({
  heading: {},
  huge: {fontSize: 60, margin: 10},
  large: {fontSize: 36, margin: 10},
  medium: {fontSize: 22, margin: 10},
  small: {fontSize: 16, margin: 10},
  container: {
    flex: 1,
    alignSelf: 'stretch' // Fill the width
  },
  box: {
    borderBottomColor: 'black',
    borderBottomWidth: 2,
    margin: 10,
    paddingBottom: 10
  }
});
