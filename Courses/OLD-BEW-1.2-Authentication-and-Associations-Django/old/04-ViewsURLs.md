# 📜 Day 4: Views & URLs

### ⏱ Agenda

1. [🏆 [5m] Learning Objectives](#%f0%9f%8f%86-5m-learning-objectives)
2. [📖 [30m] Overview](#%f0%9f%93%96-30m-overview)
3. [📝 [10m] In Class Activity: Getting to Know Views](#%f0%9f%93%9d-10m-in-class-activity-getting-to-know-views)
4. [🌴 [10m] BREAK](#%f0%9f%8c%b4-10m-break)
5. [📝 [20m] In Class Activity: Class-Based Views](#%f0%9f%93%9d-20m-in-class-activity-class-based-views)
6. [💻 [30m] In Class Activity: Let's Make A Website!](#%f0%9f%92%bb-30m-in-class-activity-lets-make-a-website)
7. [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

## 🏆 [5m] Learning Objectives

1. Identify and describe the difference between class-based views and function-based views in Django.
2. Recognize the role of URLs in the Django framework.
3. Apply class-based views, function-based views, and urlpatterns in a series of challenges and stretch challenges.

## 📖 [30m] Overview

### Views

In Django, **views** represent the **controller** layer of the Model-View-Controller pattern. This means **views** are required to do two things:

1. They must accept an `HttpRequest` object as its first argument.
2. They must return an `HttpResponse` object (or raise an exception).

#### Function-Based Views

Let's begin by checking out this approachable, function-based view that returns the current date and time.

```python
from datetime import datetime
from django.http import HttpResponse

def show_the_time(request):
    now = datetime.now()
    html = "<html><body>It is now {}</body></html>".format(now)
    return HttpResponse(html)
```

##### URLs

```python
from django.conf.urls import url

# This syntax imports all of the functions and classes
# inside the views.py in the same folder.
from . import views

urlpatterns = [
    url(r'^now/$', views.show_the_time),
]
```

##### Advantages of Function-Based Views

- Simple to implement
- Easy to read
- Straightforward
- Good for one-off or specialized functionality

##### Disadvantages of Function-Based Views

- Hard to extend and reuse the code
- Handling of HTTP methods (`GET`, `POST`) with if/else statements

#### Class-Based Views

At their core, CBVs are Python classes. Django ships with a variety of “template” CBVs that have pre-configured functionality that you can reuse and oftentimes extend. These classes are then given helpful names that describe what kind of functionality they provide. You’ll often see these referred to as “generic views” because they provide solutions to common requirements.

This means, to use class-based views, we'll have to modify, or *refactor*, the code to support this:

```python
from datetime import datetime
from django.http import HttpResponse
from django.views import View  # Import the View parent class

class ShowTimeView(View):  # Create a view class

    # Change the function-based view to be called get and add the self param
    def get(self, request):
        now = datetime.now()
        html = "<html><body>It is now {}</body></html>".format(now)
        return HttpResponse(html)
```

##### URLs

In `urls.py`, we'll need to modify our existing `urlpattern` slightly and change how we reference this new, class-based view:

```python
from django.conf.urls import url

from . import views

urlpatterns = [
    # Change how we reference the new view.
    url(r'^now/$', views.ShowTimeView.as_view()),
]
```

##### Advantages of Class-Based Views

- **Code Reuse**: In CBV, a view class can be inherited by another view class and modified for a different use case.
- **DRY** — Using CBVs help to reduce code duplication.
- **Code Extendability**: Can be extended to include more functionalities
- **Code Structure**: In CBVs A class based view helps you respond to different http request with different class instance methods instead of conditional statements inside a single function based view.

##### Disadvantages of Class-Based Views

- Harder to read
- Require extra imports

#### When Should I Use Each?

Class-based views provide an **alternative way to implement views as Python objects instead of functions**. They do not replace function-based views, but have certain differences and advantages when compared to function-based views.

Use this handy flowchart to choose when to use each type of view!

<p align="center">
  <img src="https://github.com/Make-School-Courses/BEW-1.2-Authentication-and-Associations/blob/master/Lessons/Assets/which-view.jpeg?raw=true">
</p>

## 📝 [10m] In Class Activity: Getting to Know Views

Pair up, and **write down the answers** to the following challenges:

1. When is it a good idea to use a **function-based view**?
2. When would it be better to use a **class-based view**?

We will discuss the answers together as a group when we return from break!

## 🌴 [10m] BREAK

## 📝 [20m] In Class Activity: Class-Based Views

Pair back up, discuss, and write one to two sentences (in your own words!) on the following prompt:

1. Describe one situation in which you might use each of these class-based views:
   - [View](https://docs.djangoproject.com/en/2.2/ref/class-based-views/base/#view)
   - [ListView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/generic-display/#listview)
   - [DetailView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/generic-display/#detailview)
   - [TemplateView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/base/#templateview)
3. Which class-based view would you use to display **all events**?
4. Which class-based view would you use to display **only one event**?

## 💻 [30m] In Class Activity: Let's Make A Website!

For these challenges, use `views.py` in the `clubs_app` app we created last class period.

### Challenges

1. Create a **function-based view** that returns a `Hello, World!` message as a string when you visit it in a browser.
2. Create a **class-based view** that returns a `Hello, World!` message as a string.

### Stretch Challenges

1. Import the `Event` model we created during our last class. Use it to show a list of `Event`s using a class-based view and an HTML template. Which class-based view will you use?

## 🤗 [5m] Vibe Check

[make.sc/bew1.2-vibe-check](https://make.sc/bew1.2-vibe-check)

## 📚 Resources & Credits

1. [Medium: Django Class-Based Views vs Function-Based Views](https://medium.com/@ksarthak4ever/django-class-based-views-vs-function-based-view-e74b47b2e41b)
2. [YouTube: Intro to Class-Based Views in Django](https://www.youtube.com/watch?v=-tqhhT3R6VY)
3. [YouTube: Deep Dive - Class-Based Views](https://youtu.be/Qki2m5AyfWw)
4. [Class-Based Views: Advanced Django Training](https://django-advanced-training.readthedocs.io/en/latest/features/class-based-views/)
5. [Built-in class-based views API](https://docs.djangoproject.com/en/2.2/ref/class-based-views/)
