import React from 'react'
import { useSelector } from 'react-redux'

function Total() {
  const total = useSelector((state) => state.counters.reduce((acc, n) => acc + n))
  return <h1>{total}</h1>;
}

export default Total