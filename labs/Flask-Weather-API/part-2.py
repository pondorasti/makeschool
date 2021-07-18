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

    return """
    Search for your city:
    <br>
    <form action="/results" method="GET">
      <input type="text" name="city">
      <button type="submit">Search</button>
    </form>
    """

@app.route('/results')
def results_page():
    """Return HTML content of results page showing a city's temperature."""

    # Get the user's city from the URL's query string (i.e. whatever was entered
    # in the previous page's form)
    users_city = request.args.get('city')

    # TODO: Make a dictionary called `query_params` and add 2 fields to it:
    # 1. A key `q` with the value of whatever is in the `users_city` variable.
    # 2. A key `appid` with the value of whatever is in the `APP_ID` variable.


    # TODO: Make a call to the function `requests.get` and pass it the following
    # parameters:
    # 1. The base URL of the API call, stored in the variable BASE_URL
    # 2. A named parameter called `params` with value of whatever is in the
    #    `query_params` dictionary.
    # Store the result of this call in a variable called `response`.


    # TODO: Print out 3 things to the console:
    # 1. The response's status code. We can access this using the `.status_code`
    #    field of the `response` object.
    # 2. The response's generated URL. We can access this using the
    #    `.url` field of the `response` object.
    # 3. The response's JSON data. We can access this by calling the `.json()`
    #    method of the `response` object.


    return users_city


if __name__ == "__main__":
    app.run(debug=True)