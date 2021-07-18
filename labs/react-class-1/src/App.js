import React, { Component } from 'react';

import Title from './title'
import Button  from './Button'
import OnOffButton from './OnOffButton'
import ToggleButton from './ToggleButton'
import Clock from './Clock'

import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Title title="Foo Bar" />
          <Button label="Click" onClick={() => console.log('!!!')}/>
          <OnOffButton />
          <ToggleButton label="Foot!" />
          <Clock />
        </header>
      </div>
    );
  }
}

export default App;

