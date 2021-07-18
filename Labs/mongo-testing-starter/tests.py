from app import app
from unittest import TestCase, main
from unittest.mock import patch

################################################################################
# SETUP:
# 1. Make sure you have MongoDB and PyMongo installed
# 2. In the project's folder, run the tests with `python3 tests.py`
#
# CHALLENGES:
# 1. Modify the 'test_show_classical_songs' test to load the classical songs.
# 2. Modify the 'test_show_song' test to load the song details page for a specific
#    song.
# 3. Modify the 'test_delete_song' test to make a POST request for a specific
#    song, then check if it would have been deleted.
################################################################################

class AppTests(TestCase): 
    """Run tests on the Songs App."""
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    @patch('pymongo.collection.Collection.find')
    def test_show_songs(self, mock_find):
        """Test the All Songs page."""
        # Set up our fake data.
        fake_songs = [
            {'title': 'Another One Bites the Dust', 'artist': 'Queen', 'genre': 'Rock'},
            {'title': 'Fur Elise', 'artist': 'Beethoven', 'genre': 'Classical'}
        ]
        # Set fake data as the mock return value for `find`.
        mock_find.return_value = fake_songs

        # Load the URL being tested.
        result = self.app.get('/all')

        # Check that status code is OK.
        self.assertEqual(result.status_code, 200)

        # Check that the page content contains the 2 songs in our test data.
        page_content = result.get_data(as_text=True)
        self.assertIn('Another One Bites the Dust', page_content)
        self.assertIn('Fur Elise', page_content)

    @patch('pymongo.collection.Collection.find')
    def test_show_classical_songs(self, mock_find):
        """Test the Classical Songs page."""
        # TODO: Set up some fake data that includes at least 1 classical song.

        # TODO: Set the mock's return value to be the fake data.

        # TODO: Call `self.app.get` to load the page.

        # TODO: Check that the status code is 200.

        # TODO: Check that the classical song appears in the page content.
        pass

    @patch('pymongo.collection.Collection.find_one')
    def test_show_song(self, mock_find_one):
        """Test the Song Detail page."""
        # TODO: Set up some fake data for a single song.

        # TODO: Set the mock's return value to be the fake data.

        # TODO: Call `self.app.get` to load the page.

        # TODO: Check that the status code is 200.

        # TODO: Check that the song's title, artist, and genre appear in the 
        # page's content.

    @patch('pymongo.collection.Collection.insert_one')
    def test_create_new_song(self, mock_insert_one):
        """Test the Song Creation route."""
        # Set up our fake data.
        fake_title = 'Safety Dance'
        fake_artist = 'Men Without Hats'
        fake_genre = 'Pop'

        # Wrap the data as key-value pairs in a dictionary, so that it will
        # match what the route expects to receive.
        post_data = {
            'title': fake_title,
            'artist': fake_artist,
            'genre': fake_genre
        }

        # Make a POST request to the URL being tested, and pass in our data.
        result = self.app.post('/create', data=post_data)

        # Check that the status code is 302 (meaning that we are redirected).
        self.assertEqual(result.status_code, 302)

        # Ensure that a song object would have been added to the database.
        mock_insert_one.assert_called_with(post_data)

    @patch('pymongo.collection.Collection.delete_one')
    def test_delete_song(self, mock_delete_one):
        """Test the Song Deletion route."""
        # TODO: Set up a fake id for a song. (We don't actually need to set 
        # title, artist, etc here!)

        # TODO: Make a POST request to `/delete/FAKE_SONG_ID`, using the fake id
        # you created.

        # TODO: Ensure that a song object with the specified id would have been
        # deleted from the database, using `assert_called_with`.


if __name__ == '__main__':
    main()