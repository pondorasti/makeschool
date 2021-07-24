# 📜 Day 4: Views

### ⏱ Agenda

1. 🏆 [5m] Learning Objectives
1. 📝 [15m] Review: Many-to-Many Relationships
1. 📖 [30m] Overview: Function-based Views vs. Class-based Views
1. 🌴 [10m] BREAK
1. 📝 [20m] From Function-based to Class-based Views
1. 💻 [30m] In Class Activity: Read the Source Code
1. 📚 Resources & Credits

## 🏆 [5m] Learning Objectives

1. Identify and describe the difference between class-based views and function-based views in Django.
1. Refactor function-based views into generic class-based views.
1. Identify use cases and pros/cons of various generic class-based views.

## 📝 [30m] Review: Many-to-Many Relationships

Watch as your instructor reviews how to use many-to-many relationships with a real-world example.

Split students into breakout groups of 3. In a code editor, complete the code for the following models for an EventBrite-like site that tracks events and attendees. Keep in mind that the `Ticket` class will represent the "through" relationship.

```js
from django.db import models

class Event(models.Model):
  ...

class Attendee(models.Model):
  ...

class Ticket(models.Model):
  ...
```

Go over the solution together as a class.

## 📖 [30m] Overview: Function-based Views vs. Class-based Views

In Django, **views** represent the **controller** layer of the Model-View-Controller pattern. This means **views** are required to do two things:

1. They must accept an `HttpRequest` object as its first argument.
2. They must return an `HttpResponse` object (or raise an exception).

### Function-Based Views

Let's begin by checking out this function-based view that returns the current date and time.

```python
from datetime import datetime
from django.http import HttpResponse

def show_the_time(request):
    now = datetime.now()
    html = "<html><body>It is now {}</body></html>".format(now)
    return HttpResponse(html)
```

The URL code for this view should look as follows:

```python
urlpatterns = [
    # ...
    path('current-time/', views.show_the_time, name='show-the-time')
]
```

#### Advantages of Function-Based Views

- Simple to implement
- Easy to read
- Straightforward
- Good for one-off or specialized functionality

#### Disadvantages of Function-Based Views

- Hard to extend and reuse the code
- Handling of HTTP methods (`GET`, `POST`) with if/else statements

### Class-Based Views

<!-- note: split into View & Generics sections -->

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

The URL code for this view should now look as follows:

```python
urlpatterns = [
    # ...
    path('current-time/', views.ShowTimeView.as_view(), name='show-the-time')
]
```

#### Advantages of Class-Based Views

- **Code Reuse**: In CBV, a view class can be inherited by another view class and modified for a different use case.
- **DRY** — Using CBVs help to reduce code duplication.
- **Code Extendability**: Can be extended to include more functionalities
- **Code Structure**: In CBVs A class based view helps you respond to different http request with different class instance methods instead of conditional statements inside a single function based view.

#### Disadvantages of Class-Based Views

- Harder to read
- Require extra imports

#### When Should I Use Each?

Class-based views provide an **alternative way to implement views as Python objects instead of functions**. They do not replace function-based views, but have certain differences and advantages when compared to function-based views.

## 🌴 [10m] BREAK

## 📝 [5m] Generic Class-based Views

Generic Class-based Views are view classes that are built into Django. We can _extend_ these classes to take advantage of their built-in functionality to perform a very specific task.

## 💻 [40m] In Class Activity: CBVs

Split students into groups of 3-4. Each group will fill out their own copy of [this worksheet](https://docs.google.com/document/d/1lwAhYh6sYrzmduuzebQhXw2OIKBj1iOQFea9nba0ukE/edit?usp=sharing) on the following view classes:

  - [ListView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/generic-display/#listview)
  - [DetailView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/generic-display/#detailview)
  - [TemplateView](https://docs.djangoproject.com/en/2.2/ref/class-based-views/base/#templateview)

Together with your group, fill out _one copy_ of the worksheet and be prepared to present your findings to your peers.

## Wrap-Up

Begin working on the [Tutorial Part 4](https://docs.djangoproject.com/en/2.2/intro/tutorial04/) and [Homework 3: Music Site](Projects/03-music-site.md).

Check out the [study guide](Assessments/quiz-1.md) and study for Quiz 1, to be given on Thursday.

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## 📚 Resources & Credits

1. [Medium: Django Class-Based Views vs Function-Based Views](https://medium.com/@ksarthak4ever/django-class-based-views-vs-function-based-view-e74b47b2e41b)
1. [Classy Class-based Views](http://ccbv.co.uk/)
2. [YouTube: Intro to Class-Based Views in Django](https://www.youtube.com/watch?v=-tqhhT3R6VY)
3. [YouTube: Deep Dive - Class-Based Views](https://youtu.be/Qki2m5AyfWw)
4. [Class-Based Views: Advanced Django Training](https://django-advanced-training.readthedocs.io/en/latest/features/class-based-views/)
5. [Built-in class-based views API](https://docs.djangoproject.com/en/2.2/ref/class-based-views/)
