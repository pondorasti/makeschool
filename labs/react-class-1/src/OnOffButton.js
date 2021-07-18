import React, { Component } from 'react'
// Import Button 
import Button from './Button'

// Define a stateful Component
class OnOffButton extends Component {
  constructor(props) {
    super(props)
    // Define state 
    this.state = { isOn: false }
  }

  handleClick() {
    // Change state by calling setState() 
    this.setState({ isOn: !this.state.isOn })
  }

  render() {
    // Define a label value 
    const label = this.state.isOn ? 'On' : 'Off'
    return (
      <Button label={label} onClick={() => this.handleClick()} />
    )
  }
}

export default OnOffButton