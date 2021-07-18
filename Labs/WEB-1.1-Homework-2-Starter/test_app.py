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

    def test_froyo(self):
        res = app.test_client().get('/froyo')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        expected_page_text = 'What is your favorite Fro-Yo flavor?'
        self.assertIn(expected_page_text, result_page_text)

    def test_froyo_results(self):
        res = app.test_client().get('/froyo_results?flavor=vanilla&toppings=strawberries')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('vanilla', result_page_text)
        self.assertIn('strawberries', result_page_text)

    def test_favorites(self):
        res = app.test_client().get('/favorites')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True).lower()
        self.assertIn('favorite color', result_page_text)
        self.assertIn('favorite animal', result_page_text)
        self.assertIn('favorite city', result_page_text)

    def test_favorites_results(self):
        url = 'favorites_results?color=purple&animal=penguin&city=San%20Francisco'
        res = app.test_client().get(url)
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('purple', result_page_text)
        self.assertIn('penguin', result_page_text)
        self.assertIn('San Francisco', result_page_text)

    def test_secret_message(self):
        res = app.test_client().get('/secret_message')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('input', result_page_text)

    def test_message_results(self):
        res = app.test_client().post('/message_results', data=dict(message='Hello World'))
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('HWdellloor', result_page_text)

    def test_calculator_add(self):
        res = app.test_client().get('/calculator_results?operand1=6&operand2=7&operation=add')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('add 6 and 7', result_page_text)
        self.assertIn('result is: 13', result_page_text)

    def test_calculator_subtract(self):
        res = app.test_client().get('/calculator_results?operand1=6&operand2=7&operation=subtract')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('subtract 6 and 7', result_page_text)
        self.assertIn('result is: -1', result_page_text)

    def test_calculator_multiply(self):
        res = app.test_client().get('/calculator_results?operand1=6&operand2=7&operation=multiply')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('multiply 6 and 7', result_page_text)
        self.assertIn('result is: 42', result_page_text)

    def test_calculator_divide(self):
        res = app.test_client().get('/calculator_results?operand1=6&operand2=3&operation=divide')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('divide 6 and 3', result_page_text)
        self.assertIn('result is: 2', result_page_text)

    def test_horoscope_aries(self):
        res = app.test_client().get('/horoscope_results?users_name=Ducky&horoscope_sign=aries')
        self.assertEqual(res.status_code, 200)
        random.seed(1)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('Ducky', result_page_text)
        self.assertIn('aries', result_page_text)
        self.assertIn('Adventurous and energetic', result_page_text)
        self.assertIn('18', result_page_text)

    def test_horoscope_taurus(self):
        res = app.test_client().get('/horoscope_results?users_name=Moxie&horoscope_sign=aries')
        self.assertEqual(res.status_code, 200)
        random.seed(3)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('Moxie', result_page_text)
        self.assertIn('taurus', result_page_text.lower())
        self.assertIn('Patient and reliable', result_page_text)
        self.assertIn('31', result_page_text)



if __name__ == '__main__':
    unittest.main()