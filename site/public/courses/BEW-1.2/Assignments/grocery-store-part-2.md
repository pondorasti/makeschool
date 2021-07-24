# Homework 4: Grocery Store Site Part 2

## Purpose (Why should I do this?)

This project will allow you to practice adding authentication & authorization to an existing website using the Flask-Login library. After this assignment, you should be able to integrate sign-up & login functionality into your Flask projects!

If you have trouble with this assignment, I would highly recommend completing the [SQLAlchemy Auth Lab (Books)](https://github.com/Make-School-Labs/BEW-1.2-Auth-Lab) which will guide you through step-by-step in adding login & sign-up to an existing website.

Scoring for this project is as follows:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Less than two of the form routes are completed, or form routes are not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | The auth routes (login and signup) are completed and functional, but other routes contain errors. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | (Almost) all routes are functional and produce the expected result. Minor errors may be present. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | All routes are functional and produce the expected result. Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |

## Setup

For this project, you will be using the [Homework 3 starter code](https://github.com/Make-School-Labs/BEW-1.2-Forms-Homework). Please modify your existing submission to add functionality. You may choose to make a copy of your submission for this assignment.

## Instructions

The client for the grocery tracker app said that they loved your work!! However, they really want to add a feature to keep track of which users create the `GroceryStore` and `GroceryItem` entities, so that they can reward their top contributors. They also want to allow users to add items to a shopping list to make it easier to remember what they want to buy. 

In this assignment, you'll be adding login & signup to your application to support these features.

### Adding Users

**In the `grocery_app/models.py` file, add a new class `User` which inherits from `db.Model`.** Your model will need to have at least the following fields:

- id (the primary key)
- username
- password

Also, let's add a `created_by` field to each of the `GroceryStore` and `GroceryItem` models so that we can see who added them to the website. To do this, we'll need to add both a Foreign Key column (to store the user's id), _and_ a relationship (to store the `User` object itself):

```py
created_by_id = db.Column(db.Integer, db.ForeignKey('user.id'))
created_by = db.relationship('User')
```

Once you make this change, try re-running your server and see if your code still works. If not, you may need to delete the `database.db` file and try again (you will need to enter new dummy data, as this will delete your data as well).

### Setting Up flask_login

In `grocery_app/__init__.py`:

- Create a `flask_login.LoginManager` instance
- Set the login view to `auth.login`
- Initialize it with the app

Then, define a `load_user` function which will look up a user by ID, and give it the `@login_manager.user_loader` decorator.

Finally, initialize an instance of `flask_bcrypt.Bcrypt` with the app.

## Adding forms

In `grocery_app/forms.py`, add form classes for the `LoginForm` and `SignUpForm`. **You can copy these from the lab activity instructions, as they will be pretty much the same.** 

For reference, here is the code (you'll need to add the imports):

```py
# forms.py

class SignUpForm(FlaskForm):
    username = StringField('User Name',
        validators=[DataRequired(), Length(min=3, max=50)])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Sign Up')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('That username is taken. Please choose a different one.')

class LoginForm(FlaskForm):
    username = StringField('User Name',
        validators=[DataRequired(), Length(min=3, max=50)])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Log In')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if not user:
            raise ValidationError('No user with that username. Please try again.')

    def validate_password(self, password):
        user = User.query.filter_by(username=self.username.data).first()
        if user and not bcrypt.check_password_hash(
                user.password, password.data):
            raise ValidationError('Password doesn\'t match. Please try again.')
```

## Adding Routes

In `grocery_app/routes.py`, add a new blueprint for auth related routes and call it `"auth"`. We'll use it to define the routes for login & signup.

Then, go to `grocery_app/__init__.py` and register the new blueprint.

_Stretch Challenge: Alternately, you can refactor the code to contain multiple `routes.py` files, one for each blueprint - but it's not necessary._

Next, add routes for `login`, `signup`, & `logout`, as well as the associated templates. **You can copy these from the lab activity instructions, as they will be pretty much the same.**

For reference, here is the code:

```py
# routes.py

auth = Blueprint("auth", __name__)

@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    print('in signup')
    form = SignUpForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(
            username=form.username.data,
            password=hashed_password
        )
        db.session.add(user)
        db.session.commit()
        flash('Account Created.')
        print('created')
        return redirect(url_for('auth.login'))
    print(form.errors)
    return render_template('signup.html', form=form)


@auth.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        login_user(user, remember=True)
        next_page = request.args.get('next')
        return redirect(next_page if next_page else url_for('main.homepage'))
    return render_template('login.html', form=form)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('main.homepage'))
```

Here is the code for `signup.html` - the code for `login.html` is almost identical, so you can use this as a reference for both:

```html
<!-- login.html -->
{% extends 'base.html' %}
{% block content %}

<h1>Log In</h1>

<form action="/login" method="POST">
    {{ form.csrf_token }}
    <fieldset>
        <legend>Enter your credentials</legend>

        {{ form.username.label }}
        {{ form.username }}
        <ul>
        {% for error in form.username.errors %}
            <li class="error">{{ error }}</li>
        {% endfor %}
        </ul>

        {{ form.password.label }}
        {{ form.password }}
        <ul>
        {% for error in form.password.errors %}
            <li class="error">{{ error }}</li>
        {% endfor %}
        </ul>

        {{ form.submit }}
    </fieldset>
</form>

{% endblock %}
```

Now that we've got those routes set up, **add some more buttons to `grocery_app/templates/base.html` for login, signup, logout.** The login & signup buttons should only appear for logged-out users, and the logout button should only appear for logged-in users. Make sure to test out the entire flow to verify that it works!

### Restricting Routes & Adding created_by

Cool, now our users can log in! Next up, we only want to allow logged-in users to submit new `GroceryStore` and `GroceryItem` entries.

**Add the `@login_required` decorator to the routes for `new_store`, `new_item`, `store_detail`, and `item_detail`** so that only logged-in users can access those pages.

Now, we also want to add a `created_by` to the new instances of `GroceryStore` and `GroceryItem`. **Modify the routes for `new_store` and `new_item` so that they add the `flask_login.current_user` object as the creator of each new instance.** If an instance is edited, it shouldn't change who created it.

Then, **modify the templates for `store_detail.html` and `item_detail.html` so that they display the username of the user who created them.**

### Adding a Shopping List Feature

Our website is almost done! We just need to add the shopping list feature.

#### Models

**In `grocery_app/models.py`, add a many-to-many relationship between `User` and `GroceryItem` for the shopping list items.**

In the `User` model, it should look something like this:

```py
class User(UserMixin, db.Model):
    # ...
    shopping_list_items = db.relationship(...)
```

You'll also need to add a bridge table `shopping_list_table` which contains two foreign keys to `User` and `GroceryItem`.

#### Routes

**In the `item_detail` route, add a button to add the item to the user's shopping list.** This button should make a POST request to a route `add_to_shopping_list` and should pass the item's id.

The function signature for the route should look like this:

```py
@main.route('/add_to_shopping_list/<item_id>', methods=['POST'])
def add_to_shopping_list(item_id):
    # ... adds item to current_user's shopping list
```

Now, we just need a way for a user to see what is on their shopping list!

**Add a route `shopping_list` which displays in a template all of the user's shopping list items.** Make sure to use the `@login_required` decorator so that only logged-in users can see it!

The route should look like this:

```py
@main.route('/shopping_list')
@login_required
def shopping_list():
    # ... get logged in user's shopping list items ...
    # ... display shopping list items in a template ...
```

Finally, add a link to `base.html` to the shopping list page so that the user can access it.

_**Stretch Challenge**: Add a "delete" button to each shopping list item on the page, to remove it from the user's shopping list._

Woo-hoo, your site is done! Make sure to test all of your code at this point to make sure it works!

## Submission

Submit your work on [Gradescope](https://gradescope.com).
