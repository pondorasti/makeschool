# Intro to Backend Systems 

In this portion of the class we are going to learn about internet architecture, HTTP, REST API design concepts, test-driven development, data modeling, representation, persistence, authentication, authorization, and documentation. After finishing this course, you will be prepared to design, build, and deploy your own RESTful web API services using Python, Flask, and other popular libraries and tools. These principles and concepts carry over to developing web services in other languages and frameworks as well.

## Objectives

- Learn how to setup a python environment for develpment
- Use git and github to manage your projects
- Use package managers to fetch and manage requirements
- Learn how to use the python debugger to debug your code
- Create your first route in flask

## Class Materials

[Slides - Intro to Backend](intro-to-backend.key)


## Python and Environment Setup

1. If you don't already have brew, install brew by following the instructions here: https://brew.sh: 
2. Install python3 with ```brew install python3```.
3. Install pip, the python package manager.
4. Install virtualenv with: pip3 install virtualenv


Lets create a basic virtual environment for Python3 and install the required packages.

Run ```virtualenv development``` to setup our virtual environment.

Activate your virtual environment with:

```source development/bin/activate```

Create a requirements.txt file containing these dependencies.


aniso8601==1.0.0

Flask==0.10.1

Flask-PyMongo==0.3.1

Flask-RESTful==0.3.4

itsdangerous==0.24

Jinja2==2.8

MarkupSafe==0.23

pymongo==3.0.3

pytz==2015.4

six==1.9.0

Werkzeug==0.10.4

wheel==0.24.0

**Run:**

pip install -r requirements.text

## Creating your first Flask app

```python
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()
    app.config["DEBUG"] = True

```

Run ```python app.py``` in terminal and copy the url in the terminal into a browser.


### Working with Requests and JSON

Lets try returning a JSON response when we hit our person_route function:

*Note* we are importing the json library to convert our python objects to json.

```python
import json
from flask import Flask, request

app = Flask(__name__)

@app.route('/person')
def person_route():
    person = {"name": "Eliel", 'age': 23}
    json_person = json.dumps(person)
    return (json_person, 200, None)

```

We return a tuple of 3:
- First parameter is the data we are sending back
- Second is the status code
- Third is any headers we want to add

## Using the Python Debugger

We will be using the python debugger """ pdb """ for debugging our python code.

Lets start by inspecting our requests.

```python
....
...

import pdb

....
...

@app.route('/person')
def person_route():
    pdb.set_trace()
    
    person = {"name": "Eliel", 'age': 23}
    json_person = json.dumps(person)
    return (json_person, 200, None)

```

Run ``` python server.py ``` in terminal and visit http://127.0.0.1:5000/

This gives us an interactive interface for inspecting our code.
For example, we can inspect what is coming in from a request by checking:


- request

- request.json

- request.headers


These shows us what in the request json, and request headers

Now, anytime you want to find out whats going on with your code, you can inspect it with pdb.


#### Useful pdb commands

Use:

- **p  object_name** to print an object.
- **c** to continue. This will cause your program to continue running normally, without pausing for debugging.

- **q** To quit debugging.
- **l** to find out where your breakpoint is in your code.
- **n** to go to the next line of execution.


## Resources

1. Read the Flask documentation: http://flask.pocoo.org/docs/0.11/
2. Get started with the Flask quickstart tutorial: http://flask.pocoo.org/docs/0.11/quickstart/

## Challenges

1. Add a new route called my_page and return some text.
2. Use Paw or Postman to perform a get request to a "/pets" routes and return a list of your favorite pets in JSON format.
3. Add a new route handler that receives POST requests to the route `/pets` with JSON data in the body(an array of pet objects) and returns that JSON data unmodified in the response body. Test the `/pets` route using Paw, Curl, Postman, or another tool to make HTTP POST requests to ensure it responds correctly with the same data given in the request.


Eg array of pets
```javascript
[
    {
        'name': 'Charlie',
        'color': 'Brown'
    },
    {
        'name': 'Bingo',
        'color': 'Blue'
    }   
]
```
