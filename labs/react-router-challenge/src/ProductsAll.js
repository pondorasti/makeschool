import React from 'react';
import Product from './Product'
import data from './data'

function ProductsAll() {
  return (
    <div className="ProductsAll" style={{backgroundColor:'#eee', display:'grid', gridTemplateColumns:'1fr 1fr 1fr 1fr'}}>
      {
        data.map(item => (
          <Product {...item} />
        ))
      }
    </div>
  );
}

export default ProductsAll;