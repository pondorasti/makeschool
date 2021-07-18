const INCREMENT = 'INCREMENT'
const DECREMENT = 'DECREMENT'
const RESET = 'RESET'
const ADD_COUNTER = 'ADD_COUNTER'

const increment = (index) => {
  return {
    type: INCREMENT, 
    payload: { index }
  }
}

const decrement = (index) => {
  return {
    type: DECREMENT,
    payload: { index }
  }
}

const reset = (index) => {
  return {
    type: RESET,
    payload: { index }
  }
}

const addCounter = () => {
  return {
    type: ADD_COUNTER
  }
}

export {
  INCREMENT, 
  DECREMENT,
  increment, 
  decrement, 
  RESET, 
  reset,
  ADD_COUNTER, 
  addCounter
}



