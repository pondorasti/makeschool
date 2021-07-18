import React from 'react';

function ProductDetail({name, desc, image_lg, price}) {
  return (
    <div className="ProducDetail" style={{backgroundColor:'#eef'}}>
      <h1>{name}</h1>
      <p>{desc}</p>
      <p>{price}</p>
      <img src={image_lg} />
    </div>
  );
}

export default ProductDetail;
