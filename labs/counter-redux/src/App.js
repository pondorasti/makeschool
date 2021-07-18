import React, { Component } from 'react';
import { createStore } from 'redux';
import { Provider } from 'react-redux';

import reducers from './reducers';
import ListCounters from './components/list-counters';

import logo from './logo.svg';
import './App.css';


import { incrementCounter, incrementAll } from './actions';

const store = createStore(reducers);

setInterval(() => {
  store.dispatch( incrementAll() ) // ...
}, 1000)


class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <div className="App">
          <ListCounters />
        </div>
      </Provider>
    );
  }
}

export default App;
