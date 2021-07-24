An array is a collection of things. When we write an array in code it looks like this: 

const myArray = ['a', 'b', 'c']

myArray is a list of strings. 

We will call the things in an array "elements". Each element is stored at an index. The index is it's position and the first position is 0. In myArray 'a' is at index 0 and 'c' is at index 2. 

To access elements in an array use the square brackets with the index. 

console.log( myArray[1] ) // 'b'


const numbers = [7,11,23,1,13,17,2,19,3,5,1]


Challenge 1

In the code editor is n array of numbers your goal is to add all of the numbers together to find the total. Follow these steps:

Define a variable to hold the total (outside the loop)
Use a for loop to loop through each element in the array and add it to the total. 
Log the total to the console when the loop has finished. 

Challenge 2

Find the average of all values in the array. Do this by dividing the total by the length of the array.

Challenge 3

Find the largest number in the array. Do this by 

Define a variable that will hold the largest number (outside the loop). Set the value to 0. 
Write a for loop that will loop once for each item in the array.
Inside the loop, use an if statement to compare the current element in the array against your variable. If the value is larger set the value of the variable to the value from the array. 
Log the largest value to the console. 

Challenge 4

Find the smallest value in the array. See if you can figure this out on your own. Use the steps from the previous challenge. The starting value of your variable will need to larger than the largest value in the array. 

Challenge 5

Find the number that is not the same as the others. 

const test = [1,1,1,1,1,0,1,1,1,1]


05 - Array 

Here is another problem to solve with arrays and loops. 

Challenge

Each of the test arrays contain some numbers. Each array has one number that is different from the others. You'r goal is to find the number that is different. 

I've written a function that takes an array. 
Then 

const test_1 = [1,1,1,1,1,0,1,1,1,1]
const test_2 = [2,3,3,3,3,3,3,3,3,3]
const test_3 = [5,6,5,5,5,5,5,5,5,5]

function findUnique(array) {
  // find the unique number in array and return it 
  
  return 
}

console.log( findUnique(test_1) ) // 0
console.log( findUnique(test_2) ) // 2
console.log( findUnique(test_3) ) // 6


--- 

05 - Array 

Here is another problem to solve with arrays and loops. 

Challenge

Each of the test arrays contain some numbers. Each array has one number that is different from the others. You'r goal is to find the number that is different. 

I've written a function that takes an array. Your' job is to find the unique element in the array. You write your code inside the function. 

Follow these steps or make up your own solution. 

This solution gets the first two numbers from the array then loops through the rest. Looking at the three numbers all three will be the same or one of them will be different. 

1. Make a variable a and set it equal to the first element in array
2. Make a second variable b and set it equal to the second element in the array
3. Now define a loop that will start counting from 2 to the length of the array
4. Inside your loop define a new variable c and set it equal to the element at the index of the loop
5. Compare all three variables. If they are all equal don't do anything and let the loop continue. If they don't match find the one that doesn't match the other two and return it. 

Below this I've called the function with each of the test arrays defined above. When your code is working correctly the console should display: 

0
2
6
8

Solution
```JS
function findUnique(array) {
  // find the unique number in array and return it 
  let a = array[0]
  let b = array[1]
  for (let n = 2; n < array.length; n += 1) {
    let c = array[n]
    if (a !== b && a !== c) {
      return a
    } else if (b !== c) {
      if (a === b) {
        return c
      }
      return b
    }
  }
}
```