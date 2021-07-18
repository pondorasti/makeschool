import React from 'react';

function Product(props) {
  return (
    <div className="Product" style={{}}>
      <h3>{props.name}</h3>
      <img src={props.image} />
    </div>
  );
}

export default Product;