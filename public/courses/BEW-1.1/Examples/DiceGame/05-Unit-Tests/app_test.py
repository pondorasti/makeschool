# First we need to import our app.
# This test file should be in the same folder as your app.py file
from app import app
import unittest 

class AppTests(unittest.TestCase): 

    # This runs implicitly before any tests are run
    # We use this to set up our app before we test on it
    def setUp(self):
        # creates a test client
        self.app = app.test_client()
        # propagate the exceptions to the test client
        self.app.testing = True

    def test_home_status_code(self):
        # sends HTTP GET request to the application
        # on the specified path
        result = self.app.get('/?user_name=Meredith') 

        self.assertIn(b'Hello Meredith!', result.data)

        # assert the status code of the response
        self.assertEqual(result.status_code, 200) 


# run the tests
if __name__ == '__main__':
    unittest.main()