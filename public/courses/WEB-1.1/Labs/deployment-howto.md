# Deploy to Heroku

Congratulations - you have now completed (several) Flask applications, and you're ready to deploy!!

To do this, we'll use a service called [Heroku](https://heroku.com) that is free, but it does require a credit card to be on file.

Make sure to read the following instructions carefully. If you get an error message that is not mentioned, reach out to your isntructor or try using Stack Overflow for help!

## Before you Start

Before starting, let's go over some terminology we'll use in the instructions:

- `databaseName` - The name of the database used in your application.
- `uniqueprojectname` - A unique name for your project that you'll use for the Heroku URL. This is the one that your "beta" users will see in the URL! If your chosen name is taken, Heroku will instruct you to choose a new one.

Be sure to replace these with your _actual_ database & project names! Otherwise, your code may not work properly.

## Step 1: Sign up for & Install Heroku

First you need to create a Heroku account at [heroku.com](https://heroku.com). The service is free, but will require you to have a credit card on file.

Then you will need to add the Heroku Command Line Interface (CLI) to your bash terminal so we can interact with the Heroku service via the terminal and git. Follow [these instructions](https://devcenter.heroku.com/articles/heroku-cli) to install the Heroku CLI.

## Step 2: Install Gunicorn

Heroku does not provide a web server, and the Flask web server is not well-suited for production use because it is single-threaded. If we want our server to perform well when multiple users make requests simultaneously, then we should use a multi-threaded web server. We will be using **gunicorn**.

### If you are using a Virtual Environment

If you're using a virtual environment, make sure to **activate** it, then run the following commands in your project folder to install gunicorn and update your `requirements.txt` file:

```bash
pip3 install gunicorn

pip3 freeze > requirements.txt
```

### If you are not using a Virtual Environment

If you're not using a virtual environment, simply update your `requirements.txt` file so that it has the following contents:

```
click
Flask
Flask-PyMongo
gunicorn
itsdangerous
Jinja2
MarkupSafe
pymongo
Werkzeug
```

Make sure to also add any other Python libraries you are using!

## Add your Procfile

Before we push to Heroku, we'll have to create a special file, called `Procfile`, that lets Heroku know how to run your website.

Create a new file called `Procfile` (no file extension) and give it the following contents:

```
web: gunicorn app:app
```

Great! When we push to Heroku, it'll know how to run our application.

## Push to Heroku using GitHub

Let's start by committing what we have so far so that we have that `Procfile`. Commit your code change using the following commands:

```bash
git add .
git commit -m 'add Procfile'
```

Now, let's use the `heroku` command to create a heroku app and name it with `uniqueprojectname`. This `heroku create` command will also add our heroku app as a git remote repository that we will be able to push to using the git command `git push`.

```bash
heroku create uniqueprojectname
```

We can see our remote repos by using the command `git remote -v`. Once you run this command, you should now see that you have **two** remotes: one for GitHub, and one for Heroku:

```bash
git remote -v
```

Great, now we can push our code to heroku and open our new website!

```
git push heroku master
heroku open
```

You are probably seeing an error screen right now! Bit of a let down maybe. But also a good lesson - **Things never work the first time**. Let's debug our issues.

## Read the Logs

Whenever you have an error or problem with Heroku, you can see the logs by running `heroku logs`.

```bash
heroku logs
```

If you want to see the logs to continually you can add --tail to this command.

```bash
heroku logs --tail
```

What error are we seeing in heroku now? What do we need to do?

## Adding a Production Database with MongoDB Atlas

It looks like the error is that we cannot connect to our mongodb database. That's because it is looking at the `'mongodb://localhost:27017'` URI, but that is running on our local computer and Heroku, which is remote, doesn't have access to that. So we have to switch to MongoDB Atlas.

If you haven't yet, follow the steps in [this tutorial](https://docs.atlas.mongodb.com/getting-started/) to set up a MongoDB Atlas cluster. Make sure to create a database user with username & password!

Then, go to the `Clusters` page and click on `Connect`, followed by `Connect your application`:

<img src="Labs/Assets/atlas-connect.png" width="100%">

Make sure to select the driver of `Python`, version `3.11 or later`, and click the checkbox for `Include full driver code example`. Then click the `Copy` button to copy the code:

<img src="Labs/Assets/atlas-copy-code.png" width="80%">

Then, copy that into your application's `app.py` file. If your application already has database setup code, replace it with the new code. Make sure to swap out the username, password, and DB name as in the following code example!

Your MongoDB connection code should look something like:

```py
from pymongo import MongoClient
from dotenv import load_dotenv

# Set up environment variables & constants
load_dotenv()
MONGODB_USERNAME = os.getenv('MONGODB_USERNAME')
MONGODB_PASSWORD = os.getenv('MONGODB_PASSWORD')
MONGODB_DBNAME = 'mydb'

app = Flask(__name__)

client = MongoClient(f"mongodb+srv://{MONGODB_USERNAME}:{MONGODB_PASSWORD}@cluster0.idqxn.mongodb.net/{MONGODB_DBNAME}?retryWrites=true&w=majority")
db = client[MONGODB_DBNAME]
```

Then, make sure to add the following lines to your `.env` file with your database user's username and password (or create the file, if it doesn't exist yet):

```
MONGODB_USERNAME=yourusernamegoeshere
MONGODB_PASSWORD=yourpasswordgoeshere
```

After you update your code, you will need to add the `pymongo`, `python-dotenv`, and `dnspython` packages to your `requirements.txt` file as well.

Now we just need to tell Heroku about these environment variables! In your terminal, enter the following, making sure to use your **actual** username and password:

```bash
heroku config:set MONGODB_USERNAME=yourusernamegoeshere
heroku config:set MONGODB_PASSWORD=yourpasswordgoeshere
```

Then, verify that these have been added by running:

```bash
heroku config
```

Next, follow the steps again to `git add`, `git commit`, and `git push heroku master` to ensure that our changes are reflected in Heroku.

```bash
git add .
git commit -m 'Update deployment settings'
git push heroku master
```

Now if we try to open our heroku app via the terminal using heroku open, what happens?

## If you ran into other issues...

If your application still doesn't load, you may have other issues to fix! Read over the logs file with `heroku logs --tail` and try doing a Google search for the specific error message you see. If you get a Python or Jinja error, make sure to debug locally first! 

## If your deployment was successful...

Awwww yeah - you did it! You made your first RESTful and Resourceful app using Flask, Jinja2, and MongoDB!

Make sure to push your changes to GitHub (which DOES NOT happen automatically if you push to Heroku):

```bash
git push origin master
```

If you're interested in taking your deployment skills to the next level, check out the [BEW 2.2 - Docker, DevOps, & Deployments](https://make.sc/bew2.2) course.