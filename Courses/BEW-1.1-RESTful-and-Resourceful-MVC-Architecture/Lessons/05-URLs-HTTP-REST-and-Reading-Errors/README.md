<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# URLs, HTTP, REST, and Reading Errors

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/05-URLs-HTTP-REST-and-Reading-Errors/README)

### [Demo](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Lessons/05-URLs-HTTP-REST-and-Reading-Errors/demo)

<!-- > -->

## Agenda

1. What is an API? How do we use one?
1. Postman
1. Dictionaries & JSON
1. Break
1. The `requests` library
1. Flask and APIs

<!-- > -->

## Learning Outcomes

1. Describe the uses of an API 
1. Write an API request using Postman
1. Use Python to access JSON data
1. Use the `requests` library to write an API request

<!-- > -->

## Warm Up [15 min]

I want to ask the user of my website what their favorite color is. How do I do so, and display the answer, in Flask?

<!-- > -->

# APIs

<!-- v -->

## APIs

- **A**pplication **P**rogramming **I**nterface
- Used to get data from a web URL
- Just like a normal website! Except instead of serving HTML, it is serving JSON data
- We want to use that data in our web app

<!-- v -->

## What is a REST API?

- **REST** = **Re**presentational **S**tate **T**ransfer
- A REST API has endpoints that allow us to do operations on objects

<!-- v -->

## What are REST Operations?

Aka, CRUD (Create, Read, Update, Delete) operations

<ul>
<li>

**GET** `/dogs?breed=shiba+inu` - show me all shiba inu dogs (Read)
</li> <!-- .element: class="fragment" -->
<li>

**GET** `/dogs/1` - show me the dog with id 1 (Read) </li> <!-- .element: class="fragment" -->
<li>

**POST** `/dogs` - enter a new dog into the database (Create) </li> <!-- .element: class="fragment" -->
<li>

**PUT/PATCH** `/dogs/1` - update the dog with id 1 (Update) </li> <!-- .element: class="fragment" -->
<li>

**DELETE** `/dogs/1` - delete the dog with id 1 (Delete) </li> <!-- .element: class="fragment" -->
</ul>

<!-- v -->

## Example: Chuck Norris API

Follow the documentation to get a random Chuck Norris joke! 

http://www.icndb.com/api/

<!-- v -->

## URL Query Parameters

What if I only want a nerdy joke?

http://api.icndb.com/jokes/random?limitTo=nerdy

<!-- v -->

## Introducing Postman

Download Postman for Mac here:

https://www.getpostman.com/downloads/

<!-- v -->

## Activity [15 mins]

Use Postman to try out the Chuck Norris API! Use the documentation to help you complete the following challenges.

1. Make a request for a random joke.
1. Make a request for 100 jokes.
1. Make a request for the list of joke categories.

<!-- > -->



# Review: Dictionaries

<!-- v -->

## What is a Dictionary?

A **dictionary** is a Python data type that stores key-value pairs.

| Key         | Value       |
| ----------- | ----------- |
| "name"      | "Bananas" |
| "price"     | 0.99        |
| "num_in_stock" | 200        |

<!-- v -->

## How do we use Dictionaries?

We can use a dictionary in Python like:

```python
fruit = {
    "name": "Bananas",
    "price": 0.99,
    "num_in_stock": 200
}
```

<!-- v -->

## Accessing a Field

We can access a field in our dictionary like:

```python
>>> fruit["name"]
"Bananas"
```

<!-- v -->

## Setting a Field

We can set a new field in our dictionary like:

```python
fruit["color"] = "yellow"
```

This is exactly like using a list! Except instead of being associated with a numerical *index*, the values are associated with a string *key*.

<!-- v -->

## Practice

Open up the Python interpreter and type the following:

```python
>>> fruit = {
...     "name": "Bananas",
...     "price": 0.99
... }
```

Try setting and accessing at least 2 different fields.

<!-- > -->


## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# The requests Library

<!-- v -->

## Install requests

Install the `requests` library:

```bash
$ pip3 install requests
```

<!-- v -->

## Using requests

Use the `requests.get` function to send a GET request to your API.

This function returns a `Response` Object. We need to call `.json()` to get the JSON data.

```py
>>> import requests

>>> r = requests.get("http://api.icndb.com/jokes/random?limitTo=nerdy")
>>> joke_json = r.json()
```

<!-- v -->

## Get the Data

Remember that our JSON data looks like this:

```py
{ "type": "success", "value": { 
    "id": 505, 
    "joke": "Chuck Norris can spawn threads that complete before they are started.", 
    "categories": ["nerdy"] }
}
```

Once we have a JSON object, we can extract the fields we want using bracket notation:

```python
>>> joke_str = joke_json["value"]["joke"]
>>> joke_str
"Chuck Norris can spawn threads that complete before they are started."
```

<!-- v -->

## Set the Query String

The part of the URL after the `?` is the **query string**.

```txt
http://api.icndb.com/jokes/random?limitTo=nerdy
```

If our URL has a lot of query parameters, it can get a little messy.

```txt
http://fakeapi.com/search?term=wow+very+long&filter=much+long+wow&name=whoa+cool+person
```

<!-- v -->

## Set the Query String

We can use `requests` to set the query string for us:

```python
my_params = {
    "term": "wow very long",
    "filter": "much long wow",
    "name": "whoa cool person"
}
r = requests.get("http://fakeapi.com/search", params=my_params)
```

<!-- > -->

# Flask and APIs

<!-- v -->

## Let's Make a Joke Program


```py
import requests
from pprint import PrettyPrinter

pp = PrettyPrinter(indent=4)

params = { "limitTo": "nerdy" }
r = requests.get("http://api.icndb.com/jokes/random", params=params)
joke_json = r.json()
pp.pprint(joke_json)
```

<!-- v -->

## Turn it Into a Flask Route

```python
import requests
from flask import Flask

app = Flask(__name__)

@app.route('/joke')
def make_joke():
    params = { "limitTo": "nerdy" }
    r = requests.get("http://api.icndb.com/jokes/random", params=params)
    joke_json = r.json()
    joke_str = joke_json["value"]["joke"]
    return joke_str
```

<!-- v -->

## Run the Server

Let's try running it!

```bash
$ export FLASK_ENV=development
$ flask run
```

<!-- v -->

## Activity

Modify the code in our joke route to:

1. Show a joke for "Ada Lovelace" instead of "Chuck Norris"
1. Ask the user their name, and tell them a joke about themselves

<!-- > -->

## Resources

1. [Slides](https://docs.google.com/presentation/d/1PfQ_apXeAe56HwJia4FwP9rg6f4Awj95MbrsqxdUMZE/edit?usp=sharing)
1. [What is HTTP?](https://www.youtube.com/watch?v=SzSXHv8RKdM)
1. [Explained HTTP, HTTPS, SSL/TLS](https://www.youtube.com/watch?v=po3zYOe00O4)
1. [REST Wikipedia Article](https://en.wikipedia.org/wiki/Representational_state_transfer)
1. [REST & HTTP](https://www.youtube.com/watch?v=LHJk_ISxHHc)
1. [Intro to REST](https://www.youtube.com/watch?v=YCcAE2SCQ6k)
