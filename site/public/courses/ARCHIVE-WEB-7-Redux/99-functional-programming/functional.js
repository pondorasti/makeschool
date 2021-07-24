
// A function to determine if something exists
// Things exist if they are not null or undefined

function exists(it) {
  return it != null;
}

// Does not exist
exists(null);             // false - is null 
exists(undefined);        // false - is undefined
exists({}.noProp);        // false - has no property
exists((function(){})()); // false - returns no value

// Exists 
exists('anyvalue');     // true - any value
exists(0);              // true - even 0
exists(false);          // true - or false!

// Truthy things are true and exist! 
// They are not false

function truthy(it) {
  return (it !== false) && exists(it); 
}

// Not truthy
truthy(false);      // false - false is not true
truthy(undefined);  // false - undefined is not true

// Truthy
truthy(0);          // true - 0 is true
truthy('');         // true - empty strings are truthy


// Getting functional

var test = [null, undefined, 1, 3, 5, 0, false];
var testExists = test.map(exists);
console.log(testExists);

var testTruth = test.map(truthy);
console.log(testTruth);

// str.toLowerCase() converts a string to lowercase
// str.toUpperCase() converts a string to upper case

// Upper case first letter of word

function upperCaseFirst(str) {
  return str.split(' ').map(function(word){
    return word[0].toUpperCase() + word.substr(1);
  })
}

var names = ["andy anders", "bob baker", "caitlin cole"];
console.log(names.map(upperCaseFirst));

// Challenges 
// Imperative programming 
// 1) Write a program that sings 99 bottles of beer on the wall...
// 2) 

