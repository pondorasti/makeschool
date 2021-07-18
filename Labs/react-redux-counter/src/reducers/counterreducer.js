import { INCREMENT, DECREMENT, RESET, ADD_COUNTER } from '../actions'

// Reducer is responsible for 1 piece of state
// - updating state
// - initializing state 


const counterreducer = (state = [0, 0], action) => {

  // const { type, payload } = action
  // const { index } = payload


  switch(action.type) {
    case INCREMENT:
      // Must return new state
      return state.map((count, i) => {
        if (i === action.payload.index) {
          return count + 1
        }
        return count
      })

    case DECREMENT: 
      return state.map((count, i) => {
        if (i === action.payload.index) {
          return count - 1
        }
        return count
      })

    case RESET: 
      return state.map((count, i) => {
        if (i === action.payload.index) {
          return 0
        }
        return count
      })

    case ADD_COUNTER: 
      // state.push(0) // BAD!!! 
      // return state 
      return [...state, 0] // copying state 

    default: 
      return state
  } 
}

export default counterreducer
