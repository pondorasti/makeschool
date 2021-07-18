# Final Exam Study Guide

## Final Exam Format

The final exam will be a written assessment, with questions spanning the topics discussed over the course of BEW 1.2.

One double-sided 8.5x11 page of hand-written notes will be allowed.

## Topics

The following topics will be covered:

### Starting a Project

- Identify commands used to start a project, create an app, migrate models, enter commands in the shell, and run tests

### Models

- Use `.filter()` and `.get()` to query objects in a database
- Use Django filters to get all objects matching a particular query
- Create, save, and update models
- Iterate over a QuerySet of objects to see all results

### Views & URLs

- Explain the differences between function-based & class-based views; give examples of each
- Given a URLs file, write the `{% url %}` template tag or `reverse()` call to generate a particular URL
- Write a function-based view that queries for a particular model and renders a template

### Templates

- Given a model and view, write a template to display the data, using for loops / if statements

### Forms

- Given a form class & view, write a template to display the form using `as_p()`
- Match a form class to its HTML output


### Authentication

- Describe the difference between authentication & authorization; give examples of each

### Testing

- Explain the differences between unit tests & integration tests; given a test scenario, identify which is most appropriate

### Static Files

- Given a `static` directory, use the `{% static %}` template tag to generate a link to a static image file