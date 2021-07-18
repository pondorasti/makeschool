# 📜 Day 9: Testing

### ⏱ Agenda

1. [🏆 [**5m**] Learning Objectives](#%f0%9f%8f%86-5m-learning-objectives)
2. [☀️ [**10m**] Warm Up: Brainstorming Test Cases](#%e2%98%80%ef%b8%8f-10m-warm-up-brainstorming-test-cases)
3. [📖 [**40m**] Overview: Testing in Django](#%f0%9f%93%96-40m-overview-testing-in-django)
4. [🌴 [**10m**] BREAK](#%f0%9f%8c%b4-10m-break)
5. [💻 [**35m**] Activity: MakeWiki Tests](#%f0%9f%92%bb-35m-activity-makewiki-tests)
6. [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

## 🏆 [**5m**] Learning Objectives

1. Describe the process involved when writing test cases using the Django framework.
1. Recognize which unit tests add value to a Django codebase.
1. Practice identifying and writing test cases in Django apps.
1. Integrate newly written test cases with existing code.

## ☀️ [**10m**] Warm Up: Brainstorming Test Cases

Recall the **two typical types of tests** developers write:

- **Unit Tests** are isolated tests that test one specific function.
- **Integration Tests**, meanwhile, are larger tests that focus on user behavior and testing entire applications. Integration testing combines different pieces of code functionality to make sure they behave correctly.

Break into assigned/random groups of 2-3. Have students open their MakeWiki project and run the code. Prompt the following:

1. **While viewing each page of the MakeWiki website, write down your ideas for the different interactions you should consider testing**.
2. Label each potential test case as a unit test, or an integration test.

## 📖 [**40m**] Overview: Testing in Django

> **Documentation**: [Writing and Running Tests in Django].

Tests are written in each app's `tests.py` file. This file is created when you run `python manage.py startapp`. Here's what it looks like at the start:

```python
# wiki/tests.py
from django.test import TestCase

# Create your tests here.
```

Run `python manage.py test` to test your project.

**NOTE**: Django’s unit tests use a Python standard library module: `unittest` --- the same thing Flask uses! That means, when you run `python manage.py test`, `unittest` will find all subclasses of `unittest.TestCase` in any file whose name begins with `test`, then automatically run all of the tests it found.

### Canary Test

Open up `wiki/tests.py` and write your first test case: a **_canary_** test. Canary tests are minimal tests that quickly verify that the system works as expected.

```python
# wiki/tests.py
from django.test import TestCase

class WikiTestCase(TestCase):
    def test_true_is_true(self):
        """ Tests if True is equal to True. Should always pass. """
        self.assertEqual(True, True)
```

When you're done writing the code, run the tests with `python manage.py test`. This first test should always pass!

### Testing a Model

Let's try something using the code we've already written. Let's test an aspect of our `Article` model!

```python
# wiki/tests.py
from django.test import TestCase
from django.contrib.auth.models import User
from wiki.models import Article

class WikiTestCase(TestCase):
    def test_true_is_true(self):
        """ Tests if True is equal to True. Should always pass. """
        self.assertEqual(True, True)

def test_article_slugify_on_save(self):
        """ Tests the slug generated when saving an Article. """
        # Author is a required field in our model.
        # Create a user for this test and save it to the test database.
        user = User()
        user.save()

        # Create and save a new article to the test database.
        article = Article(title="My Test Article", content="test", author=user)
        article.save()

        # Make sure the slug that was generated in Article.save()
        # matches what we think it should be.
        self.assertEqual(article.slug, "my-test-article")
```

Add this to your `tests.py` file, then run the new test. Did it work?

### Testing a Route

What other things could we test? We could check to see whether or not our routes are working.

When testing a route, there are **4 steps** we _(almost) always_ need to do:

1. **Set up the data.** This usually means creating some instances of our models!
1. **Make a GET or POST request,** and save the response object in a variable.
1. **Check that the REALITY** (what we _actually_ got in the response) **matches the EXPECTATION** (what we _should_ get in the response, if our site is working correctly).
1. If we are testing a POST route, **check that the data was updated in the database.**

#### Example: Testing a GET Route

Let's add the following class to our `tests.py` file together, below the definition for `WikiTestCase`:

```python
from django.contrib.auth.models import User
from django.test import TestCase

from wiki.models import Article


class ArticleListViewTests(TestCase):
    def test_multiple_articles(self):
        # Make some test data to be displayed on the article.
        user = User.objects.create()

        Article.objects.create(title="My Test Article", content="test", author=user)
        Article.objects.create(title="Another Test Article", content="test", author=user)

        # Issue a GET request to the MakeWiki homepage.
        # When we make a request, we get a response back.
        response = self.client.get('/')

        # Check that the response is 200 OK.
        self.assertEqual(response.status_code, 200)

        # Check that the number of articles passed to the template
        # matches the number of articles we have in the database.
        response_articles = response.context['articles']
        self.assertEqual(len(response_articles), 2)

        # Check that the response HTML contains the text of the articles.
        self.assertContains(response, 'My Test Article')
        self.assertContains(response, 'Another Test Article')
```

Run your tests a final time. Are they all passing? Be sure to ask a friend or raise your hand to get unblocked!

#### [**10m**] Activity: Write a Test for the Article Detail Page

With a partner, write a test for the `ArticleDetailView` page. You can use the following starter code:

```py
class ArticleDetailViewTests(TestCase):
    def test_single_article(self):
        # TODO: Make some test data (one User and one Article)

        # TODO: Make a GET request for the detail page

        # TODO: Verify (using assertContains) that the article's title and contents
        # appear on the page
```

## 🌴 [**10m**] BREAK

### Testing a GET & POST Route

Let's try writing a few more! This time, let's write some tests for the **Homework 4: Polls Redux** assignment, using both **GET** and **POST**.

Make sure to create a file called `tests.py` inside of the `polls` directory to put your test code into.

```py
from django.contrib.auth.models import User
from django.contrib.auth import login
from .models import Question, Choice

from datetime import datetime

class QuestionViewTests(TestCase):
    def test_show_question_creation_form(self):
        # 1: Create test data.
        user = User.objects.create_user(username='admin', password='djangopony')
        self.client.login(username='admin', password='djangopony')

        # 2: Make a GET request.
        response = self.client.get('/polls/create/')

        # 3: Check that the response contains the text "New Poll"
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'New Poll')

    def test_submit_question_creation_form(self):
        # 1: Create test data.
        user = User.objects.create_user(username='admin', password='djangopony')
        self.client.login(username='admin', password='djangopony')

        # 2: Make a POST request.
        response = self.client.post('/polls/create/', 
            {
                'question_text': 'What is your favorite animal?', 
                'pub_date': '3/4/2020'
            })

        # 3: Check that the response was successful
        self.assertEqual(response.status_code, 302)

        # 4: Check that the data was updated in the database
        new_question = Question.objects.filter(question_text='What is your favorite animal?')
        self.assertTrue(new_question.exists())
```

### Final Thoughts

#### More is Better!

It may seem that if we tested everything, that our tests could grow out of control --- with more code in our tests than in our application! The testing code may appear to be repetitive or unaesthetic, compared to the elegant conciseness of the rest of our code.

It doesn’t matter. **Let your tests grow**. For the most part, you can **write a test once** and **then forget about it**. It will continue performing its useful function as you continue to develop your program.

At worst, as you continue developing, you might find that you have some tests that are now redundant. Even that’s not a problem; in testing **redundancy is a good thing**.

#### Test Organization

As long as your tests are sensibly arranged, they won’t become unmanageable. Good rules-of-thumb include having:

- A **separate TestClass for each model or view**
- A **separate test method** for **each set of conditions** you want to test
- Test **method names** that **describe their function**

## 💻 [**35m**] Activity: MakeWiki Tests

In the same `tests.py` file we've used today, write tests that prove the following:

1. That the wiki details page loads for a specific article
1. That the wiki article creation form loads when visiting `/create`

Next, write a test that proves that we can successfully create a new wiki article by filling out the new article form. This one involves a few more steps:

- Create a dictionary of key-value pairs containing the post data to be sent via the form
- Make a POST request to the client with `self.client.post()`
- Check that we get a `302` status code (Why 302 and not 200?)
- Check that a new article object was created in the test database

## Wrap-Up

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## 📚 Resources & Credits

- [Intro to Testing in Django]
- [Writing and Running Tests in Django]
- [The Django Test Client](https://docs.djangoproject.com/en/2.2/topics/testing/tools/): Used when writing route tests.

[Intro to Testing in Django]: https://realpython.com/testing-in-django-part-1-best-practices-and-examples/
[Writing and Running Tests in Django]: https://docs.djangoproject.com/en/2.2/topics/testing/overview/

