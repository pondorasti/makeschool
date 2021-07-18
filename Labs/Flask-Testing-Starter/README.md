# Flask Testing Starter Code

## Setup

Clone this repository:

```bash
git clone https://github.com/Make-School-Labs/Flask-Testing-Starter.git flask-testing
```

Navigate to the project folder:

```bash
cd flask-testing
```

Install unittest if it's not already installed:

```bash
pip3 install flask_unittest
```

## Part 1: String Tests

Run the tests:

```bash
python3 -m unittest discover
```

All of the tests should pass, but that's because they're not all filled out yet!

Go to `unit_tests/test_string_functions.py` and read over the first two unit tests. I added some comments to the first one to annotate the steps: We choose a scenario, set up the expected output, then call the function to determine the actual output. Then, we compare the expectation vs. reality by using an assertion.

Fill out the rest of the unit tests by filling in at least 2 scenarios for each of the remaining tests. (The scenarios I've given are "long string" and "short string", but you can change them up!)

## Part 2: Edge Cases

The string function `find_longest_word` contains a bug: It doesn't work when there aren't any words!

Write a unit test to catch the bug. Your test should fail.

Then, fix the bug by modifying the function code. Run your test again - it should now pass.

Then, write edge case tests for each of the other functions. See if you can catch (and fix) any other bugs!

## Part 3: Route Tests

Route tests are similar to unit tests, but they can be a little more broad as sometimes routes contain more than one feature.

Go to `route_tests/test_app.py` and fill in the TODOs to test the route functions. It may be helpful to first manually test these in your browser so that you can understand how they are supposed to work.

For edge cases, make sure you pick a scenario at the "edge" of possible scenarios! That could mean testing with an empty string, 0, or 1. See if you can come up with more!
