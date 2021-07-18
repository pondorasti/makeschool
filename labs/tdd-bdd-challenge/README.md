# 🧪 tdd-bdd-challenge

BEW 1.2 Day 9 challenges!

**Clone or fork this repo to begin.**

## TDD Practice

1. Clone this repo locally and `cd` into its directory
2. `$ npm i` install starter code packages.
3. `$ npm i mocha -g` Install mocha globally.
4. Open the code in your preferred code editor.

**The goal is to make each test pass before the end of the class period!**

### Level 1 Challenges

#### Overview

Imagine you just got a job with a MeasureIt.com. They want to create an app that measures everything. You'll need some methods that can return measurements.

* Area should return the area of a rectangle.
* Perimeter should return the perimeter of a rectangle.
* Should return the area of a circle with radius.
* Stretch: Test that any negative widths, breadths, or radii return null

You'll start by writing pending tests for these methods. Then write functions that make the tests pass.

### Level 2 Challenges

#### Overview

The product is a shopping cart. The cart will track products added to a cart. The cart needs to add new products, remove products, and provide the total count, and price of all products in the cart.

Start with these test cases and write code to answer test case. Note: there is no code yet that does any of the things the tests ask for.

From a TDD perspective, you start with failing tests and build the  application to meet the requirements of the tests.

In terms of **BDD**, the test descriptions are written to describe what the product should be capable of doing.

```javascript
it('Should create a new item with name and price');
it('Should return an array containing all items in cart');
it('Should add a new item to the shopping cart');
it('Should return the number of items in the cart');
it('Should remove items from cart');

// Stretch Challenges
it('Should update the count of items in the cart');
it('Should remove an item when its count is 0');
it('Should return the total cost of all items in the cart');
```

Your goal is to write code that meets the above test cases.

To help visualize the how the cart behaves, you can picture the cart
as a table. Imagine the tables below were drawn up by the design
team to describe how the cart would work.

Imagine your shopping cart is empty:

| name | price | qty | cost |
|------|-------|-----|------|
|      |       |     |      |

Imagine you add an apple to the cart

| name | price | qty | cost |
|------|-------|-----|------|
| apple| 0.99  |  1  | 0.99 |
| total|       |  1  | 0.99 |

What if you add a banana?

| name  | price | qty | cost |
|-------|-------|-----|------|
| apple | 0.99  |  1  | 0.99 |
| banana| 1.29  |  1  | 1.29 |
| total |       |  2  | 2.28 |

What if you add another apple?

| name  | price | qty | cost |
|-------|-------|-----|------|
| apple | 0.99  |  2  | 1.98 |
| banana| 1.29  |  1  | 1.29 |
| total |       |  3  | 3.27 |

#### Hints

 While you won't be making a functional shopping cart, you will have to create some of the system. Think about how shopping carts work. Ask yourself how the cart will keep track of items and what exactly an item is.

"Items" in the cart will be JavaScript Objects, and the "cart" system will hold them in an array.

* Set up your tests run your code. All tests should be pending.
* Solve each test case one at a time by following the TDD pattern.
  * Write functions that handle the test case. The functions should return a value the test case can evaluate.
  * Run your tests. If the first case passes move on to the next, if not revise your code and test again.
* Solving one test case may break a previously working case. In this case refactor and test again.

## Additional Resources

* [Step by Step Setup](https://github.com/Product-College-Courses/BEW-1.2-Authentication-and-Associations/blob/master/09-TDD/in-class-tdd/README.md) - Quick documentation on how to get started with TDD and BDD in Node.
* [Chai.js Cheatsheet](https://devhints.io/chai) - Awesome cheat sheet for implementing TDD and BDD!
