# Homework 3: Grocery Store Site

## Purpose (Why should I do this?)

This project will allow you to practice the basics of using Class-based Forms with the WTForms and Flask-WTF libraries. After this assignment, you should be able to integrate class-based forms into your Flask projects!

If you have trouble with this assignment, I would highly recommend completing the [SQLAlchemy Forms Lab (Books)](https://github.com/Make-School-Labs/BEW-1.2-Forms-Lab) which will guide you through step-by-step and show examples of creating and using form classes.

Scoring for this project is as follows:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Less than two of the form routes are completed, or form routes are not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Forms are present, and at least one of the form routes is completed and functional. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | (Almost) all routes are functional and produce the expected result. Minor errors may be present. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | All routes are functional and produce the expected result.Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |

## Setup

Clone the [starter code](https://github.com/Make-School-Labs/BEW-1.2-Forms-Homework) and follow the instructions in the README to get started on this project.

Before starting this project, make sure to run the code to familiarize yourself with how it works.

## Instructions

You've been commissioned to build out a grocery tracker app. This will allow users to track the prices of grocery items across multiple stores, and add items that are available at specific stores.

### Forms

The first step here will be to create the form classes that we'll use to build out the forms. These will be used to create and update instances of `GroceryStore` and `GroceryItem`, which can be found in `grocery_app/models.py`.

**Navigate to `grocery_app/forms.py` and complete the TODOs to create the form classes.**

### Routes

Next, we'll build out the routes to complete this app. You will be building out 4 different routes, which will allow users to create and update instances of `GroceryStore` and `GroceryItem`.

**Navigate to `grocery_app/routes.py` and complete the TODOs to complete the routes.**

**Stretch Challenge**: With 2 routes using each of our 2 form classes, that's a lot of repeated code! Create a [partial template](https://jinja.palletsprojects.com/en/2.11.x/templates/#include) for each form so that you can re-use it in both the `Create` and `Update` routes.

## Submission

Submit your work on [Gradescope](https://gradescope.com).

