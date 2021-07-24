# Unit Testing With Pytest
This README has a walkthrough for setting up pytest below.  Please follow along with the guide and using what you've learned complete the exercises in the TODO

## TODO

- [ ] Exercise 1: Carbon 14 Dating [carbon_dating.py](carbon_dating.py)
  - [ ] Implement
  - [ ] Write tests
- [ ] Exercise 2: Calculate Grades [extract_position.py](extract_position.py)
  - [ ] Implement
  - [ ] Write tests
- [ ] Exercise 3: Extract Position [calculate_grades.py](calculate_grades.py)
  - [ ] Implement
  - [ ] Write tests

# Table of Contents

  - [Getting Started with pytest](#getting-started-with-pytest)
    - [Download pytest](#download-pytest)
    - [Write a test](#write-a-test)
  - [Practice 1](#practice-1)
    - [Solution to Practice 1](#solution-to-practice-1)
  - [Test for Exception](#test-for-exception)
  - [Pytest Fixtures](#pytest-fixtures)
    - [Re-write our test with Fixtures](#re-write-our-test-with-fixtures)
  - [What and Where to Submit](#what-and-where-to-submit)
  - [Reference and further studies](#reference-and-further-studies)


## Getting Started with pytest

pytest works by finding test files and then running test classes and test functions in them. It finds the tests by searching in current folder and sub-folders for any files whose names starts or ends with  **\_test** or **test\_** respectively as follows:

1. test_*.py
2. *_test.py

### Download pytest

Enter the following command in your terminal: `$ pip install pytest`

**Note:** If you get an the following warning:   
    ```
    WARNING: The scripts py.test and pytest are installed in '/home/kami/.local/bin' which is not on PATH.
    ```

Add the installation path  (`/home/kami/.local/bin)` to your `PATH`, by running the following command: `$ export PATH="$HOME/.local/bin:$PATH"`

### Write a test

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

![pytest](screenshots/pytest1.png)

The dot after test_one.py means that one test was run and it passed.
The [100%] shows the overall progress of running all test cases. Since there is just one test here, one test is 100% of the tests. If you have two tests, each would be 50%.

If you need more information, you can use -v or –verbose:

```bash
> pytest -v 
```

![pytest--verbose](screenshots/pytest-verbose.png)

To have a brief output, you use -q or --quiet flag:

![pytest-quiet](screenshots/pytest-quiet.png)

Now let’s write a failing test to see how pytest behaves. Assume a new programer joins the team and he mistakenly removes 0.5 in the kinetic energy formula as follows: 

```python
def calculate_kinetic_energy(mass, velocity): 
    """Returns kinetic energy of mass [kg] with velocity [ms]."""
    return mass * velocity ** 2

```
Fortunately, there is a unit test for this function. Let’s see how pytest catch this bug. Make sure you have changed your program to reflect the bug. Then run the following command in the terminal:
```> pytest```

You get a similar output: 

![pytest-failing-kinetic-energy](screenshots/pytest-failing-kinetic-energy.png)

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

### Solution to Practice 1

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

Wow! Can you believe that? That’s why you should use math.`isclose()` function instead of ‘==’ to compare floating-point numbers:

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

In order to handle this special case, we can check whether the input list is empty or not at the beginning of the function. If empty, we would return `NaN`:

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

## Test for Exception

Assume you have a function that should raise an exception in a particular situation. You want to write a test to make sure the function raises the exception. How would you do that with pytest?

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

Assume you have been assigned to write a unit test for this function so that your test verifies the function raises TypeError exception in case somebody passed a non-string value to it. How would you do that?

We write the unit test as follows: 

```python
import pytest

def test_palindrome():
    with pytest.raises(TypeError):
        palindrome(44)

```

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

Consider the constructor of the class. If the caller does not pass any initial amount, the default value of 0 will be set to self.balance. Otherwise, the value sent to the constructor is set to the ```self.balance```.

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

You may have noticed some repetition in each test function. Can you spot them? The repetition happened in creation of ‘wallet’ object. In every test function, we have created Wallet() object with different initial values. We can rewrite them using fixtures:

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

It is notable that each test is provided with a newly-initialized ‘Wallet’ instance, and not one that has been used in another test. Also it is a good practice to add docstrings to your fixture functions. It helps you and other testers to quickly understand the fixture functions and their specific purpose.

**Note:** Read section "Parametrized Test Functions" and "Combining Test Fixtures and Parametrized Test Functions" on [this blog post](https://semaphoreci.com/community/tutorials/testing-python-applications-with-pytest).


## What and Where to Submit

Submit **exercises 2, 3 and 4** at [Unit Testing 1](https://www.gradescope.com/courses/206382/assignments/1045905) at gradescope.

## Reference and further studies

1. .[Pytest Installation and Getting Started
](https://docs.pytest.org/en/stable/getting-started.html#getstarted)
1. 'Python Testing with pytest' book by Brian Okken.
1. [semaphoreci](https://semaphoreci.com/community/tutorials/testing-python-applications-with-pytest)
