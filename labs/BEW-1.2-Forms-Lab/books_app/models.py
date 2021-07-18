"""Create database models to represent tables."""
from books_app.extensions import db
from sqlalchemy.orm import backref
import enum

class FormEnum(enum.Enum):
    """Helper class to make it easier to use enums with forms."""
    @classmethod
    def choices(cls):
        return [(choice.name, choice) for choice in cls]

    def __str__(self):
        return str(self.value)

class Audience(FormEnum):
    CHILDREN = 'Children'
    YOUNG_ADULT = 'Young Adult'
    ADULT = 'Adult'
    ALL = 'All'

class Book(db.Model):
    """Book model."""
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    publish_date = db.Column(db.Date)

    # The author - Who wrote it?
    author_id = db.Column(db.Integer, db.ForeignKey('author.id'), nullable=False)
    author = db.relationship('Author', back_populates='books')
    
    # The audience - Who is this book written for?
    audience = db.Column(db.Enum(Audience), default=Audience.ALL)

    # The genres, e.g. fiction, sci-fi, fantasy
    genres = db.relationship(
        'Genre', secondary='book_genre', back_populates='books')

    # Who favorited this book?
    users_who_favorited = db.relationship(
        'User', secondary='user_book', back_populates='favorite_books')

    def __str__(self):
        return f'<Book: {self.title}>'

    def __repr__(self):
        return f'<Book: {self.title}>'

class Author(db.Model):
    """Author model."""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    biography = db.Column(db.String(200))
    books = db.relationship('Book', back_populates='author')

    def __str__(self):
        return f'<Author: {self.name}>'

    def __repr__(self):
        return f'<Author: {self.name}>'

class Genre(db.Model):
    """Genre model."""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False, unique=True)
    books = db.relationship(
        'Book', secondary='book_genre', back_populates='genres')

    def __str__(self):
        return f'<Genre: {self.name}>'

    def __repr__(self):
        return f'<Genre: {self.name}>'

book_genre_table = db.Table('book_genre',
    db.Column('book_id', db.Integer, db.ForeignKey('book.id')),
    db.Column('genre_id', db.Integer, db.ForeignKey('genre.id'))
)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), nullable=False, unique=True)
    favorite_books = db.relationship(
        'Book', secondary='user_book', back_populates='users_who_favorited')

favorite_books_table = db.Table('user_book',
    db.Column('book_id', db.Integer, db.ForeignKey('book.id')),
    db.Column('user_id', db.Integer, db.ForeignKey('user.id'))
)
