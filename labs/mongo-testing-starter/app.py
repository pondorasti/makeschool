from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient
from bson.objectid import ObjectId

# Initialize the Flask app
app = Flask(__name__)

# Set up the MongoDB client, database, and collection
client = MongoClient()
db = client['test_db']
songs_collection = db['songs']

################################################################################
# SETUP:
# 1. Make sure you have MongoDB and PyMongo installed
# 2. Open a terminal and run the command `mongod`
# 3. In the project's folder, run the application with `flask run`
#
# CHALLENGES:
# 1. Modify the 'show_all_songs' route to query for all songs
# 2. Modify the 'show_classical_songs' route to query for all songs with 
#    genre=Classical
# 3. Modify the 'create_new_song' route to:
#     a. Get the song's artist and genre from the route's POST data
#     b. Insert the song into the MongoDB database with `insert_one`
# 4. Modify the 'show_song' route to query for the song with specified ID
################################################################################


@app.route('/')
def home():
    """Show the homepage."""
    return render_template('index.html')

@app.route('/all')
def show_all_songs():
    """Show a list of all songs."""
    # TODO: Replace '[]' below with a call to songs_collection.find() to get
    # all songs
    all_songs = []
    return render_template('songs_list.html', songs=all_songs)

@app.route('/classical')
def show_classical_songs():
    """Show a list of classical songs."""
    # TODO: Replace '[]' below with a call to songs_collection.find() to get
    # all songs with genre='Classical'
    classical_songs = []
    return render_template('songs_list.html', songs=classical_songs)

@app.route('/song/<song_id>')
def show_song(song_id):
    """Show a specific song."""

    # TODO: Replace `None` below with a call to `find_one` on the songs
    # collection to get the specific song we are looking for, using the song's
    # object id.
    # HINT: You will need to convert the id from type `string` to type 
    # `ObjectId`.
    song = None

    return render_template('song_detail.html', song=song)

@app.route('/create')
def show_create_form():
    """Shows a creation form to make a new song."""
    return render_template('song_create_form.html')

@app.route('/create', methods=['POST'])
def create_new_song():
    """Creates a new song using the POST data from the form."""
    song_title = request.form.get('title')

    # TODO: Replace `None` below with a call to `request.form.get` to get the
    # right parameters
    artist = None
    genre = None

    # Create a new song object using the POST data
    song = {
        'title': song_title,
        'artist': artist,
        'genre': genre
    }

    # TODO: Replace `None` below with a call to `insert_one` on the songs 
    # collection to put the new song in the database and get the result.
    result = None

    return redirect(url_for('show_song', song_id=result.inserted_id))

@app.route('/delete/<song_id>', methods=['POST'])
def delete_song(song_id):
    """Delete a specific song."""
    # TODO: Replace `None` below with a call to `delete_one` on the song with
    # the given id.
    result = None

    return redirect(url_for('show_all_songs'))

if __name__ == '__main__':
    app.run(debug=True)