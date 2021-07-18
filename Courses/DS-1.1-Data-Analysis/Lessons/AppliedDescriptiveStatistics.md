# [Slides](../Notebooks/Applied_Descriptive_Statistics.ipynb)

# Learning Objectives
- Learn what is mean, median and mode and why there are important
- Learn what is range, variance, percentile

## An Introduction to Descriptive Statistics

- At this point in our course, we've had plenty of time, experience, and practice in manipulating our data.

- However, to really _understand_ our data and underlying patterns across it, we need to dive a layer deeper into the mathematics behind data mechanics and dynamics.

- In order to be able to draw conclusions from our data, we need to be able to **describe and interpret our data**.

- This will become essential for more advanced data science concepts in data visualization, machine learning, and deep learning.

## Statistics involves collecting, interpreting, describing behaviors, and inferring trends across data

We generally describe the realm of _statistics_ to be broken up into **two** major fields:

### 1. Descriptive Statistics

Descriptive Statistics involves describing, presenting, summarizing and organizing your data (population-based), either through numerical calculations or data visualization methods (e.g. graphs, tables).

### 2. Inferential Statistics

Inferential Statistics allows us to infer trends and make assumptions/assertions about a population based on a study of a sample taken from it.

Generally, the more inferential a statistical analysis becomes, the deeper and more complex we get with our mathematics.

## Measures of Central Tendency

In statistics, we often find that describing data by "averages" allows us to more often make more powerful assertions regarding the data as a whole.

We often use **three key measures of central tendency** to help describe the centroid (arithmetic mean trend across a distribution) of our data:
- **Mean**
- **Median**
- **Mode**

### The mean is the raw average value across our data

- Calculating the mean is simple: _compute the sum of all values across our data and divide by the total number of values in our dataset_.

- We've been using the mean for years and years, but such a surprisingly simple arithmetic calculation turns out to have massive implications across being able to critically understand and break down complex datasets!

### Write a function to compute the mean from an arbitrary dataset

```Python
data = np.array([1, 3, 5, 2, 3, 7, 8, 4, 10, 0, 6, 7, 3, 0, 3, 0, 5, 7, 10, 1, 4, 9, 3])

# TODO: Complete this function by having the function return the average value of our dataset.
def compute_mean(dataset):
    """ Main function that calculates the average value across our data. """
    return

compute_mean(data)
```
### The median is the "middle value" or midpoint across our data

- Determining the median is as simple as it sounds: _ascertain the data value lying in the exact middle of our dataset_.

- One critical exception occurs when our data has an even number of values and thus has **two values** at its center: _in these cases, ascertain the **mean** value of the two medians to obtain the true median across our data_.

- And remember: the median can only be calculated across _sorted data_!

- If data is distributed in a non-normal manner, then we can learn a great deal from interpreting what the exact median value of our dataset is.

### Write a function to compute the median from an arbitrary dataset

```Python
data = np.array([1, 3, 5, 2, 3, 7, 8, 4, 10, 0, 6, 7, 3, 0, 3, 0, 5, 7, 10, 1, 4, 9, 3])

# TODO: Complete this function by having the function return the exact true median value of our dataset.
# HINT: Consider using DataFrame slicing to help with identifying the correct median value(s).
def compute_median(dataset):
    """ Main function that determines the median value across our data. """
    count = len(dataset)

    if count < 1:
        # TODO: Complete this if-statement
        return
    if count % 2 == 1:
        # TODO: Complete this if-statement
        return
    else:
        # TODO: Complete this if-else statement
        return

compute_median(data)
```
### The mode is the most commonly occurring value or feature across our data

- Determining the mode is relatively simple: _find the value that occurs most frequently across our data_.

- Remember that if all values across our data are unique and only occur once, then our data **has no mode**!

- The mode is also an interesting measure of central tendency in that it can be applied towards categorical (non-numerical) data; one can find frequently occurring categories without running any calculations.

### Write a function to compute the mode from an arbitrary dataset

```Python
# NOTE: Tricker than it looks!
data = np.array([1, 3, 5, 2, 3, 7, 8, 4, 10, 0, 6, 7, 3, 0, 3, 0, 5, 7, 10, 1, 4, 9, 3])

# TODO: Complete this function by having the function return the relative mode across our dataset.
# HINT: Remember histograms and tokenization from CS 1.2? How many they help you here?
def compute_mode(dataset):
    """ Main function that determines the mode value across our data. """
    return

compute_mode(data)
```
## What percentage of passenger (Titanic) paid fare less then the mean ($ 32.2)?

```Python
import numpy as np
import pandas as pd

df = pd.read_csv('titanic.csv')

ls_fare = df['Fare'].dropna().values

numbers_below_mean = df[df['Fare'] <= np.mean(ls_fare)]

pr_below_mean = len(numbers_below_mean)/len(ls_fare)

```

## What percentage of passenger paid fare less then the median ($ 14.45)?

```Python
numbers_below_median = df[df['Fare'] <= np.median(ls_fare)]

numbers_below_median['Fare'].isna().sum()

pr_below_median = len(numbers_below_median)/len(ls_fare)
```
## Compute Percentile for Fare (75 percent)

- At which amount, 75 percent of passengers paid less than it?

```Python
numbers_below_percentile = df[df['Fare'] <= np.percentile(ls_fare, 75)]
pr_below_percentile = len(numbers_below_percentile)/len(ls_fare)
```
## Measures of Spread and Variance

- Like our friends in the central tendency community, measures of spread and variance do their best to describe patterns across our data as a whole.

- However, unlike measures of central tendency, which focus on the distribution of our data towards an arithmetic centroid, measures of spread and variance talk about the shape and layout of our data all across the board!

- In this course, there are **two key measures of spread and variance** to help describe the shape of our data:
- **Range**
- **Standard Deviation**

### The range is the coordinate pair describing the smallest and largest values our data contains

- In other words, determining the range is as simple as quantifying the absolute minimum and maximum values across our data and shoving them into a coordinate object!

- You're probably intimately familiar with the `range()` object in Python: we're kind of constructing that for any dataset!

- Keep in mind that we want the **absolute** min and max: not the _local_ min and max.

- In other words, we don't want just any small and large value – we want the absolutely smallest and largest values that occur in our data.

### Write a function to compute the range from an arbitrary dataset

```Python
data = np.array([1, 3, 5, 2, 3, 7, 8, 4, 10, 0, 6, 7, 3, 0, 3, 0, 5, 7, 10, 1, 4, 9, 3])

# TODO: Complete this function by having the function return the effective range of values across our data.
def compute_range(dataset):
    """ Main function that determines the range of values across our data. """
    return ()

compute_range(data)
```
### The standard deviation is the square root of the variance and dispersion of our data from the mean

- Calculating the standard deviation is slightly more complex than our other descriptive statistics.

- To calculate the standard deviation, we must first _calculate the **variance** of our data and then take its square root_.

- And to calculate the variance, we must _find the difference between every data point and the true mean, square the difference, sum all the differences up, and take the average of all those numbers_.

- The standard deviation is slightly more complicated because it has to do more with the relationship between how spread out our data is from each other and how spread out our data is from the mean.

- Therefore, the standard deviation allows us to _interpret individual data values and whether or not they are a considerable distance from the mean away from the rest of our data_!

- This becomes incredibly important when we dive into outlier detection, hypothesis testing, and analyzing data for values that may affect it abnormally.

### Write a function to compute the standard deviation from an arbitrary dataset

```Python
data = np.array([1, 3, 5, 2, 3, 7, 8, 4, 10, 0, 6, 7, 3, 0, 3, 0, 5, 7, 10, 1, 4, 9, 3])

# TODO: Complete this function by having the function return the standard deviation of our data.
# NOTE: Since we need the true mean across our data, let's use our previously written function!
def compute_standard_deviation(dataset):
    """ Main function that approximates the standard deviation of our data. """
    true_mean = compute_mean(dataset)

    # TODO: Complete these calculations step-by-step to correct the standard deviation calculation.
    sum_diffs_squared = int()
    variance = int()

    return math.sqrt(variance)

compute_standard_deviation(data)
```
