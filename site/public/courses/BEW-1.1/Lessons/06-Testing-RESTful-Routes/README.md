<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Testing RESTful Routes

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/06-Testing-RESTful-Routes/README)
### [Starter Code](https://github.com/Make-School-Labs/Flask-Testing-Starter)

<!-- > -->

## Agenda

1. [Learning Objectives](#learning-objectives)
1. [Why Test Our Routes?](#why-test-our-routes?) 
1. [Forms of Testing](#forms-of-testing)
1. [Unit Tests](#unit-tests) 
1. [Break](#break)
1. [Route Tests](#route-tests)

<!-- > -->

## Learning Objectives

1. List various types of automated tests
1. Define unit tests and how to implement them in Python
1. Implement route tests for one resource

<!-- > -->

# Why Test Our Routes?

<!-- v -->

## What is Automated Testing?

**Manual testing** means manually running your program many times, with various test cases.
<!-- .element: class="fragment" data-fragment-index="1" -->
- Example: Running your app to see if it's working
<!-- .element: class="fragment" data-fragment-index="2" -->

**Automated testing** is writing code that tests your code *for you*.
<!-- .element: class="fragment" data-fragment-index="3" -->
- Example: Writing code that tests the correctness of your app for various user inputs
<!-- .element: class="fragment" data-fragment-index="4" -->

<!-- v -->

## Why Learn Automated Testing?

1. Ensures that your next change won't break anything that was previously working<!-- .element: class="fragment" data-fragment-index="1" -->
  - These are called **regression** tests 
1. Other developers can contribute to your project without fear of breaking it<!-- .element: class="fragment" data-fragment-index="2" -->
1. Improves accuracy of your code - easier to test many edge cases<!-- .element: class="fragment" data-fragment-index="3" -->
  - What is an **edge case**?

<!-- > -->

# Forms of Testing

<!-- v -->

## How can I test my code?

We'll go over a couple of the most foundational tests you can run on your projects:

1. **Unit Testing** - tests a single function
1. **Route Testing** - tests what is served by a single route

<!-- > -->

# Unit Tests

<!-- v -->

## What are Unit Tests?

**Unit tests** test the output or return value of a single function.

They are very **resilient** and will rarely break as you make changes to your code, but they provide very _narrow test coverage_ to your application as a whole so you have to write a lot of them.

Python has a built in unit test library called [unittest](https://docs.python.org/3.7/library/unittest.html) that we'll use for running our unit tests going forward.

<!-- v -->

## Example

Here's an example of a unit test that checks the output of a `greet_by_name` function. Check out the comments for details. Let's call this file `test_greeting.py`:

```python
import unittest

def greet_by_name(name):
    """Greet user by name."""
    greeting = "Hello, " + name + "!"
    return greeting

class StringFunctionTests(unittest.TestCase):
    def test_greeting(self):
        """Test the greeting function."""
        self.assertEqual(greet_by_name('Dani'), 'Hello, Dani!')

if __name__ == '__main__':
    unittest.main()
```

<!-- v -->

## Assertions

What does `assertEqual` mean? This is an example of an assertion! 

An **Assertion** is a true/false statement that defines a test. In the above example, we're testing to make sure the `greet_by_name('Dani')` function returns `Hello, Dani!` as an answer.

Read more about assertions [here](https://docs.python.org/3/library/unittest.html#unittest.TestCase).

<!-- v -->

## Run the Test

If you were to run this function, you'd see the following output:

```bash
➜  ~ python3 string_tests.py
.
----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

Great! Our test passed!

<!-- v -->

## Question

What would happen if we change:

```python
self.assertEqual(greet_by_name('Dani'), 'Hello, Dani!')
```

To the following:

```python
self.assertEqual(greet_by_name('Dani'), 'Hello, Meredith!')
```

<!-- v -->

## Fail!

Our two parameters to `assertEqual` no longer match, so the test would fail!

```bash
➜  ~ python3 test_greeting.py
F
======================================================================
FAIL: test_default_greeting_set (__main__.GreetByNameTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_greeting.py", line 10, in test_default_greeting_set
    self.assertEqual(greet_by_name('Dani'), 'Hello, Meredith!')
AssertionError: 'Hello, Dani!' != 'Hello, Meredith!'
- Hello, Dani!
+ Hello, Meredith!


----------------------------------------------------------------------
Ran 1 test in 0.001s

FAILED (failures=1)
```

<!-- v -->

## Activity: Write some Tests

Clone the repository [here](https://github.com/Make-School-Labs/Flask-Testing-Starter) and write tests for the other functions.

<!-- > -->

## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# Route Tests

<!-- v -->

## What is Route Testing?

**Route Tests** test a single route. They are typically more broad than unit tests, but will not break when we change something minor like the styling.

<!-- v -->

## Route Testing Example

Here's an example of testing a route:

```python
from app import app
import unittest 

class AppTests(unittest.TestCase): 
    
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    def test_homepage(self):
        """Verify that homepage renders correctly."""
        result = self.app.get('/')
        self.assertEqual(result.status_code, 200)
        page_content = result.get_data(as_text=True)
        self.assertIn('Hello world', page_content)
```

<!-- v -->

## What if I want to test with specific form input?

We can *simulate* a user entering "Cat" into the "Favorite animal?" input box by changing the query string.

```py
def test_fortune_cat(self):
    """Verify that homepage renders correctly."""
    result = self.app.get('/fortune_results?animal=cat')
    self.assertEqual(result.status_code, 200)

    page_content = result.get_data(as_text=True)
    self.assertIn('Your day will be paw-some', page_content)
```

<!-- v -->

## Activity: Test Fortune Teller

Write at least four route tests for your Fortune Teller project (one for each possible fortune).

<!-- > -->

## Vibe Check

Go to [https://make.sc/bew1.1-vibe-check](https://make.sc/bew1.1-vibe-check) and fill out the form.

<!-- > -->

<!-- .slide: data-background="#0D4062" -->
## Homework

Homework 3 (Weather App) is due on Thursday, at midnight.

<!-- > -->

## Resources
- [Python unittest docs](https://docs.python.org/3/library/unittest.html)
