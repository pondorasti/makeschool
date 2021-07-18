# Time Series Analysis

## Learning Objectives (Competencies) (5 min)
By the end of this lesson, students will be able to:
1. Describe what is time series
2. Describe how can decompose the time series into trend and seasonality
3. Learn how we can compute the monthly rate of return for a stock data set


## Time Series Analysis
Time series: series of data point listed in time order
Example: Temperature during the day, number of taxi rides during a week, stock market price and ...
Trend: Long term progression (for example increase or decrease)
Seasonality: Patterns due to seasonal factors

## Review: Sort the following data frame based on date
```python
import pandas as pd
df = pd.DataFrame({'Value':['100','78','129'] , 'Date':['02/20/2015','01/15/2016','08/21/2015']})
```

## Activity: Obtain the trend and seasonality for air passenger dataset
Additive model: $x(t) = trend(t) + seasonality(t) + residual(t)$
Steps:
1- Plot the number of passenger based on Month: Hint:
```python
import pandas as pd
import matplotlib.pyplot as plt
df = pd.read_csv('AirPassengers.csv')
df['Month'] = pd.to_datetime(df['Month'])
plt.plot(df['Month'], df['#Passengers'])
plt.show()
```
2- Set the index of data frame by Month:
`df  = df.set_index(['Month'])`
3- Apply the decomposition to data-frame -> Give us trend and seasonality
`import statsmodels.api as sm`
`decomposition = sm.tsa.seasonal_decompose(df, model='additive')`
4- Plot trend, seasonality and residual for passenger dataset

```python
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm

# Load and plot passaenger time series
df = pd.read_csv('AirPassengers.csv')
df['Month'] = pd.to_datetime(df['Month'])
plt.plot(df['Month'], df['#Passengers'])
plt.show()

# Apply decompostion analysis to the time series
df  = df.set_index(['Month'])
decomposition = sm.tsa.seasonal_decompose(df, model='additive')
decomposition.plot()
plt.show()
```
## Sampling and Smoothing
Most of the time, for time series analysis, the data has many jumps and downs.
It is desired to have smoother version of time series.
We have two options:
1- Sampling the time series
2- Smoothing the time series

## Activity: Time Series Sampling and Smoothing on Apple dataset
Task: Plot the "Close", which is stock market price at closing time (5:30 p.m. NY time), its sampled version and its smoothed version.
Steps:
1- Load and plot Apple Stock Market dataset:
Hint:
```python
import pandas as pd
data = pd.read_csv('AAPL.csv')
data['Date'] = pd.to_datetime(data['Date'])
data['Tick'] = range(0, len(data))
plt.plot(data['Date'], data['Close'])
plt.show()
```
2- Sample this dataset and plot it:
Hint: use `data.sample()``
3- Smooth this time series ("Close"):
Hint: use `data['Close'].rolling(window=5).mean()`

```python
data = pd.read_csv('AAPL.csv')
data['Date'] = pd.to_datetime(data['Date'])
data['Tick'] = range(0, len(data))
plt.plot(data['Date'], data['Close'], label='Original')

# Sample time series
data_one_tenth = data.sample(frac=0.5)
data_one_tenth = data_one_tenth.sort_values(by=['Tick'])
plt.plot(data_one_tenth['Date'], data_one_tenth['Close'], label='Sampled')

# Smooth the dataset

data['Rolling_Mean']  = data['Close'].rolling(window=5).mean()
plt.plot(data['Date'], data['Rolling_Mean'], label='Smooth')

# plot them all
plt.legend()
plt.show()
```
## Using Quandl for Time Series analysis
The library that we will use for retrieving financial, economic and sociology data is the python api for Quandl.
Head over to https://www.quandl.com/ to sign up for an account to get an API key first!

## Activity: Compute the monthly return for Apple stock data for March 2017
In order to compute the monthly return for specific month, we should slice the dataset
We again only look at "Close" market price for apple from quandl
Task: compute monthly return
1- First read this article: https://www.quantconnect.com/tutorials/introduction-to-financial-python/rate-of-return,-mean-and-variance
2- Translate the formula to Python code

```python
import quandl
import numpy as np

quandl.ApiConfig.api_key = 'yz2smCsxKsYnJV6sh88w'
#get quandl data
aapl_table = quandl.get('WIKI/AAPL')
aapl_table.to_pickle('apple_quandl.pkl')
# aapl_table.head()
aapl = aapl_table.loc['2017-3',['Open','Close']]

# From compund rate of return formula
aapl['log_price'] = np.log(aapl['Close'])
x = np.diff(aapl['log_price'])
print(aapl)
print(x.sum()*100)

# Another way to compute the montly return
returns = aapl['Close'].pct_change()
print(returns.sum()*100)
print(np.log(143.66/139.79)*100)
```


## Challenges
Check Challenges_Time Series.ipynb

Write a code to compute the followings:

1. How many government accounts have made comments in the month this dataset covers?
2. What day had the most comments? which had the least?
3. We'll define a fraudulent account as one that has made more than 40 average clicks per minute. how many fraud accounts are there in this dataset? How many are students in college? Do non-government accounts have a higher probability of being fraud vs the probability of being fraudulent if they are non-government accounts?
4. How many comments mention 'gradiva' and were there more mentions during the day or night?
5. Was the latter half of the month more popular for commenting than the earlier half?
6. What is the average length of a comment coming from people in the irs?

## Q&A Wrap up (5 min)

## Resources
- Watch these series of videos blog [Python Programming for Finance ](https://pythonprogramming.net/getting-stock-prices-python-programming-for-finance/)
