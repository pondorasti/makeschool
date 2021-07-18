# FEW 2.3 - Lesson 10

# Redux Part 2

Redux has many parts the best way to own them is review! 

## Learning Objectives

1. Describe the Flux Pattern
1. Describe Application State
1. Describe Actions, Actions Creators, and Reducers

## React Redux Review 

Read the first part of this article it is a very nice and succinct explanation of React and Redux. 

https://medium.com/weekly-webtips/2020-redux-tutorial-with-hooks-and-thunk-8a6a4be6f9de

## React Router Review 

Import your dependencies: 

```
npm install react-router-dom
```

In App.js import: 

```JS
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
```

Wrap your components with a Router: 

```js
function App() {
  return (
    <div className="App">
      <Router>
        ... other components here ...
      </Router>
    </div>
  );
}
```

Define a page and add that to your Router. Use a Link to navigate to a Route. Be careful not to confuse Router and Route!

Notice the Link uses to to indicate which path it should navigate to. 

The component property in a Route is the Component that should be displayed when we navigate to that Route:

```JS
<Router>
  <Link to="/">Shop</Link>
  <Link to="/cart">Cart</Link>
  
  <Route path="/cart" component={ShoppingCartPage} />
  <Route path="/" exact component={ShoppingPage} />
</Router>
```

## Redux Review 

### Create a React app with Redux

These steps cover making a new React app with Redux.

**Create a new React app:**

```
npx create-react-app redux-review
```

**Import dependencies:** 

```
yarn add redux react-redux redux-thunk
```

**Add Actions and Reducers**

Create a folder for `src/actions` and `src/reducers`.

Create `actions/index.js`. 

Create `reducers/index.js`. Add some default code here:

```JS
import { combineReducers } from 'redux'

export default combineReducers({
	
})
```

**Setup Store and Provider**

Create the store. In `index.js` add the following: 

```JS
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import rootReducer from './reducers'

const store = createStore(rootReducer)
```

Then modify the existing code to wrap the app in the Provider component: 

```JS
ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);
```

This should setup your app to use Redux. 

From here you can make any app that uses Redux. 

### Using Redux with a web API

These steps will cover adding Redux Thunk and loading data into the Redux store. 

Add an action to load the Weather data. In `actions/index.js`

```JS
export const LOAD_WEATHER = 'LOAD_WEATHER'

export const loadWeather = (zip) => {
	return {
		type: LOAD_WEATHER,
		payload: { zip }
	}
}
```

Make a new component to load some weather data `LoadWeather.js`

```JS
import { useState } from 'react'
import { useDispatch } from 'react-redux'
import { loadWeather } from './actions'

function LoadWeather() {
	const [zip, setZip] = useState('')
  const dispatch = useDispatch()

	return (
		<form
			onSubmit={(e) => {
				e.preventDefault()
				dispatch(loadWeather(zip))
			}}
		>
			<input 
				value={zip}
				onChange={(e) => setZip(e.target.value)}
			/>
			<button>Submit</button>
		</form>
	)
}

export default LoadWeather
```

Import this component into App. Modify `App.js`:

```JS
import LoadWeather from './LoadWeather'
import './App.css';

function App() {
  return (
    <div className="App">
      <LoadWeather />
    </div>
  );
}

export default App;
```

So far this component will send an action when the form is submitted but that action hasn't yet been handled by a reducer. Since the action will be asynchronous we also need to modify the action. 

Modify `actions/index.js`. 

```JS
export const LOAD_WEATHER = 'LOAD_WEATHER'

export const loadWeather = (zip) => {
	return async (dispatch) => {
		const apikey = '467355df4c808dd6134a3b64e9ace282'
		const path = `https://api.openweathermap.org/data/2.5/weather?zip=${zip}&appid=${apikey}&units=imperial`
		const res = await fetch(path)
		const json = await res.json()
		const { cod, message } = json
		if (cod !== 200) {
			dispatch({
				type: LOAD_WEATHER,
				payload: { cod, message }
			})
			return 
		}

		const { temp } = json.main
		// console.log(json)
		dispatch({
			type: LOAD_WEATHER,
			payload: { cod, temp }
		})
	}
}
```

This is long. Below I have reduced it to the minimum code to show how the thunk works. 

```JS
export const LOAD_WEATHER = 'LOAD_WEATHER'

export const loadWeather = (zip) => {
	return async (dispatch) => {
    // Does some async code after this resolves
    // Calls the dispatcher with an action 
		dispatch({
			type: LOAD_WEATHER,
			payload: { ... }
		})

	}
}
```

The actions returns a function instead of an object. This object receives the dispatcher as a parameter. 

Define a reducer to handle the weather data. 

Add a new file: `reducers/weatherReducer.js`:

```JS
import { LOAD_WEATHER } from '../actions'

const weatherReducer = (state = null, action) => {
	switch(action.type) {
		case LOAD_WEATHER:
			return action.payload
		default: 
			return state
	}
}

export default weatherReducer
```

Now add this to your combine reducers code edit `reducer/index.js`:

```JS
import { combineReducers } from 'redux'
import weatherReducer from './weatherReducer'

export default combineReducers({
	weather: weatherReducer
})
```

You can test at this point. You won't see anything appear yet. You can log the weather data to the console in the action function or in the reducer. Try this! 

### Display the weather data

To display the weather data you'll make a new component. Since you're using Redux you can pull the data out of the store into any component using the `useSelector` hook. 

Before you start build a mental picture of state. Currently the store looks like this: 

```JS
{ weather: null }
```

When data is loaded state will look something like: 

```JS
{ weather: {
  cod: 200,
  temp: 72
} }
```

If there is an error state will look something like this: 

```JS
{ weather: {
  cod: '404',
  message: 'City not found'
} }
```

Look at your action and the payload. Then look at the weather reducer. You'll see the payload is returned as state here. 

Create a new component `DisplayTemp.js`:

```JS
import { useSelector } from 'react-redux'

function DisplayWeather() {
	const weather = useSelector(state => state.weather)
	
	if (weather === null) {
		return null
	}

	console.log(weather)

	return (
		<h1>{weather.temp}</h1>
	)
}

export default DisplayWeather
```

This component gets the weather state from the store. If the value is `null` it returns null which will display nothing. If there is a value it returns an h1 with the temp. 

Add the new component to the App. Edit `App.js`:

```JS
import LoadWeather from './LoadWeather'
import DisplayTemp from './DisplayTemp'
import './App.css';

function App() {
  return (
    <div className="App">
      <DisplayTemp />
      <LoadWeather />
    </div>
  );
}

export default App;
```

Here I imported `DisplayTemp` and added to the JSX block. 

At this point you should be able to run your App, enter a zip and display the temp. Test it to make sure everything is working: 

### Challenges

If you go this far try these challenges:

- Add some styles
  - Style the input form in `LoadWeather.js`
  - Style the temp display in `DisplayTemp.js`
  - Style the App component
- Create a component that looks for a message on `state.weather` and display the message
  - Display the message
  - Style the message
- Expand the data you've collected. So far we only have the temperature. Collect more data and pass it along to be added to state. Collect data in the `loadWeather` action.

## Tutorial concepts Review 

Quick let's review everything. Identify the following in the tutorial projects. 

1. Review and identify all of the parts of Redux
  - Actions 
  - Action Creators 
  - Reducers 
  - Combined Reducers 
  - The Store
2. Review and identify all of the parts used by React Redux
  - Provider component 
3. React REdux Hooks
  - useDispatch
  - useSelector
4. Identify and describe the parts of Redux and React Redux
  - Actions 
  - Store 
  - Reducers
  - Immutable State 
  - connected components
5. Identify and described Application State

## Challenges 

Using the sample Redux project try these challenges:

- Create a component that resets all counters
- Create a component that increments all timers
- Create a component that decrements all timers
- Create a component that displays an average of all counters
- Create a component that display the min and max counter values

Sample Redux Project: https://github.com/Make-School-Labs/react-redux-counter

## Redux Review 

Discuss issues and questions with tutorial projects. Write any questions you have abput the tutorial project down on the board. 

## After Class 

Find an issue and push a solution. Explore the issues in the projects below and find one that you are confortable working on. Develop a solution and submit a pull request. 

- [Tetris Redux App](https://github.com/soggybag/tetris-redux-app)
    - [issues](https://github.com/soggybag/tetris-redux-app/issues)
- [Simple Journal](https://github.com/soggybag/simple-journal)
    - [issues](https://github.com/soggybag/simple-journal/issues)
- [Course Book React](https://github.com/soggybag/course-book-react)
    - [issues](https://github.com/soggybag/course-book-react/issues)
- [SF Public Spaces](https://github.com/soggybag/sf-public-spaces)
    - [issues](https://github.com/soggybag/sf-public-spaces/issues)



