from app import app
import unittest

class AppTests(unittest.TestCase): 

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    def test_home_status_code(self):
        result = self.app.get('/') 
        self.assertEqual(result.status_code, 200)

    def test_fortune_results_default_response(self):
        result = self.app.get('/fortune_results')
        self.assertIn('Nothing of note', result.get_data(as_text=True))

    def test_fortune_results_unicorn(self):
        result = self.app.get('/fortune_results?animal=unicorn')
        self.assertIn('magical day', result.get_data(as_text=True))

    def test_fortune_results_cat(self):
        result = self.app.get('/fortune_results?animal=cat')
        print(result)
        self.assertIn('will be paw-some', result.get_data(as_text=True))

# run the tests
if __name__ == '__main__':
    unittest.main()