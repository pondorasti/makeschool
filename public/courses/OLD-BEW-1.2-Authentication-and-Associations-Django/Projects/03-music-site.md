# Homework 3: Music Site 

## Purpose (Why should I do this?)

This assignment is designed for you to practice connecting URLs, views, templates, and models in Django in order to build out list and detail pages for `Musician`s and `Song`s. These are very important skills that you will use in nearly any full-stack project.

You will be responsible for building this project from start to finish. You may (and _are expected to_) utilize resources such as past assignments, the Django tutorial, class examples, and the Django documentation.

## Requirements

Your Django site must include the following pages:

1. Musician List page
  - Must list all `Musician` objects in bullet points or list items
  - `Musician` names must link to their detail pages using the `{% url %}` template tag
2. Musician Detail page
  - Must show any relevant details about that musician
  - Must list all albums by that musician in bullet points or list items
  - Each album should link to its Album Detail page using the `{% url %}` template tag
3. Album Detail Page
  - Must show any relevant details about that album
  - Must list all songs on that album in bullet points or list items
  - Each song should link to its Song Detail page using the `{% url %}` template tag
4. Song Detail page
  - Must show any relevant details about the song, including its album and musician

### Stretch Goals

1. Add Bootstrap styling!
1. Include a "New Musician", "New Album", or "New Song" page that creates a new model instance

## Scoring

Your work will be scored out of **65** points as follows:

| Criteria                                       | Possible  |
| ---------------------------------------------- | :-------: |
| Has a `Musician List` page that lists all musicians |    `10`    |
| - Each Musician in list page links to its detail page |   `5`    |
| Has a `Musician Detail` page that lists all albums by that musician |    `10`    |
| - Displays at least 1 relevant detail about the Musician (e.g. their age) | `5` |
| - Each Album in musician page links to its detail page |   `5`    |
| Has an `Album Detail` page that lists all songs on that album |    `10`    |
| - Displays at least 1 relevant detail about the album (e.g. its publish date) | `5` |
| - Each Song in album page links to its detail page |   `5`    |
| Has a `Song Detail` page that lists details about one song |    `10`    |
| **TOTAL**                                  | **`65`** |

## Starter Code

If needed, check out the starter code [here](https://github.com/meredithcat/django-music-site) which includes the `Musician` and `Song` models - however I encourage you to build your own or use your code from class!

## Resources

1. [Django Class-based Views](https://docs.djangoproject.com/en/3.0/topics/class-based-views/)
1. [Django Templates](https://docs.djangoproject.com/en/3.0/topics/templates/)
