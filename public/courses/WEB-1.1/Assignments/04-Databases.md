# Homework 5: Databases

## Purpose (Why should I do this?)

When writing your own web applications, you will nearly always need a database of some sort. This assignment will allow you to practice using the MongoDB database to create, read, update, and delete objects, as well as model one-to-many relationships.

Scoring for this project is as follows:

| Score | Rating | Correctness | Code Quality |
| :---: | :----: | :---------: | :----------: |
| **1** | **Needs Improvement** | Required sections of submission are largely missing or not functional. | Code is messy and hard to follow. Code includes TODOs or does not include docstrings for most routes. |
| **2** | **Basic** | Most routes are functional, but a few may be hard-coded or incorrect. | Some routes have code that is messy and hard to follow. Some routes do not include docstrings. |
| **3** | **Proficient** | All routes are functional and produce the expected result. | Code is clear and easy to follow. Submitted code does not include TODOs. Nearly all functions have docstrings. |
| **4** | **Advanced** | Stretch challenges are complete and demonstrate an advanced understanding of the concepts presented. | Code is extensible and may utilize helper functions, classes, or advanced data structures to aid in readability. |

## Getting Started

There's quite a lot of setup for this assignment! I've broken it down into a few parts.

### GitHub

If you haven't yet, create a folder to contain your work for this course. If you put it in the `/dev/courses` folder, then the full path would be something like `/dev/courses/web1.1`.

In a terminal window, navigate to your newly created folder and clone the [starter code](https://github.com/Make-School-Labs/WEB-1.1-Homework-5-Databases-Starter):

```
git clone git@github.com:Make-School-Labs/WEB-1.1-Homework-5-Databases-Starter.git Homework-5-Databases
```

Next, go to [GitHub.com](https://github.com) and create a new repository for your project. **IMPORTANT: Make sure the box for "Initialize with a README" is NOT checked**. Then, run the following commands to push your starter code to GitHub:

```
git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin master
```

Refresh the page in your newly-created GitHub repo to make sure your changes were successfully pushed.

#### Set Upstream

Next, let's connect your local clone of this course repo to the upstream repo on GitHub so that you can pull in any changes or updates made.

Add the starter code’s upstream repo as another remote to your local repo:

```
git remote add upstream git@github.com:Make-School-Labs/WEB-1.1-Homework-4-Starter.git
```

Verify that you have two remotes: `origin` (with your username in the URL) and `upstream` (with Make-School-Labs) with `git remote -v`.

When you want to access new starter code for future assignments, first be sure you’ve committed and pushed your recent work (run `git status` to check) and then pull from the course’s upstream repo with `git pull upstream master`.

### Running a MongoDB Server

Follow the [MongoDB Setup Instructions](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/) to install and run a MongoDB server on your computer.

Install with the command:

```
brew install mongodb-community@4.4
```

And run with the command:

```
brew services start mongodb-community@4.4
```

This will run a MongoDB server on the local URL `localhost:27017`, which will only be reachable from your machine. That's fine for now, because you'll also be running the Flask server on your machine, on `localhost:5000`.

### Installing Packages - Virtual Environment

If you'd like, you can use a [Python virtual environment](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/) for this assignment. This will allow you to install Python packages _only_ for this assignment, so that they won't "pollute" your global environment. If you choose _not_ to do this step, please skip to the "Installing Packages - No Virtual Environment" section.

To create a new virtual environment, navigate to your project's directory, and enter the command:

```bash
python3 -m venv env
```

This will create a folder called `env` within your project directory that will hold a copy of all installed packages. **IMPORTANT: DO NOT SUBMIT YOUR VIRTUAL ENVIRONMENT TO GRADESCOPE.** If you do, it'll freeze the website and I won't be able to grade your work. :-(

To activate your virtual environment, navigate to your project directory and enter the command:

```bash
source env/bin/activate
```

Once you've activated your virtual environment, enter the following command to install all packages needed for this assignment:

```bash
pip3 install -r requirements.txt
```

When you're finished working on this project, you can deactivate your virtual environment with the command:

```bash
deactivate
```

### Installing Packages - No Virtual Environment

If you choose not to use a virtual environment, simply navigate to your project's directory and enter the following command to install all required packages:

```bash
pip3 install -r requirements.txt
```

## Instructions

### Getting Used to the Codebase

Once you have cloned the starter code, navigate to the project directory and run:

```
python3 app.py
```

to start the server. Open up the site in your local browser, and click around to see what you can do! You should be able to visit the `plants_list`, `about`, `create`, `detail`, and `edit` pages. Read over the code in `app.py` and `templates/` to get a feel for how the code works together to display each page.

### Create a Plant

The first thing to do is to get the create route working! Complete the TODOs in the app's `create()` route, then run the code and try creating a few plants!

Note that this route is a little bit special, as it accepts both a `GET` and a `POST` request, so it is essentially doing double duty. We'll use if/else statements to do something different depending on if the user is viewing the form (`GET`), or submitting the form (`POST`).

**HINT**: If you're having trouble with this step, look at examples of using the [insert_one](https://api.mongodb.com/python/current/api/pymongo/collection.html#pymongo.collection.Collection.insert_one) operation!

Use the [Robo 3T program](https://robomongo.org/) to inspect the contents of your database and verify that the data was added.

### List Plants

Now that we've got a few plants in the database, the next step is to show all plants on the homepage!

Complete the TODOs in the app's `plants_list()` route to get all plants in the database, then complete the TODOs in the `plants_list.html` template to show all plants. Make sure you use a for loop to loop over the list of results!

**HINT**: If you're having trouble with this step, look at examples of using the [find](https://api.mongodb.com/python/current/api/pymongo/collection.html#pymongo.collection.Collection.find) operation!

### Plants Detail

Usually if a website lists many objects, you'll want to have a way to "zoom in" on a single object and see all of its relevant details.

Complete the TODOs in the `detail()` route, as well as in the `detail.html` template, to get the plant with the requested id and pass it to the template, then display its information.

**HINT**: If you're having trouble with this step, look at examples of using the [find_one](https://api.mongodb.com/python/current/api/pymongo/collection.html#pymongo.collection.Collection.find_one) operation!

### Add a Harvest

Complete the TODOs in the `harvest()` route to process the results of the form on the detail page. Then, modify the `detail.html` page to use a for loop to display all harvests.

### Edit Plant

Note that this route is a little bit special, as it accepts both a `GET` and a `POST` request, so it is essentially doing double duty. We'll use if/else statements to do something different depending on if the user is viewing the form (`GET`), or submitting the form (`POST`).

Complete the TODOs in the `edit()` route to take the results of the form and use them to update the specified plant. If the user is merely viewing the form, we should show that object's current data so that the user knows what they're editing. Complete the rest of the TODOs in the `edit()` route and the `edit.html` template to show the current values of the plant being edited.

**HINT**: If you're having trouble with this step, look at examples of using the [update_one](https://api.mongodb.com/python/current/api/pymongo/collection.html#pymongo.collection.Collection.update_one) operation!

### Delete Plant

Complete the TODOs in the `delete()` route to delete the plant with the given id.

**HINT**: If you're having trouble with this step, look at examples of using the [delete_one](https://api.mongodb.com/python/current/api/pymongo/collection.html#pymongo.collection.Collection.delete_one) operation!

## Stretch challenges

Stretch challenges are totally up to you! Here are some ideas you may want to consider:

1. **Error Handling**: If the plant with the given `_id` doesn't exist, show a custom 404 page.
1. **Styles Level Up**: Customize the HTML code or `style.css`!
1. **More Resources**: Try adding more resources to the database!

## Submission

When you're ready to submit your work, make sure you push all of your changes to GitHub:

```bash
git add .
git commit -m'Completed all challenges'
git push
```

Then, submit your assignment using [Gradescope](https://gradescope.com).