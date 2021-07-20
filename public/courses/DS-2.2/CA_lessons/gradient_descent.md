# Gradient Descent 🗻📉

# Why you should know this 

Gradient descent is by far the most popular optimization strategy used in machine learning and deep learning at the moment. 

It is used when training data models, can be combined with every algorithm and is easy to understand and implement. 

Everyone working with machine learning should understand its concept.


# Prerequisites
* QL 1.1 Quantitative Reasoning
* DS 1.1 Data Analysis & Visualization
* DS 2.1 Machine Learning


# What is a gradient?

For a single variable equation, gradient is the slope of the equation. 

Gradient is a way of packing together all the partial derivaties of a multi-variable function into a vector.

# How do we compute gradient?

[Video on how to calculate gradient](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/gradient)

For example if you are given a math function:

<img src="https://render.githubusercontent.com/render/math?math=f(x,y) = x^{2}sin(y)" color='yellow'>


## Step 1: Find the partial derivatives with respect to both x and y

[How to calculate the partial derivatives of a function](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/partial-derivatives/v/partial-derivatives-introduction)

Partial derivative w.r.t x → <img src="https://render.githubusercontent.com/render/math?math=df/dx = 2xsin(y)">

Partial derivative w.r.t y → <img src="https://render.githubusercontent.com/render/math?math=df/dy = x^{2}cos(y)">

## Step 2: Once you have these two equations, put them into a vector.

**∇ (nabla)**  → The symbol for Gradient

<img src="assets/gradient_answer.png" height=200 width=auto>

The gradient of any function is equal to a vector with its partial derivatives. Hence Gradient could be called as a "full-derivative" since it captures all the partial derivative inside the function and puts it inside a vector representation.

### Exercise 1

* Compute the gradient of the following math function.

<img src="https://render.githubusercontent.com/render/math?math=f(x,y) = x^{4}cos(y)-4">

**Example Input:** <img src="https://render.githubusercontent.com/render/math?math=f(x,y) = x^{2}sin(y)">

**Example Output:**
<img src="https://render.githubusercontent.com/render/math?math=df/dx = 2xsin(y)"> and <img src="https://render.githubusercontent.com/render/math?math=df/dy = x^{2}cos(y)">

### Exercise 2

* Write a python function, that computes the gradient of a 2nd degree polynomial in x and y, specifided by the form A + B*x + C*y + D*x*y + Ex<sup>2</sup> + Fy<sup>2</sup>,  where the inputs are the numerical values of the coefficients [A, B, C, D, E, F].

**Example Input:** A=2,  B=3, C=4, D=5, E=6, F=7

2 + 3*x + 4*y + 5*x*y + 6x<sup>2</sup> + 7y<sup>2</sup>

**Example Output:**  [12x+5y+3, 5x+14y+4]


# Gradient in graphs

Watch this [video](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/gradient-and-graphs) that explains about gradient in graphs.

Gradient shows you which direction you should go inside the graph to approach your goal. Your goal being achieving the highest height on the graph.

The gradient points in the direction of steepest ascent. This mean the gradient will point to where you should go to achieve the maximum height in the graph.

**Gradient Ascent → Finding the maximum height(point) of a graph.**

**Gradient Descent → Finding the minimum point of a graph.**

For gradient ascent, we are trying to increase the value of **f**, where **f** is the height of the graph. So the gradient vector will point towards where the graph is increasing in height and getting steeper. 

The gradient is zero when if going in any direction from the gradient vector, the height doesn't increase or decrease in value, but rather remains roughly constant. This means for 2D fields, the graph has reached a flat/plateau surface. 


# Gradient and contour maps

Watch this [video](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/gradient-and-contour-maps) that explains more about this topic. 

# Gradient Descent

Gradient Descent is a method used to minimize the cost function. 

If cost function is graphed, the gradient descent is going towards the direction of where the steepest slope is.

What's the downhill direction?

<img src="assets/gradient_graph_steps.png" height=300 width=auto>

Calculating the Gradient Descent helps us find the lower/minimum cost function. To find where the cost function will be close to zero, because when the cost function is a small value, it means our model is correctly predicting the value that we want. 

Calculating the Gradient of a function gives us the direction of the steepest ascent. So taking the negative of that gradient will give the direction to decrease the function most quickly.

### The overall algorithm for minimizing the cost function

1. Compute the gradient direction
2. Take a small step downhill (take the negative of the gradient)
3. Repeat

Gradient descent → repeatedly changing the weights and bias of an input function by some multiple negatives of a gradient.

It's a way to converge to a local minimum of a cost function.

 <img src="assets/complex_local_minima.png" height=300>
 
# Gradient Descent in a Neural Network

Gradient Descent works by finding the minima of a certain function. 

minima ⇒ minimum height/ "valleys" of the function

## Gradient Descent and Cost Function

### What is Cost Function

Cost Function quantifies the error between predicted and expected values of each output of a model and presents it in the form of a single real number. 

- **Input of a cost function is all of the weights and biases of the Neural Network.**
- **The output is 1 number that describes how bad the weights and biases are so that they could be improved upon.**

### Calculating the cost function


The formula of cost function for MNIST digit classifier is: 

𝚺<img src="https://render.githubusercontent.com/render/math?math={(estimated probability - predicted probability)}^2">

The cost function is not always the sum of the squares of (estimated probabilities minus predicted probabilities). However, in many cases the cost function is a mean squared error, of which the probabilities for MNIST digits are a special case. The mean squared error cost function is the sum of the squares of the errors which is often the sums of the squares of the components of a (predicted output vector - true output vector).

For Example: For a digit classifier (MNIST), we calculate the cost function by subtracting the estimated - predicted value for each digit output, squaring them for each digit, and summing all of the values together. 

<img src="assets/cost_function_calculation.png" height=300>

This sum is small when the network confidently classifies the image correctly. And large when it doesn't. 

Cost function calculates how bad the weights and biases are on the current Neural Networks so that they could be improved upon.


**For example if you are the actual values and predicted values of a model in two different array:**

* actual_values = [0, 5, 10, 15]

* predicted_values = [0, 2, 4, 6]

**cost function**  = (0-0)^2 + (5-2)^2 + (10-4)^2 + (15-6)^2 = 126

### Exercise 3

* Given the actual and predicted values of a digit classifier in 2 different arrays, write a python function to calculate the cost function and return the value.

**Example Input** 

actual_values = [0, 5, 10, 15]

predicted_values = [0, 2, 4, 6]

**Example Output**

return value = **126**


 
# Resources

[Gradient Descent article](https://builtin.com/data-science/gradient-descent)

[Gradient descent video](https://www.youtube.com/watch?v=IHZwWFHWa-w&ab_channel=3Blue1Brown)

[Khan academy Gradient and directional derivatives](https://www.khanacademy.org/math/multivariable-calculus/multivariable-derivatives/gradient-and-directional-derivatives/v/gradient)

[Cost function article](https://towardsdatascience.com/coding-deep-learning-for-beginners-linear-regression-part-2-cost-function-49545303d29f)

[Partial Derivative Calculator](https://www.symbolab.com/solver/partial-derivative-calculator/)
