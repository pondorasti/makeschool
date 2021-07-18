from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, ValidationError
from books_app.models import User

class SignUpForm(FlaskForm):
    # TODO: Fill out the form fields & validators!
    pass


class LoginForm(FlaskForm):
    # TODO: Fill out the form fields & validators!
    pass
