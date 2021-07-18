
// This example has some tuples. 
// These are arrays with mixed types. 
// Define a tuple type for each. 
// Add the types for the variables and function

const snack1 = ['Cookies', 142]
const snack2 = ['Avocado', 234]
const snack3 = ['Banana', 105]

function displayNutrition(food) {
  console.log(`Item: ${food[0]} Calories: ${food[1]}`)
}

console.log(displayNutrition(snack1))
console.log(displayNutrition(snack2))
console.log(displayNutrition(snack3))

// Compile the code and check what type script says: 
// tsc example-5.ts

export {
  displayNutrition
}