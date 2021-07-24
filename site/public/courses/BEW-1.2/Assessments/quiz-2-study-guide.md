# Quiz 2: Forms & Authentication

You should be able to...

- **Models**:
    - Given model definitions containing columns and relationships, write Python code to: 
        - Create new model instances
        - Update model instances
        - Read all model instances that fit a specific criteria
    - Given an ERD describing relationships between entities, identify the correct model definition code to match (or vice versa).
- **Forms**:
    - Explain how using form classes improves code style and/or readability.
    - Given a form class definition, write Python code to create a form instance, check if it's valid, and use the form data to create a model instance.
    - Given a form class definition, write Jinja template code to display the form fields, as well as any errors.
- **Authentication**:
  - Explain the diference between authentication & authorization.
  - Given a Python or Jinja2 code snippet, complete the code to display the currently logged in user's username using `current_user`.
  - Explain why it is important to store the user's hashed password in the database, instead of the plaintext password.
  - Use the bcrypt `generate_password_hash` and `check_password_hash` functions to complete a code snippet to generate & verify passwords.
