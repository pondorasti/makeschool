// A simple/stateless component 
import React from 'react'

// Renders the time from a date
const Time = ({ date, locale }) => {
  const timeStr = date.toLocaleTimeString(locale)
  return (
    <div>{timeStr}</div>
  )
} 

export default Time