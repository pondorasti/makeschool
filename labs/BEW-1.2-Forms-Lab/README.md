# Lab - Books App Part 2 (Forms)

## Why should I do this?

This lab will guide you through the process of writing and using Flask-WTForms form classes. This makes the process of using forms much more streamlined and "Pythonic", and will result in more robust, error-proof, and readable code. By the end of this lab, you should be ready to independently write and use form classes for your projects. 

## Setup

Clone this repository to your computer. 

**Take a look at the code** - it looks a bit different than what you're used to. Namely, the code is now separated out into several files rather than being written in a single `app.py` file. Since we're now writing model and form code as well as route code, this will help us to maintain some structure and separation.

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

## Part 1: Explore Forms

**Take a look at the `books_app/forms.py` file**, which contains a form we'll use to collect user data on new books. The user can add a book's title, publish date, author, audience, and genres.

**Take a look at the `books_app/routes.py` file**, and see how the `create_book` route is using the `BookForm` class. Namely, we create an instance of `BookForm` and pass it to the template. Then when the form is submitted, we use the data to create a new `Book` object and save it to the database.

Now, **run the server** and test out the routes. See if you can create a few new books. Notably, you'll only be able to select authors that have already been added to the database - but don't worry, we'll be able to add new authors soon!

## Part 2: Books, Authors, & Genres

Test out the `+ New Author` and `+ New Genre` links. It doesn't look like they're working yet! **Modify the code** to add a form to each route:

- In `forms.py`, fill out the `AuthorForm` class with the appropriate fields. You may need to look up how to use the fields - you can use [this guide](http://wtforms.simplecodes.com/docs/0.6/fields.html) as a reference.
- In `routes.py`, complete the TODOs in the `create_author` route to instantiate an `AuthorForm`, send it to the template, and use it to create a new `Author` instance. You can use the `create_book` route as a reference.
- In `templates/create_author.html`, use the `form` object to display its labels and fields. You can use the `create_book.html` template as a reference.

Then, test it out and see if you can create a new author! Once you're satisfied with your understanding, complete the same steps for `Genre`.

However, what if we want to _modify_ a book (or author/genre) after it's created? We can use the same `BookForm` to do that, too! Complete the TODOs in the `book_detail` route to update the `Book` object once the form is submitted.

## Part 3 (Stretch): Users

Now you're really getting the hang of using forms! If you've made it this far, here are some stretch challenges:

1. Make a `create_user` route that uses a `UserForm` class to add new users to the database.
1. In the `profile` route, allow a user to update their information, such as username and favorite books. (We don't have any authentication yet, so that means that anyone can update any user's profile.)
1. Come up with your own ideas for new features and then implement them!

## Resources

If you'd like more resources on working with Flask-WTForms, check out the following:

- [WTForms QuickStart](https://flask-wtf.readthedocs.io/en/stable/quickstart.html) - Enough to get you started.
- [Intro to Flask-WTForms [VIDEO]](https://www.youtube.com/watch?v=vzaXBm-ZVOQ) A simple introduction to get started with the basics
- [WTForms Fields](http://wtforms.simplecodes.com/docs/0.6/fields.html) - All of the possible fields.
- [WTForms Validators](https://wtforms.readthedocs.io/en/2.3.x/validators/)