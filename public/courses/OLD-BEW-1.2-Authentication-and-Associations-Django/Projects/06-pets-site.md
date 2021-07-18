# Homework 6: Pet Sitting Site

## Purpose (Why should I do this?)

In this project, you will be building a pet sitting service app. Your customers will be able to enter information for their pets (e.g. name, breed, and special instructions). Then, they will be able to book pet sitting appointments and will be assigned a pet sitter.

This project will reinforce the following concepts: 

1. Views, URLs, Templates, & Models
1. Authentication & Authorization
1. Forms
1. Automated Testing

You will be responsible for building this project from start to finish. You may (and _are expected to_) utilize resources such as past assignments, the Django tutorial, class examples, and the Django documentation.

## Requirements

You will be building the models, views, URLs, templates, & tests for this project. Details are as follows.

### Models

Your `models.py` file must include the following models:

1. `Pet`
  - Must have the following fields: 
    - `pet_name` - `CharField` 
    - `species` - `CharField`
    - `breed` - `CharField`
    - `weight_in_pounds` - `IntegerField` or `DecimalField` 
    - `Owner` - must be a `ForeignKey` field to the built-in `User` class
2. `Appointment`
  - Must have the following fields: 
    - `date_of_appointment` - `DateField` 
    - `duration_minutes` - `IntegerField`
    - `special_instructions` - `CharField`
    - `pet` - must be a `ForeignKey` field to the `Pet` class

Feel free to add any other fields you'd like! Right now, our site only supports making appointments for a single pet. If you'd like to support multi-pet appointments, you can swap the `pet` ForeignKey field for a `ManyToManyField`.

### Views

Your Django site must include the following views:

1. Home page - `/`
  - Must link to Pets List page & Calendar page
2. Pets List page - `pets/`
  - Must list all of the user's `Pet`s in bullet points or list items
  - Pet names must link to their detail pages using the `{% url %}` template tag
  - Must include a form to create a new pet -OR- link to a separate pet creation page
  - Should not be viewable by non-logged-in users
3. Pets Detail page - `pets/<pet_id>`
  - Must show all relevant details about that pet
  - Must list all appointments associated with that pet
  - Should not be viewable by non-logged-in users
4. Calendar Page - `calendar/`
  - Must show all upcoming appointments with all pets, ordered by soonest first
  - Should not show appointments that have already occurred _(hint: Look at the Polls Tutorial for how to do this!)_
  - Must include a form to create a new appointment -OR- link to a separate appointment creation page
  - Should not be viewable by non-logged-in users
5. Login page
6. Sign-up page

All pages should include links to log in, sign up, and (if already logged in) to log out. These links should be located in a `base.html` file.

### Tests

Your `tests.py` file(s) must include the following tests:

1. Test Pets List page
  - Create `User` and `Pet` objects, log in
  - Load the page
  - Check if `Pet`s belonging to the user appears in the result
2. Test Pets Detail page
  - Create `User`, `Pet`, and `Appointment` objects, log in
  - Load the page
  - Check if `Pet` object's details appear in the result
3. Test Pet Creation page
  - Create `User` object
  - Make a `POST` request to `pets/` with key-value pairs to create a new `Pet`
  - Check that the `Pet` object was created in the database
4. Test Appointment Creation page
  - Create `User` and `PET` object
  - Make a `POST` request to `calendar/` with key-value pairs to create a new `Appointment`
  - Check that the `Appointment` object was created in the database

## Scoring

Your work will be scored out of **140** points as follows:

| Criteria                                       | Possible  |
| ---------------------------------------------- | :-------: |
| Has `Pet` and `Appointment` classes that include appropriate fields | `15` | 
| Has a `Pets List` page that lists all pets | `5` |
| - Each Pet in list page links to its detail page | `5` |
| - Has a `Create Pet` form that creates a new pet in the database | `10` |
| Has a `Pets Detail` page that lists details about one pet | `5` |
| - Shows all appointments for that pet | `10` |
| Has a `Calendar` page that lists all upcoming appointments | `10` |
| - Lists only future appointments, sorted by earliest first | `10` |
| Has a Log In page that logs the user in | `10` |
| Has a Sign Up page that signs up a new user | `10` |
| `Pet List`, `Pet Detail`, and `Calendar` pages are only available to logged-in users | `10` |
| Tests the Pets List page | `10` |
| Tests the Pets Detail page | `10` |
| Tests the Pet Creation flow | `10` |
| Tests the Appointment Creation flow | `10` |

## Submission

Submit your finished code on [Gradescope](https://gradescope.com).

## Resources

1. [Django Authentication](https://docs.djangoproject.com/en/3.0/topics/auth/)
1. [Django Forms](https://docs.djangoproject.com/en/3.0/topics/forms/)