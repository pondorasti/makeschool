# Homework 4: Polls Redux - Authentication & (More) Forms

## Purpose (Why should I do this?)

This assignment is designed for you to practice writing **forms** and adding **authentication** to an existing app.

Scoring is as follows:

| Criteria                                       | Possible  |
| ---------------------------------------------- | :-------: |
| Add Login & Logout links |    `5`    |
| Add Accounts URLConf |    `5`    |
| Add Registration App & Login Page |    `10`    |
| Add Message for Logged-in Users |    `10`    |
| Sign Up Page |    `10`    |
| New Question Creation Form |    `10`    |
| Save the Question's Author |    `10`    |
| New Choice Creation Form |    `10`    |
| **TOTAL**                                  | **`70`** |

## Setup

_To complete this assignment, you **MUST** have a working version of the [Polls tutorial](https://docs.djangoproject.com/en/2.2/intro/tutorial01/), completed through at least Part 4._

To begin, make a _copy_ of your Polls Tutorial folder. If this folder is called `django-tutorial`, you can do this as follows in the command line:

```
$ cp -r django-tutorial polls-redux
```

Then, set up a _new_ repository for your Polls application on [GitHub.com](https://github.com) and execute the following to switch the remote:

```
$ git remote remove origin
$ git remote add origin git@github.com:USERNAME/REPOSITORY.git
```

Alternatively, if you'd prefer, you can complete this project on a separate _branch_ of the same repository you used for your Polls tutorial.

## Part 1: Authentication

In this part, we'll be adding login & logout functionality to our Polls app.

### Add Login & Logout links _(5 Points)_

In the `polls/templates/polls` folder, create a file called `base.html`. This will hold our HTML code for displaying the login & logout links. In this file, put the following contents:

```html
<p align="right">
  <a href="/accounts/login">Login</a>
  <a href="/accounts/logout">Logout</a>
</p>

{% block content %}
<p>
    This is a placeholder block.
</p>
{% endblock %}
```

Then, _refactor_ your templates for `detail.html`, `index.html`, and `results.html` by extending `base.html` and putting the existing content in between `{% block content %}` and `{% endblock content %}` blocks, as follows:

```html
{% extends 'polls/base.html' %}

{% block content %}

<!-- ... EXISTING CONTENT GOES HERE ... -->

{% endblock content}
```

Run your server, and verify that all of your pages now have "Login" and "Logout" links. If you click on one, you will see a "Page not found" error - don't worry, we'll fix that shortly!

### Add Accounts URLConf _(5 Points)_

In your project's root URLConf (most likely called `mysite/urls.py`), add the following to your `urlpatterns` list:

```py
path('accounts/', include('django.contrib.auth.urls')),
```

This _single line of code_ tells Django to include the URLs from the `django.contrib.auth` package, which gives us URLs and views for login, logout, password change, password reset, and more! So cool!

If you want to learn more about _precisely_ which URLs are included there, [click here](https://docs.djangoproject.com/en/2.2/topics/auth/default/#module-django.contrib.auth.views).

Now, run your server and refresh the page at `/polls/`. Click on one of the links again. What do you see?

You should see the following error: `TemplateDoesNotExist at /accounts/login/: registration/login.html`. This means that we need a _template_ called `registration/login.html` to render our login page!

### Add Registration App & Login Page _(10 Points)_

In your root folder, run the following command to create a "registration" app:

```bash
$ python3 manage.py startapp registration
```

Make sure to add the `registration` app to the `INSTALLED_APPS` list in `settings.py`.

Now, let's add a template for our login page! In the `registration` folder, create a folder called `templates`, and inside of that one create another folder called `registration`. Inside of that folder, create a file called `login.html` and give it the following contents:

```html
{% extends 'polls/base.html' %}

{% block content %}
    <h3>Log In!</h3>
    
    {% if form.errors %}
        <p>Your username and password didn't match. Please try again.</p>
    {% endif %}

    <form method="post" action="{% url 'login' %}">
        {% csrf_token %}
        <p>
            <label for="id_username">Username</label>
            <input type="text" name="username" id="id_username" required>
        </p>
        <p>
            <label for="id_password">Password</label>
            <input type="password" name="password" id="id_password" required>
        </p>
        <input type="submit" value="login">
    </form>
{% endblock %}
```

Save your work, and try loading the login page again. You should see a form to enter your username and password. Log in with your superuser credentials. (If you've forgotten the password, you can always run `python3 manage.py createsuperuser` to create a new login.) What do you see?

That's right! You should see... _(dun dun dun)_ another error message! Let's fix that.

Go to your `settings.py` file and enter the following two lines:

```py
LOGIN_REDIRECT_URL = '/polls/'
LOGOUT_REDIRECT_URL = '/polls/'
```

This will tell Django to take us back to the polls homepage whenever we log in or log out. Once you're done, re-load the login page and try logging in again. Success!

### Add Message for Logged-in Users _(10 Points)_

Okay, so that's cool and all, but... How do we actually know we've logged in?! If you've followed the instructions so far, you should find yourself back at the Polls homepage. Let's add a message in `base.html` to greet the logged-in user (and to prove to ourselves that we're now logged into the site).

In `polls/templates/polls/base.html`, add the following to the very top of the file:

```html
<p>
    Hello, {{ request.user.username }}!
</p>
```

Now, re-load the page and behold: the website now knows your name! WHOA SO COOL! So, why does this work?!

It turns out that whenever we load a template in Django, there are some _extra variables_ that always get passed to the template, even if we don't explicitly include them in the context. One of these is the `request` object, which has a property `user` that contains the logged-in user object. If there is no logged in user, then `request.user` will contain an instance of the `AnonymousUser` class instead of the `User` class. Pretty cool!

[Click here](https://docs.djangoproject.com/en/3.0/ref/contrib/auth/#user-model) to learn more about the `User` and `AnonymousUser` models.

Let's make one more change to `polls/templates/polls/base.html`. We only want to show this message _if_ the user is logged in. So, let's change the previous lines to the following:

```html
{% if request.user.is_authenticated %}
    <p>
        Hello, {{ request.user.username }}!
    </p>
{% endif %}
```

This ensures that we will _only_ see the message if we are logged into the site.

As a final challenge, **modify the code for the "Login" and "Logout" links to show the "Logout" link _only_ if the user is logged in, and the "Login" link _only_ if they are logged out.**

### Sign Up Page _(10 Points)_

Woo-hoo, we've got the login flow working! But there's still an issue: None of our users can sign up for the site unless they are site admin users. Let's make a sign-up page!

In `polls/templates/polls/base.html`, add the following link (to be shown _only_ if the user is _not_ logged in):

```html
<a href="/registration/signup">Sign Up</a>
```

Now, let's add the code to make this link work. In `mysite/urls.py`, add the following to your URLConf:

```py
path('registration/', include('registration.urls')),
```

Then, in the `registration` app, create a file called `urls.py` and put the following URL into its `urlpatterns` list (and make sure to import the `views.py` file):

```py
path('signup/', views.SignUpView.as_view(), name='signup'),
```

Next, add the `SignUpView` class to `registration/views.py`:

```py
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.views.generic import CreateView


class SignUpView(CreateView):
    form_class = UserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'registration/signup.html'
```

Finally, we'll need to make the template file to display to the user. In `registration/templates/registration`, create a new template called `signup.html` and give it the following contents:

```html
{% extends 'polls/base.html' %}

{% block content %}
    <h3>Sign Up!</h3>

    <form method="post">
      {% csrf_token %}
      {% for field in form %}
          {% for error in field.errors %}
              <p class="text-danger">{{ error }}</p>
          {% endfor %}
          <p>
              <label for="id_{{ field.name }}">{{ field.label|title }}:</label>
              <input type="{% if "password" in field.name %}password{% else %}text{% endif %}" name="{{ field.name }}" id="id_{{ field.name }}" required>
          </p>
      {% endfor %}
      <button type="submit">Sign up</button>
    </form>
{% endblock %}
```

Run your server, and verify that you are able to sign up with a _new_ username and password. Once you sign up, you will still need to log in with your new credentials.

## Part 2: Forms

### New Question Creation Form

In `polls/templates/polls/base.html`, add the following link. Make sure it shows _only for logged-in users_ - we don't want just anyone to create a new poll!

```html
<a href="/polls/create">New Poll</a>
```

Now, let's create the URL for the poll creation page. In `polls/urls.py`, add the following URL to your URLConf:

```py
path('create/', views.QuestionCreateView.as_view(), name='create'),
```

Next, add the corresponding `QuestionCreateView` to `polls/views.py`:

```py
from .forms import QuestionCreateForm

class QuestionCreateView(generic.edit.CreateView):
    def get(self, request, *args, **kwargs):
        context = {
          'form': QuestionCreateForm()
        }
        return render(request, 'polls/create.html', context)

    def post(self, request, *args, **kwargs):
        form = QuestionCreateForm(request.POST)
        if form.is_valid():
            question = form.save()
            question.save()
            return HttpResponseRedirect(
                reverse('polls:detail', args=[question.id]))
        # else if form is not valid
        return render(request, 'polls/create.html', { 'form': form })
```

Read over this code to make sure that you understand what it is doing:

- When the user loads the "Create" page, show the `polls/create.html` template and pass in a form object.
- When the user submits the form, save the question to the database, using the data passed in through the `POST` request. Then, redirect the user to the detail page for their newly created question.
- If the form is not valid (e.g. the user entered an invalid publish date), show the form again with any error messages.

For our code to work, we'll have to also write the `QuestionCreateForm` class. In the `polls` app folder, create a file called `forms.py` and in it, add the following code:

```py
from django import forms

from .models import Question

class QuestionCreateForm(forms.ModelForm):
    class Meta:
        model = Question
        fields = ['question_text', 'pub_date']
```

This indicates that the `QuestionCreateForm` should use the 'question_text' and 'pub_date' fields from the `Question` model class. This is preferred to writing our own fields here, so that if they were to ever change in the `Question` class, they would be updated in the `QuestionCreateForm` class as well.

Finally, we'll need a _template_ to display our form. In `polls/templates/polls`, create a file called `create.html` and give it the following contents:

```html
{% extends 'polls/base.html' %}

{% block content %}
    <h3>New Poll</h3>

    <form method="POST">
        {% csrf_token %}
        
        {{ form.as_p }}
        <button type="submit">SUBMIT</button>
    </form>
{% endblock %}
```

At this point, we should finally be ready to test our code! Run your server, and see if you can create a few new Questions this way.

### Save the Question's Author _(10 Points)_

Before moving on, let's add one more feature to add some _polish_ to our application: I want to know who the _author_ was of any given question. Since we now have a signup/login flow, this should be pretty straightforward!

First, let's restrict access to the `QuestionCreateView` to only users who are logged in. That way, every new `Question` object will have a valid author.

In `polls/views.py`, modify the `QuestionCreateView` class using the `LoginRequiredMixin` as follows:

```py
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy

class QuestionCreateView(LoginRequiredMixin, generic.edit.CreateView):
    login_url = reverse_lazy('login')

    def get(self, request, *args, **kwargs):
      # ...
    
    def post(self, request, *args, **kwargs):
      # ...
```

To verify that that worked, try going to `/polls/create` while logged out. You should be redirected to the login page!

In `polls/models.py`, modify the `Question` class by adding a ForeignKey field for the question's author:

```py
from django.contrib.auth.models import User

class Question(models.Model):
    author = models.ForeignKey(User, on_delete=models.PROTECT, blank=True, null=True, help_text='The user who posted this question.')
```

After doing this step, make sure to migrate your models so that the app will pick up on the new `author` field.

Next, let's modify the `QuestionCreateView`'s `post()` method so that it will save the question's author, in addition to its text and publish date:

```py
class QuestionCreateView(LoginRequiredMixin, generic.edit.CreateView):
    # ...

    def post(self, request, *args, **kwargs):
        form = QuestionCreateForm(request.POST)
        if form.is_valid():
            question = form.save(commit=False) # don't save the question yet
            question.author = request.user
            question.save()
            return HttpResponseRedirect(
                reverse('polls:detail', args=[question.id]))
        # else if form is not valid
        return render(request, 'polls/create.html', { 'form': form })
```

Finally, update `polls/detail.html` to show the author of a particular question:

```html
{% extends 'polls/base.html' %}

{% block content %}
    <h1>{{ question.question_text }}</h1>
    {% if question.author %}
        <p>Author: {{ question.author.username }}</p>
    {% endif %}

    <!-- ... voting form goes here ... -->
{% endblock %}
```

Make sure you test out creating a new Question, and make sure your username shows up!

### New Choice Creation Form

By now, you're probably wondering: How do we create new _choices_ for our brand-new polls?! We'll cover that in this next part!

In `polls/forms.py`, create a new form class for the `Choice` model and call it `ChoiceCreateForm`. It should be very similar to the `QuestionCreateForm` we made previously. Specify that it contains only the field `choice_text`.

In `polls/views.py`, modify the existing `DetailView` class as follows:

```py
from .forms import ChoiceCreateForm

class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['choice_form'] = ChoiceCreateForm()
        return context

    def post(self, request, pk):
        form = ChoiceCreateForm(request.POST)
        if form.is_valid():
            choice = form.save(commit=False)
            choice.question = Question.objects.get(pk=pk)
            choice.save()
            return HttpResponseRedirect(reverse('polls:detail', args=[pk]))
        # else if form is not valid
        context = {
          'choice_form': form,
          'question': Question.objects.get(pk=pk)
        }
        return render(request, 'polls/detail.html', context)
```

This code does the following:

- If the user loads the question detail page, an extra entry for the `choice_form` is added to the context variables and sent to the template.
- When the user submits a new choice, save the choice to the database, using the data passed in as well as the question corresponding to the `pk` from the URL. Then, redirect the user back to the detail page.
- If the form is not valid (e.g. the user entered an invalid publish date), show the form again with any error messages.

Finally, modify `polls/templates/polls/detail.html` by adding the `choice_form` right after the voting form. We only want to show this extra form if the logged-in user is the same as the question's author.

```html
{% if request.user == question.author %}
    <!-- choice creation form -->
    <h3>Create a new Choice!</h3>
    <form method='POST'>
        {% csrf_token %}
        {{ choice_form.as_p }}

      <input type="submit" value="Submit new choice!">
    </form>
{% endif %}
```

Verify that your code is correct by adding some `Choice`s! Woo-hoo, you're done!!

Your completed detail page should look like the following:

<img src="Projects/Assets/polls-detail.png" width="600" border="1px solid black">

## Submission

Submit your finished homework using our [class submission site](https://gradescope.com).

## Resources

1. [User authentication in Django](https://docs.djangoproject.com/en/3.0/topics/auth/)
1. [Working with forms](https://docs.djangoproject.com/en/3.0/topics/forms/)