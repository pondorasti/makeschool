export const INCREMENT = 'INCREMENT';
export const DECREMENT = 'DECREMENT';
export const RESET_COUNT = 'RESET_COUNT';
export const INCREMENT_BY = 'INCREMENT_BY';

export const incrementCounter = () => {
  console.log("INCREMENT Action");
  return {
    type: INCREMENT
  }
}

export const decrementCounter = () => {
  return {
    type: DECREMENT
  }
}

export const resetCount = () => {
  return {
    type: RESET_COUNT
  }
}

export const incrementBy = (n = 1) => {
  return {
    type: INCREMENT_BY,
    payload: n
  }
}
