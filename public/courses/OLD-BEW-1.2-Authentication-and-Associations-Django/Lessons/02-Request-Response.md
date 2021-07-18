# Day 2: Request-Response

[Watch the Recording!](https://zoom.us/rec/share/-OpoIZ_86EZJbZWU8E3YVrIlPJzoaaa80HQa86BbxRwU14ZlhG7atisDtsTLRkfB?startTime=1585863150000)

## Agenda

1. Warm-Up (5 minutes)
1. Tutorial Review (15 minutes)
1. Request/Response Practice (15 minutes)
1. Activity: Request/Response Practice (20 minutes)
1. BREAK
1. Django Request/Response (20 minutes)
1. Tutorial Time (25 minutes)
1. Wrap-Up (5 minutes)
1. Resources & Credits

## Learning Objectives

By the end of this class, you will be able to...

1. Create a Django project, from scratch, containing URLs and Views that together form a route.
1. Describe the relationships between URLs, Views, Templates, & Models.

## Warm-Up

With a group of 3, answer the following question:

_What are your best tips for staying productive and motivated while working virtually?_

## Tutorial Review (15 minutes)

Review the first portion of the Django tutorial together.

As we review, be sure to compare/contrast Django syntax with what you've seen before in Flask.

## Practice - I Do, We Do, You Do (15 minutes)

Watch as the instructor starts a new project using the techniques from the tutorial.

Then, tell the instructor what to do to accomplish the same task.

## Activity: Request/Response Practice (20 minutes)

Choose pairs randomly. With your partner, decide who will be the **driver** and who will be the **navigator**. The **driver** should share their screen and type in the code; the **navigator** should give them instructions.

1. Create a project called 'music_site' that contains an app called 'music'.
1. Re-route _all_ web requests (hint: use the empty string `''`) to your music app's URLs file. Then, send any web requests for the homepage `''` to a view called `home`.
1. Create a view function `home` that returns an HttpResponse with the text "Hello World! You're at the Music App home page."

After you finish and test out your site in the browser, switch partners and repeat.

## Break (10 minutes)

## Django Request/Response (20 minutes)

Django heavily utilizes what we would call **separation of concerns**. That means that pieces of code that have different responsibilities are put in different places.

In Flask, we wrote routes that look like this:

```py
@app.route('/about-me')
def about():
  return "<p>Hello! This is an about page!</p>"
```

- The first line of code above is the **URL configuration**. It tells the server that when the user visits the url `/about-me`, it should run the `about` function and return its result as a response.
- The second and third lines of code are the **view**. It describes the function that is referenced by the URL configuration.

In Django, these two separate concerns would be placed in two separate files, `urls.py` and `views.py`:

```py
# urls.py
from django.urls import path
from . import views

urlpatterns = [
  path('about-me/', views.about)
]
```

There are a few things you'll notice about this code:

1. We are importing and using a function called `path` that constructs the URL. `path` takes two arguments: The first is the **URL**, which always should end in a `/`. This is what the user would type into their browser. The second is the **view function** that should be run for this URL.
1. Because our views are located in a separate file, we need to import them. `from . import views` means "Look in the same folder as urls.py, find a file called views, and import its contents."
1. We are creating an **array of URL configurations** called `urlpatterns`. This name must match exactly, or Django won't be able to find it.

```py
from django.http import HttpResponse

def about(request):
  return HttpResponse('<p>Hello! This is an about page!</p>)
```

Here, you'll notice that we can't just return a regular string. We need to first wrap it in an `HttpResponse` so that it can be parsed as HTML.

### What about templates?

What's that? You want to display your HTML in a template, you say? Say no more!

In Django we can use the `render` function, which is very similar to Flask's `render_template`.

The `render` function takes in a "context" variable, which is a dictionary containing any key-value pairs we want to send to the template.

```py
from django.shortcuts import render

def about(request):
    context = {
        'favorite_color': 'blue'
    }
    return render(request, 'myapp/about.html', context)
```

This will render the template located in the file `myapp/about.html`, and pass it the `favorite_color` variable which has the value of `blue`.

The relationship between URLs, Views, Templates, & Models looks like this:

<img src="Lessons/Assets/views-urls.png" width="500">

## Tutorial Time (30 Minutes)

Continue to work on the Tutorial Part 2 (Models).

## Wrap-Up (5 minutes)

Finish [Tutorial Part 2 (Models)](https://docs.djangoproject.com/en/2.2/intro/tutorial02/) and [Homework #1 (Portfolio Site)](Projects/01-portfolio-site.md) before the next class session and submit both of those to [Gradescope](https://gradescope.com).

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## Resources & Credits

1. [Django: Writing Views](https://docs.djangoproject.com/en/3.0/topics/http/views/)
1. [Django: URL Dispatcher](https://docs.djangoproject.com/en/3.0/topics/http/urls/)