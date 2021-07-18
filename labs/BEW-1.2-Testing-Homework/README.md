# Books App Part 4 (Tests)

## Setup

Clone this repository to your computer. 

**Take a look at the test code** in `books_app/main/tests.py`. There are several existing tests that you can use as examples.

**To run the code**, navigate to the project folder and run the following to install the required packages:

```
pip3 install -r requirements.txt
```

Then, copy the `.env.example` file to `.env`:

```
cp .env.example .env
```

Then you can run the following to run the Flask server:

```
python3 app.py
```

## Running the Tests

**To run all of the tests**, you can run the following from the root project directory:

```
python3 -m unittest discover
```

(Make sure you have unittest installed.)

**To run all tests from a single file**, run the following:

```
python3 -m unittest books_app.main.tests
```

**To run one specific test**, you can run the following:

```
python3 -m unittest books_app.main.tests.MainTests.test_homepage_logged_in
```

## Instructions

Navigate to `books_app/main/tests.py` and `books_app/auth/tests.py`, and complete the TODOs to finish all tests. Make sure you run the tests as you go along to ensure that they still pass!

## Resources

If you'd like more resources on working with Flask-WTForms, check out the following:

- [Unit Testing a Flask Application](https://www.patricksoftwareblog.com/unit-testing-a-flask-application/)
- [Testing Flask Applications](https://flask.palletsprojects.com/en/1.1.x/testing/)
- [Python Tutorial: Unit Testing Your Code with the unittest Module [VIDEO]](https://www.youtube.com/watch?v=6tNS--WetLI)
