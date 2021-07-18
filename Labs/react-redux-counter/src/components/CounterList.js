import React from 'react';
import Counter from './Counter'
import { useSelector } from 'react-redux'

function CounterList() {
  const counters = useSelector((state) => state.counters)
  const counterList = counters.map((count, i) => {
    return <Counter key={i} index={i} />;
  });

  return <div className="App">{counterList}</div>;
}

export default CounterList
