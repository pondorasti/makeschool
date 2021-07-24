from flask import Flask, request
from flask_pymongo import PyMongo
from bson.json_util import dumps

# Set up the Flask 'app' variable
app = Flask(__name__)

# Tell Flask how to find our database
app.config['MONGO_URI'] = 'mongodb://localhost:27017/test_db'
mongo = PyMongo(app)
db = mongo.db

@app.route('/users', methods=['GET'])
def get_all_users():
    """Display all users in JSON form."""
    # Find all users
    users_list = db.users.find({})

    # Make JSON containing list of all users (for easier use in HTML)
    users_json = dumps(users_list)

    # Render some HTML containing the list of all users
    return """
    <a href="/new_user">New User</a>
    <br><br>
    Users: {}
    """.format(users_json)

@app.route('/new_user')
def new_user_form():
    """Display an HTML form for user creation."""

    return """
    <form action='/users' method='POST'>
        Username: <input name='username' type='text'/>
        Password: <input name='password' type='password'/>
        Bio: <textarea name='bio'></textarea>
        <button type='submit'>Submit</button>
    </form>
    """

@app.route('/users', methods=['POST'])
def create_user():
    """Create a new user."""

    # Make the new user JSON from form data
    new_user = {
      "username": request.form.get('username'),
      "password": request.form.get('password'),
      "bio": request.form.get('bio'),
    }

    # Insert into PyMongo database
    db.users.insert_one(new_user)

    # Render some HTML
    return """
    User created successfully!
    <a href="/users">Back to Home</a>
    """

if __name__ == '__main__':
    app.run(debug=True)