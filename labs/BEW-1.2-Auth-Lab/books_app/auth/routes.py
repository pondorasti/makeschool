from flask import Blueprint, request, render_template, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user

from books_app.models import Book, Author, Genre, User
from books_app.auth.forms import SignUpForm, LoginForm

# Import app and db from events_app package so that we can run app
from books_app.extensions import app, db, bcrypt

auth = Blueprint("auth", __name__)

@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    # TODO: Fill out this route!
    pass


@auth.route('/login', methods=['GET', 'POST'])
def login():
    # TODO: Fill out this route!
    pass

@auth.route('/logout')
def logout():
    # TODO: Fill out this route!
    pass