from flask import Flask, render_template, request
import requests

# Set up 'app' variable
app = Flask(__name__)

# The App ID for the OpenWeatherMap API. This is kind of like our login 
# credentials.
APP_ID = '2608f679d4594364525f6c6cc2246c79'

# The base URL of the OpenWeatherMap API.
BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'


def kelvin_to_fahrenheit(temp_kelvin):
    """Converts a temperature in degrees Kelvin to degrees Fahrenheit, 
    and returns the result."""
    return temp_kelvin * 9/5 - 459.67


@app.route('/')
def homepage():
    """Return HTML content of homepage."""

    # TODO: Write an HTML form:
    # 1. Create a form tag whose action goes to the URL "/results"
    # 2. In between the opening and closing form tags, create an input tag
    #    that takes in text and named "city"
    # 3. Also in between the form tags, add a submit button with text "Search"
    # More info on Forms: https://www.w3schools.com/html/html_forms.asp
    return """
        Your HTML code goes here!
    """


@app.route('/results')
def results_page():
    """Return HTML content of results page showing a city's temperature."""

    # TODO: Get the user's city from the `city` query parameter of the URL using
    # the `request.args.get()` function and store it in a variable called 
    # `users_city`.
    # E.g. if our URL looks like: http://localhost:5000/results?city=San+Francisco
    # We want to get the string "San Francisco".


    # TODO: Return the 'users_city' variable to the web browser.
    
    return ""


if __name__ == "__main__":
    app.run(debug=True)