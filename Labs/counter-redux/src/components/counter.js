import React, { Component } from 'react';

class Counter extends Component {

  render() {
    return (
      <div>

        <h1>{this.props.count}</h1>

        <button onClick={() => {
          console.log("Counter Up!");
          this.props.onUp()
        }}>Up</button>

        <button onClick={() => {
          this.props.onDown()
        }}>Down</button>

      </div>
    );
  }
}

export default Counter;








//
