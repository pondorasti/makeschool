# Day 4: More Models

### Table of Contents

1. Learning Objectives
1. Review: Music Site Project (15 minutes)
1. Filters (25 minutes)
1. BREAK
1. Activity: Modeling Many-to-Many Relationships
1. ManyToManyField and Through
1. Additional Resources & Credits

## Learning Objectives (5 minutes)

1. Review models, filters, and their common usage patterns in Django.
1. Use filters to query the database for a specific subset of data.
1. Write data models for real-world scenarios.
1. Use the `Many-to-Many` and `Through` relationship to model scenarios.

## Review: Music Site Project (10 minutes)

Review the music site we created in the last lesson. You should have models for `Musician`, `Song`, and `Album`.

Try adding a field `publish_date`, of type `DateField`, to your `Album` class. How can we ensure that it is easy to migrate our existing data?

Go to your admin site and enter some data for your favorite songs and albums. Try to enter at least 5-10 data points.

If you're stuck, try cloning this [sample repository](https://github.com/meredithcat/django-music-site).

## Filters (15 minutes)

Perhaps we want to only see the songs that include a certain keyword, or are played by a certain artist. Or perhaps we want to only see albums that were published in a certain time period.

Use Django filters to enable this capability! They allow us to use a double-underscore, in conjunction with the field name, to generate results based on our unique criteria.

There are two parts to every filter: the **field name** and the **lookup expression**. If no lookup expression is specified, it defaults to `exact` (i.e. match exactly). The **field name** answers the question, "What field are we looking for?" and the **lookup expression** answers the question, "How are we comparing values?"

### Common Filters

These common filters come in handy in nearly every project:

- `Song.objects.get(id=14)`: Return *one* `Song` with `id` `14`.
- `Song.objects.filter(name="Single Ladies")`: Return 0 to many `Song`s with the `name` `Single Ladies`.
- `Song.objects.filter(name__iexact="Ocean Eyes")`: Return songs that match `Ocean Eyes` and `ocean eyes` (or any other capitalization).
- `Song.objects.filter(name__contains="Love")`: Return songs that contain the exact string `Love`, but not `love`. (For case insensitive, use `icontains`.)
- `Album.objects.filter(pub_date__gte=datetime.date(2011, 1, 1))`: Return albums that were published on or after January 1, 2011, i.e. have a publish date *greater than or equal to* 1/1/2011. (For *less than or equal to*, use `lte` instead of `gte`.)
- `Album.objects.filter(pub_date__year__range=[1980, 1990])`: Return albums that were published between 1980 and 1990, inclusive.

`.get()` will return 0 to one result, whereas `.filter()` can return 0 to many results.

### Chaining Filters

As you may have noticed in the tutorial, we can also **chain** filters' field names using the double-underscore `__`! We can use the double-underscore much as we would use **dot syntax** `.` in regular Python. Filter chaining is a feature that is built into Django.

Here is an example of filter chaining:

```py
# Find all songs written by an artist who was born between the years 1980 and 1990.
songs_by_millenial_artists = Song.objects.filter(album__artist__birth_date__year__range=[1980,1990])
```

In plain English, this means: "Find songs which have-an *album* which has-an *artist* who has-a *birth date* which has-a *year* which is in the *range* of 1980 to 1990."

The **field name** (*what are we looking for?*) for this query is `album__artist__birth_date__year`, and the **lookup expression** (*how are we comparing?*) is `range`.

### Activity: Filters (15 minutes)

With a partner, fill out the [Filters Worksheet](https://docs.google.com/document/d/1hRK2kNzNBiyhEkyfeBkaMFN7XM_x7y47hPLg-ux5cA4/edit). When you are finished, take a look at the [solution](https://docs.google.com/document/d/1l2b-uAIKt_mIbZG2Jh-6WF3aNFIkKs4cq8-0QyNIhDc/edit). 

## BREAK (10 minutes)

<!--
## Activity: Data Modeling (10 minutes)

As a class, model a Lyft/Uber competitor `MakeRide` which hires drivers to give rides to passengers. Use the whiteboard to log all relevant information for each ride.

As a class, answer the following questions about the data you collected:

1. How do we plan to _access_ the data? (E.g. Find all rides that took place between 10am and 12pm on March 3rd.) Come up with at least 3-5 examples.
1. What are the _nouns_ we want to track? (E.g. Driver, Rider, Place.) These will be our database models.
1. What are the _relationships_ between these models? E.g. How is a driver related to a rider?

Go over the answers and construct a data model for `MakeRide`.
-->

## ManyToManyField and Through (25 minutes)

Here is an example of a many-to-many relationship using a `through` class. 

```py
from django.db import models

class Person(models.Model):
    name = models.CharField(max_length=128)

    def __str__(self):
        return self.name

class Group(models.Model):
    name = models.CharField(max_length=128)
    members = models.ManyToManyField(Person, through='Membership')

    def __str__(self):
        return self.name

class Membership(models.Model):
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    group = models.ForeignKey(Group, on_delete=models.CASCADE)
    date_joined = models.DateField()
    invite_reason = models.CharField(max_length=64)
```

This way, we can track more information about the relationship between two models. Even if you don't specify a `Through` table, Django will create one anyway, so it is usually better to be more explicit about the relationship.

We can interact with our data models as follows:

```py
>>> ringo = Person.objects.create(name="Ringo Starr")
>>> paul = Person.objects.create(name="Paul McCartney")
>>> beatles = Group.objects.create(name="The Beatles")

>>> m1 = Membership(person=ringo, group=beatles,
...     date_joined=date(1962, 8, 16),
...     invite_reason="Needed a new drummer.")
>>> m1.save()

>>> beatles.members.all()
<QuerySet [<Person: Ringo Starr>]>

>>> ringo.group_set.all()
<QuerySet [<Group: The Beatles>]>

>>> m2 = Membership.objects.create(person=paul, group=beatles,
...     date_joined=date(1960, 8, 1),
...     invite_reason="Wanted to form a band.")

>>> beatles.members.all()
<QuerySet [<Person: Ringo Starr>, <Person: Paul McCartney>]>
```

## Activity: Modeling Many-to-Many (20 minutes)

With your partner, choose one of the following scenarios and write a data model, including a `Through` class. 

1. EventBrite: `Attendee` and `Event` with "through" class `Ticket`
1. Patreon: `Creator` and `Subscriber` with "through" class `Subscription`
1. LinkedIn: `Employee` and `Company` with "through" class `Employment`

If you finish early, switch partners and write another.


## Wrap-Up

Continue working on the [Tutorial Part 3](https://docs.djangoproject.com/en/2.2/intro/tutorial03/) (Views & URLs) and [Homework 2](Projects/02-books-site).

Fill out the [Vibe Check](https://make.sc/bew1.2-vibe-check) form to let your instructor know of any thoughts or feelings you'd like to share about the class!

## Additional Resources & Credits

- [Many-to-Many Fields](https://docs.djangoproject.com/en/3.0/topics/db/examples/many_to_many/)
- [Django: Extra Fields on Many-to-Many](https://docs.djangoproject.com/en/3.0/topics/db/models/#extra-fields-on-many-to-many-relationships)
- [Django Book: Chapter 2, Models](https://djangobook.com/mdj2-models/)
