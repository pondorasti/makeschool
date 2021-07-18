from django.urls import path

"""
  CHALLENGES:
    1. Refactor the URL named `wiki-list-page` and point it to the root route (`/`).
      - Make sure Django doesn't give you any warnings or errors when you execute `python manage.py runserver`.
      - Test by visiting http://127.0.0.1:8000/.
    2. Refactor the URL named `wiki-details-page` to show the DetailsView for any Page that exists.
      - Use the slug field in the Page model to accomplish this.
      - DO NOT CHANGE the `name` argument.
      - Test by visiting http://127.0.0.1:8000/w/title-but-replace-spaces-with-dashes in your browser.
  """

urlpatterns = [
    # path('REPLACE_ME_WITH_ROOT_ROUTE', REPLACE_ME_WITH_VIEW.as_view(), name='wiki-list-page'),
    # path('REPLACE_ME_WITH_SLUG', REPLACE_ME_WITH_VIEW.as_view(), name='wiki-details-page'),
]
