// const nums = [1,2,3]

// function mapper(arr, callback) {
//  const newArr = []
//  arr.forEach(item => newArr.push(callback(item)));
// //  const count = arr.length
// //  for (let i = 0; i < count; i += 1) {
// //    newArr.push( callback(arr[i]) )
// //  }
//  return newArr
// } 
// const doubled = mapper([1,2,3], n => n * 2)

// console.log(doubled)

const items = [
 {name: 'Goo', price: 2.99},
 {name: 'Foo', price: 1.99},
 {name: 'Bar', price: 5.99},
]
const total = items.reduce( (acc, item) => acc + ' ' + item.name, '')

// ' ' <-- Acc
// ' Goo' 
// ' GooFoo'
// 0GooFooBar

console.log(total)
