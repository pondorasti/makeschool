import React from 'react'
// This is a react-redux hook 
// Use it instead of connect
// like mapStateToProps
import { useSelector } from 'react-redux'

export default function WeatherDisplay() {
	// Use this instead of mapStateToProps
	const data = useSelector(state => state.weather)

	console.log(data)
	if (data === null) {
		return null
	} else if (data.cod != 200) { 
		return <div>{data.message}</div>
	}

	const { name, cod, dt, sys, wind, clouds, coord } = data
	const { main, description, icon } = data.weather[0]
	const { temp, pressure, humidity, temp_min, temp_max } = data.main 

	return (
		<div className="WeatherDisplay">
			<div>{name}</div>
			<div>{description}</div>
			{/* <div>Icon: {icon}</div> */}
			<div className="temp">{temp.toFixed(1)}</div>
			<div>Temp Min: {temp_min} Max: {temp_max}</div>
			<div className="atmosphere">Pressure: {pressure} Humidity: {humidity}</div>
			
		</div>
	)
}

// 
