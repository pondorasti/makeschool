# FEW 2.3 Assignment 3

Solve the challenges below to assess your knowledge of map, filter, and reduce. 

## Challenges!

After working through all this project give yourself a a review on your knowledge of map, filter, and reduce. Try to solve the problems below:

### Map Challenges

```JS  
// Transform objects to categories 
const allCategories = data.map((obj) => {
	return obj.category
})
console.log(allCategories) // Should display ["Toys", "Kids", "Electronics", ...]

// Transform objects to prices 
const allPrices = data.map((obj) => {
	// Your code here...
})

console.log(allPrices) // should display ["$12.07", "$185.21", "$190.79", ... ]

// Transform objects to names 
const allNames = data.map(/* What goes here? */)

console.log(allNames) // Should display ["Zoolab", "Lotstring", "Fintone", ... ]


// Transform Objects to ratings
const allRatings // Map data to a list of ratings here...

console.log(allRatings) // [3.0, 3.0, 3.1, ... ]

// Transform objects to units
// You do it all. Create an array of the unit values from the data

// -------------------------------------------------

// Now combine two or more properties to generate new values 

// Transform objects into names and prices
const namesAndPrices = data.map((obj) => {
  return `${obj.name} ${obj.price}`
})

console.log(namesAndPrices) // ["Zoolab $12.07", "Lotstring $185.21", "Fintone $190.79", ... ]


// Transform objects into names and categories
const namesAndCategories = data.map((obj) => {
  // what goes here?
})

console.log(namesAndCategories) // ["Zoolab Toys", "Lotstring Kids", "Fintone Electronics", ... ]


// Transform data into Names and ratings
const namesAndRatings = data.map(/* what goes here? */)

console.log(namesAndRatings) // // ["Zoolab 3.0", "Lotstring 3.0", "Fintone 3.1", ... ]


// Transform data into an array of strings that show: 
// Name price and rating
// Zoolab $12.07 Rating: 3.0
const namePriceRating = data.map((obj) => {
  return `${obj.name} ${obj.price} Rating: ${obj.rating}`
})

console.log(namePriceRating) // ["Zoolab $12.07 Rating: 3.0", ... ]


// Transform data to an array of 
// Name category Units
// Zoolab Toys Units: 632
const nameCategoryUnits = data.map(/* What goes here? */)


// Transform data into 
// id Name Category 
// 1 Zoolab Toys
const idNameCategory // you do the rest...

console.log(idNameCategory)

// Map also includes the index of each item. 

// ...you do all the work...

```

### Filter Challenges

```JS
// ------------------------------------------------

// Filter problems 

// The function provided to filter must return 
// true if the item is to be included or false if not

const allToys = data.filter((obj) => {
  return obj.category === "Toys"
})

console.log(allToys)

const allKids = data.filter((obj) => {
 // Return only items where the category is Kids
})

console.log(allKids)

// Filter for category Games
const allGames = data.filter(/* Your code here... */)

console.log(allGames)

// Filter for all objects in category Music
const allMusic // Your code here...

console.log(allMusic)

// Find all of the objects with a rating 
// greater than 3.0
const ratingOverThree = data.filter((obj) => {
  // ??? 
})

console.log(ratingOverThree)


// Find all of the objects with a rating 
// equal to or less than 3

const ratingThreeOrLess = data.filter(/* Your code here */)

console.log(ratingThreeOrLess)

// Find all of the Sports with a rating 
// 3 or greater

const greatSports = data.filter((obj) => {
  return obj.category === "Sports" && obj.rating >= 3
})

console.log(greatSports)


// Find everything with a category of Home and 
// a rating less than 3

const badHome = data.filter(/* Your code here... */)

console.log(badHome)

// We need to restock! We should find all of the 
// objects where the rating is over 3 and the number 
// of units is less than 100

// ------------------------------------------------
```

### Reduce Challenges 

```JS
// Reduce problems

// What's our total inventory? 

const totalUnits = data.reduce((acc, obj) => {
  return acc += obj.units
})

console.log(totalUnits)

// Add up the total ratings
const totalRating = data.reduce((acc, obj) => {
  // Return the accumulator plus the objects rating
})

console.log(totalRating)

// Find the average rating by dividing the rating by the length of data
// log the answer with console.log()

// Find the total number of units in stock by adding 
// up the unit value for each product
const totalUnits = data.reduce(/* ??? */)

console.log(totalUnits)

// Reduce will use the first element to determine 
// the value type returned. In the examples above
// rating and units are number and the totals are
// also numbers. 

// You may want to return a different type 
// from the type in the source. For example, you might 
// want to return an object created from strings. 

// Do this by adding the starting value as the second 
// parameter to reduce. 

// data.reduce(() => {}, {}) // The second param is {}

// Make an object with properties that match the 
// names of each product and have values equal to 
// the rating. 

const nameRating = data.reduce((acc, obj) => {
  return acc[obj.name] = obj.rating
}, {}) 

console.log(nameRating)

const nameUnits = data.reduce((acc, obj) => {
  // Get the name and unit sould look like:
  // { Zoolab: 632, Lotstring: 241, ... }
}, {}) 

console.log(nameRating)
```