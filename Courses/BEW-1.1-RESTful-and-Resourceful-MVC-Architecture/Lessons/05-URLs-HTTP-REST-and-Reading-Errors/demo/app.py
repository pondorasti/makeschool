from flask import Flask, request

app = Flask(__name__)

@app.route('/color')
def fav_color():
    """Shows user a form."""
    return """
    <form action="/color_results">
        What is your favorite color?
        <input type="text" name="color">
        <br>
        <input type="submit">
    </form>
    """

@app.route('/color_results')
def color_results():
    users_fav_color = request.args.get("color")

    return "Your favorite color is " + users_fav_color