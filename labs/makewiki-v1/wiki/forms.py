from django import forms
from wiki.models import Page


class PageForm(forms.ModelForm):
    """ Render and process a form based on the Page model. """
    model = Page
