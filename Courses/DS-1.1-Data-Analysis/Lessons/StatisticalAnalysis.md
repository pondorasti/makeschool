# Statistical Analysis

## Learning Objectives (Competencies) (5 min)
By the end of this lesson, students will be able to:
1. Describe what is histogram
2. Describe how can fit mixture of Gaussian to fit the data distribution
3. Learn what is correlation and visualize the correlation among features


## What is histogram? (10 min)

Histogram is one method for estimating density. We explore our own function to the existed ones


## Statistical Analysis
We have learned null hypothesis, and compared two-sample test to check whether two samples are the same or not
To add more to statistical analysis, the following topics should be covered:
1- Approximate the histogram of data with combination of Gaussian (Normal) distribution functions:
Gaussian Mixture Model (GMM)
Kernel Density Estimation (KDE)

2- Correlation among features

## Review
Write a function that computes and plot histogram of a given data
Histogram is one method for estimating density

## What is Gaussian Mixture Model (GMM)?
GMM is a probabilistic model for representing normally distributed subpopulations within an overall population

![](../Notebooks/Images/gmm_fig.png)

$p(x) = \sum_{i = 1}^{K} w_i \ \mathcal{N}(x \ | \ \mu_i,\ \sigma_i)$
$\sum_{i=1}^{K} w_i = 1$
https://brilliant.org/wiki/gaussian-mixture-model/

## Activity : Fit a GMM to a given data sample
Task:
1- Generate the concatenation of the random variables as follows:
`x_1 = np.random.normal(-5, 1, 3000)`
`x_2 = np.random.normal(2, 3, 7000)`
`x = np.concatenate((x_1, x_2))`
2- Plot the histogram of x
3- Obtain the weights, mean and variances of each Gaussian
Steps needed:  `from sklearn import mixture`
`gmm = mixture.GaussianMixture(n_components=2)`
`gmm.fit(x.reshape(-1,1))`

```Python
import numpy as np
import matplotlib.pyplot as plt
from sklearn import mixture

# Generate data samples and plot its histogram
x_1 = np.random.normal(-5, 1, 3000)
x_2 = np.random.normal(2, 3, 7000)
x = np.concatenate((x_1, x_2))
plt.hist(x, bins=20, density=1)
plt.show()

# Define a GMM model and obtain its parameters
gmm = mixture.GaussianMixture(n_components=2)
gmm.fit(x.reshape(-1,1))
print(gmm.means_)
print(gmm.covariances_)
print(gmm.weights_)
```
## The GMM has learn the probability density function of our data sample
Lets the gmm model generate sample from its model:
```Python
z = gmm.sample(10000)
plt.hist(z[0], bins=20, density=1)
plt.show()
```

### Kernel Density Estimation (KDE)
Kernel density estimation (KDE) is a non-parametric way to estimate the probability density function of a random variable. In other words the aim of KDE is to find probability density function (PDF) for a given dataset.
Approximate the pdf of dataset:
$p(x) = \frac{1}{Nh}\sum_{i = 1}^{N} \ K(\frac{x - x_i}{h})$
where $h$ is a bandwidth and $N$ is the number of data points

## Activity: Apply KDE on a given data sample
Task: Apply KDE on previous generated sample data x
Hint: use
`kde = KernelDensity(kernel='gaussian', bandwidth=0.6)`
```python
from sklearn.neighbors import KernelDensity

kde = KernelDensity(kernel='gaussian', bandwidth=0.6)
kde.fit(x.reshape(-1,1))

s = np.linspace(np.min(x), np.max(x))
log_pdf = kde.score_samples(s.reshape(-1,1))
plt.plot(s, np.exp(log_pdf))
```
```python
m = kde.sample(10000)
plt.hist(m, bins=20, density=1)
plt.show()
```
## KDE can learn handwritten digits distribution and generate new digits
http://scikit-learn.org/stable/auto_examples/neighbors/plot_digits_kde_sampling.html

## Correlation
Correlation is used to test relationships between quantitative variables
Some examples of data that have a high correlation:
1- Your caloric intake and your weight
2- The amount of time your study and your GPA
Question what is negative correlation?
Correlations are useful because we can find out what relationship variables have, we can make predictions about future behavior.

## Activity: Obtain the correlation among all features of iris dataset
1- Review the iris dataset. What are the features?
2- Eliminate two columns ['Id', 'Species']
3- Compute the correlation among all features.
Hint: Use `df.corr()`
4- Plot the correlation by heatmap and corr plot in Seaborn -> `sns.heatmap`, `sns.corrplot`
5- Write a function that computes the correlation (Pearson formula)
Hint: https://en.wikipedia.org/wiki/Pearson_correlation_coefficient
6- Compare your answer with `scipy.stats.pearsonr` for any given two features

```python
import pandas as pd
import numpy as np
import scipy.stats
import seaborn as sns
import scipy.stats

df = pd.read_csv('Iris.csv')
df = df.drop(columns=['Id', 'Species'])
sns.heatmap(df.corr(), annot=True)

def pearson_corr(x, y):
    x_mean = np.mean(x)
    y_mean = np.mean(y)
    num = [(i - x_mean)*(j - y_mean) for i,j in zip(x,y)]
    den_1 = [(i - x_mean)**2 for i in x]
    den_2 = [(j - y_mean)**2 for j in y]
    correlation_x_y = np.sum(num)/np.sqrt(np.sum(den_1))/np.sqrt(np.sum(den_2))
    return correlation_x_y

print(pearson_corr(df['SepalLengthCm'], df['PetalLengthCm']))
print(scipy.stats.pearsonr(df['SepalLengthCm'], df['PetalLengthCm']))
```

## Resources
- Read this blog [KDE ](https://jakevdp.github.io/blog/2013/12/01/kernel-density-estimation/)
