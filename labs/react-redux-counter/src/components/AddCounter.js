import React from 'react'
import { useDispatch } from 'react-redux'
import { addCounter } from '../actions'

function AddCounter() {
  const dispatch = useDispatch()
  return (
    <button onClick={() => dispatch(addCounter())}>Add Counter</button>
  )
}

export default AddCounter
