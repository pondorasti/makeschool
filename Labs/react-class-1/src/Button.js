import React from 'react'

const Button = (props) => {
  if (props.isSelected) {
    console.log('Button is selected ' + props.isSelected)
    styles = { ...styles, backgroundColor:'#db7116' }
  } else {
    styles = { ...styles, backgroundColor:'#22be31' }
  }

  return (
    // Styles assigned to style attribute
    <button style={styles} onClick={props.onClick}>
      {props.label}
    </button>
  )
}

export default Button

// Components can be styled with JavaScript
// Define an object with the camelcase collection of styles 
// Assign this to JSX elements via the `style` attribute
let styles = {
  padding: '0.25em 0.5em 0.25em 0.5em', 
  border: 'none', 
  borderRadius: '0.5em',
  backgroundColor: '#22be31',
  fontSize: '16px',
  color: '#030',
}