# Quiz 1 Study Guide

## Learning Objectives

You should be able to...

- Write a Flask route for a specific URL
- Given a route & HTML form, access the form's data using `request.args` and `request.form`
- Give examples of when to use a `GET` vs. a `POST` request
- Call `render_template` using a context dictionary to render an HTML file
- Use Jinja2 `for` loops and `if` statements to display dynamic HTML based on data passed in

## Sample Questions

### Question 1: Forms

**Part 1**: I am developing a site to search for your favorite media (books, movies, and TV) and write reviews. My code so far for the form looks like this:

```html
<form action="/search" method="GET">
    What media would you like to search for?
    <input type="text" name="search_query"><br>
 
    What category are you searching in?
    <select name="category">
        <option value="books">Books</option>
        <option value="movies">Movies</option>
        <option value="tv">Television</option>
    </select><br>
    <input type="submit" value="Search!">
</form>
```

If the user searches for “Spongebob” in the category “Television”, **what URL will they be sent to? Fill in the blanks and include all query parameters.** (Note: Multiple query parameters can be separated by a ‘&’.)

`https://mysite.com/_________?_______________________`

Hover below for answer & explanation!

<div class="hover-reveal">
The URL the user will be sent to is:

`https://mysite.com/search?search_query=Spongebob&category=tv`

For the search query, the key is determined by the `name=` property of the input element (`search_query`), and the value is determined by what the user types (`Spongebob`), for a key-value pair of `search_query=Spongebob`.

For the category, since the user doesn't type anything, the value is determined by the `value=` property of the select element, for a key-value pair of `category=tv`.
</div>

**Part 2**: I am writing a Flask route for the search page which accepts a GET request from the form shown above. Fill in the TODOs to complete the function.

```py
@app.route('/search', methods=['GET'])
def order_page():
    query = '' # TODO 1
    category = '' # TODO 2
 
    # ... find search results here
    
    return render_template('search_results.html', results=search_results)
```

**What should go in place of TODO 1 and TODO 2?**

Hover below for answer & explanation!

<div class="hover-reveal">

**TODO 1** should be completed as:

`query = request.args.get('search_query')`

And **TODO 2** should be completed as:

`category = request.args.get('category')`

Remember to look at the `name=` property of each form element to find the key to use to retrieve each of these values!
</div>

### Question 2: Templates

I am writing a Task Tracker application that will show the user what they have on their to-do list. Since I don’t yet have a database set up, I am testing my app with some sample data. Here is what I have so far in my route function:

```py
@app.route('/tasks')
def task_tracker():
    """Show the user what they have to do."""
    users_tasks = [    # Could contain any number of string values
        'Call mom',
        'Walk dog',
        'Pay bills',
        'Buy groceries',
    ]
    return render_template(task_list.html', tasks=users_tasks)
```

**Fill in the code below** to complete the `task_list.html` template using a Jinja if statement and for loop. If the tasks variable contains at least one item, the page should display the tasks in separate bullet points. Otherwise, it should display the text “No tasks for now!”.

```html
<!-- task_list.html -->

<!-- TODO 1: If there is at least one task, use a Jinja for loop to display each
 todo list item on a separate bullet point. -->
You have the following on your to-do list:
<ul>
    <li>... TODO item goes here ...</li>
</ul>

<!-- TODO 2: If there are no tasks, display the following text. -->
No tasks for now!
```

Hover below for answer & explanation!

<div class="hover-reveal">
Here is the completed code:

```html
{% if tasks %}
You have the following on your to-do list:
<ul>
    {% for task_item in tasks %}
    <li>{{ task_item }}</li>
    {% endfor %}
</ul>
{% else %}
No tasks for now!
{% endif %}
```

We use the `{% if %}` block to show a block of HTML conditionally, if there is at least one task. Then, to show a bullet point for each task, use the `{% for %}` block. We are **iterating over** the `tasks` variable which was passed in from the route, and creating the `task_item` loop variable which we can use to display each task.
</div>
