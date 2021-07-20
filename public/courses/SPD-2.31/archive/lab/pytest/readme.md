# Unit Testing With Pytest

## Download pytest

Enter the following command in your terminal:

> $ pip install pytest

Note: If you get an the following warning:

```

 WARNING: The scripts py.test and pytest are installed in '/home/kami/.local/bin' which is not on PATH.
```

Add the installation path  (/home/kami/.local/bin) to your PATH,  by running the following command:
```

> $ export PATH="$HOME/.local/bin:$PATH"
```

## Getting Started with pytest

pytest works by finding test files and then running test classes and test functions in them. It finds the tests by searching in current folder and sub-folders for any files whose names starts or ends with  **\_test** or **test\_** respectively as follows:

1. test_*.py
2. *_test.py

Now, let’s write a test:

1. Create a folder called pytest-tut and cd into it.

```bash
> mkdir pytest-tut
> cd pytest-tut
```

2. Create a python script and open it.
   
```bash
> code test_one.py
```

3. Write the following in the script:

```python
# test_one.py

def calculate_kinetic_energy(mass, velocity): 
    """Returns kinetic energy of mass [kg] with velocity [ms]."""
    return 0.5 * mass * velocity ** 2

```

Assume we want to test the above method using pytest. To do so, we  write (in the same file):

```python
def test_calculate_kinetic_energy():
    mass = 10 # [kg]
    velocity = 4 # [m/s]
    assert calculate_kinetic_energy(mass, velocity) == 80
```

In the next step, we will run pytest to see whether our test case ‘test_calculate_kinetic_energy’ will pass or not.
4. Assuming your are in the folder containing test_one.py, run the following command:

```bash
> pytest
```

(you could also run, ```> pytest test_one.py```)

What do you see? You should see something similar to the following: 

![pytest](pytest1.png)

The dot after test_one.py means that one test was run and it passed.
The [100%] shows the overall progress of running all test cases. Since there is just one test here, one test is 100% of the tests. If you have two tests, each would be 50%.

If you need more information, you can use -v or –verbose:

```bash
> pytest -v 
```

![pytest--verbose](pytest-v.png)

To have a brief output, you use -q or --quiet flag:

![pytest-q](pytest-q.png)

Now let’s write a failing test to see how pytest behaves. Assume a new programer joins the team and he mistakenly removes 0.5 in the kinetic energy formula as follows: 

```python
def calculate_kinetic_energy(mass, velocity): 
    """Returns kinetic energy of mass [kg] with velocity [ms]."""
    return mass * velocity ** 2

```
Fortunately, there is a unit test for this function. Let’s see how pytest catch this bug. Make sure you have changed your program to reflect the bug. Then run the following command in the terminal:
```> pytest```

You get a similar output: 

![pytest-failing-kinetic-enegy](pytest-failing-kinetic-enegy.png)

The failing test, test_calculate_kinetic_energy(), gets its own section to show us why it failed: the calculate_kinetic_energy(10, 4) returned 160 but it should have become 80 instead. Much of this is in red to make it really stand out (if you’ve got a color terminal).
As you see, pytest is a powerful tool to test your code.

## Practice 1

Assume you are a developer working for a company. They have asked you to write unit tests for one of their software packages. You encounter the following function:

```python
def get_average(li):
    sum = 0
    for num in li:
        sum += num
    mean = sum / len(li)
    return mean
```

Write a unit test for it. Does this function handle every possible input properly? If not, fix the bug and write a unit test against the bug.

**Note:** The solution is at the end of this tutorial.

### Test for Exception

Assume you have a function that should raise an exception in a particular situation. You want to write a test to make sure the function rasies the exception. How would you do that with pytest?

Consider the following code:

```python
# test_exception.py
def palindrome(word):
    if not isinstance(word, str):
        raise TypeError('Please provide a string argument')
    return word == word[::-1]
```

This code checks whether a word is a palindrome or not. For example, it return True if we give it ‘hannah’ and False for ‘kami’. Also it raises a TypeError exception if the input parameter is not a string. For example, the method call

```python
palindrome(44) 
```

leads to:

```TypeError: Please provide a string argument```

Assume you have been assinged to write a unit test for this function so that your test verifies the function raises TypeError exception in case somebody passed a non-string value to it. How would you do that?

We write the unit test as follows: 

```python
import pytest

def test_palindrom():
    with pytest.raises(TypeError):
        palindrome(44)

```

## Exercise 2 (to be submitted to gradescope)

#### Carbon 14 Dating

Consider the following function that calculates the age of fossile:

```python
import math

T_HALF = 5730
DECAY_CONSTANT = -0.693

def get_age_carbon_14_dating(carbon_14_ratio):
"""Returns the estimated age of the sample in year.
carbon_14_ratio: the percent (0 < percent < 1) of carbon-14 
in the sample conpared to the amount in living 
tissue (unitless). 
"""
return math.log(carbon_14_ratio) / DECAY_CONSTANT * T_HALF 

# TODO: Write a unit test which feed 0.35 to the function. 
# The result should be '8680.34'. Does the function handles 
# every possible input correctly? What if the input is zero
# or negative?
# Add the necessary logic to make sure the function handle 
# every possible input properly. Then write a unit test againt 
# this special case.

```

Read the TODO above and implement the necessary changes and unit tests.

## Pytest Fixtures

**Note:** This section has been chosen from a blog post titled [Testing Python Applications with Pytest](https://semaphoreci.com/community/tutorials/testing-python-applications-with-pytest) by Kevin Ndung'u Gathuku.

Consider the following class:

```python
# wallet.py

class InsufficientAmount(Exception):
    pass


class Wallet(object):

    def __init__(self, initial_amount=0):
        self.balance = initial_amount

    def spend_cash(self, amount):
        if self.balance < amount:
            raise InsufficientAmount('Not enough available to spend {}'.format(amount))
        self.balance -= amount

    def add_cash(self, amount):
        self.balance += amount

```

Consider the constructor of the class. If the caller does not pass any initial amount, the defulat value of 0 will be set to self.balance. Otherwise, the value sent to the constructor is set to the ```self.balance```.

Now, let’s write some unit test for the above class in a different file:

```python
# test_wallet.py

import pytest
from wallet import Wallet, InsufficientAmount


def test_default_initial_amount():
    wallet = Wallet()
    assert wallet.balance == 0

def test_setting_initial_amount():
    wallet = Wallet(100)
    assert wallet.balance == 100

def test_wallet_add_cash():
    wallet = Wallet(10)
    wallet.add_cash(90)
    assert wallet.balance == 100

def test_wallet_spend_cash():
    wallet = Wallet(20)
    wallet.spend_cash(10)
    assert wallet.balance == 10

def test_wallet_spend_cash_raises_exception_on_insufficient_amount():
    wallet = Wallet()
    with pytest.raises(InsufficientAmount):
        wallet.spend_cash(100)

```

Now run the test:

```bash
> pytest -q test_wallet.py
.....
5 passed in 0.01 seconds
```

All tests will run successfully.

Now, let’s rewrite our test using fixtures to see how they help us to shorten our tests.

### Re-write our test with Fixtures

You may have noticed some repetition in each test function. Can you spot them? The repetition happened in creation of ‘wallet’ object. In every test funciton, we have created Wallet() object with different initial values. We can rewrite them using fixtures:

```python
# test_wallet.py

import pytest
from wallet import Wallet, InsufficientAmount

@pytest.fixture
def empty_wallet():
    '''Returns a Wallet instance with a zero balance'''
    return Wallet()

@pytest.fixture
def wallet():
    '''Returns a Wallet instance with a balance of 20'''
    return Wallet(20)

def test_default_initial_amount(empty_wallet):
    assert empty_wallet.balance == 0

def test_setting_initial_amount(wallet):
    assert wallet.balance == 20

def test_wallet_add_cash(wallet):
    wallet.add_cash(80)
    assert wallet.balance == 100

def test_wallet_spend_cash(wallet):
    wallet.spend_cash(10)
    assert wallet.balance == 10

def test_wallet_spend_cash_raises_exception_on_insufficient_amount(empty_wallet):
    with pytest.raises(InsufficientAmount):
        empty_wallet.spend_cash(100)


```

In the above code, we have defined two fixture functions:

1. wallet()
2. empty_wallet()
   

The ```@pytest.fixture``` decorator is used to tell pytest that a function is a fixture. When you put the fixture name (‘empty_wallet’ or ‘wallet’) in the parameter list of a test function, pytests runs the fixture and replaces the parameter with it before running the test. In other words, these two fixture functions are used to initialize the method parameters ‘wallet’ and ‘empty_wallet’ respectively in test functions.

Generally speaking, fixtures are functions that pytest runs them before (and sometimes after) the actual test function.

It is notable that each test is provided with a newly-initialized ‘Wallet’ instance, and not one that has been used in another test. Also it is a good practice to add docstirngs to your fixture functions. It helps you and other testers to quickly understand the fixure functions and their specific purpose.

**Note:** Read section "Parametrized Test Functions" and "Combining Test Fixtures and Parametrized Test Functions" on [this blog post](https://semaphoreci.com/community/tutorials/testing-python-applications-with-pytest).

## 	Exercise 3 (to be submitted to gradescope)

Write a unit test for ```calculate_stat()``` function. Submit it at [Unit Testing 1](https://www.gradescope.com/courses/206382/assignments/1045905) at gradescope.

```python
# Written by Kamran Bigdely
# Example for Compose Methods: Extract Method.
# Refactored.
import math 

def display_grade_stat():
    """Gathers stats and print them out."""
    grade_list = read_input()
    # Calculate the mean and standard deviation of the grades
    mean, standard_deviation = calculate_stat(grade_list)
    # print out the mean and standard deviation in a nice format.
    print_stat(mean, standard_deviation)

def read_input():
    """Get the inputs from the user."""
    grade_list = []
    n_student = 5
    for _ in range(0, n_student):
        grade_list.append(int(input('Enter a number: ')))
    return grade_list

def calculate_stat(grade_list):
    """Calculate the mean and standard deviation of the grades."""
    total = 0
    for grade in grade_list:
        total = total + grade
    mean = total / len(grade_list)
    sum_of_sqrs = 0
    for grade in grade_list:
        sum_of_sqrs += (grade - mean) ** 2
    sd = math.sqrt(sum_of_sqrs / len(grade_list)) # standard deviation
    return mean, sd

def print_stat(mean, sd):
    """print out the mean and standard deviation in a nice format."""
    print('****** Grade Statistics ******')
    print("The grades's mean is:", mean)
    print('The population standard deviation of grades is: ', round(sd, 3))
    print('****** END ******')

display_grade_stat()

```

## Exercise 4 (to be submitted to gradescope)

Write a unit test for ```extract_position()``` function. Submit it at [Unit Testing 1](https://www.gradescope.com/courses/206382/assignments/1045905) at gradescope.
```python
# by Kami Bigdely
# Replace nested conditional with gaurd clauses

def extract_position(line):
    if not line:
        pos = None
    else:
        if 'debug' in line or 'error' in line:
            pos = None
        else:
            if 'x:' in line:
                start_index = line.find('x:') + 2
                pos = line[start_index:] # from start_index to the end.
            else: 
                pos = None
    return pos

if __name__ == "__main__":
    result1 = extract_position('|error| numerical calculations could not converge.')
    print(result1)
    result2 = extract_position('|update| the positron location in the particle accelerator is x:21.432')
    print(result2)

```

## Solution to Exercise 1

We can write the following unit test to test get_average() function for normal inputs:

```python
def test_get_average_normal_use_case():
    assert math.isclose(get_average([1,2,3,4]), 2.5)
```

**Note:** Do not write, 

```python
assert get_average([1,2,3,4]) == 2.5
```

Why? Because you should never ever compare floating point values directly using ‘==’. Floating-point error can causes the result of an calculation differ slightly from the correct answer. For example, consider the following multiplication: 
```bash
>>> 0.1*0.1*10
0.10000000000000002 
```

The result should be exactly 0.1 but it’s not. The ‘2’ at the end is a floating-point error. Now if in your program you had written

```python
0.1*0.1*10 == 0.1:
```
the condition would evaluate to ```False``` (!) as follows:
```bash
>>> 0.1*0.1*10 == 0.1
False
```

Wow! Can you believe that? That’s why you should use math.isclose() function instead of ‘==’ to compare floating-point numbers:

```bash
>>> math.isclose(0.1*0.1*10, 0.1)
True
```

What about integer numbers? Fortunately, you can safely compare integer numbers without any issue.
Now, going back to the second part of the question. Is there any input that can blow up the get_average() function? Yes, there is!

The function get_average() can throw the exception ‘ZeroDivisionError’, if it receives **an empty list:**

```bash
mean = sum / len(li)
ZeroDivisionError: division by zero 
```

In order to handle this special case, we can check whether the input list is empty or not at the beginng of the function. If empty, we would return NaN:

```python
def get_average(li):
    if not li:
            return float('NaN')
    sum = 0
    for num in li:
    sum += num
    mean = sum / len(li)
    return mean
```

Now, let’s write a unit test for it:
```python
def test_get_average_empty_list():
    assert math.isnan(get_average([]))
```


## What and Where to Submit

Submit **exercises 2, 3 and 4** at [Unit Testing 1](https://www.gradescope.com/courses/206382/assignments/1045905) at gradescope.
## Reference and further studies

1. .[Pytest Installation and Getting Started
](https://docs.pytest.org/en/stable/getting-started.html#getstarted)
1. 'Python Testing with pytest' book by Brian Okken.
1. [semaphoreci](https://semaphoreci.com/community/tutorials/testing-python-applications-with-pytest)
