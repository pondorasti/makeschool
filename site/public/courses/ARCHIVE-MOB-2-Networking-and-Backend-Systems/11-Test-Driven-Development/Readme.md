# Test Driven Development

## Vocabulary

- TDD
- Unit Testing
- Integrated testing
- Continous integration
- Performance testing

## Objectives

- Write tests for your API
- Understand the benefits of writing tests


## Class Materials

[Test Driven Development - Slides](tdd.key)

## TDD

TDD is an approach to software development where we start writing tests first before writing any application code.

## Why do we write tests?

We write tests to ensure that a part of our software is behaving the way we expect it to 99% of the time.

Writing good tests are hard, but with good architectural design, testing can be made simple.
Writing code to be composable, perform a single responsibility can enable us to write testable code.

## What should we test for?

- Validation - parameters passed to server are of the correct type and value
- Behaviours


## Types of tests
Different types of tests achieve different results. Depending on your project/language/preference you might choose to do one of the other, or use a combination of them.

There are many types of testing but we will go over unit and integration tests

- Unit Testing
- Integration Testing
- System Testing
- Stress Testing
- Performance Testing
- Usability Testing
- Beta Testing

### Integration test

Integration testing tests combined functionality after integration.


### Unit test

Unit testing tests individual components or group of related components. It is often done to test that the unit he/she has implemented is producing expected output against given input.


## Testing our flask API

We need to setup our tests for each test case to run.


#### #1
To test our flask api, we need to import a few modules

### *Note*
import server below refers to the name of your flask app.

```python

import server
import unittest
import json
from pymongo import MongoClient

db = None

```

#### #2
Create a class that inherits from unittest.TestCase

```python

class FlaskrTestCase(unittest.TestCase):

    def setUp(self):
        self.app = server.app.test_client()
        
        # Run app in testing mode to retrieve exceptions and stack traces
        server.app.config['TESTING'] = True
        
        # Inject test database into application
        mongo = MongoClient('localhost', 27017)
        global db
        db = mongo.test_database
        server.app.db = db
        
        ## We do this to clear our database before each test runs
        db.drop_collection('users')
        
```

#### #3
Create tests for a user route with GET request

```python
def test_getting_a_user(self):

    ## Post 2 users to database
    self.app.post('/user/',
                      headers=None,
                      data=json.dumps(dict(
                          name="Eliel Gordon",
                          email="eliel@example.com"
                      )),
                      content_type='application/json')
    
    ## 3 Make a get request to fetch the posted user

    response = self.app.get('/user/',
                            query_string=dict(email="eliel@example.com")
                        )
                                
    # Decode reponse
    response_json = json.loads(response.data.decode())
    
    ## Actual test to see if GET request was succesful
    ## Here we check the status code
    self.assertEqual(response.status_code, 200)
```

#### #4
Make sure to add this to the bottom of your test file.

```python
if __name__ == '__main__':
    unittest.main()
```

## Resources

[Testing a Flask App](http://flask.pocoo.org/docs/0.12/testing/)

## Challenges

1. Write 5 tests for our user/trip resource & route. 
Examples of things you can test:
- Constraints
- Validation
- Response from server

