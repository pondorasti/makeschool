"""Import packages and modules."""
from flask import Blueprint, request, render_template, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user
from datetime import date, datetime
from books_app.models import Book, Author, Genre, User
from books_app.main.forms import BookForm, AuthorForm, GenreForm

# Import app and db from events_app package so that we can run app
from books_app.extensions import app, bcrypt, db

main = Blueprint("main", __name__)

##########################################
#           Routes                       #
##########################################

@main.route('/')
def homepage():
    all_books = Book.query.all()
    all_users = User.query.all()
    return render_template('home.html', 
        all_books=all_books, all_users=all_users)


@main.route('/create_book', methods=['GET', 'POST'])
def create_book():
    form = BookForm()

    # if form was submitted and contained no errors
    if form.validate_on_submit(): 
        new_book = Book(
            title=form.title.data,
            publish_date=form.publish_date.data,
            author=form.author.data,
            audience=form.audience.data,
            genres=form.genres.data
        )
        db.session.add(new_book)
        db.session.commit()

        flash('New book was created successfully.')
        return redirect(url_for('main.book_detail', book_id=new_book.id))
    return render_template('create_book.html', form=form)


@main.route('/create_author', methods=['GET', 'POST'])
def create_author():
    # TODO: Make an AuthorForm instance

    # TODO: If the form was submitted and is valid, create a new Author object
    # and save to the database, then flash a success message to the user and
    # redirect to the homepage

    # TODO: Send the form object to the template, and use it to render the form
    # fields
    return render_template('create_author.html')


@main.route('/create_genre', methods=['GET', 'POST'])
def create_genre():
    # TODO: Make a GenreForm instance

    # TODO: If the form was submitted and is valid, create a new Genre object
    # and save to the database, then flash a success message to the user and
    # redirect to the homepage

    # TODO: Send the form object to the template, and use it to render the form
    # fields
    return render_template('create_genre.html')


@main.route('/book/<book_id>', methods=['GET', 'POST'])
def book_detail(book_id):
    book = Book.query.get(book_id)
    form = BookForm(obj=book)

    # TODO: If the form was submitted and is valid, update the fields in the 
    # Book object and save to the database, then flash a success message to the 
    # user and redirect to the book detail page

    return render_template('book_detail.html', book=book, form=form)


@main.route('/profile/<username>')
def profile(username):
    # TODO: Make a query for the user with the given username, and send to the
    # template

    # STRETCH CHALLENGE: Add ability to modify a user's username or favorite 
    # books
    return render_template('profile.html', username=username)


# TODO: Add `@login_required`
@main.route('/favorite/<book_id>', methods=['POST'])
def favorite_book(book_id):
    book = Book.query.get(book_id)
    # TODO: If the book is not already in user's favorites, then add it,
    # commit the change to the database, and flash a success message.

    # Then, redirect the user to the book detail page for the given book.
    return "Not yet implemented!"


# TODO: Add `@login_required`
@main.route('/unfavorite/<book_id>', methods=['POST'])
def unfavorite_book(book_id):
    # TODO: If the book is in user's favorites, then remove it,
    # commit the change to the database, and flash a success message.

    # Then, redirect the user to the book detail page for the given book.
    return "Not yet implemented!"
