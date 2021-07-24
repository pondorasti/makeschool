# Provisioning a Remote Database on Heroku

## Why We're Doing This

🤔 You may be asking yourself the following questions:

- *I thought we stored our data using SQLite?!*
- *Isn't that just a file in our repository?*
- *Why do we need to create and use a whole new database?*

Our development environment uses SQLite. It's an excellent tool for day to day development — but it often doesn't work on many platforms used to deploy and manage server-side applications. PostgreSQL (or Postgres) is the most popular database deployed amongst real-world Django projects.

⁉️ ***Never heard of Postgres? Don't worry, let's walk through setting up our first database together!***

## Steps to Create a Remote Database

**1**: Add a free database instance to your Heroku application by running the following command in your terminal:

```bash
heroku addons:create heroku-postgresql:hobby-dev
```

**2**: Add `dj-database-url` and `psycopg2-binary` to your `requirements.txt` file.

**3**: Add these two lines to the bottom of `settings.py`:

```python
import dj_database_url
db_from_env = dj_database_url.config()
DATABASES['default'].update(db_from_env)
```

This code will parse the values of the `DATABASE_URL` environment variable and convert them to something Django can understand.

**4**: Push to Heroku to complete the database setup:

```bash
git push heroku master
```
