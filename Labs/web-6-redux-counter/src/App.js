import React, { Component } from 'react';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import reducers from './reducers';
import Counter from './components/counter';

import './App.css';



class App extends Component {
  render() {
    return (
      <Provider store={createStore(reducers)}>
        <div className="App">
          <header className="App-header">
            <h1 className="App-title">Counter</h1>
          </header>
          <Counter />
        </div>
      </Provider>
    );
  }
}

export default App;
