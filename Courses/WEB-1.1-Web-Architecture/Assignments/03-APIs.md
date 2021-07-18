# Homework 4: APIs

## Purpose (Why should I do this?)

Sometimes, when writing an app or website, we need to get data from an external source. That's where APIs come in! Understanding how to make API calls will give you a better overall understanding of the web, and will give you the freedom of using API data to enhance your applications!

For this assignment, we'll be using the [Open Weather Map API](https://openweathermap.org/api). It's easy to use - all you need is an API key - and provides rich data on the current, forecast, and historical weather conditions in any city!

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

In a terminal window, navigate to your newly created folder and clone the [starter code](https://github.com/Make-School-Labs/WEB-1.1-Homework-4-APIs-Starter):

```
$ git clone git@github.com:Make-School-Labs/WEB-1.1-Homework-4-APIs-Starter.git Homework-4-APIs
```

Next, go to [GitHub.com](https://github.com) and create a new repository for your project. **IMPORTANT: Make sure the box for "Initialize with a README" is NOT checked**. Then, run the following commands to push your starter code to GitHub:

```
$ git remote set-url origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
$ git push -u origin master
```

Refresh the page in your newly-created GitHub repo to make sure your changes were successfully pushed.

### Weather API

Go to the [OpenWeatherMap sign-up page](https://openweathermap.org/appid) and sign up for an account. After signing up, click on the "API keys" tab and copy the API key. This is the key that you will use for making your queries.

Open the [Postman](https://www.getpostman.com/downloads/) desktop client and enter the following URL:

```
http://api.openweathermap.org/data/2.5/weather?q=YOUR_CITY_HERE&appid=YOUR_APP_ID&units=imperial
```

Replace `YOUR_CITY_HERE` with the name of a city (e.g. `San+Francisco`), and replace `YOUR_APP_ID` with the API key you obtained in Step 1.

Read over the API response in Postman. What does the data look like? What can we conclude about the weather in the specified city?

Finally, rename the file called `.env.example` in your project to `.env` and enter your API key. Do not use quotes!! Your `.env` file contents should look like:

```
API_KEY=yourapikeygoeshere
```

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

## Part 1: Current Weather Data

Open up the `app.py` file in your starter code. Complete the `TODO`s in the `results()` route to retrieve the user's choices, construct the API query parameters, check the results of the API call, and pass the resulting data to the client.

Then, open the `results.html` file and complete the TODOs to show the resulting data.

It may be helpful to read over the API documentation for the [current weather endpoint](https://openweathermap.org/current).

Also, you may want to review the [requests Quick Start Guide](https://requests.readthedocs.io/en/master/user/quickstart/) if you're having trouble understanding how the API call is being made or how the data is being passed.

## Part 2: Comparing Two Cities

Take a look at the `comparison_results.html` file. You will need to complete the TODOs to compare two cities.

The `comparison_results` route gives a bit less guidance on how to proceed, but by now, you should have a good understanding on how to make these API calls! See if you can use the hints to make your code more elegant and efficient.

## Stretch Challenges

Complete one or more of the following stretch challenges and demonstrate a higher-level understanding of the topic(s) in order to earn "stretch" points.

These are all just ideas - feel free to riff off of these to create your own stretch challenges!


### Show an Icon

The API data returned from OpenWeatherMaps includes an "icon" field that we can use to show an image of the current weather conditions (e.g. sunny, cloudy, rainy, etc). See [here](https://openweathermap.org/weather-conditions) for a list of weather conditions and their corresponding icons.

Modify the `results.html` and/or `comparison_results.html` pages to show an icon image for that day's weather conditions.

### Error Handling

Currently, the app doesn't have any error handling, so if the user enters a city that doesn't exist or a date outside of the allowed range, they are shown a generic error message. Modify the routes to show a 404 page if the user enters invalid data.

### Style Level Up

The styling in the `results.html` and `comparison_results.html` files is kind of plain - the weather conditions are just shown in bullet points. See if you can add to the styles in `static/style.css` to improve on it!

## Submission

When you're ready to submit your work, make sure you push all of your changes to GitHub:

```bash
$ git add .
$ git commit -m'Completed all challenges'
$ git push
```

Then, submit your assignment using [Gradescope](https://gradescope.com).
