# Homework 1: Request/Response

## Purpose (Why should I do this?)

Understanding the Request/Response Cycle is critical to being able to design and implement projects on the Web. In this project, you will practice implementing Flask routes to strengthen your understanding of Request/Response.

Scoring for this project is as follows:

| Score | Rating | Program Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Required sections of submission are largely missing or not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Most routes are functional, but a few may be hard-coded or incorrect. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | All routes are functional and produce the expected result. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |

## Getting Started

If you haven't yet, create a folder to contain your work for this course. If you put it in the `/dev/courses` folder, then the full path would be something like `/dev/courses/web1.1`.

In a terminal window, navigate to your newly created folder and clone the [starter code](https://github.com/Make-School-Labs/WEB-1.1-Homework-1-Starter):

```
$ git clone git@github.com:Make-School-Labs/WEB-1.1-Homework-1-Starter.git Homework-1-Request-Response
```

Next, go to [GitHub.com](https://github.com) and create a new repository for your project. **IMPORTANT: Make sure the box for "Initialize with a README" is NOT checked**. Then, run the following commands to push your starter code to GitHub:

```
$ git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
$ git push -u origin master
```

Refresh the page in your newly-created GitHub repo to make sure your changes were successfully pushed.

Finally, make sure you have installed Flask:

```
$ pip3 install flask
```

## Instructions - Core Challenges

### Hello, World! _(Tutorial)_

Programmers often refer to a "Hello World" project as a _proof-of-concept_ of a new skill (or language, framework, etc) they are learning. It is a project that is so simple, all it does is say hello to the user! Writing "Hello World" projects is a very useful first step in learning to code. Think of it like buying a pair of running shoes, putting them on your feet, going outside, and taking your first step!

Let's create a Hello World project together. Open up your newly created `app.py` file, using your favorite text editor (we recommend VSCode). In it, add the following two lines of code:

```py
from flask import Flask

app = Flask(__name__)
```

These two lines of code accomplish the following:
- Import the Flask library
- Set up our `app` variable so that we can start writing routes.

Now, _below_ the first two lines, add the following lines of code to hear a very special message from our Make School mascot:

```py
@app.route('/')
def homepage():
    """Shows a greeting to the user."""
    return 'Are you there, world? It\'s me, Ducky!'
```

These lines of code accomplish the following:
- The first line, `@app.route('/')`, indicates the URL of the web page we'll need to visit in order to see our result. In this case, it's `/` or the home page.
- The second line, `def homepage():`, defines the **route function**. Whatever this function _returns_ will show up in your browser when you visit the appropriate URL!
- The third line is called a **docstring**, and describes the route in a human-readable way. It's completely optional -- try removing it!
- The fourth line _returns_ the page contents.

We're almost there -- we just need to tell Python how to run our server! To the _very bottom_ of `app.py`, add the following two lines of code:

```py
if __name__ == '__main__':
    app.run(debug=True)
```

Now we're ready to run the code! Open up your terminal, in your project folder, and type the following:

```
$ python3 app.py
```

You should see something like this in your Terminal output:

```
 * Serving Flask app "homework-1" (lazy loading)
 * Environment: development
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 246-619-731
```

Go to the URL [http://localhost:5000](http://localhost:5000) and check out your cool new webpage!!


### Your User's Favorite Animal _(Tutorial)_

Writing a website isn't just about showing off your own interests - it's also about keeping your users happy! Let's make a route where the _user_ can type in their favorite animal - regardless of what it might be - and get a response.

For this, we'll have to use a **route variable**. In your `app.py` file, add the following:

```py
@app.route('/animal/<users_animal>')
def favorite_animal(users_animal):
    """Display a message to the user that changes based on their favorite animal."""
    return f'Wow, {users_animal} is my favorite animal, too!'
```

These lines of code accomplish the following:
- The first line again indicates the URL of the web page we'll need to visit. The angle brackets, `<` and `>`, denote a **route variable** for which the user can type _anything at all_! The value of whatever the user types into the URL will be available in a variable called `users_animal`.
- The second line is the function signature for the route function. It takes in the variable `users_animal`.
- The fourth line returns the result, to be shown on the web page. Note how it uses the variable `users_animal` to construct a response.

Now, try it out! Try typing `localhost:5000/animal/zebra` into your browser and see what happens! You should see a message like the following:

```
Wow, zebra is my favorite animal, too!
```

### Your User's Favorite Dessert

Now that we've gotten the hang of route variables, let's try another. Write a route `favorite_dessert` for the URL `/dessert/<users_dessert>`. If I visit the URL `/dessert/donuts`, I should see the text: `How did you know I liked donuts?`

### Mad Libs

Write a route for the URL `/madlibs/<adjective>/<noun>` which takes in 2 strings and displays a funny (but work-appropriate) story using them!

### Multiply 2 Numbers

Next, let's try a more challenging one. Write a route `multiply` that takes in 2 numbers, multiplies them, and displays the results. It should use the URL `/multiply/<number1>/<number2>`, then take in `number1` and `number2` as parameters.

Write the rest of the route function, as follows:
- If I go to the URL `/multiply/5/7`, I should see the result: `5 times 7 is 35`.
- If I go to the URL `/multiply/hello/world`, I should see the result: `Invalid inputs. Please try again by entering 2 numbers!`

**HINT 1**: We can check whether a particular string contains only numbers by using the [isdigit()](https://www.w3schools.com/python/ref_string_isdigit.asp) method, which returns a boolean (`True` or `False`).

**HINT 2**: All route variables are of type `string`, which means you'll need to cast them as integers in order to do the multiplication. You can do so using the built-in [int()](https://www.freecodecamp.org/news/how-to-convert-strings-into-integers-in-python/) method.

### Say N Times

Write a route, `sayntimes`, that will repeat a string a given number of times. It should use the URL `/sayntimes/<word>/<n>`. For example:

- If I go to the URL `/sayntimes/hello/6`, I should see the result: `hello hello hello hello hello hello`
- If I go to the URL `/sayntimes/world/3`, I should see the result: `world world world`
- If I go to the URL `/sayntimes/hello/world`, I should see the result: `Invalid input. Please try again by entering a word and a number!`

**HINT**: Use a for loop to add up lots of small strings into one large string!

Try out your route in the browser! What happens when you use a very large number (e.g. `1000000`)?

### Dice Game

Write a route `dicegame` that chooses a random number from 1 to 6. If the user rolls a 6, they win the game; otherwise, they lose.

- If I go to the URL `/dicegame`, I should see a result like: `You rolled a 2. You lost!`
- If I go to the URL `/dicegame` again, I should see a result like: `You rolled a 6. You won!`
- If I go to the URL `/dicegame` again, I should see a result like: `You rolled a 5. You lost!`

**HINT**: You can use the Python `random` library method [randint()](https://www.w3schools.com/python/ref_random_randint.asp) to generate a random number from 1 to 6.

## Testing

To test the correctness of your code, first make sure you've installed pytest:

```bash
$ pip3 install pytest
```

Then, run the tests:

```bash
$ pytest
```

If you'd like to run just a single test, you can run:

```bash
$ pytest -k 'test_dicegame'
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

1. [Flask Quick Start Guide](https://flask.palletsprojects.com/en/1.1.x/quickstart/)

