# MakeWiki Challenges

### Table of Contents

1. [Authentication & Authorization](#authentication--authorization)
2. [Core Application](#core-application)

## Authentication & Authorization

### Login & Logout

- [ ] Add the provided Django authentication views to the project's URLconf.
- [ ] Test `/accounts/login` in your browser --- see if you can log in using username `admin` and password `djangopony`.
- [ ] In `base.html`, hide the `New Page` and `Log Out` buttons for unauthenticated users.
- [ ] When a user clicks `Log Out`, they are logged out of the system, and returned to the homepage.
- [ ] When a user clicks `Log In`, they are navigated to the Login page.
- [ ] Replace `Hello, USERNAME` text with the username of the logged-in user, and only show it when the user is logged in.

### Signup

- [ ] Create a new app named `accounts`. Add it to the `INSTALLED_APPS` list in `settings.py`.
- [ ] Create a view for signing up:
    - [ ] Must subclass `django.views.generic.CreateView`.
    - [ ] Set `form_class` to `django.auth.forms.UserCreationForm`.
    - [ ] Render the `registration/signup.html` template.
- [ ] In `accounts/urls.py`, link `SignupView` to a URL named `signup`.
- [ ] Add `accounts.urls` to the project's URLconf.
- [ ] When a user clicks `Sign Up`, they are presented with a form to create an account, and can submit it successfully.

### Stretch Challenges

- [ ] Add a `Forgot Password` link to the Log in page.

---

## Core Application

### Challenges

#### `makewiki/urls.py`

- [ ] Uncomment the `path()` for the `wiki` app below. Use it to direct any request (except `/admin` URLs) to the the `wiki` app's URL configuration. Use the above docstring to guide you if you feel stuck.
- [ ] Make sure Django doesn't give you any warnings or errors when you execute `python manage.py runserver`.

#### `wiki/views.py`

`PageListView`:

- [ ] On `GET`, display a homepage that shows all Pages in your wiki.
- [ ]  Replace the CHALLENGE text with a descriptive docstring for `PageListView`.
- [ ] Replace `pass` below with the code to render a template named `list.html`.

#### `wiki/urls.py`

 - [ ] Refactor the URL named `wiki-list-page` and point it to the root route (`/`).
      - Make sure Django doesn't give you any warnings or errors when you execute `python manage.py runserver`.
      - Test by visiting http://127.0.0.1:8000/.
- [ ] Refactor the URL named `wiki-details-page` to show the `DetailsView` for any `Page` that exists.
      - Use the `slug` field in the `Page` model to accomplish this.
      - DO NOT CHANGE the `name` argument.
      - Test by visiting http://127.0.0.1:8000/title-slug in your browser.

#### `templates/base.html`

- [ ]  `📓 Pages`: Replace `#` with the `url` template tag.

---

### Stretch Challenges

#### `wiki/models.py`

- [ ]  Add time zone support for `created` and `modified` dates if you're receiving the warning below:

    ```python
    RuntimeWarning: DateTimeField received a naive datetime (YYYY-MM-DD HH:MM:SS) while time zone support is active
    ```

- [ ]  Add the ability to update the slug when the Page is edited.

#### `wiki/views.py`

- [ ] Import the `PageForm` class from `forms.py`.
    - This `ModelForm` enables editing of an existing `Page` object in the database.
- [ ]  On `GET`, render an edit form below the page details.
- [ ]  On `POST`, check if the data in the form is valid.
    - If `True`, save the data, and redirect back to the `DetailsView`.
    - If `False`, display all the errors in the template, above the form fields.
- [ ] Instead of hard-coding the path to redirect to, use the `reverse` function to return the path.
- [ ] After successfully editing a `Page`, use Django Messages to "flash" the user a success message: "REPLACE_WITH_PAGE_TITLE has been successfully updated."
