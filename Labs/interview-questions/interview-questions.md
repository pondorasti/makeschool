# Interview Questions 

1. Find a path through space. Supplied with a 
list of 2d coordinates find the shortest route 
from the first coordinate in the array to the 
last coordinate in the array. Assume you are given 
an array of numbers where the each pair of number 
is a latitude and a longitude. 

1. You have an array of towers and an array of zombies. 
Towers need to fire at closest zombie. 
Each array contains coordinate pairs representing x 
and y positions on the screen. 

1. You are building an online cooperative game. 
The game needs random numbers to generate
events, obstacles, and other game elements. The 
problem: the game runs on the clients 
computer and needs to generate the same sequence of 
random numbers. Talk about how you 
might approach the problem and ideas for solutions. 

2. Our app receives data in CSV format. Your job is 
to write a system to convert the CSV
into an Object array. Walk me through your solution. 

3. We have a game built on a grid of any dimensions. 
I'd like to hear three different 
approaches to manage the game board data. Each board 
square contains an GameObject with 
properties describing the contents. 

4. We have a game that works with a grid. Imagine 
objects of different colors are placed
on the grid as the game is played. You need to write 
a function to search the grid for
adjacent matches of three or more colors. 

5. We have a web serveice that produces web pages 
without any class or id names. We need 
someone to write a stylesheet for this. Describe 
your best strategy for writing CSS for 
this. 

6. Write a method that copies an object. The method 
should take an object as a parameter
and return an object. You need to do this without 
any external libraries. 

7. What is the significance of, and reason for, 
wrapping the entire content of a JavaScript 
source file in a function block?

8. What is NaN? What is its type? How can you 
reliably test if a value is equal to NaN?

9. Can you name and explain two programming paradigms 
important for JavaScript app developers? 

10. If we run the code snippet below what will appear 
in the console: 

```
var text = 'outside';
function logIt(){
    console.log(text);
    var text = 'inside';
};
logIt();
```

11. We are working on a scientific study we need a 
function that mixes up all of the letters
in a word but, the first and last letter should be 
unchanged. For example: widget might 
become wgidet. 

12. The value of Pi has become very popular with 
kids we want to make app that harnesses this 
while the opportunity is hot. Write a program that 
calculates the value of Pi.


---

1. Given an array of values you need to map the 
values on to a grid. Return an array of objects 
containing the original value, and a row and col 
that would represent the position of where the 
object would map on the grid. Assume the length 
of the original array is always a square e.g. 4, 
9, 16 etc. Assume the grid has an equal height 
and width. 

For example: 

```
[1,2,1,1,
 1,2,2,1,
 1,2,3,0,
 1,1,1,0]
 
 []
 
```

1. Given an array of values that should map to a 
grid. Find values where three or more adjecent 
values match. Adjacent values are either to the 
left, right, top or bottom, not diagonal. Return 
an array of the matching values. Assume the length 
of the original array is a square e.g. 4, 9, 16, 
etc. Assume the grid has an equal height and width. 

```
// Grid 4 x 4

[0,2,1,0,
 0,2,2,0,
 0,3,3,0,
 0,0,0,0]
 
matchThree(2) // sould find and return 
```

1. Given an array of values you need to map these 
to a 3 dimensional grid. Return an array of objects 
containing the original value and x, y, and z 
position as an integer. Assume the length of the 
original array is a cube e.g. 8, 27, 64. Assume the 
height and width of the grid is equal. 

1. Given an array of values that map to a 3 
dimensional grid. Search the array for matching 
adjacent values. Your function should return values 
where three or more adjacent values match. Assume 
the original array has a length that is a cube e.g. 
8, 27, 64 etc. Assume the height, width, and depth 
are equal. 

