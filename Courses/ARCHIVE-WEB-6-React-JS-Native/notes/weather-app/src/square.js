import React, { Component } from 'react';

const Square = (props) => {
  return (
    <div style={styles.square}>{props.label}</div>
  )
}

export default Square;

const styles = {
  square: {
    width: '100px',
    height: '100px',
    backgroundColor: '#ddd',
    lineHeight: '100px',
    textAlign: 'center',
    margin: '5px'
  }
}
