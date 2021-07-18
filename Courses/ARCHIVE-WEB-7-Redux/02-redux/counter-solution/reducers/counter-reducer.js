import { INCREMENT, DECREMENT, RESET_COUNT, INCREMENT_BY } from '../actions';

export default counterReducer = (state = 0, action) => {
  console.log("Reducer"+action);
  switch (action.type) {
    case INCREMENT:
      return state += 1;
    case DECREMENT:
      return state -= 1;
    case RESET_COUNT:
      return 0;
    case INCREMENT_BY:
      return state += action.payload;
    default:
      return state;
  }
}
