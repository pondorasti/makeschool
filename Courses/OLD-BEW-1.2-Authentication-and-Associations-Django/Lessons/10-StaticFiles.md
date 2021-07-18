# 📜 Day 10: Static Files


### ⏱ Agenda

1. [[**05m**] 🏆 Objectives](#05m--objectives)
2. [[**15m**] ✓ Review: Static Files](#15m--review-static-files)
3. [[**30m**] 💻 Activity: Serve Static Files](#30m--activity-serve-static-files)
4. [[**10m**] 🌴 BREAK](#10m--break)
5. [[**15m**] 💻 Activity: Peer Proposal Review](#15m--activity-peer-proposal-review)
6. [[**45m**] 💻 Activity: Kickoff Contractor Project](#45m--activity-kickoff-contractor-project)
7. [🌃 After Class](#-after-class)
8. [📚 Resources & Credits](#-resources--credits)


## [**05m**] 🏆 Objectives

1. Recall the patterns needed to implement static files as introduced by the Django Tutorial.
2. Practice implementing static files in the MakeWiki project.
3. Review project proposals and kick off Contractor Project development.

## [**15m**] ✓ Review: Static Files

The ability to serve static files comes from `django.contrib.staticfiles`, which is included in your `INSTALLED_APPS` list by default when you start a new Django project.

**To include static files in your project, follow these steps**:

1. Make sure that `django.contrib.staticfiles` is included in your `INSTALLED_APPS`.
1. In your settings file, define `STATIC_URL`, for example:

      ```python
      STATIC_URL = '/static/'
      ```

1. Your project will probably also have static assets that aren’t tied to a particular app. In addition to using a `static/` directory inside your apps, you can define a list of directories (`STATICFILES_DIRS`) in your settings file where Django will also look for static files. For example:

    ```python
    STATICFILES_DIRS = [
        os.path.join(BASE_DIR, "static"),
    ]
    ```

1. Add the following code to your root URLconf to serve static URLs:

   ```python
   from django.conf import settings
   from django.conf.urls.static import static

    urlpatterns = [
        # ... the rest of your URLconf goes here ...
    ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    ```

1. In your templates, use the static template tag to build the URL for the given relative path to your image.

      ```html
      {% load static %}
      <img src="{% static "my_app/example.jpg" %}" alt="My image">
      ```

## [**30m**] 💻 Activity: Serve Static Files

**CHALLENGE**:

1. Create a `static` folder in the root of your `makewiki` repository.
2. Find an image online that you like, then save it inside the new `static` folder.
3. Follow the steps listed above to enable static files in your above in your makewiki project.
4. Edit the `list.html` template to show the image somewhere on the screen!

## [**10m**] 🌴 BREAK

## [**45m**] 💻 Activity: Kickoff Contractor Project

Begin work on your Contractor Project. Your instructor will be reviewing your proposals during this time, and will chat with you one on one to clarify your project, if required. Be ready for feedback!

## 🌃 Wrap-Up

Continue working on your Contractor Project.

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## 📚 Resources & Credits

- [**Django Docs**: Serving Static Files in Development](https://docs.djangoproject.com/en/2.2/howto/static-files/)
