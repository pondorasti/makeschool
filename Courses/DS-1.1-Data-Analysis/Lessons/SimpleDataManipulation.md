# [Slides](../Notebooks/Pandas_Intro.ipynb)

## Learning Objectives
- How to create pandas data-frame
- How do data manipulation with Pandas

### Lets create a simple data-frame in Pandas

- If we pass a Python dictionary as the `data` to the Pandas DataFrame input argument, we can create a Pandas DataFrame

```Python
import pandas as pd

df = pd.DataFrame(data= {'name':['john', 'mary', 'peter','jeff','bill', 'lisa'], 'age':[23, 78, 22, 19, 45, 33],
                         'state': ['iowa', 'dc', 'california', 'texas', 'washington', 'dc'], 'num_children': [2, 2, 0, 1, 2, 1],
                        'num_pets' : [0, 4, 0, 5, 0, 0]})
```

`df.columns`

## If we are only interested in the first three column

`df[['name', 'age', 'state']]`

### Select the second to fourth rows based on columns (name and age for example)

`df.loc[2:4, 'name']`

`df.loc[2:4, ['name', 'age']]`

### Select the first two rows

```Python
# select the first 2 rows
df.iloc[:2]
```
### Select the last two rows
```Python
# select the last 2 rows
df.iloc[-2:]
```
### Select rows up to and including the assigned one

```Python
# select rows up to and including the one
# with index=2 (this retrieves 3 rows)
df.loc[:2]
```
### Select the first column without specifying the name of column

```python
# first column of data frame with index
df.iloc[:,0]
```
```Python
# select columns by name
df.loc[:,['age', 'state']]
# df[['age', 'state']]
```
### Select the second row of dataframe
```Python
# second row of data-frame
df.iloc[1]
```

### Filter or conditional selection of data-frame
```Python
# people whose "age" is greater than 30
df[df['age'] > 30]
```
### Another way of the above selection
`df[df.age> 30]`

### Select data-frame such that the return data-frame has more pets than children

```Python
# people who have more pets than children
df[df["num_pets"] > df[ "num_children"]]
```
### Who in the data-frame is older than 40 and own pets

```Python
# people older than 40 who own pets
df[(df["age"] > 40) & (df["num_pets"] > 0)]
df[ (df["age"] > 40) | (df["num_pets"] > 0) ]
```
### Drop age and num_children columns
```Python
# df itself is not modified; a copy is returned instead
df.drop(["age","num_children"],axis=1)
```
### After dropping, the original data-frame is untouched

`df`
`df.describe()`

### What is the average for age, num_pets and num_children?
```Python
# Apply an aggregate function to every column
import numpy as np
df[["age","num_pets","num_children"]].mean()
df[["age","num_pets","num_children"]].apply(lambda col: np.mean(col),axis=0)
```
`df[["age","num_pets","num_children"]].apply(lambda col: np.sum(col),axis=0)`

`df['age'].sum()`

### Add numerical values of age, num_pets, num_children
```Python
df[["age","num_pets","num_children"]].apply(lambda row: np.sum(row),axis=1)
```
### Select data-frame based on column name
`df[['age']]`

`df['age']`

`df[["age"]].apply(lambda value: value*2)`

### Apply a function to specific column and apply the changes to original data-frame

`df['age'] = df['age'].apply(lambda x: x*2)`

### Sort data-frame based on a specific column in ascending order

```Python
# Sort DataFrame by column value
df.sort_values( "age", ascending= True)
```
### Select rows whose name begins with the letter 'j'

```Python
# select rows whose name begins with the letter 'j'
df[df.apply(lambda row: row['name'].startswith('j'),axis=1)]
```

### Pivot table from data-frame
```python
from collections import OrderedDict
from pandas import DataFrame
import pandas as pd
import numpy as np

table = OrderedDict((
    ("Item", ['Item0', 'Item0', 'Item1', 'Item1']),
    ('CType',['Gold', 'Bronze', 'Gold', 'Silver']),
    ('USD',  ['1$', '2$', '3$', '4$']),
    ('EU',   ['1€', '2€', '3€', '4€'])
))
d = DataFrame(table)
p = d.pivot(index='Item', columns='CType', values='USD')
```
