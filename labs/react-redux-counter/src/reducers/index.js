import { combineReducers } from 'redux'
import counterreducer from './counterreducer'
import totalReducer from './totalReducer'

export default combineReducers(
  {
    counters: counterreducer,
    total: totalReducer
  }
)

/*

{
  counters: [],
  total: 0
}

*/



/*
ideas 1 - single key on state value is object

export default combineReducers(
  {
    todos: todoReducer
  }
)

state -> {
  todos: {
    todos: [],
    score: 87
  }
}

----------------------
idea 2 - two keys 
export default combineReducers(
  {
    todos: todoReducer,
    score: scoreReducer
  }
)

state -> {
  score: 86,
  todos: []
}




*/

