export const LOAD_WEATHER = 'LOAD_WEATHER'
export const WEATHER_SUCCESS = 'WEATHER_SUCCESS'
export const WEATHER_ERROR = 'WEATHER_ERROR'

export const weatherSuccess = (data) => {
	return {
		type: WEATHER_SUCCESS, 
		payload: { data }
	}
}

export const weatherError = (error) => {
	return {
		type: WEATHER_ERROR, 
		payload: { error }
	}
}

// Use a thunk. This is a function that wraps an action
export const loadWeather = (zip) => {
	// returns a function! This function receives the dispatcher
	return async (dispatch) => {
		const apikey = process.env.REACT_APP_OPENWEATHERMAP_API_KEY
		const url = `https://api.openweathermap.org/data/2.5/weather?units=imperial&zip=${zip},us&appid=${apikey}`

		try {
			const res = await fetch(url)
			const json = await res.json()
			// Call the dispatcher with an action
			dispatch(weatherSuccess(json))
		} catch(err) {
			dispatch(weatherError(err))
		}
	}
}