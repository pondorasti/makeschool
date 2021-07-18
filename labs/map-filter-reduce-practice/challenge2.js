// ================================================================

// Array methods challenges!

// Your goal is to write some functions implementations of various regular array methods
// Slice, indexOf, find, push, reverse, shift,

// Write your code here in this file.

// **************************************************************************************
// Test your code by running: `npm test` or `npm run challenge2` for only this file
// **************************************************************************************

// Every challenge is preceeded with simple implementation of each method using the groceries array
// Challenges expect to receive parameter data from the instrument data set defined in instruments.js file
// Your goal is to extract the relevant piece of information from the data and return it.


// =================================================================
const groceries = [
    "Pasta",
    "Cereal",
    "bananas",
    "apples",
    "oranges",
    "mangoes",
    "strawberries",
    "blueberries",
    "Cheese",
    "Eggs",
    "crackers",
    "Tomato sauce",
  ];

// slice() method returns a shallow copy of a portion of an array into
// a new array object selected from start to end (end not included)
//where start and end represent the index of items in that array.

let fruits = groceries.slice(2, 8);
// console.table(fruits); // output: [bananas, apples, oranges, mangoes, strawberries, blueberries]


// 1 =================================================================
// In the instruments data, woodwind instruments are in place between index 3 and index 11
// Return an array of woodwind instruments using the slice method
function woodWindInstruments(instrumentsArray) {
  return [];
}

// The find method returns the first element in an array which satisfies a test provided by a function.
// this examples logs the first item on the grocery list that starts with the letter "C"

let firstC = groceries.find((item) => (item[0]).toLowerCase() === 'c')
// console.log(firstC); // output: "Cereal"



// 2 =================================================================
// In the instruments data, return the first instrument with LESS than 10 players
// Return an object e.g {name: picollo, family: woodwond, players: 8}

function firstInstrumentLessThan10(instrumentsArray) {
    return {};
}



// The indexOf() method searches for a specific element and returns its first index
// or -1 if it is not present.
// The findIndex method is similar. It returns the index of the first element in the array that
// satisfies a provided testing function or -1 if it is not present

let indexOfEggs = groceries.indexOf('Eggs')
//console.log(indexOfEggs) // output: 9

// 3 =================================================================
// In the instruments data, find the index of the "Accordion", "Harp", "Double bass", "Piano" and "Lyre"
// Return a number that is total sum of these indexes
function sumOfIndexes(instrumentsArray) {
    return 0;
}


// The push() method adds new items to the end of an array.
// the ushift() method adds items to the beginning of an array

groceries.push('flour')
// console.log(groceries[groceries.length - 1]); //output: 'flour'

groceries.unshift('sparkling water')
// console.log(groceries[0]); // 'sparkling water'


// 4 =================================================================
// add more instruments to the instruments data
// add  {"family": "Woodwind", "name": "Bagpipe", "players": 12} to the end of the array, 
// add {"family": "Brass", "name": "Vuvuzela", "players": 15} to the beginning off the array
// return a new array containing the new instruments at the first index and last index;
function addMoreInstruments(instrumentArray) {
    return [];

}

// The forEach() method executes a function once for each item in the array.
// add the number of players
// find the instrument with the highest number of players
// flatten array

// The forEach() method executes a function once for each item in the array.

// groceries.forEach((e => console.table(e))) // output: prints out the items in the array to the console.



// 5 =================================================================
// Use a forEach loop to get the total number of instrument players in the instrument dataset
// Return a number that is the sum total of all the players

function totalNumberOfPlayers(instrumentArray) {
    return 0;
}



// 6 =================================================================
// Find the instrument with the highest number of players
// Return an object containing the details of the instrument with the highest number of players
// e.g. {"family": "woodwind","name": "Lyre", "players": 24}

function instrumentWithHighestPlayers(instrumentArray) {
    return {};
}

module.exports = {
    woodWindInstruments,
    firstInstrumentLessThan10,
    sumOfIndexes,
    addMoreInstruments,
    totalNumberOfPlayers,
    instrumentWithHighestPlayers
};
