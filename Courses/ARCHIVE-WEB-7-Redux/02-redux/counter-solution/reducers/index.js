import { combineReducers } from 'redux';
import counterReducer from './counter-reducer';
import totalReducer from './total-reducer';

export default combineReducers({
  counter: counterReducer,
  total: totalReducer
});
