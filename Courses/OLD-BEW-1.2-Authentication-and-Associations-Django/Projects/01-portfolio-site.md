# Homework 1 (Request/Response): Portfolio Site

## Purpose (Why should I do this?)

This assignment is designed for you to practice starting a project and connecting URLs & Views. This is _critically_ important for you to understand as you start your Django journey, because _every Django project you ever build_ will have these! By the end of this assignment, you should be able to quickly create a project, add apps, and set up a Request/Response cycle using URLs & Views.

Total Points: `60`

## Instructions

#### Getting Started

In your projects directory, create a new Django project called `portfolio_site`. Then, navigate into your brand new project folder (note: this is the **root folder**). Before making any code changes, run `git init` to initialize a Git repository _inside of your root folder_. This is how it's typically done in a Django application (instead of having another enclosing folder).

Start a new app called `portfolio`.

Open your project's folder in a code editor and take a look at its file contents. You should have a file tree that looks like:

```
portfolio-site/
  portfolio-site/
    settings.py
    urls.py
    wsgi.py
  portfolio/
    admin.py
    apps.py
    models.py
    views.py
  manage.py
  .git/
```

_Note: You may not see the `.git` folder unless you run `ls -a`._

The **outer `portfolio_site` folder** is called the **root folder**. It contains a file called `manage.py` as well as all of your app folders.

The **inner `portfolio_site` folder** is called the **project folder**. It contains your project's **root URL configuration**, as well as some important settings.

Open up `portfolio_site/settings.py` and add your `portfolio` app to the `INSTALLED_APPS` list.

#### Root & App URLs  _(5 Points)_ 

Open up the `portfolio_site/urls.py` file and create a URL entry to re-route _all_ web requests (hint: use the empty string `''`) to your portfolio app's URLs file.

Create a `urls.py` file inside of the `portfolio` app directory. Add a URL entry to send web requests for the homepage `''` to a view called `home`.

_HINT: For these tasks, take a look at the instructions that are included in your root URLs file._

For more information about URLs, read [here](https://docs.djangoproject.com/en/3.0/ref/urls/).

#### Views  _(10 Points)_ 

Open up the `portfolio/views.py` file and create a view function called `home` that returns an HttpResponse with the text "Portfolio Home".

Repeat the steps above to create a URL for `contact/` and view function called `contact` (still within the `portfolio` app) for another page that displays the text "Contact Me".

Make sure you test out these URLs in your browser to ensure that they work.

#### Say Hello _(10 Points)_

Next, you've decided that you want to personalize your portfolio site to be more welcoming to the person visiting your site, and you want to greet them by name. In `portfolio/urls.py`, create a URL entry that accepts a "name" parameter, like so:

```py
urlpatterns = [
  # ...
  path('greet/<str:name>/', views.greet_by_name),
]
```

Then, create a view function that accepts this "name" parameter, and have it return a string based on the name entered:

```py
def greet_by_name(request, name):
  # TODO: Return an HttpResponse that contains a string that includes the given name
```

Now try it out in your browser!

#### Another App  _(10 Points)_ 

In your project root folder, start another app called `messageboard` and add it to your installed apps. Modify the `portfolio_site/urls.py` file to re-route _all_ web traffic starting with `'messages'` to the message board's URLs file.

In your `messageboard` app, create a URL and view function called `home` for the URL `''` to display the text "Welcome to the message board!".

## Stretch Challenges

#### Render to a Template

Refactor your apps above to _render to a template_ instead of simply returning an HttpResponse. Check out the [render shortcut documentation](https://docs.djangoproject.com/en/3.0/topics/http/shortcuts/) for more info on how to do that.

## Discussion Questions

In your project's root folder, create a file called `README.md`. In it, answer the following discussion questions:

1. _**(5 Points)**_ How is this project structure different than a Flask (or Node) application? What role are the `urls.py` and `views.py` files responsible for?

1. _**(5 Points)**_ Why do we use 2 separate `urls.py` files? How do they interact?

1. _**(5 Points)**_ When is it desirable to split our code over multiple apps? Why would we want to do so?


## Submission

Submit your finished homework using our [class submission site](https://gradescope.com).

## Resources

1. [Writing your first Django app, part 1 - Request/Response](https://docs.djangoproject.com/en/3.0/intro/tutorial01/)