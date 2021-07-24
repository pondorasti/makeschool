import requests
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/weather')
def weather_form():
    return """
    <form action="/weather_results" method="GET">
        Type in your city:
        <input type="text" name="city"><br>
        <input type="submit" value="Submit!">
    </form>
    """

@app.route('/weather_results')
def weather_results():

    params = {
        'q': request.args.get('city'),
        'units': 'Imperial',
        'appid': '2608f679d4594364525f6c6cc2246c79'
    }
    weather_url = 'http://api.openweathermap.org/data/2.5/weather'

    response = requests.get(weather_url, params=params)
    response_json = response.json()

    temp = response_json["main"]["temp"]

    return "It is now " + str(temp) + " degrees Fahrenheit."

if __name__ == "__main__":
    app.run()