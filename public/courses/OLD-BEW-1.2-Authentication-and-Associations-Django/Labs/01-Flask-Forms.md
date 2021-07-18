# Flask & Forms Review

## Learning Objectives (5 minutes)

By the end of this class, you should be able to...

1. Use HTML forms to collect user data, analyze it, and send a result back to the user.
1. Translate code written in Flask into Django.

## TT: Forms in Flask (20 minutes)

HTML forms are one tool we can use to collect user input and make our websites interactive. Let's review how we use them in Flask to make a "favorite color" application.

```py
# app.py
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def homepage():
    return render_template('home.html')
```

We can create a `home.html` template that collects the user's favorite color:

```html
<!-- templates/home.html -->
<h1>Welcome!</h1>

<form action="/results" method="GET">
What is your favorite color?

<input type="text" name="favorite_color">

<input type="submit" value="Submit!">
</form>
```

Then, we'll need to collect the user's input from the **query parameters** that were sent via the form.

```py
# app.py
# ...

@app.route('/results')
def favorite_color_results():
    # declare a variable for the user's favorite color
    users_favorite_color = request.args.get('favorite_color')

    return render_template('results.html', favorite_color=users_favorite_color)
```

Finally, we'll need a `results.html` template:

```html
<!-- templates/results.html -->
<h1>Form Results</h1>

<p>Your favorite color is: {{ favorite_color }}</p>

{% if favorite_color == 'blue' %}
    <p>That's my favorite color, too!</p>
{% endif %}
```

## Activity 1 (25 minutes)

Write a Flask application that collects the users' favorite foods. If their favorite foods match yours, give them a special message!

**STRETCH CHALLENGE**: Collect a _list_ of favorite foods from the user (as comma-separated values). Display each in a separate bullet point. Then display a number representing how many favorite foods the user has in common with you!

## BREAK (10 minutes)

## Activity 2 (50 minutes)

Create a new Django application, and re-write your Flask code in Django. **HINT**: To get the query parameters, use `request.GET.get('form-field-name-goes-here')`.

For more information on request parameters, check out [this article](https://docs.djangoproject.com/en/3.0/ref/request-response/).

## Wrap-Up

Continue working on [Homework 1](Projects/01-portfolio-site) - due by Monday at 11:59 PM.

## Resources

1. [Request and response objects](https://docs.djangoproject.com/en/3.0/ref/request-response/)