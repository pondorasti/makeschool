import { combineReducers } from 'redux'
import { weatherReducer } from './weather-reducer'

export default combineReducers({
	weather: weatherReducer
}) 