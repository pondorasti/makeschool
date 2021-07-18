
<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Flask Templating with Jinja

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/04-Flask-Templating/README)

### [Demo](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Lessons/04-Flask-Templating/demo)

<!-- > -->

## Agenda

1. Learning Objectives
1. Flask Review
1. Jinja Templates & Template Control Flow
1. Documentation


<!-- > -->

## Learning Objectives

By the end of today, you should be able to:

1. Explain the uses of templates 
1. Render a Flask web page using a Jinja template
1. Use template control flow structures such as for loops & conditionals
1. Document your code using comments, docstrings, and a README

<!-- > -->

## Warm-Up [5 min]

Compare and contrast the following:

- **Route variables** (e.g. `/items/pumpkin_spice`)
- **Query parameters** (e.g. `/items?query=pumpkin+spice`)

In what scenarios should you use each? Share with a partner.

<!-- > -->

# Jinja Templates

<!-- v -->

## What are Templates?

Templates are special HTML files that:

- Can use variables passed from your Flask route
- Can use some control structures (for loops, if/else)
- Can inherit from other templates to avoid repetition

<!-- v -->


## Render a Template

At the top of `app.py`, import `render_template`:

```py
from flask import render_template
```

Then change our route to call the `render_template` function:

```py
@app.route('/hello')
def say_hello():
    """Says hello."""
    return render_template('greeting.html')
```

<!-- v -->

## Add the Template

Add a file in the `templates` folder called `greeting.html`.

Give it the contents `Hello, World!`.

<!-- v -->

## Check that it Works

Let's try running our server again!

```bash
$ flask run
```

<!-- > -->

# Passing Data

<!-- v -->

## Make an `/items` route

We can pass *any kind of data* to our template. Here, let's pass in a list of items.

```py
@app.route('/items')
def show_items():
    """Show a list of items."""
    items_to_show = [
        'Pumpkins',
        'Karaoke Machine',
        'Disco Ball'
    ]

    return render_template('items_list.html', items=items_to_show)
```

<!-- v -->

## Update the Template

In Jinja, we can show the value of a variable using `{{` and `}}`.

```html
The items are:
<br>
{{ items }}
```

<!-- > -->

# Template Control Flow

<!-- v -->

## Loops

We can use a *loop* in Jinja using `{% for _ in _ %}`. Let's show each item on a separate line.

```html
The items are:
<ul>
{% for item in items %}
  <li> {{ item }} </li>
{% endfor %}
</ul>
```

<!-- v -->

## Conditionals

Let's show a nice message to the user if there are no items.

We can use an *if statement* in Jinja as follows:

```html
{% if items %}
  <ul> ... </ul>
{% else %}
  No items to show!
{% endif %}
```

<!-- > -->

# Write your Own Templates

<!-- v -->

## Challenges [25 min]

1. Write a route that passes a list of songs to a template called `song_list.html`. Add your favorites!
1. Write a route that passes a boolean for whether or not it is sunny to a template `weather.html`. Show a custom greeting depending on the weather!

<!-- v -->

## Stretch Challenge

1. Use the `random` library to choose a random number. Pass the result to a template, and show the user either "You won!" or "You lost!" depending on the result.

<!-- > -->

## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# Documentation

<!-- v -->

## Why write documentation?

Documentation is helpful because it...

<ul>
<li>Makes your code easier for others to understand</li><!-- .element: class="fragment" -->
<li>

Makes your code easier for *you* to understand </li><!-- .element: class="fragment" -->
<li>Forces you to make better decisions when writing code</li> <!-- .element: class="fragment" -->
</ul>

<!-- v -->

## How can I write documentation?

There are three ways we (typically) write documentation:

1. **Code Comments**: Describe particularly confusing or complicated lines of code
1. **Docstrings**: Describe *what* a single function does (not *how* it does it)
1. **README**: Describe an entire project and give usage instructions

<!-- > -->

# Docstrings

<!-- v -->

## What is a docstring?

A **docstring** (or **documentation string**) describes what a single function does. It goes at the beginning of the function and starts and ends with `"""`.

```py
def say_hello(name):
    """Say hello to the specified user."""
    return "Hello, " + name
```

<!-- v -->

## Multi-Line Docstrings

If the function takes inputs or returns an output, we can specify those as well.

```py
def multiply(x, y):
    """
    Multiplies 2 numbers and returns the result.
    
    Parameters:
        x (int): The first operand.
        y (int): The second operand.
    
    Returns:
        int: The product of the 2 numbers.
    """
    return x * y
```

<!-- v -->

## Write some Docstrings [10 min]

Write the function signature and docstring (*not the code!*) for the following functions:

1. A function that takes in 2 numbers and returns their sum.
1. A function that takes in a list of numbers and returns their sum.
1. A Flask route function that displays an item's detail page.

<!-- > -->

# READMEs

<!-- v -->

## What is a README?

A **README** is a file, located in the root folder of your project, that describes:

- A description of the project
- Installation and usage instructions
- Any other relevant information

Typically, a README is written in **Markdown** and has a `.md` extension.

<!-- v -->

## Activity: Write a README [10 min]

Visit [makeareadme.com](https://www.makeareadme.com/) and write a README.md file for your Fortune Teller project.

*Finish early? Work on your Homework #2.*

<!-- > -->

## Vibe Check

[make.sc/bew1.1-vibe-check](https://make.sc/bew1.1-vibe-check)

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## Homework

Finish [Homework 2](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/#/Assignments/Weekly-Homework?id=homework-2) by Monday, Nov. 4

<!-- > -->

## Resources

- [Jinja Template Documentation](https://jinja.palletsprojects.com/en/2.10.x/templates/)
- [GeeksForGeeks on Python Docstrings](https://www.geeksforgeeks.org/python-docstrings/)
- [Python.org Docstring Conventions](https://www.python.org/dev/peps/pep-0257/)
- [A Beginner's Guide to Documentation](https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/)