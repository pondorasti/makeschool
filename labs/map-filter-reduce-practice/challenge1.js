
// ================================================================

// Array methods challenges! 

// Your goal is to write some functions implementations of map/filter/reduce that will extract
// relevant data from an array. 

// Write your code here in this file. 

// *************************************
// Test your code by running: `npm test`
// *************************************

// Challenges 1, 3, 5 expect to receive a simple array of numbers [1, 2, 3, 4, 5] as the parameter data.
// The other challenges expect to receive parameter data from the people data set defined in people.js file
// Your goal is to extract the relevant 
// piece of information from the data and return it.

// =================================================================


// 1 ---------------------------------------------------------------
// Map turn these numbers into strings
// Return an array with the numbers in the numbersArray as prices
function convertNumbersToPrices(nums) {
	return [];
}

// 2 ---------------------------------------------------------------
// Map turn the balance in the peopleArray into currency notation
// Return an array of the balance field (people.balance) as a string in currency notation.
// For example 2276.38 => "$2,276.38"
function transformBalancetoCurrency(peopleArray) {
	return [];
}

// 3 ---------------------------------------------------------------
// Filter out the odd numbers in the numbersArray leaving only the even numbers
// Return an array of even numbers

function filterOddNumbers(nums) {
	return [];
}

// 4 ---------------------------------------------------------------
// Filter out the number of unregisterd people in the people data leaving only the registered people
// Return an array of registered People

function filterUnregisteredPeople(peopleArray) {
	return [];
}

// 4 ---------------------------------------------------------------
// Filter out the number of unregisterd AND Unactive people in the people data
// Return an array of registered People who are active
function filterUnregisteredAndUnactivePeople(peopleArray) {
	return [];
}


// 5 ---------------------------------------------------------------
// reduce(use the reduce method) an array of numbers to the sum of the number in the array
// Return a sum of the numbers in the array

function sumNumbers(nums) {
	return 0;
}

// 6 ---------------------------------------------------------------
// Get(use the reduce method) the sum total of the ages for all the people in the people data
// Return a sum of the ages 

function totalAge(peopleArray) {
	return 0;
}

// 7 (stretch challenge) ---------------------------------------------------------------
// Return the number of the person with the highest balance
// Return an object containing the person's name and their balance e.g. {name: "Amy JJll", balance: 3872.67 }

function highestBalanceHolder(peopleArray) {
	return {}
}

// 8 (Stretch Challenge) ---------------------------------------------------------------
// Return the number of times a particular eyeColor occurs in the people data set
// Return an object containing the eyeColor and number of times it occurs e.g {'blue': 2, 'brown': 3, 'green':0}
function countInstancesofEyeColor(peopleArray) {
	return {}
}


// 9 (Stretch Challenge) ---------------------------------------------------------------
// Return an array containing the names of every REGISTERED WOMEN in the people data

function registeredWomen(peopleArray) {
	return [];
}


// 10 (Stretch Challenge) ---------------------------------------------------------------
// Return the sum total of the balance for all REGISTERED and ACTIVE MEN in the people data
// Return your sum total in dollar currency notation e.g. $2,458.32

function totalBalanceRegandActiveMen(peopleArray) {
	return '';
}

// 11 (Stretch Challenge) ---------------------------------------------------------------
// Return the sum total of the balance for all REGISTERED and ACTIVE WOMEN in the people data
// Return your sum total in dollar currency notation e.g. $2,458.32

function totalBalanceRegandActiveWomen(peopleArray) {
	return '';
}

// 11 (Stretch Challenge) ---------------------------------------------------------------
// Return the sum total of the balance for everyone between the age of 35 and 40(people who are 35 and 40 excluded)
// Return your sum total in dollar currency notation e.g. $2,458.32

function totalBalanceAge35_40(peopleArray) {
	return '';
}




module.exports = {
	convertNumbersToPrices,
	transformBalancetoCurrency,
	filterOddNumbers,
	filterUnregisteredPeople,
	filterUnregisteredAndUnactivePeople,
	sumNumbers,
	totalAge,
	highestBalanceHolder,
	countInstancesofEyeColor,
	registeredWomen,
	totalBalanceRegandActiveMen,
	totalBalanceRegandActiveWomen,
	totalBalanceAge35_40
}