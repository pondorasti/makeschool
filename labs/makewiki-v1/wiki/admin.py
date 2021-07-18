from django.contrib import admin
from wiki.models import Page


class PageAdmin(admin.ModelAdmin):
    """ Show helpful fields on the changelist page. """
    list_display = ('title', 'slug', 'author', 'created', 'modified')


admin.site.register(Page, PageAdmin)
