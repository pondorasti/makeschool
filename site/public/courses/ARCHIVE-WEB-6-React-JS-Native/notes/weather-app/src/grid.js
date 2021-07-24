import React, { Component } from 'react';
import Square from './square';

class Grid extends Component {
  constructor(props) {
    super(props);
    this.state = {
      squares: [1,2,3,4,5,6,7,8,9,10,11,12]
    }
  }

  render() {
    const squares = this.state.squares.map((square) => {
      return <Square label={square} />
    });

    return (
      <div style={styles.grid}>
        {squares}
      </div>
    );
  }
}

export default Grid;

const styles = {
  grid: {
    width: 4 * 110 + 'px',
    border: '1px solid #000',
    margin: 'auto',
    display: 'flex',
    alignItems: 'flex-start',
    justifyContent: 'center',
    flexWrap: 'wrap'
  }
}
