// This is an example of a Stateless Component 

// To use JSX React must be in scope! 
import React from 'react'

// Stateless components are defined as a function that returns JSX
// Simple components always receive `props` as an argument. 
// `props` is an object with properties passed to the component.
const Title = (props) => {
  // You could execute some code here...
  const { title } = props

  return ( // Mulitline JSX expressions must be wrapped in ()
    <h1>
      {title} {/* JS Expressions inside JSX must be wrapped in {} */}
    </h1>
  )
}

// Export your Component 
export default Title
