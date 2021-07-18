# What you Need to Know 

- Write JS Code
	- Define variables
		- const
		- let
		- var
	- Strings
		- Template Strings
	- Loops
		- for loop
	- conditional statements
		- if then else
	- functions
		- parameters
		- arguments
		- return
		- executing a function
	- Scope
		- local scope
		- global scope
		- block scope
		- closure
	- Objects and Classes
		- Object literal
		- Define a class
			- contructor
			- properties
			- methods
			- extends
			- create an instance

# Classes and Objects 

## Question 1 - Defining an Object

Online shopping is really big. It's how you and everyone else does much of their shopping.

Every shopping site has a cart. The cart needs to display the items you are purchasing, the quantity of each item, and price. 

You need to build a shopping cart! 

Object Oriented programming will be your approach.

**Step 1 - **

The first step will be to define an object that represents an item in the cart. Use a class. You class should have thefollowing properties: 

- name
- price
- qty

**Step 2 -**

Add a method to your class that returns the subtotal (price * qty). 

- subtotal: returns price * qty

**Step 3 -** 

Define a class that will be a shopping cart. A shopping cart is responsible for holding an array of Items. It should have a property:

- cart

**Step 4 -**

The Cart needs to calculate the total cost of the cart. This should be the total of all subtotals of all items in the cart. 

- total: 
	- loops through all items
	- calls subtotal on every item
	- returns the sum of all subtotals
	
**Step 5 -**

Add a method to the Cart class that adds a new item to the shopping cart. 

- addItem(name, price, qty) : Creates a new item and adds it to the cart array. 

**Step 6-**

Create a new cart and add 100 items! Use 'shopping-cart-data.js', this file defines an array of objects each with a name, price, and qty.  

- Make an instance of Cart. 
- loop through the shoppingCartData array
	- call addItem() with the params from the objects in teh array

**Step 7-**

It's possible to add tewo items with the same name when calling addItem. Modify your code to increase the qty of an item if it already exists in cart. 

**Step 8-**

Each item needs a describe() method that returns a string describing the purchase. The description string should read: 

"<name> $<price> * <qty> = <subtotal>"

**Step 9-**

The cart needs to be able to display a list of all everything in the cart. 

Create displayCart() method that prints the contents of the cart to the console by calling describe() on each item in the cart and displaying the return string in the console. 

**Step 10-**

Add a couple more methods to the shopping cart class. 

- itemCount() returns the number of items in cart
- getTax(tax) takes a tax percent and returns the tax amount
- describe() returns a string that lists all items in cart, followed by "You have <itemCount> items in your cart. Total cost <total> + tax: <getTax> = <total+tax>"

# Functions 

## Question 1 - Functions 

For Science! We need to write a string scrambler for a scientific study. Seriously science needs this! The articles below talk about a study developed and performed at the University of Cambridge. 

- https://www.mnn.com/lifestyle/arts-culture/stories/why-your-brain-can-read-jumbled-letters
- https://www.mrc-cbu.cam.ac.uk/people/matt.davis/cmabridge/
- https://en.wikipedia.org/wiki/Typoglycemia

**tl;dr** 

These studies show that people can read a sentence even if the letters between the first and last are scrambled. 

It's possible there is more to learn. You need to write some functions that will randonly scramble strings. The goal is to randomize words in different ways and test a person's ability to read a sentence where the spelling of words have been scrambled. 

**Step 1 -**

To get started you'll need a function that generates random numbers. JS provides `Math.random()`. This returns a random number between 0 and 1 as a decimal value. We need a reliable way to get random integers in a range. 

Write a function that takes a parameter `n` and returns a random number from `0` to `n - 1`. 

- `Math.random()` returns a number from 0 - 1.
- `Math.floor(n)` rounds n down to the nearest whole number.
- `Math.floor(Math.random() * 10)` returns a whole from 0 - 9.

**Step 2 -**

Randomizing characters in a string is your next goal. There are a couple approaches you can take. Here are some tools yoiu can use.

**String.length**: A String has a length property that tells you how many characters there are. 

**String.charAt(index)**: returns the character at index. 

**String.slice(beginIndex[, endIndex])**: extracts a section of a string and returns it as a new string, without modifying the original string.

**String.split(separator)**: splits a String object into an array of strings by separating the string into substrings, using a specified separator string to determine where to make each split.

**String.substring(indexStart[, indexEnd])**: method returns the part of the string between the start and end indexes, or to the end of the string.

Any easy solution is to split the string into an array with "" as the separator. This will give you and array of characters. 

From here it's all about randomizing the array. 

The easy approach is to use a while loop to continue while the length of the array is greater than 0. With each loop remove a random index from the array. To remove an element at an index use: 

**Array.splice(start[, deleteCount])**: Splice can be used to add and remove elements from an array. To remove an element set `start` to the index you want to remove and `deleteCount` to 1.

Another alternative is using an algorithm like Fisher-Yates. 

https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array

**Goal**

Write a function that randomizes the character in a given string. 

Test these strings: "What" "is" "a" "boolean"

Results: "tWah" "is" "a" "boaleon" or something similar. Remember it's random. 

**Step 2.5 -**

As above but leave the first and last letter in place. Only randomize the letters between the first and last letters. 

To accomplish this you can start with the code from the previous step. 

If you split the string into an array you can remove the first and last characters, randomize what's left and then add these characters to begining and end of the results. 

**Array.pop()**: removes the last letter from an array and returns it. 

**Array.shift()**: removes the first character from an array and returns it. 

**Goal**

Write a _new_ function that randomizes all letters between the first and last in a given string. 

Test with these words: "What" "is" "a" "string"

Results: "Waht" "is" "a" "sinrtg"

**Step 3 -**

Write a function that takes a string and divide it into words on the space and scrambles each word.

The goal is to take a sentence and scramble each word. This will be naive first approach. 

You can use `String.split(' ')` to get an array of strings split on the " ". From here you need to loop through the array and pass each string through one of the string randomizers you wrote ealier. 

Test this with string: "The rains in spain fall mainly on the plains"

Results: Something like

"The rnais in saipn flal minlay on the palnis"

or 

"ehT nrias in ispan llaf yilnma on the ialsnp"

**Step 3.5-**

The scientists need to be able to process a lot of text in different ways. The system you create needs to be flexible. 

Modify the last function you wrote to take two parameters. The first is the string of words to be randomized. The second parameter is the function used to randomize those words! 

for example your function might look like this: 

```
const sentenceRandomizer = (stringOfWords, randomizerFunction) => {
	...
}
```

Imagine you defined two functions `randomizeWord` and `randomizeWordWithFirstAndLastInPlace` you could call the function above like this: 

```
const str = "The rains in spain fall mainly on the plains"

// Should randomize words
sentenceRandomizer(str, randomizeWord) 

// Should randomize words but leave the first and last letters in place
sentenceRandomizer(str, randomizeWordWithFirstAndLastInPlace) 
```

**Step 4 -** 

The next step is handling punctuation. Consider that you need to handle the possiblity of a word ending with `!`, `.`, `?`, or `,`. You need to preserve this character in it's position. 

Test with this sample string: "What the heck! Where are my keys?"

**Step 5 -**

Write a function that shifts the letters of a string by `n` places. For example: 

- ("test", 1) => "ttes" 
- ("Weather", 3) => "herWeat"

## Question 1 - Functions 

Write a function that counts to any number printing each value to the console. When the number is divisible by 3 in place of the value print "fizz" when the number is divisible by "5" print "buzz". If the number is divisible by 3 and 5 print "fizz buzz". 

## Question 2 - Functions parameters

Modify the function above so that is takes two extra parameters let's call them `a` and `b`. These will replace the fixed numbers 3 and 5 in the first example. You new function should print 'fizz' when the count is divisible by `a`, 'buzz' when the count is divisible by `b`, and 'fizz buzz' when the number is divisible by `a`, and `b`. 

## Loops and Objects

Take a look at `shopping-cart-data.js`. This is a list of 100 items that includes the name, price, and quantity item. Your goal is to write a function that lists all of the products. 

- List the name of each product
- List the name, price, and quantity
- List the name, price, quantity, and subtotal 
	- Subtotal is the price * qty

Display information above in the console. 

- Display the total number of items at the bottom
	- This should be a total of all qty values
- Display the total cost at the bottom
	- This should be total of all subtotals

Now display this all in the browser. 

- List each item in the browser in an p, li, or other tag. 
	- `<p>Ice Cream Bar - Rolo Cone $5.19 * 6 = 31.14</p>`
- Include the total and total qty at the bottom

# Arrays

## Question 1 - Basics

- Define an Array
	- literal []
	- new Array()
- Add an element to an array
	- push
	- []
- Get the length of an array
- Manipulating an array
	- pop() removes last
	- shift() removes first
	- slice()
	- splice()
- loop through all elements of an array
- Get an element from an array

# Strings

## Basics -

- Define a string
- Get the length of a string
- String methods
	- charAt()
	- charCode()
	- includes()
	- indeOf()
- Escaping
	- \'
	- \n

## Template Strings

- Define a template string and inlcude a variable
- Define a template string use an expression

# Loops and Arrays

## Question 1 - Loops

Write function that prints the contents of an array. Put a space " " between each element. Assume each element is a single string or number. Prin the results to the console.

For example given the the array [33, 12, 74, 8] Your function should print:

<pre>33 12 74 8</pre>

## Question 2 - Loops 2

Modify the previous function to handle one dimensional or two dimensional arrays.

In the case of a one dimensional array the results should be the same as above.

When the array is two dimensional each sub array should print its contents on the same line. For example given
[ [1, 2, 3], [4, 5, 6], [7, 8, 9] ] it should print

<pre>
1 2 3
4 5 6
7 8 9
</pre>

If the given array is: [11, 22, 33] your function should print:

<pre>11 22 33</pre>

## Question 3 - Loops and Arrays

Write a function that generates a two dimensional array of any any height and width filled 0.

Your function given a width of 4 and a height of 6 display:

<pre>
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
</pre>

Note: if you're using conole.log() you may see: (6) 0 0 0 0. Since each of the 6 lines is the same same string it prints the line once and says how many times it was repeated.

## Question 4 -

Map one array on to another array. Your job is to write a function that takes two arrays and returns an array. The returned array should be the length of the first array with it's values, the values of the second array should be overwritten onto the second array.

For example: function combineArray([0,0,0,0,0,0], [5,4,3]) should return: [5,4,3,0,0,0]

For example: function combineArray([0,0], [5,4,3]) should return: [5,4]

## Question 5 -

Extend the example above to inlcude a third parameter. This will be a number that sets the starting index where the second array will start as it is superimposed over the first array.

For example: function combineArray([0,0,0,0,0,0], [5,4,3], 2) should return: [0,0,5,4,3,0]

For example: function combineArray([0,0,0], [5,4,3], 1) should return: [0,5,4]

## Question 6 -

Write a function that maps a two dimensional array over another two dimensional array.

For example, given the two arrays below:


```JavaScript

// First Array
[
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
]

// Second Array
[
	[1,1,1],
	[1,1,1],
	[1,1,1]
]
```

Write a function that takes two arrays, and "draws" the second array into the first array. Your function should take two extra parameter that set the starting row and column.

For example:

`mapGridOnToGrid(arr1, arr2, 2, 3)`

Returns:

```JavaScript
[
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,1,1,1,0],
	[0,0,1,1,1,0],
	[0,0,1,1,1,0],
]
```

## Question 7 -

Same as above but, array 2 only maps non 0 values to array 1.


```JavaScript

// First Array
[
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
]

// Second Array
[
	[0,0,1],
	[0,1,1],
	[0,1,0]
]
```

`mapGridOnToGrid(arr1, arr2, 2, 3)`

Returns:

```JavaScript
[
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,0,0],
	[0,0,0,0,1,0],
	[0,0,0,1,1,0],
	[0,0,0,1,0,0],
]
```

