<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# More Testing & Mocks

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/07-More-Testing/README)
### [Demo](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Lessons/07-More-Testing/demo)

<!-- > -->

## Agenda

1. Learning Objectives
1. Intro to Mocks
1. Activity: Read and Answer Questions
1. How to Use Mocks
1. Testing our Weather App

<!-- > -->

## Learning Objectives

1. Describe why mocks are useful and improve our tests.
1. Use the unittest.mock library to mock out an API call.
1. Set an expected return value for a mock object and verify that the mocked method was called.

<!-- > -->

# Intro to Mocks

<!-- v -->

## Warm-Up

We are writing a test for our Weather app, which calls the OpenWeather API.

*If the API breaks (or temporarily goes down), should our tests break? Yes or No?*

<!-- v -->

## Why use Mocks?

When writing tests, we want to test only a *single function at a time*.

So, we want to **mock out** the behavior of anything (such as an API call) that is out of scope of the function being tested.

<!-- v -->

## An Analogy: Tennis Ball Machine

When practicing tennis, you want to practice only a single move at a time; and you don't want to depend on another human to throw the ball for you.

So, you might **mock** the ball throw by using a machine to "fake" it.

![tennis](assets/tennis-ball-machine.gif)

<!-- v -->

## Activity: Mocks Documentation

#### (30 min)

1. Form a group of 4 at your table.
1. Read this page on mocks: https://realpython.com/python-mock-library/
1. With your group, answer the questions on your worksheet.

<!-- > -->

## Break [10 mins]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# How to Use Mocks

<!-- v -->

## Mocks: The Ditto of Programming

A mock is designed to take the shape of any object we tell it to.

![Ditto](assets/ditto.gif)

<!-- v -->

## Setting the Return Value

Let's say we're testing a program called `foo` that makes an "expensive" (i.e. time-consuming) API call. We want to mock out the API call itself, and only test our program.

<aside class="notes">
This is a simplified example, but it is similar to how you will mock out functions in your own code!
</aside>

```py
@patch('foo.expensive_api_call')
def test_foo(self, expensive_api_call):
    # Set the mock's return value
    expensive_api_call.return_value = {
        'name': 'Togepi',
        'species': 'Spike Ball Pokemon',
        'type': 'Fairy',
        'moves': ['Charm', 'Growl', 'Metronome']
    }

    # Call the function being tested
    result = foo.function_we_are_testing('Togepi')

    # ... verify that result is what we expect
```

<!-- v -->

## Verifying the Mock was Called

Finally, we want to make sure that the API was called with the parameters we expect.

```py
@patch('foo.expensive_api_call')
def test_foo(self, expensive_api_call):
    expensive_api_call.return_value = # ... set return value

    result = foo.function_we_are_testing('Togepi')
    # ... verify that result is what we expect

    expensive_api_call.assert_called_with(API_BASE_URL, {'name': 'Togepi'})
```

<!-- > -->

# Testing our Weather App

<!-- v -->

## Review: Weather App Code

Your weather app should look something like this.

```py
@app.route('/weather_results')
def weather_results():
    """Display the temperature in a given city."""
    params = {
        'q': request.args.get('city'),
        'units': 'Imperial',
        'appid': '2608f679d45c238a545e6f6cc2246c79'
    }
    weather_url = 'http://api.openweathermap.org/data/2.5/weather'

    response = requests.get(weather_url, params=params)
    response_json = response.json()

    temp = response_json["main"]["temp"]

    return "It is now " + str(temp) + " degrees Fahrenheit."
```

<!-- v -->

## Set up our Tests

You'll need the following setup code to run a test. (No need to memorize it!)

```py
from app import app
from unittest import TestCase, main

class AppTests(TestCase): 
    """Run tests on the Weather App."""
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    def test_weather_results(self, requests):
        pass

if __name__ == '__main__':
    main()
```

<!-- v -->

## A First Attempt

What's wrong with this test code? What will happen when I run it?

```py
def test_weather_results(self):
    result = self.app.get('/weather_results?city=San+Francisco')
    self.assertEqual(result.status_code, 200)

    page_content = result.get_data(as_text=True)
    self.assertIn('It is now 60 degrees Fahrenheit', page_content)
```

<!-- v -->

## Adding a Mock

```py
from unittest.mock import patch

@patch('app.requests')
def test_weather_results(self, requests):
    requests.get().json.return_value = {
        'main': { 'temp': 60 }
    }
    result = self.app.get('/weather_results?city=San+Francisco')
    self.assertEqual(result.status_code, 200)

    page_content = result.get_data(as_text=True)
    self.assertIn('It is now 60 degrees Fahrenheit', page_content)
```

<!-- v -->

## Verifying the API Call

How do we make sure that the API call actually happened as intended?

```py
from unittest.mock import patch, ANY

@patch('app.requests')
def test_weather_results(self, requests):
    requests.get().json.return_value = {
        'main': { 'temp': 60 }
    }
    result = self.app.get('/weather_results?city=San+Francisco')
    # ... do other verifications on result

    requests.get.assert_called_with(ANY, 
        params={'q': 'San Francisco', 'units': 'Imperial', 'appid': ANY})
```

<!-- v -->

## Activity: Add Tests

1. In your Weather API project folder, create a file called `tests.py`.
1. Use the starter code from the lesson to test your code using city "San Francisco".
1. See if you can break the test by changing the inputs.
1. Write more tests!

<!-- > -->

## Vibe Check

Go to https://make.sc/bew1.1-vibe-check and fill out the form.

<!-- v -->

## 🎉 Shout-Outs 🎊

Have any shout-outs? Show appreciation for your peers!

<!-- > -->

<!-- .slide: data-background="#0D4062" -->
## Homework

Homework 3 (Weather App) is due tonight at midnight.

In addition, please finish today's activity as homework and add at least 2 route tests to your Weather App.

<!-- > -->

## Resources
- [Python unittest docs](https://docs.python.org/3/library/unittest.html)
