# Linear Regression [Slides](https://github.com/Make-School-Courses/DS-2.1-Machine-Learning/blob/master/Notebooks/remote_simple_linear_regression.ipynb)

## Learning Objectives (Competencies)
By the end of this lesson, students will be able to:
- What is linear Regression
- How they can use linear regression for predicting: house price, stock market price, temperature forecast
- Tell how well a regression model works

## What is linear regression and what is its application? (5 min)

- In regression, we are interested in predicting a scalar-valued target, such as the price of a stock.
- By linear, we mean that the target must be predicted as a linear function of the inputs.


## Visualize the simple linear regression when have single-input single-output data (5 min)

## Mathematical formulation of linear regression and what the objective function is to be minimized (5 min)

- Linear regression is an approach for predicting a quantitative response using a feature or multiple features

## Activity: write a Python code to obtain the coefficient and intercept of a simple regression (15 min)
- The X and Y as the single-input single-output data are given
- Use numpy `np.polyfit` and `np.poly1d` to obtain the linear regression model coefficients
- Use sklearn `from sklearn.linear_model import LinearRegression` to obtain the linear regression model coefficients

## Multiple Linear Regression is introduced and advertising dataset is given and explored (5 min)

## Activity: Obtain linear regression model parameters for advertising dataset (20 min)

- Load Advertising.csv
- Use `from sklearn.linear_model import LinearRegression` and `import statsmodels.formula.api as smf`
- Compare the result and sklearn with ordinary least square (OLS) from statsmodels
- Good resource for OLS: https://www.statsmodels.org/stable/regression.html

## Break (10 min)

## How to evaluate linear regression model? (5 min)
- Mean Absolute Error (MAE)
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)
- R-Squared

## Activity: Obtain the R-squared for advertising data (15 min)
```
from sklearn.metrics import r2_score
print(reg.score(X_test, Y_test))
print(r2_score(Y_test, reg.predict(X_test)))

```
## Optional reading for closed-form solution of linear regression model (10 min)

- For linear regression, the model parameters has closed form solution. http://pillowlab.princeton.edu/teaching/mathtools16/slides/lec10_LeastSquaresRegression.pdf
- Assuming the error as Gaussian, Least Square (LS) is identical to Maximum Likelihood Estimate (MLE)
- Bonus point: Show this. Solution: http://people.math.gatech.edu/~ecroot/3225/maximum_likelihood.pdf

## Challenges and stretch challenges (10 min)
- The Boston_Housing_Prices dataset is a famous dataset usually used for learning or benchmarking regression techniques. This dataset contains 14 variables, one of which (MEDV, median value of home) we'll use as our target.
- https://github.com/Product-College-Courses/DS-2-Machine-Learning/blob/master/04_Regression_Techniques.ipynb
