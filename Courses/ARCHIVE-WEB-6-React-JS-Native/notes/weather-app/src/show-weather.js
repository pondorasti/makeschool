import React, { Component } from 'react';


/** ************************************
/ ShowWeather
/
****************************************/
// A simple component to display weather data
export default (props) => {
  const data = props.weather;

  // Convert data for display here.
  //  - Convert temp K to F or C.
  //  - Load an image for icon
  //  etc.

  // Style this component...

  return (
    <div>
      <div>Latitude:{data.coord.lon}, Longitude:{data.coord.lat}</div>
      <div>{data.weather[0].main}</div>
      <div>{data.weather[0].description}</div>
      <div>Icon:{data.weather[0].icon}</div>
      <div>Temp:{data.main.temp}</div>
      <div>Pressure:{data.main.pressure}</div>
      <div>Humidity:{data.main.humidity}</div>
      <div>Temp:{data.main.temp}</div>
      <div>Temp Min:{data.main.temp_min}</div>
      <div>Temp Max:{data.main.temp_max}</div>
      <div>Wind Speed:{data.wind.speed}</div>
      <div>Wind deg:{data.wind.deg}</div>
      <div>Clouds:{data.clouds.all}</div>
    </div>
  );
}
