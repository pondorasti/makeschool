// This is an example of a Stateful component

// Stateful Components are defined as Classes that extend React.Component
// Stateful Components must define a render method that returns JSX
// Stateful Components take props in their constructor
// Stateful Components define state as a class property
//  State is an object with properties
//  Never! change state directly, instead call this.setState() with new values

import React, { Component } from 'react' // Import Component from 'react'
import Button from './Button'

class ToggleButton extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selected: false
    }
  }

  handleClick(e) {
    console.log(this.state.selected)
    this.setState({ selected: !this.state.selected })
  }

  render() {
    return (
      <Button 
        label={this.props.label} 
        isSelected={this.state.selected} 
        onClick={(e) => this.handleClick()}
      />
    )
  }
}

export default ToggleButton