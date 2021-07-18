import React from 'react';
// Need this to add middleware
import { createStore, applyMiddleware } from 'redux'
// Use redux-thunk to handle async actions
import thunk from 'redux-thunk'
import { Provider } from 'react-redux'
import './App.css';
import Weather from './Weather'
import rootReducer from './reducers'
import WeatherDisplay from './WeatherDisplay'

// Create the store with middleware
const store = createStore(rootReducer, applyMiddleware(thunk))

function App() {
  return (
    <Provider store={store}>
      <div className="App">
        <header className="App-header">
          <Weather />
          <WeatherDisplay />
        </header>
      </div>
    </Provider>
  );
}

export default App;
