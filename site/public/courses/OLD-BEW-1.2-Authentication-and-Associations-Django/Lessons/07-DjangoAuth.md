# 📜 Day 7: Authentication & Authorization

### ⏱ Agenda

1. [**02m**] 🏆 Objectives
1. [**15m**] 📖 Overview: Login & Logout
1. [**30m**] 💻 Activity: Polls Authentication - Login & Logout
1. [**10m**] 🌴 BREAK
1. [**15m**] 📖 Overview: Signup
1. [**30m**] 💻 Activity: Polls Authentication - Signup
1. 🌃 After Class
1. 📚 Resources & Credits

## [**02m**] 🏆 Objectives

1. Define authentication and authorization and discuss examples of each.
1. Apply authentication (Login, Logout, & Signup) to an existing codebase.

## [**15m**] 📖 Overview: Login & Logout

### Authentication vs. Authorization

In Django, superusers have access to the `/admin` interface, whereas regular users do not. This is an example of **authentication** and **authorization**:

- All users can attempt to **log in** (*authentication*)
- But only superusers **have access to** the administrative interface (*authorization*)

### Think / Pair / Share: Brainstorm Analogies

Spend 5 minutes coming up with one or two real-world analogies for authentication and authorization. Discuss and choose your favorite analogy.

We will share these analogies together shortly.

### Enabling User Authentication in Django

<!-- NOTE: add section on request.user -->

In the project's root URLconf, we add the following to the provided `urlpatterns` list:

```python
path('accounts/', include('django.contrib.auth.urls')),
```

This will enable the following URL patterns:

```python
accounts/login/ [name='login']
accounts/logout/ [name='logout']
accounts/password_change/ [name='password_change']
accounts/password_change/done/ [name='password_change_done']
accounts/password_reset/ [name='password_reset']
accounts/password_reset/done/ [name='password_reset_done']
accounts/reset/<uidb64>/<token>/ [name='password_reset_confirm']
accounts/reset/done/ [name='password_reset_complete']
```

This will enable authentication outside the administrative interface, like you see on typical websites.

Read more about [Authentication Views in Django](https://docs.djangoproject.com/en/2.2/topics/auth/default/#module-django.contrib.auth.views).

### Login Templates

By adding that single line of code, we are effectively _using_ the Django built-in Login & Logout views:

- The [LoginView](https://github.com/django/django/blob/master/django/contrib/auth/views.py#L40) class has a default `template_name` attribute of `registration/login.html`. That means we need to create a _template file_ located in a folder "registration" and called "login.html".
- The [LogoutView](https://github.com/django/django/blob/master/django/contrib/auth/views.py#L107) redirects the user to another page after they are logged out. Which page they are redirected to depends on the value of the `LOGOUT_REDIRECT_URL` variable located in `settings.py`. (So, no template needed for this one!)

## [**30m**] 💻 Activity: Polls Authentication - Login & Logout

1. Begin the [Polls Redux assignment](Projects/04-polls-redux). Make sure to _make a copy_ of your working Polls project (starting from Part 4 or later).

2. Stop when you complete the section titled [`Add Message for Logged-in Users`](Projects/04-polls-redux?id=add-message-for-logged-in-users-10-points).

## [**10m**] 🌴 BREAK

## [**15m**] 📖 Overview: Signup

We can log users in and out, but how do they sign up? We'll have to implement that functionality with our own view.

User-related functionality --- creation during signup, viewing or editing a user profile, etc. ---  is typically kept in an `accounts` or `registration` app.

### Signup Views

Here's a `views.py` that handles the following workflow:

- Allow user to choose `username` and `password`, then confirm the password.
- Saves the user based on the submitted form data.
- Redirects the user to the homepage if successful, or shows an error that tells the user what went wrong.

**IMPORTANT**: Signing up **does not authenticate** the user! Be sure to redirect the user to the login page after signing up.

```python
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.views.generic import CreateView


class SignUpView(CreateView):
    form_class = UserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'signup.html'
```

These four lines of code do a lot!

- We’re subclassing the generic class-based view `CreateView` in our `SignUpView` class.
- We specify the use of the built-in `UserCreationForm` and a template called `signup.html`.
- We then use `reverse_lazy` to redirect the user to the login page upon successful registration. Why use `reverse_lazy` instead of `reverse`?
    - All Python class attributes, like `success_url`, are **evaluated when the class is imported**.
    - When this happens, Django hasn't finished building all the URLs for the project.
    - We use `reverse_lazy` to tell Python to reverse (or "build") the URL when a user requests it, instead of saving it when the class is imported.
    - You'll get an error like the one below if you don't use `reverse_lazy` with CBVs: `django.core.exceptions.ImproperlyConfigured: The included urlconf 'accounts.urls' does not appear to have any patterns in it. If you see valid patterns in the file then the issue is probably caused by a circular import.`

### Signup Templates

The simplest `signup.html` template looks like this:

```html
{% extends 'base.html' %}

{% block title %}Sign Up{% endblock %}

{% block content %}
  <h2>Sign up</h2>
  <form method="post">
    {% csrf_token %}
    {{ form.as_p }}
    <button type="submit">Sign up</button>
  </form>
{% endblock %}
```

### The User object & `request.user`

In Django, we can take advantage of the [built-in User model](https://docs.djangoproject.com/en/3.0/ref/contrib/auth/#user-model) when writing our authentication code. Then, we can use `request.user` to access the logged-in user anywhere in our views or templates!

To limit access to a particular page to _only_ logged-in users, we can use:

- The [`@login_required` decorator](https://docs.djangoproject.com/en/3.0/topics/auth/default/#the-login-required-decorator) - only for function-based views
- The [LoginRequiredMixin](https://docs.djangoproject.com/en/3.0/topics/auth/default/#the-loginrequired-mixin) - only for class-based views

## [**30m**] 💻 Activity: Polls Authentication - Signup

Move on to the [`Sign Up Page` section](Projects/04-polls-redux?id=sign-up-page-10-points).

## 🌃 After Class

- **HOMEWORK**: Complete [Homework 4](Projects/04-polls-redux) by EOD on Tuesday.
- **UP NEXT:** We'll talk more about Forms next week!

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## 📚 Resources & Credits

### Unblockers

Use these resources if you get stuck on your challenges today.

- [Django Authentication: **Login & Logout Tutorial**](https://wsvincent.com/django-user-authentication-tutorial-login-and-logout/)
- [Django Authentication: **Sign Up Tutorial**](https://wsvincent.com/django-user-authentication-tutorial-signup/)
- [Django Authentication: **Password Reset Tutorial**](https://wsvincent.com/django-user-authentication-tutorial-password-reset/)

### More Information

Learn more through the resources below.

- [**Docs**: Using the Django authentication system](https://docs.djangoproject.com/en/2.2/topics/auth/default/)
- [**Django `reverse` vs `reverse_lazy`**](http://cheng.logdown.com/posts/2015/05/25/django-reverse-vs-reverse-lazy): Blog post describing a common pitfall when implementing class-based views.

