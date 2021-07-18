# Hypothesis Testing & Acceptable Error

## [Slides](../Notebooks/HypothesisTesting.ipynb)

## Learning Objectives (Competencies)
By the end of this lesson, students will be able to:
1. Describe null hypothesis and when and how apply Null Hypothesis
2. What are the metrics we need in order to statistically accept or reject null  
3. How and when use Z test or T test
4. Whether or not two samples are different

## What is Null Hypothesis - Real Life & In Industry

**Null Hypothesis** is the formal methods of reaching conclusions based on population statistics and sample data where
we apply changes to population

Industry uses
* Drug test on response time of brain
* A special food boost IQ
* A/B Marketing Test

## Review of Z distribution, CDF and SF

Activity: Generate 10000 sample as a random variable with Normal distribution with pre-define mean and standard deviation.
Hint = from `scipy.stats import norm`
   `norm.rvs(loc= , scale= , size=10000)`

Write a code to show that $Z = \frac{X - \mu}{\sigma}$, is standard Normal
Hint: Plot histogram of Z, show Z is standard normal

## Null hypothesis drug example on rat

A neurologist is testing the effect of a drug on response time by injecting 100 rats with a unit dose of a drug, subjecting each to neurologist stimulus and recording its response time. The neurologist knows that the mean response time for rats not injected with the drug is 1.2 seconds. The mean of the 100 injected rats's response time is 1.05 seconds with population standard deviation of 0.5 seconds. Do you think the drug has effect on response time?

$H_o :$ Drug has no effect ==> $\mu_x = 1.2$ even with drug
$H_a :$ Drug has effect ==> $\mu_x \neq 1.2$ when the drug is given

## The steps to reject or accept the null hypothesis
1- The population mean is known, $\mu$
2- The sample mean is known, $\bar{x}$
3- Define a significant level, $\alpha$
4- If $N$ > 30, calculate z-score, $z-score = \frac{\bar{x} - \mu}{\sigma/\sqrt{N}}$
5- Calculate p-value, $p-value = 2SF(Z-score)$
6- Decision: if $p-value &lt; \alpha$ then reject the null hypothesis

##Activity: z-test
Write a function the takes the mean of population, significant level and the samples as the input argument
then decide to reject or accept the null hypothesis for drug effect on rat
Recall: $\mu = 1.2$, $\bar{x} = 1.05$, $N = 100$ and $\sigma = 0.5$

```Python
def accept_or_reject_null_hypothesis(mu, sample_mean, significant_level, N):
    # Calculate standard deviation of the sampling distribution
    sample_std = sigma / N

    # Calculate z-score from population mean (mu), sample mean and sample std
    z = (sample_mean - mu) / sample_std

    # Calculate p-value from z-score
    p_value = 2 * norm.cdf(-np.abs(z))

    # Determine whether to accept or reject null hypothesis
    if p_value < significant_level:
        print('reject null hypothesis')
    else:
        print('accept null hypothesis')
```

## Activity: t-test
The average British man is 175.3 cm tall. A survey recorded the heights of 10 British men. Calculate the t-score from formula and use available function in `stats.ttest_1samp`. Compare what you will get
`x = [177.3, 182.7, 169.6, 176.3, 180.3, 179.4, 178.5, 177.2, 181.8, 176.5]`

```Python
from scipy import stats
import numpy as np

x = [177.3, 182.7, 169.6, 176.3, 180.3, 179.4, 178.5, 177.2, 181.8, 176.5]
mu = 175.3
sample_mean = np.array(x).mean()

# Calculate the standard deviation of sample distribution

N = len(x) # number of data samples
SE = np.array(x).std(ddof=1) /np.sqrt(N)

# t-test from formula
t = (sample_mean - mu)/SE
print("t-statistic: ",t)

# one sample t-test that gives you the p-value too can be done with scipy as follows:
t, p = stats.ttest_1samp(x, mu)
print("t = ", t, ", p = ", p)
```

## Activity: z-test or t-test?
- Write a function that determine whether use z-test or t-test in order to accept or reject null hypothesis

```Python
def z_t_null_hypothesis(data_sample, mu, sigma, significant_level):
    if sigma:
        z_score = (np.mean(data_sample)-mu)/(sigma/np.sqrt(len(data_sample)))
        p = scipy.stats.norm.sf(abs(z_score))*2
    elif len(data_sample) > 30:
        z_score = (np.mean(data_sample)-mu)/(np.std(data_sample)/np.sqrt(len(data_sample)))
        p = scipy.stats.norm.sf(abs(z_score))*2
    else:
        t, p = stats.ttest_1samp(data_sample, mu)

    if p < significant_level:
        print('reject null hypothesis')

    else:
        print('accept null hypothesis')
```
## What is one-tail or two-tail calculation for p-value?
- If the alternative hypothesis says the mean of sample is different from mean of population, we should compute p-value from two-tail.

- If it says the mean of sample is greater or lower than the mean of population we should compute one-tail

# Possible errors that can happen when accept or reject null hypothesis

- Type I error : We reject the null hypothesis when the null is true
$\alpha$ = P(rejecting $H_o$  $|$  $H_o$ is true)
- Type II error : We accept the null hypothesis when it is not true
$\beta$ = P(accepting $H_o$ $|$ $H_o$ is false)
The drug has effect on brain
The drug has no effect on brain

## Other examples for statistical test
- Please read the Unpaired t-test part of this article
http://iaingallagher.tumblr.com/post/50980987285/t-tests-in-python

## Homework
https://docs.google.com/document/d/1ITryiXU_VoyBvtZY4deehk4PmlieSlF7rSNc8sBU3Sw/edit

## Resources
- [Slide Animation of T-test vs Z-test](https://docs.google.com/presentation/d/1BQibGlrpX71JU0jBU0C7zJJr6S_4WQeFzO7PBmnxf8g/edit?usp=sharing)
-  Read this blog from iaingallagher [Z and T test in Python](http://iaingallagher.tumblr.com/post/50980987285/t-tests-in-python)
- Read Jeff Groff's [article on null hypothesis on Kaggle](https://www.kaggle.com/jgroff/unit-3-hypothesis-testing)
- More numerical examples on [Hypothesis Testing with the Z score](http://jukebox.esc13.net/untdeveloper/RM/Stats_Module_4/mobile_pages/Stats_Module_48.html)
