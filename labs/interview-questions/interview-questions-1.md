# interview questions

## 1

Given an array of arrays. For each element in the array create
a row of boxes with one box for each item in the next array.

Give this array:

[[3,3,3], [2,2], [4,4,4,4], [1]]

![Question 1](Question-1.png)

Alternative

![Question 2](Question-2.png)

Here boxes are all the same size but wrap to the next line when
there are more than three.

[[red,red,red], [orange,orange], [yellow,yellow,yellow,yellow], [green]]

## 2

Explain how this works in JavaScript?

## 3

Make this work:

`duplicate([1,2,3,4,5]); // [1,2,3,4,5,1,2,3,4,5]`

## 4

Explain "hoisting".

## 5

Question: What value is returned from the following statement?

`"i'm a lasagna hog".split("").reverse().join("");`

## 6 (Swift)

What is the difference Non-Escaping and Escaping Closures ?

## 7 (Swift)

Explain [weak self] and [unowned self] ?

## 8

Write a function that draws a sine wave it should take in
period and amplitude as params.

## 9

Write the function below. It should take in an x and y
and an array of 4 arrays.

Do not assume that the block will map to the grid.

```
mapBlockToGrid(x, y, block) {
  ...
  return [...] // new grid array with block mapped at x and y
}

var block = [
  [0,1,0,0],
  [0,1,1,0],
  [0,0,1,0],
  [0,0,0,0]
]

// Example the block above should map to the grid below.

mapBlockToGrid(4, 3, block)

[
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,1,0,0,0,0],
  [0,0,0,0,0,1,1,0,0,0],
  [0,0,0,0,0,0,1,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0]
]
````

## 10

You are given an array of objects. These Objects describe
an image with the width, height, and file path. Your job
is to return the number of images that fit the width of
a given view/window. 
