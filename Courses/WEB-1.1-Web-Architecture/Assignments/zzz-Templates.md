# Homework 3: Templates

## Purpose (Why should I do this?)

When creating a web server that serves HTML, developers use **templates** to make their code more re-usable, readable, and elegant! As your projects grow in size, templates will be absolutely critical to successful web development.

For this assignment, we'll practice using Jinja2 template variables, if statements, loops, and template inheritance.

Scoring for this project is as follows:

| Criteria | Possible |
| :------: | :------: |
| Refactor Favorites | `10` |
| Refactor Calculator | `10` |
| Compliments | `15` |
| Template Inheritance | `10` |
| **TOTAL** | **`50`** |

## Getting Started

Clone the [Starter Code]() for this assignment into your projects directory by running the following command:

```
$ git clone ...
```

Then, open up the project folder in your favorite code editor (we recommend VSCode) and open up `app.py` to get started!

## Instructions

### Refactor Favorites _(10 points)_

Refactor the `choose_favorites` and `favorites_results` routes to render a template. Any relevant variables should be included in a `context` dictionary as key-value pairs and passed to `render_template`. You may use your previous homework submission as a reference.

### Refactor Calculator _(10 points)_

Refactor the `calculator` and `calculator_results` routes to render a template. Any relevant variables should be included in a `context` dictionary as key-value pairs and passed to `render_template`. You may use your previous homework submission as a reference.

### Compliments _(20 points)_

Take a look at the `compliments` route which displays a form to the user, located in `compliments_form.html`. The form contains:

- A text box for the user's name
- A checkbox for choosing whether the user wants compliments (yes/no)
- A dropdown for choosing how many compliments the user would like

Complete the `compliments_results` route to:

- Greet the user by name
- Only show them compliments if the checkbox was checked
- Show a randomly chosen list of compliments, according to how many the user requested, each in its own separate bullet point

**HINT**: Use the `<ul>` (unordered list) and `<li>` (list item) tags to create bullet points. You'll need to use a for loop to cycle through the list of compliments!

### Template Inheritance _(10 points)_



## Submission

Submit your assignment using [Gradescope](https://gradescope.com).

## Resources

1. [Flask Tutorial: Templates](https://pythonbasics.org/flask-tutorial-templates/)
