# Lab - Books App Part 3 (Authentication)

## Why should I do this?

This lab will guide you through the process of adding authentication - that is, fully functional login, signup, & logout routes - to your Flask application. By the end of this lab, you should be ready to use the Flask-Login library to add user login functionality to your projects. 

## Setup

Clone this repository to your computer. 

**Take a look at the code** - in particular, one notable difference in this lab is that there is no longer one single `routes.py` file - instead, the routes are split into two blueprints, `main/routes.py` and `auth/routes.py`. This allows us to maintain some separation between the routes, and keep all of the authentication related routes in one place. Nifty!

**To run the code**, navigate to the project folder and run the following to install the required packages:

```
pip3 install -r requirements.txt
```

Then, rename the `.env.example` file to `.env`:

```
mv .env.example .env
```

Then you can run the following to run the Flask server:

```
python3 app.py
```

## Part 1: Tutorial Instructions

### Setup Code

In `books_app/extensions.py`, add the following code under the "Authentication" header:

```py
login_manager = LoginManager()
login_manager.login_view = 'auth.login'
login_manager.init_app(app)
```

This will create a login manager and initialize it with our app. We are also telling the login manager where to find the login route, namely that it's inside of the `auth` blueprint and is called `login`.

Below that, add the following code:

```py
from .models import User

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)
```

This tells the login manager how to load a user with a particular id. We're using Flask-SQLAlchemy for this project, but technically, you could use any other database, or even make up your own `User` object!

Finally, let's initialize Bcrypt which we'll use later for hashing passwords:

```py
bcrypt = Bcrypt(app)
```

_Side note: All of the required imports should already be present in the project, but it's still a good idea to run your code as you go along, to make sure you catch any missing imports or syntax errors!_

### Models

In `books_app/models.py`, **update the `User` model so that it inherits from `flask_login.UserMixin`**:

```py
class User(UserMixin, db.Model):
    # ... fields go here
```

This will super-charge our `User` model with all of the functionality it needs to support authentication! To read more about what functionality the `UserMixin` provides, read the documentation [here](https://flask-login.readthedocs.io/en/latest/#your-user-class).

### Forms

In `books_app/auth/forms.py`, let's create a few forms to use for login & signup.

Start by creating the `SignUpForm`:

```py
class SignUpForm(FlaskForm):
    username = StringField('User Name',
        validators=[DataRequired(), Length(min=3, max=50)])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Sign Up')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('That username is taken. Please choose a different one.')
```

Our signup form has only 2 entry fields, `username` and `password`, but we could certainly add more fields if there is any other relevant information we want to store in the `User` object.

Note that we have an extra method, `validate_username`, which makes sure that a new user can't sign up with a username that is already taken. If that happens, we'll display an error and the user can try signing up again.

Now, fill out the `LoginForm`:

```py
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

This form has the same fields as the signup form. This time, we actually need _two_ validators: The first is `validate_username`, which throws an error if the user _doesn't_ exist in the database. This makes sense - you can't log in as a user that doesn't exist yet!

The second validator is how we check that the user's password matches what is listed in the database. Here, we are checking that the user's password matches the password hash we stored in the database. Because we're storing a hash, and not the real password, we need to use the bcrypt `check_password_hash` function to decode it. If the passwords match, then `check_password_hash` returns `True`.

### The Sign Up Route

In `books_app/auth/routes.py`, let's fill out the sign up route:

```py
@auth.route('/signup', methods=['GET', 'POST'])
def signup():
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
        return redirect(url_for('auth.login'))
    return render_template('signup.html', form=form)
```

The first part of this route should look familiar! We are initializing a `SignUpForm` instance, and checking if it was submitted and is valid.

If it is valid, then we:

- Generate a hashed password using the `bcrypt` library - this is very important for website security! **Never store user passwords in plaintext.** Always use a library like `bcrypt` to hash it first.
- Create a new `User` object with the given username and hashed password and committing it to the database
- Flash a success message to the user
- Redirect the user to the login page so that they can log in with their newly created account.

Whew, that was a lot! But we're not done yet, though - we still need to display the signup form to the user.

Fill out the `books_app/templates/signup.html` file with the following form contents:

```html
<form action="/signup" method="POST">
    {{ form.csrf_token }}
    <fieldset>
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
```

This will allow us to display any errors to the user so that they know to try again if their username or password is too long or short, or if their chosen username is taken.

Now that that step is done, be sure to try out the `/signup` URL in your browser! What happens? Do you see your newly created user listed?

### The Login Route

In `books_app/auth/routes.py`, let's fill out the login route so that our users can log in:

```py
@auth.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        login_user(user, remember=True)
        next_page = request.args.get('next')
        return redirect(next_page if next_page else url_for('main.homepage'))
    return render_template('login.html', form=form)
```

Because we did all of the heavy lifting of checking usernames & passwords in the form, here we can work based off of the assumption that the user's password matched and that the user exists in the database. Cool!

Note that here, we're using a `next_page` variable to determine where to send the user to. This is because we may have routes in the future that require the user to be logged in. If the user tries to visit a page while logged out, they will be redirected to the login page. Using the `next` query parameter allows us to send the user back where they wanted to go once they are logged in.

Next, let's fill out the template for the login route. Fill out the `books_app/templates/login.html` file with the following form contents:

```html
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
```

This one is pretty similar to the sign up template. As a stretch challenge, consider putting the form code in a partial template that can be re-used in both the login and signup routes.

Let's also fill out the log out route in `books_app/auth/routes.py`:

```py
@auth.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main.homepage'))
```

Finally, let's add some code to the `base.html` file so that the user can see that they are logged in.

**Modify the `books_app/templates/base.html` file** to add the following just above the `{% block content %}{% endblock %}`:

```html
{% if current_user.is_authenticated %}
<p>You are logged in as {{ current_user.username }}</p>
{% endif %}
```

Now, try out your routes. What happens when you log in? Is anything different?

### Checking the `current_user` Object

Usually, when we implement logins, we also want to hide some information from the user depending on their logged-in status.

Let's start by modifying `templates/base.html` so that it doesn't show so many buttons. It's quite confusing to see a `Log In` button if you are already logged in!

Because we are using the Flask-Login library, it's super easy to check if a user is logged in. We can do so like the following:

```html
{% if current_user.is_authenticated %}
    <!-- stuff you only want to show to logged-in users -->
{% else %}
    <!-- stuff you only want to show to logged-out users -->
{% endif %}
```

**Modify the `base.html` file** so that it only shows the appropriate links to logged-in or logged-out users.

### Protecting Routes

Even though the buttons are hidden, a logged-out user could still go directly to the URLs for (for example) Create Book, Create Author, etc. But we want to restrict these routes to only logged-in users.

We can do this with the `login_required` decorator, which looks like this:

```py
@main.route('/create_book', methods=['GET', 'POST'])
@login_required
def create_book():
```

**In `books_app/main/routes.py`, add `@login_required`** to the routes for Create Book, Create Author, and Create Genre.

## Part 2: Challenge

By now, hopefully you've gotten the hang of using Flask-Login! Let's test your knowledge by completing the `favorite_book` and `unfavorite_book` routes.

First, navigate to `book_detail.html` and complete the TODOs to appropriately display either the "Favorite Book" form or "Unfavorite Book" form to logged-in users.

Then, navigate to `main/routes.py` and complete the TODOs in the `favorite_book` and `unfavorite_book` routes. (No need to complete the other routes.) Make sure to add `@login_required` to these routes, so that only logged-in users can favorite a book.

Make sure to test your work!!


## Resources

If you'd like more resources on working with Flask-Login, check out the following:

- [Intro to Flask-Login [VIDEO]](https://www.youtube.com/watch?v=K0vSCCAM2ss) - an excellent 35 minute walkthrough that gives you the basics.
- [Python Flask Tutorial: User Authentication [VIDEO]](https://www.youtube.com/watch?v=CSHx6eCkmv0)
- [Flask-Login Quickstart](https://flask-login.readthedocs.io/en/latest/)