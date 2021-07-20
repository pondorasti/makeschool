# [Slides](../Notebooks/Pandas_Merge_Concatenate.ipynb)

## Learning Objectives
- How to combine different data-frame
- Learn how to reshape a data-frame

## Combine Dataset in Pandas

- Create two data-frames that have common columns

```Python
import pandas as pd

adf = pd.DataFrame(data={'x1': ['A', 'B', 'C'], 'x2' : [1, 2, 3]})

bdf = pd.DataFrame(data={'x1': ['A', 'B', 'D'], 'x3' : ['T', 'F', 'T']})

```
### Merge adf and bdf based on adf
```python
pd.merge(adf, bdf, how='left')
```

### Merge adf and bdf based on bdf
```Python
pd.merge(adf, bdf, how= 'right')
```
### Merge adf and bdf based on what they have in common
```Python
pd.merge(adf, bdf, how= 'inner')
# Another way to do the above Task
pd.merge(adf, bdf)
```

### Union of two DataFrames

```Python
pd.merge(adf, bdf, how= 'outer')
```

### Appending Pandas DataFrames

```Python
# Append bdf after bdf (row-wise concatenation)
pd.concat([adf, bdf], sort=True)

# Column-wise concatination
pd.concat([adf, bdf], axis=1)

```
```Python
cdf = pd.DataFrame(data={'x1': ['A', 'B', 'C'], 'x3' : ['T', 'F', 'T']})
# cdf
pd.concat([adf, cdf], axis=1)

pd.concat([adf, cdf], sort=False)

# Correct the indexing after concatination
df = pd.concat([adf, cdf], ignore_index=True)
df

pd.merge(adf, cdf, how='left')
```

## When two data-frames have exactly the same columns

```Python

df = pd.DataFrame([[1, 2], [3, 4]], columns = ['a','b'])
df2 = pd.DataFrame([[5, 6], [7, 8]], columns = ['a','b'])

df = df.append(df2, ignore_index=True)
```

### Slicing data-frame based on largest value for an specific column

```Python
import numpy as np

df = pd.DataFrame({'a': [1, 10, 8, 11, -1],'b': list('abdce'), 'c': [1.0, 2.0, np.nan, 3.0, 4.0]})
df.nlargest(3, 'a')

df

df['c'].isnull().sum()

df.isnull().sum()
```

### Reshape Pandas data-frame with Melt
```python
data = {'weekday': ["Monday", "Tuesday", "Wednesday",
         "Thursday", "Friday", "Saturday", "Sunday"],
        'Person 1': [12, 6, 5, 8, 11, 6, 4],
        'Person 2': [10, 6, 11, 5, 8, 9, 12],
        'Person 3': [8, 5, 7, 3, 7, 11, 15]}
df = pd.DataFrame(data, columns=['weekday',
        'Person 1', 'Person 2', 'Person 3'])

# Reshape Pandas Data With Melt
melted = pd.melt(df, id_vars=["weekday"],
                 var_name="Person", value_name="Score")

melted                         
```

### More Exercise

- https://martin-thoma.com/pandas-merge-join-concatenate/

- https://github.com/codebasics/py/blob/master/pandas/11_melt/pandas_melt_tutorial.ipynb

- https://deparkes.co.uk/2016/10/28/reshape-pandas-data-with-melt/
