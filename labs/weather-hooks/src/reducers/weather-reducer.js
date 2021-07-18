import { WEATHER_SUCCESS, WEATHER_ERROR } from '../actions'

export const weatherReducer = (state = null, { type, payload }) => {
	switch(type) {
		case WEATHER_SUCCESS: 
			return payload.data

		case WEATHER_ERROR: 
			return payload.error

		default: 
			return state
			
	}
}