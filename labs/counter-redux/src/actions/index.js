export const INCREMENT = "INCREMENT"
export const DECREMENT = "DECREMENT"
export const NEW_COUNTER = "NEW_COUNTER"
export const INCREMENT_ALL = "INCREMENT_ALL"

export const incrementAll = () => {
  return {
    type: INCREMENT_ALL
  }
}


export const newCounter = () => {
  return {
    type: NEW_COUNTER
  }
}



export const incrementCounter = (index) => {
  return {
    type: INCREMENT,
    payload: index
  }
}

export const decrementCounter = (index) => {
  return {
    type: DECREMENT,
    payload: index
  }
}
