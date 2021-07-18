// This is an example of a Stateful component
// The example includes component lifecycle methods 

import React, { Component } from 'react'
import Time from './Time'

// Extends Component
class Clock extends Component {
  constructor(props) {
    super(props)
    // Define state 
    this.state = { date: new Date() }
  }

  componentDidMount() {
    // When the component is added to the DOM do this
    this.timer = setInterval(() => {
      this.setState({ date: new Date() })
    }, 500)
  }

  componentWillUnmount() {
    // When the component is removed from the DOM
    clearInterval(this.timer)
  }

  render() {
    return (
      <div>
        <Time date={this.state.date} />
      </div>
    )
  }
}

export default Clock