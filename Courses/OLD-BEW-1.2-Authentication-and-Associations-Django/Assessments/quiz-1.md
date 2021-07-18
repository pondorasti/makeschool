# Quiz 1 Study Guide

The first half of this quiz will assess your knowledge of how to start a project and how to write simple URLs and views. However, you should focus the majority of your time on studying models, model fields, and their implications, which will be the focus of the second half of the quiz.

### Starting a Project

- Recall the Terminal commands for accomplishing the following tasks:
  - Start a new project
  - Create a new app within a project
  - Create a superuser

### Views & URLs - Part 1

- Explain how the server decides which page to show for a given URL.
- Given a URL configuration, write a view function to correspond to a URL.
- Given a view function, write a URL configuration to correspond to the view.

### Models

- Given a scenario with real-world objects, write model definitions to correspond to those objects.
- Use the `TextField`, `CharField`, `BooleanField`, `IntegerField`, and `DateTimeField` to model object attributes.
- Use the `ForeignKey` and `ManyToManyField` field types to model relationships between objects.
- Describe the purpose of the `through` field option when modeling a many-to-many relationship, and write a `through` model for a given relationship.
- Query objects in a database using `.get()` and `.filter()`.
- Describe the purpose of model migrations and list the commands used to migrate your models.