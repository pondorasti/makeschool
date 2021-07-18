# Homework 2: 📚 Books Site 

## Purpose (Why should I do this?)

This assignment is designed for you to practice creating models and relating them using one-to-many and many-to-many relationships.

Scoring is as follows:

| Criteria                                       | Possible  |
| ---------------------------------------------- | :-------: |
| Create Book Model |    `10`    |
| Create Author Model |   `10`    |
| Relate Book & Author Models |    `10`    |
| Create Tag Model |   `10`    |
| Filter Books |    `10`    |
| Create Book List View |   `10`    |
| Create Book Detail View |    `10`    |
| **TOTAL**                                  | **`70`** |

## Instructions - Part 1: Creating your Models

Start a Django project called `books_site`. In it, create an app `books`. Make sure you add `books` to your project's `INSTALLED_APPS`.

#### Create Book Model _(10 Points)_

In `books/models.py`, create a model called `Book` and give it the following fields:

- `title`: Should be a `CharField`
- `num_pages`: Should be an `IntegerField`
- `date_published`: Should be a `DateField`

Make sure you add a method `__str__` to your model that returns the book's title.

Run `python3 manage.py makemigrations` and `python3 manage.py migrate` to migrate your shiny new model.

In the Django shell, create a new `Book` instance for your favorite novel:

```py
>>> from books.models import *
>>> book1 = Book(title='Harry Potter', num_pages=300, date_published='1997-06-26')
>>> book1.save()
```

Create at least 2 more books in the same way as above.

Then, do a database query to check that your books were created:

```py
>>> all_books = Book.objects.all()
>>> all_books
```

Pretty cool!

#### Create Author Model _(10 Points)_ 

Create another model called `Author` that has the following fields:

- `name`: Should be a `CharField`
- `birth_date`: Should be a `DateField`

Make sure you add a method `__str__` to your model that returns the author's name.

Migrate your models again, and create a few `Author` objects in your database. Here is an example of one:

```py
>>> author1 = Author(name='J.K. Rowling', birth_date='1965-07-31')
>>> author1.save()
```

#### Relate Book & Author Models _(10 Points)_ 

Now, add another field to your `Book` model for the author. This should be a `ForeignKey` field and should reference the `Author` model class.

In the field definition, specify `null=True` so that our previous `Book` instances (which don't have authors) are still valid.

Migrate your models, and make sure you don't get any errors. Then, modify the previous `Book` model instances to include their author.

Here is an example of how to do that:

```py
# Retrieve the object from the database
>>> book1 = Book.objects.get(title='Harry Potter')

>>> author1 = Author.objects.get(name='J.K. Rowling')

>>> book1.author = author1
>>> book1.save()
```

#### Create Tag Model _(10 Points)_ 

Create another model called `Tag`. A tag should only have a single field, `name`, that specifies the name of the tag. A tag represents some characteristic of a book - e.g. "fiction", "nonfiction", "young adult", "fantasy", etc. A book can have multiple tags, and a tag can apply to multiple books, so this is a **many-to-many relationship**.

In your `Book` model, create another field called `tags` that is a `ManyToManyField`. You **don't** need a `Through` relationship for this one.

Migrate your models again. Create some `Tag`s in the database, then add some tags to one of your `Book` objects:

```py
>>> tag1 = Tag.objects.create(name='Fantasy')
>>> book1 = Book.objects.get(title='Harry Potter')

>>> book1.tags.add(tag1)
>>> book1.save()
```

#### Filter Books _(10 Points)_ 

Next, let's try filtering our books.

To filter by a specific author, we can use a filter like this:

```py
>>> book_list = Book.objects.filter(author__name='J.K. Rowling')
>>> book_list
```

This should print all of the books in your list written by J.K. Rowling. The double-underscore in `author__name` acts the same as `author.name` would in normal Python code.

Create a file in your project's root folder called `README.md`. In it, answer the following questions:

1. How would we filter for all books with titles containing the word 'Django'?
1. How would we filter for all books with tag 'Fiction'?
1. How would we filter for all _authors_ who have _written_ books containing the word 'Django'? **HINT:** We can use the `book` field to refer to an author's books, even though the `Author` model doesn't explicitly contain it!

## Instructions - Part 2: Views

Now, let's display this data in our app!


#### Create Book List View _(10 Points)_ 

In `books_site/urls.py`, create a URL entry to re-route _all_ web requests (hint: use the empty string `''`) to your book app's URLs file. 

Create a `books/urls.py` file and in it, create a URL entry for the homepage URL `''` and connect it to a view called `home`.

In `books/views.py`, create a view function `home`. This home view should display all books in the database in a list. This time, instead of just returning a string, we are going to call `render` to render from a template.

Read the documentation on the [render function](https://docs.djangoproject.com/en/3.0/intro/tutorial03/#a-shortcut-render) and try writing a view function that renders a template called `home.html`. In the context variable, you should pass a list of all `Book` objects.

Then, take a look at the solution below:

```py
from django.shortcuts import render
from .models import Book

def home(request):
  context = {
    'books': Book.objects.all()
  }
  return render(request, 'home.html', context)
```

Next, create a new folder in `books` called `templates`. In it, make a file `home.html` to display your data:

```html
<h1>All Books</h1>

<ul>
  {% for book in books %}
    <li>
      <a href="/book/{{ book.id }}">{{ book.title }}</a>
    </li>
  {% endfor %}
</ul>
```

Run your server, and check that everything works! When you load `localhost:8000` in your browser, you should see the list of books!

What happens when you click on a specific book's title? You should get "Page Not Found"!

#### Create Book Detail View _(10 Points)_ 

Next, let's make a detail page to display each book. In your `books/urls.py` file, create another URL entry for `book/<int:book_id>/` and connect it to a view function called `detail`.

The `detail` view function should take in the `request` object and the `book_id` parameter. It should construct a context variable that includes the specific book that has that given id, then render a template `detail.html`.

Try writing this on your own, then take a look at the solution:

```py
def detail(request, book_id):
  context = {
    'book': Book.objects.get(id=book_id)
  }
  return render(request, 'detail.html', context)
```

Now, create a template in `books/templates` called `detail.html` that displays information about the book: its title, number of pages, publish date, author, author's birth date, and tags.

When you are finished, your detail page should look like this:

<img src="Projects/Assets/books-site-detail.png" width="300">

## Submission

Submit your finished homework using our [class submission site](https://gradescope.com).

## Resources

1. [Django Models](https://docs.djangoproject.com/en/3.0/topics/db/models/)
1. [Model Field Reference](https://docs.djangoproject.com/en/3.0/ref/models/fields/)
1. [Making Queries](https://docs.djangoproject.com/en/3.0/topics/db/queries/)

📕 📙 📒 📗 📘