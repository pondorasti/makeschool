import React, { Component } from 'react';
import { connect } from 'react-redux';

class Counter extends Component {

  render() {
    return (
      <div>
        <h1>0</h1>

        <button onClick={(e) => {

        }}>Up</button>


        <button onClick={(e) => {

        }}>Down</button>


      </div>
    );
  }
}

// export default Counter;

const mapStateToProps = (state) => {
  return {}
}

const mapDispatchToProps = () => {
  return {}
}

// export default connect(mapStateToProps)(Counter);
export default connect(mapStateToProps, mapDispatchToProps())(Counter);
