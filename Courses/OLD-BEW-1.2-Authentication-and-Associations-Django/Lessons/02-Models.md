# Day 3: Models & ForeignKey

### Table of Contents

1. Learning Objectives (5 minutes)
1. Tutorial Review (10 minutes)
1. Models Overview (30 minutes)
1. Break
1. Activity: Models (25 minutes)
1. Activity Review (15 minutes)
1. Wrap Up (5 minutes)
1. Additional Resources

## Learning Objectives (5 Minutes)

1. Identify and describe different types of Django model fields.
1. Use `ForeignKey` fields to model relationships between everyday objects
1. Query for Model instances using Django's command line tool.

## Tutorial Review (10 Minutes)

Go through [Part 2](https://docs.djangoproject.com/en/2.2/intro/tutorial01/) of the tutorial and go over any questions.

## Models Overview (30 Minutes)

Bring up your `music` app from last class session. We'll be adding some new functionality to it.

Let's take a look at some Model code using a `ForeignKey` field. You can add this to `music/models.py` file.

```py
from django.db import models

class Musician(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Song(models.Model):
    artist = models.ForeignKey(Musician, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    num_stars = models.IntegerField()

    def __str__(self):
        return self.name
```

### Tell Django about our Models

If you haven't yet, in `music_site/settings.py`, enter the following line into the `INSTALLED_APPS` list:

```py
INSTALLED_APPS = [
    ...,
    'music'
]
```

Then register the models in `music/admin.py`:

```py
from django.contrib import admin
from . import models

admin.site.register(models.Song)
admin.site.register(models.Musician)
```

### Migrate the Models

- Migrations inform the database about any changes to your models.
- You make and apply migrations when creating new models, or changing an existing model.
- Migrations can be applied by any developer on the team to ensure their local database structure is compatible with the current models.

We can do a migration using the following commands:

1. `python manage.py makemigrations`
2. `python manage.py migrate`

### Check out the Admin site

Watch as your instructor demonstrates how to access and use the Django admin site.

### Create/Update a new Model Entry

We can create a model in one of two ways. The first is to explicitly call `save()`:

```py
a1 = Article(title='All About Django')
a1.save()
```

The second way is to use `.create()`:

```py
a1 = Article.objects.create(title='All About Django')
```

What if we want to *update* a model after it's already been created? We can retrieve it, update its fields, then save it again:

```py
a1 = Article.objects.get(title='All About Django')
a1.pub_date=datetime.date(2020, 3, 1)
a1.save()
```

Run `python3 manage.py shell` to start the interactive shell.

```py
>>> from music.models import Musician, Song

>>> Musician.objects.all()
<QuerySet []>

>>> m1 = Musician(name='Journey')
>>> m1.save()

>>> s1 = Song(name='Don\'t Stop Believing', artist=m1, num_stars=5)
>>> s1.save()

>>> # Update the model and save it again
>>> s1.num_stars = 4
>>> s1.save()
```

### Query our Database Entries

Now, how can we interact with these models? Let's try it out!

```bash
>>> from music.models import Musician, Song

>>> Musician.objects.all()
<QuerySet [<Musician: Journey>]>

>>> s1 = Song.objects.get(id=1)
>>> m1 = s1.artist

>>> s1.artist
<Musician: Journey>

>>> m1.song_set
<QuerySet [<Song: Don't Stop Believing>]>
```

## BREAK

## Activity: Models (30 minutes)

With a partner, write a model for `Album` and add it to your `models.py` file. As you work, answer the following questions:

- What are the relationships between `Musician`, `Album`, and `Song`? Are `Musician` and `Song` still related? Is it a direct relationship (Musician has-many Songs) or indirect (Musician has-many Albums each of which has-many Songs)?

- How can you migrate the database? Try doing a database migration and see what happens.

- How can you add new objects to the database? Try adding at least one Album object.

After you finish the activity, take a look at the [sample solution](https://github.com/meredithcat/django-music-site/blob/master/music/models.py).

## Go over Solution (15 minutes)

Go over any misconceptions about how to create & use models. Refer to the following diagram to illustrate the connections between models & model fields.

<img src="Lessons/Assets/models-foreign-key.png" width="1000">

## Wrap Up (5 minutes)

Continue on to [Part 3](https://docs.djangoproject.com/en/2.2/intro/tutorial03/) of the tutorial and start on [Homework 2](Projects/02-books-site).

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## Additional Resources

- [Best practices working with Django models in Python](https://steelkiwi.com/blog/best-practices-working-django-models-python/)
- [Django Models documentation](https://docs.djangoproject.com/en/2.2/topics/db/models/)
- [Django Model Fields](https://docs.djangoproject.com/en/3.0/ref/models/fields/)
