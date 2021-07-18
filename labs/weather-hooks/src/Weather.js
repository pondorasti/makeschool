// Use useState hook
import React, { useState } from 'react';
// react-redux hooks 
import { useDispatch } from 'react-redux'
import { loadWeather } from './actions'

function Weather() {
  // Use state to track zip input
  const [ zip, setZip ] = useState('90210')

	const dispatch = useDispatch() // Get the dispatcher

    return (
      <div className="App">
        <form 
          onSubmit={e => {
            e.preventDefault()
            dispatch( loadWeather(zip) )
          }}
          >

          <input 
            name="zip"
            value={zip} 
            onChange={e => setZip(e.target.value)}
            type="text" 
            pattern="(\d{5}([\-]\d{4})?)"
            placeholder="enter zip"
          />

          <button name="submit" type="submit">Submit</button>
					
        </form>
      </div>
    );
}

export default Weather;
