################################################################################
## IMPORTANT: DO NOT EDIT THIS CODE (unless you know what you're doing).
##
## To run the tests, first make sure you have pytest installed:
##
## $ pip3 install unittest
##
## Then, open up a terminal to the homework folder and run the following:
##
## $ python3 test_app.py
##
## If you want to run only a single test, you can run the following:
##
## $ python3 test_app.py TestApp.test_froyo
################################################################################

import unittest

from app import app

class TestApp(unittest.TestCase):
    """Unit tests for app.py."""

    def setUp(self):
        pass

    def test_compliments_3(self):
        res = app.test_client().get('/compliments_results?users_name=Ducky&wants_compliments=yes&num_compliments=3')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('Ducky', result_page_text)
        self.assertEqual(3, result_page_text.count('<li>'))

    def test_compliments_5(self):
        res = app.test_client().get('/compliments_results?users_name=Moxie&wants_compliments=yes&num_compliments=5')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('Moxie', result_page_text)
        self.assertEqual(5, result_page_text.count('<li>'))

    def test_compliments_none(self):
        res = app.test_client().get('/compliments_results?users_name=Moxie&wants_compliments=no&num_compliments=3')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('Moxie', result_page_text)
        self.assertNotIn('<li>', result_page_text)

if __name__ == '__main__':
    unittest.main()