
<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Intro to Flask

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/03-Intro-to-Flask/README ':ignore')

### [Demo](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Lessons/03-Intro-to-Flask/demo ':ignore')

<!-- > -->

## Agenda

1. Learning Objectives
1. Review: Flask
1. Route Variables
1. Query Strings
1. GET vs. POST

<!-- > -->

## Learning Objectives

By the end of today, you should be able to:

1. Describe what the Flask framework is and how to use it.
1. Use route variables to pass data to a route function.
1. Use an HTML Form to pass data to a route function via a query string.
1. Compare and contrast GET and POST requests.

<!-- > -->

## Warm-Up [5 min]

Name as many types of HTML **form elements** as you can.

<!-- > -->

# Review: Flask

<!-- v -->

## What is Flask?

**Flask** is the *glue* that connects your **route functions** to **the Internet**:

- When you visit a page, Flask knows to run your function.
- When that function *returns*, Flask sends the result back to the browser.

```py
@app.route('/hello')
def say_hello():
    return "Hello, World!"
```

<!-- v -->

## Write a Function

Make a file called `app.py` and insert the following.

```py
def say_hello():
    return "Hello, World!"
```

<!-- v -->

## Add Flask

```py
from flask import Flask

app = Flask(__name__)

@app.route('/hello')
def say_hello():
    return "Hello, World!"
```

<!-- v -->

## Run your Server

Do this to run your server:

```bash
$ flask run
```

Then, go to your browser and type in `localhost:5000/hello` to visit your page.

<!-- v -->

## Run in Development Mode

**PROTIP:** Do this once:

```bash
$ echo "export FLASK_ENV=development" >> ~/.zshrc
$ source ~/.zshrc
```

<!-- > -->

# Flask Route Variables

<!-- v -->

## What is a Route Variable?

A **route variable** is a way for us to pass data to our route via its URL. We specify it with `<` and `>`. The route function will take in this route variable as a parameter.

```py
@app.route('/user/<username>')
def say_hello_var(username):
    return 'Hi, ' + username
```

<!-- v -->

## Route Variable Types

We can also specify a type for our route variable:

```py
@app.route('/double/<int:the_number>')
def double(the_number):
    return str(the_number * 2)
```

<!-- v -->

## When to Use Route Variables

Typically, we use **route variables** when the value of that variable corresponds to a single item in our database.

E.g. The username entered matches to one user.

<!-- v -->

## Challenge Time! [25 min]

Write a Flask route that:

1. Takes in a number and outputs the square of that number.
1. Takes in a number *and* a name and outputs the name that number of times.
1. Takes in a name and outputs it backwards. For example, if I visit the url `/user/Meredith`, I would be greeted by `!htidereM ,olleH`!

Make sure to test your routes!

<!-- > -->


## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# Query Strings

<!-- v -->

## Query String Example

A **query string** is another way for the user to pass data through a URL.

It is made up of **key-value pairs** that are kind of like variables: the **key** is similar to a variable name.

```bash
http://mysite.com/search?name=pumpkin+spice&category=food
```

<!-- v -->

## Import `request`

In `app.py`, change your import line to the following:

```python
from flask import Flask, request
```

<!-- v -->

## request.args

The `request.args` variable is a dictionary of key-value pairs! It might look something like this:

<span class="smalltext">

**PROTIP:** This is what happens *automatically* behind the scenes; no need to type it!

</span>

```py
request.args = {
    'name': 'Pumpkin Spice',
    'category': 'Food'
}
```

<!-- v -->

## Extract a Query String

We can access the **values** in that dictionary using `.get()`.

```python
@app.route('/search')
def search_page():
    name = request.args.get('name')
    category = request.args.get('category')
    return 'You searched for ' + name + ' in the category ' + category
```

<!-- > -->

# Putting it All Together

<!-- v -->

## Accepting Data from a Form

How do we let the user enter their own data (e.g. name & category) and send them to the correct URL?

We can use a form!

```html
<form action='/search'>
    Type in the product name: <input type='text' name='name'>
    <br>
    Type in the category: <input type='text' name='category'>
    <br>
    <input type='submit'>
</form>
```

<!-- v -->

## Displaying the form

We'll need to make another route to display the form HTML.

```py
@app.route('/search_form')
def search_form():
    return """
    <form action='/search'>
        Type in the product name: <input type='text' name='name'>
        <br>
        Type in the category: <input type='text' name='category'>
        <br>
        <input type='submit'>
    </form>
    """
```

<!-- v -->

## Activity: Use a Query String

Modify your route functions from the previous activity to use a query string instead of route variables. Then, add a form so that the user can type in their inputs!

<!-- > -->

# GET vs. POST

<!-- v -->

## What is a GET request?

A **GET** request occurs whenever we visit a web page by typing the URL into the browser. **GET** is considered the "default" method.

```py
@app.route('/hello', methods=['GET'])
def say_hello():
    return "Hello, World!"
```

<!-- v -->

## What is a POST request?

A **POST** request occurs when we submit a form with a **POST** method.

```html
<form action='/login' method='POST'>
    Username: <input type='text' name='username'>
    <br>
    Password: <input type='password' name='password'>
    <br>
    <input type='submit'>
</form>
```

<!-- v -->

## How can we accept a POST request?

We can access the query parameters of a POST request using `request.form` instead of `request.args`.

```py
@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
```

<!-- > -->

## Vibe Check

[make.sc/bew1.1-vibe-check](https://make.sc/bew1.1-vibe-check)

<!-- > -->

<!-- .slide: data-background="#0D4062" -->
## Homework

Complete [Homework #2](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/Assignments/Weekly-Homework?id=homework-2) by Monday, Nov. 4 at 11:59 PM.

<!-- > -->

## Resources

- [Flask Quickstart Guide](https://flask.palletsprojects.com/en/1.1.x/quickstart/)