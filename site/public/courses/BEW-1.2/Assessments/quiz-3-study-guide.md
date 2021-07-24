# Quiz 3: Authentication & Testing

You should be able to...

- **Authentication**:
  - Explain the diference between authentication & authorization.
  - Given a Python or Jinja2 code snippet, complete the code to display the currently logged in user's username using `current_user`.
  - Explain why it is important to store the user's hashed password in the database, instead of the plaintext password.
  - Use the bcrypt `generate_password_hash` and `check_password_hash` functions to complete a code snippet to generate & verify passwords.
  - Explain how the `next` query parameter is used to redirect the user to the appropriate page.
- **Testing**:
  - Explain how writing unit tests can improve our code.
  - Given a Python function, write a unit test to verify that it works correctly under certain conditions.
  - Complete a route test for a `GET` or `POST` route to verify that it works correctly.