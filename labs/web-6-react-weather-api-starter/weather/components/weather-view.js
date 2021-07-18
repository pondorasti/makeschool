import React, { Component } from 'react'

class WeatherView extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    const { weather } = this.props
    console.log(weather)

    if (!weather) {
      return (
        <div>
          <h1>waiting...</h1>
        </div>)
    }

    return (
      <div>
        <h1>{weather.main.temp}˚</h1>
        <p>{weather.weather[0].description}</p>
        <small>{weather.main.humidity}</small>
        <dl>
          <dt>Wind</dt>
          <dd>Speed: {weather.wind.speed}</dd>
          <dd>deg: {weather.wind.deg}</dd>
          <dt>Clouds</dt>
          <dd>{weather.clouds.all}</dd>
        </dl>
      </div>
    )
  }
}

export default WeatherView
