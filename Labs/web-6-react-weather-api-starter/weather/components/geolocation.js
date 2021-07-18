import React, { Component } from 'react';

class GeoLocation extends Component {
  constructor(props) {
    super(props)

    this.state = { lat: 0, lon: 0, status: null }
  }

  componentDidMount() {
    console.log('Component Did mount')
  }

  onGetlocation() {
    if ("geolocation" in navigator) {
      this.setState({ status:"Fetching geolocation" })
      this.fetchLocation()
    } else {
      this.setState({ status:"geolocation IS NOT available" })
      return
    }

  }

  fetchLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
      this.setState({
        lat: position.coords.latitude,
        lon: position.coords.longitude,
        status: "Location Found"
      })
      this.props.onLocation(this.state.lat, this.state.lon)
    })
  }

  render() {
    return (
      <div>
        <h1>Geolocation</h1>
        <small>This component displays geo location</small>
        <p>
          <span>{this.state.lat}</span> :
          <span> {this.state.lon}</span>
        </p>
        <p><button onClick={(e) => {
          this.onGetlocation()
        }}>Get Geolocation</button></p>
        <p>Status: {this.state.status}</p>
      </div>)
  }
}

export default GeoLocation;
