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

    # Make a dictionary to hold the parameters that we'll pass in our API call
    query_params = {
        'q': users_city,
        'appid': APP_ID
    }

    # Make an API call and store the response
    response = requests.get(BASE_URL, params=query_params)

    # Print some info to the console so that we can see what the API call sent
    # in its response
    print("Status code: " + str(response.status_code))
    print("URL: " + response.url)
    print("JSON Response: " + str(response.json()))

    response_json = response.json()

    # TODO: Extract the 'main' field from the `response_json` object - hint: it
    # is a dictionary, so we can use dictionary syntax!
    # Store this in a variable called `temp_main`.


    # TODO: Extract the 'temp' field from the `temp_main` object - hint: it
    # is a dictionary, so we can use dictionary syntax!
    # Store this in a variable called `temp_kelvin`.


    # TODO: Call the `kelvin_to_fahrenheit()` function (defined above) and pass
    # in our `temp_kelvin` object. Store the result in a variable called 
    # `temp_fahrenheit`.
    
    
    # TODO: Return an HTML string containing the temperature. For example, if
    # it is 52 degrees, we want to return a string containing: "It is 52 
    # degrees today."
    return str(response_json)


if __name__ == "__main__":
    app.run(debug=True)