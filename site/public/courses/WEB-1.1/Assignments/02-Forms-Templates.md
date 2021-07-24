# Homework 2: Forms

## Purpose (Why should I do this?)

You've probably seen forms on nearly every website you've ever visited. For example, on Amazon.com, you can fill out a form to search for a particular item and see relevant results. On Facebook.com, you can fill out forms to sign up, log in, and post a status update!

For this assignment, we'll be practicing using forms in our web applications. This will allow you to collect user data on everything from their username and password to their search query, favorite food, hometown, next move in a chess game... and more!

We'll also be practicing using Jinja2 templates to store our HTML code. This will allow you to write much more complex programs that integrate code in multiple languages.

Scoring for this project is as follows:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Required sections of submission are largely missing or not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Most routes are functional, but a few may be hard-coded or incorrect. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | All routes are functional and produce the expected result. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |


## Getting Started

If you haven't yet, create a folder to contain your work for this course. If you put it in the `/dev/courses` folder, then the full path would be something like `/dev/courses/web1.1`.

In a terminal window, navigate to your newly created folder and clone the [starter code](https://github.com/Make-School-Labs/WEB-1.1-Homework-2-Starter):

```
$ git clone git@github.com:Make-School-Labs/WEB-1.1-Homework-2-Starter.git Homework-2-Forms
```

Next, go to [GitHub.com](https://github.com) and create a new repository for your project. **IMPORTANT: Make sure the box for "Initialize with a README" is NOT checked**. Then, run the following commands to push your starter code to GitHub:

```
$ git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
$ git push -u origin master
```

Refresh the page in your newly-created GitHub repo to make sure your changes were successfully pushed.

## Part 1: Forms

### Fro-Yo Ordering

Let's recreate one of the problems from the last assignment - learning your user's favorite dessert - by creating a mini **fro-yo** (or, frozen yogurt) shop. However, this time we'll be using a **form** to do so to collect our data. This is a more proper, industry-standard way of collecting user data!

First, update the route called `choose_froyo` with the following contents:

```py
@app.route('/froyo')
def choose_froyo():
    """Shows a form to collect the user's Fro-Yo order."""
    return """
    <form action="/froyo_results" method="GET">
        What is your favorite Fro-Yo flavor? <br/>
        <input type="text" name="flavor"><br/>
        <input type="submit" value="Submit!">
    </form>
    """
```

Before moving on, let's review each component of an **HTML form**:

1. The `action=` attribute specifies _which URL the user will be sent to_ when they submit the form. Here, the user will be sent to the URL `/froyo_results/`.
1. The `method=` attribute specifies the **HTTP method** the form will use to submit its results. It can be either `GET` or `POST`.
1. At least one `input` field for the user to enter data. An input field with `type="text"` will accept a text input. Each `input` field must contain a `name=` attribute, which will be used to retrieve the data later.
1. A submit button.

After saving your work, start up your server with `python3 app.py` and visit the page `http://localhost:5000/froyo` in your browser. Fill out the form and press the submit button. What happens? Take a look at what is in the URL bar. Where do you go?

Next, create a second route for `show_froyo_results`, with the following contents:

```py
@app.route('/froyo_results')
def show_froyo_results():
    users_froyo_flavor = request.args.get('flavor')
    return f'You ordered {users_froyo_flavor} flavored Fro-Yo!'
```

Here, we're using a **dictionary** called `request.args`, which stores all of the data that the user entered into the form as **key-value pairs**. We can retrieve each piece of user-entered data from the dictionary using `.get()`.

<span class="check-for-understanding">Check for Understanding:</span> Why did we use `request.args`, and not `request.form`?

Save your work, and try out your route again by re-submitting the form. Do you see a result?

Next, **add another input field for the user to enter what toppings they want.** To do so, you'll need to do the following:

1. Add another HTML `input type="text"` field to the `choose_froyo` route for toppings. Make sure that it has the attribute `name="toppings"` so that it'll pass the unit tests.
1. Add some extra text above the input tag to tell the user what to type in.
1. In the `show_froyo_results` route, create another variable to store the user's chosen toppings. Use `request.args` to get the toppings and store it in the variable.
1. Add the variable to the route's output string to show the user what they ordered!

When you're done, try out the route again. When you submit the form, you should see something like:

```
You ordered Lychee flavored Fro-Yo with toppings Mochi, Brownie Bites, and Gummy Bears!
```

### Favorite Things

Update the `favorites` route to show a form for the user to enter their favorite color, animal, and city. Each of these inputs should be collected in a different text box, with `name=color`, `name=animal`, and `name=city`, respectively. (Make sure the input names match exactly; otherwise, the tests won't pass!) The page should submit the results of the form to the URL `/favorite_results` when the user presses the submit button.

Then, update the `favorite_results` route to show the user the following sentence (with `purple`, `penguin`, and `San Francisco` changed to whichever color, animal, and city the user entered):

```
Wow, I didn't know purple penguins lived in San Francisco!
```

### Secret Message

Update the `secret_message` route to show a form for the user to enter a secret message. Make sure to use a text input box with `name=message`. We want to send this information securely, so make sure your form uses the `method='POST'` attribute. The page should submit the results of the form to the URL `/message_results`.

Then, update the `message_results` route to show the secret message -- with its letters **sorted in alphabetical order**.

**HINT**: Call the `.sort_letters()` method that's included in the starter code!

So, if I enter the phrase `Make School Rocks` into the form field and press submit, I should see the result of:

```
Here's your secret message!
 MRSaccehkklooos
```

### Calculator

Let's recreate the "Calculator" problem from the last homework, by properly using a form!

Take a look at the `calculator` route. It shows a form for the user to enter two numbers, as well as choose an operator from a drop-down menu of `+` (add), `-` (subtract), `*` (multiply), and `/` (divide).

Complete the route `calculator_results` route to show the user the result of the operation. It should also show the two operands and the operation!

**HINT**: All route variables are of type `string`, which means you'll need to cast them as integers in order to do the operations. You can do so using the built-in [int()](https://www.freecodecamp.org/news/how-to-convert-strings-into-integers-in-python/) method.

So, after submitting the form, you should see something like:

```
You chose to add 2 and 5. Your result is: 7
```

## Part 2: Templates

### Refactor Fro-Yo

Refactor the `froyo` and `froyo_results` routes to render a template. Any relevant variables should be included in a `context` dictionary as key-value pairs and passed to `render_template`.

If you need a refresher on how to do this, check out the [Repl.It activity](https://repl.it/@MeredithMurphy1/JinjaRefactor#main.py) we completed during class.

### Refactor Calculator

Refactor the `calculator` and `calculator_results` routes to render a template. Any relevant variables should be included in a `context` dictionary as key-value pairs and passed to `render_template`.


### Horoscope

Take a look at the `horoscope_form` route which displays a form to the user, located in `horoscope_form.html`. The form contains:

- A text box for the user's name
- A dropdown for choosing when they were born, with each option corresponding to a horoscope sign

Complete the `horoscope_results` route to:

- Greet the user by name
- Show them their horoscope sign, as well as their personality according to the `HOROSCOPE_PERSONALITIES` dictionary
- Show them their lucky number (generated randomly from 1 to 99)

**HINT**: You can use the Python `random` library method [randint()](https://www.w3schools.com/python/ref_random_randint.asp) to generate a random number from 1 to 99.


## Testing

To test the correctness of your code, first make sure you've installed unittest:

```bash
$ pip3 install unittest
```

Then, run the tests:

```bash
$ python3 test_app.py
```

If you'd like to run just a single test, you can run:

```bash
$ python3 test_app.py TestApp.test_froyo
```

To see what tests are available to run, open the `test_app.py` file in your starter code and take a look!

## Submission

When you're ready to submit your work, make sure you push all of your changes to GitHub:

```bash
$ git add .
$ git commit -m'Completed all challenges'
$ git push
```

Then, submit your assignment using [Gradescope](https://gradescope.com).

## Resources

1. [Processing Request Data in Flask](https://scotch.io/bar-talk/processing-incoming-request-data-in-flask)
1. [Rendering Pages in Flask Using Jinja](https://hackersandslackers.com/flask-jinja-templates/)

<!--
### Animal Facts

First, we'll create a web app that teaches you facts about all of your favorite animals! This will also introduce the concept of **forms** for collecting user data.

Create a route called `choose_animal` with the following contents:

```py
@app.route('/animal')
def choose_animal():
    """Shows a form to collect an animal name."""
    return """
    <form action="/animal_facts/" method="GET">
        Which animal would you like to see facts about?<br/>
        <input type="text" name="animal"><br/>
        <input type="submit" value="Submit!">
    </form>
    """
```

Next, let's create a **dictionary** to store our animal facts in! **Above all of your routes**, create the following **global variable** to hold a dictionary of key-value pairs:

```py
animal_to_fact = {
    'koala': 'The fingerprints of a koala are so indistinguishable from humans that they have on occasion been confused at a crime scene.',
    'otter': 'Sea otters hold hands while they\'re sleeping so they don\'t drift apart.',
    'sloth': 'It takes a sloth two weeks to digest its food.'
}
```

Feel free to add your own animal facts as well! Check out [here](https://www.mentalfloss.com/article/86578/50-incredible-animal-facts-youll-want-share) for more.

Finally, we'll need to create a route to show the results for the user's query. Create a route `show_animal_facts` with the following contents:

```py
@app.route('/animal_facts')
def show_animal_facts():
    """Shows animal facts for a given animal."""
    chosen_animal = request.args.get('animal')
    if chosen_animal in animal_to_fact:
        fact_to_show = animal_to_fact.get(chosen_animal)
        return f'Here is your fact about {chosen_animal}s: {fact_to_show}'
    else:
        return f'Sorry, we don\'t have any facts about {chosen_animal}! Check back later!'
```

Now, test out your routes by entering the name of one of the animals in your dictionary!
-->
