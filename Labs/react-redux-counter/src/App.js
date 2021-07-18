import React from "react";
import { Provider } from "react-redux";
import { createStore } from "redux";
import "./App.css";
import reducers from "./reducers";

import { AddCounter, Total, CounterList } from "./components";

const store = createStore(reducers);

function App() {
  return (
    <Provider store={store}>
      <div className="App">
        <AddCounter />
        <CounterList />
        <Total />
      </div>
    </Provider>
  );
}

export default App;
