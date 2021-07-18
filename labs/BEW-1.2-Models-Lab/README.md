# Lab - Books App

## Why should I do this?

This lab will guide you through the process of writing SQLAlchemy models and making queries to create, read, and update, and delete data in your database. By the end of this lab, you should be ready to independently write and use model classes for your projects. 

## Setup

Clone this repository to your computer. 

**Take a look at the code** - it looks a bit different than what you're used to. Namely, the code is now separated out into several files rather than being written in a single `app.py` file. Since we're now writing model code as well as route code, this will help us to maintain some structure and separation. (Also, it's really handy to be able to look at your models code side-by-side with your routes code!)

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

## Part 1: Making Queries

Before we start writing our own models, it's a good idea to get the hang of what model classes look like, and how to make queries.

Let's take a look at the models in `books_app/models.py`. There are **three model classes**: `Book`, `Author`, and `Genre`. There's also an instance of `db.Table`, the `book_genre_table`.

The relationships between `Book`, `Author`, and `Genre` are as follows:

![Books ERD](assets/books-erd.png)

**Take a look at the fields within each model class.** There are two types of fields: The first is `db.Column` fields, which correspond to the actual columns within the SQL table. The second is `db.relationship` fields, which are not actual columns in the SQL table; instead these are _shortcuts_ that tell SQLAlchemy to perform a table join. This makes it way easier to get all of the data we want, without having to perform any fancy operations.

**Start up your terminal and navigate to the outer project folder** (the one that contains `app.py`). **Run the Python interpreter** with the command:

```bash
python3
```

You should see a command prompt appear that looks like `>>>`. This means that we are running the interpreter. If you ever want to quit the interpreter, you can press `Ctrl` + `D` or type in `quit()`.

### Retrieving All Objects

First, let's try querying the tables to see what data already exists in the database. Run the following commands:

```
>>> from books_app.models import *
>>> Book.query.all()
[<Book: The Catcher in the Rye>, <Book: Franny and Zooey>, <Book: The Great Gatsby>, <Book: 1984>]
>>> Author.query.all()
[<Author: J. D. Salinger>, <Author: F. Scott Fitzgerald>, <Author: George Orwell>]
>>> Genre.query.all()
[<Genre: Fiction>, <Genre: Science Fiction>, <Genre: Classic>]
```

Now, we have a better picture of what data is already in the database! You'll notice that when we make these queries, though, we don't see every single field in the database objects. That's because, when we print out these objects as strings, Python implicitly calls the object's `__repr__()` method.

**Go to `books_app/models.py` and modify the `__repr__()` method of the Book class to show more information.** Then, restart the Python interpreter (so that it'll grab those changes) and try your queries again.

### Filtering our Queries

Ok, great, now we know how to retrieve all entries in a database table - but how do we retrieve just one? Let's try out a few queries to get the hang of it.

First, let's try querying for the book called "To Kill a Mockingbird":

```
>>> b1 = Book.query.filter_by(title="To Kill a Mockingbird").one()
>>> b1
<Book: To Kill a Mockingbird>
>>> b1.author
<Author: Harper Lee>
>>> b1.audience
Audience.YOUNG_ADULT
```

Notice that `.filter_by()` returns a list of results. Since we are expecting only one result, we can call `.one()` to get it as a single `Book` instance.

Now, let's search for all books written by Harper Lee:

```
>>> a1 = Author.query.filter_by(name="Harper Lee").one()
>>> a1
<Author: Harper Lee>
>>> a1.books
[<Book: To Kill a Mockingbird>, <Book: Go Set a Watchman>]
```

This time, we queried the `Author` table, then looked up the books associated with a specific author. However, we could also achieve the same result with the following:

```
>>> b1.author.books
[<Book: To Kill a Mockingbird>, <Book: Go Set a Watchman>]
```

Before moving on, **check your understanding** by writing queries for the following:

- Get all books that have the audience of `Audience.YOUNG_ADULT`.
- Get all books with the genre with `name='fiction'`. (HINT: Try querying the `genre` table.)
- **Stretch Challenge**: Get all books that were published after 1980. (HINT: Check out [this tutorial](https://www.tutorialspoint.com/sqlalchemy/sqlalchemy_orm_filter_operators.htm) on using filter operations.)

### Creating New Objects

Next up, let's try adding some new `Book` and `Author` entries.

Run the following in the interpreter:

```python
>>> new_author = Author(name="Margaret Atwood")

>>> from datetime import datetime
>>> new_book = Book(title="The Handmaid's Tale", audience=Audience.ADULT, author=new_author)

>>> db.session.add(new_author, new_book)
>>> db.session.commit()
```

Notice the last two lines of our code - `db.session.add()` and `db.session.commit()`. **These are required to commit our changes to the database.** If you forget these steps, then you are just creating instances of `Book` and `Author` which will be garbage-collected when they go out of scope, and the database won't change.

_Aside: Technically, we don't need to add `new_author` in the `db.session.add()` call. Since it is already saved under `new_book.author`, the database will infer that it needs to be added._

To check your understanding, try adding a few more books and authors to the database.

### Updating Objects

Updating objects with SQLAlchemy is very easy! We just need to get the object, modify its fields, and add/commit it to the database.

Let's try adding a genre and publish date to our new book:

```python
>>> b1 = Book.query.filter_by(title="The Handmaid's Tale").one()
>>> b1.publish_date = datetime(1985, 6, 1) # add a publish date
>>> g1 = Genre(name="dystopia")
>>> b1.genres.append(g1) # add the "dystopia" genre
>>> db.session.add(b1)
>>> db.session.commit()
```

Again, it's not necessary to add the `Genre` object `g1` to the db session as it's already included in the `b1` object.

To check your understanding, try updating the books you created earlier.

### Deleting Objects

If you want to try deleting objects, check out [this Stackoverflow post](https://stackoverflow.com/questions/27158573/how-to-delete-a-record-by-id-in-flask-sqlalchemy) for examples of how to do it.

## Part 2: Writing Models

Now that we've gotten the hang of writing queries, let's try out writing a new model class. We'll be writing a model for `User` as well as an extra table `favorite_book_table`. The relationships should look like this:

![Books ERD](assets/books-user-erd.png)

In `books_app/models.py`, **write a model class for the `User` entity**. It should have the following fields:

- **`id`** - the primary key
- **`username`** - a unique identifier for the user. Should be `nullable=False` and `unique=True`
- **`favorite_books`** - this should be a `db.relationship` as it's not a real column in the SQL table. Instead, it signals to SQLAlchemy to perform a table join on the `User` and `Book` tables.

In addition, **create a `db.Table` instance and call it `favorite_book_table`**. It should contain two foreign keys, one each to the `User` and `Book` tables. You can use the `book_genre_table` as an example of how to write it.

## Part 3: More Queries

Now that we have our new models, we can write some queries! **Quit and re-run the Python interpreter** so that it grabs your new changes.

Now, **create at least two instances of `User` and give each user at least two favorite books.** Feel free to reference Part 1 if you need examples of how to do this! Make sure that your changes are actually saved to the database by running another query for all objects of the `User` class.

### Working with Routes

Luckily, querying our SQL data in a Python file is exactly the same as doing so on the command line! Let's test out our skills by adding some features to the Flask application.

**Navigate to `books_app/routes.py` and complete the TODOs for the `homepage()` route.** When you are done, the homepage should display a list of all users, with each user linking to their profile. Make sure you run the Flask application to test it out!

Next, **complete the TODOs for the `profile()` route.** Once this is complete, if you navigate to the page `/profile/user1`, it should show `user1`'s favorite books.

If you have finished all of the steps so far, congratulations - you have mastered the basics of SQLAlchemy!

## Resources

If you'd like more resources on working with SQLAlchemy models, check out the following:

- [SQLAlchemy Relationship Patterns](https://docs.sqlalchemy.org/en/13/orm/basic_relationships.html) - A comprehensive guide on how to construct models with One-to-Many, One-to-One, and Many-to-Many relationships.
- [Declaring Models](https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/) - A shorter, but still useful guide.
- [Filter Operations](https://www.tutorialspoint.com/sqlalchemy/sqlalchemy_orm_filter_operators.htm)
