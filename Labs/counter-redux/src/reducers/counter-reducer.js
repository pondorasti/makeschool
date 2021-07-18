import { INCREMENT, DECREMENT, NEW_COUNTER, INCREMENT_ALL } from '../actions';


// [1,2,4,6,0]
//  - action {type:"INCREMENT", payload: 2}

const counterReducer = (state = [0], action) => {
  console.log(action);
  switch (action.type) {
    case INCREMENT_ALL:
      return state.map((count) => {
        return ++count;
      })

    case INCREMENT:
      // const newState = [...state]
      // newState[action.payload]++
      // return newState;

      return state.map((count, index) => {
        return action.payload === index ? count += 1 : count;
      })

    case DECREMENT:
    return state.map((count, index) => {
      return action.payload === index ? count -= 1 : count;
    })

    case NEW_COUNTER:
      return [...state, 0];

    default:
      return state;
  }
}

export default counterReducer;
