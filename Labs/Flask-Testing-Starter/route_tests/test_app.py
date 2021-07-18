from unittest import TestCase

from .app import app

#######################
# Index Tests
# (there's only one here because there is only one possible scenario!)
#######################

class IndexTests(TestCase):
    """Tests for the index route."""

    def test_index(self):
        """Test that the index page shows "Hello, World!" """
        res = app.test_client().get('/')
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        expected_page_text = "Hello, World!"
        self.assertEqual(expected_page_text, result_page_text)


#######################
# Favorite Color Tests
#######################

class ColorTests(TestCase):
    """Tests for the Color route."""
    def test_color_results_blue(self):
        result = app.test_client().get('/color_results?color=blue')

        self.assertEqual(result.status_code, 200)

        result_page_text = result.get_data(as_text=True)
        expected_page_text = 'Wow, blue is my favorite color, too!'
        self.assertEqual(expected_page_text, result_page_text)

    def test_color_results_light_green(self):
        # TODO: Fill in this function to test the color route with the color 
        # 'light green'.
        pass

    def test_color_results_empty(self):
        # TODO: Fill in this function to test the color route with no color.
        pass


#######################
# Froyo Tests
#######################

class FroyoTests(TestCase):
    def test_froyo_results_scenario1(self):
        # TODO: Fill in this function to test the show_froyo_results route under a
        # specific scenario.
        pass

    def test_froyo_results_scenario2(self):
        # TODO: Fill in this function to test the show_froyo_results route under a
        # specific scenario.
        pass

    def test_froyo_results_edgecase1(self):
        # TODO: Fill in this function to test the show_froyo_results route under a
        # specific EDGE CASE scenario.
        pass

    def test_froyo_results_edgecase2(self):
        # TODO: Fill in this function to test the show_froyo_results route under a
        # specific EDGE CASE scenario.
        pass


#######################
# Reverse Message Tests
#######################

class MessageTests(TestCase):
    def test_message_results_helloworld(self):
        form_data = {
            'message': 'Hello World'
        }
        res = app.test_client().post('/message_results', data=form_data)
        self.assertEqual(res.status_code, 200)

        result_page_text = res.get_data(as_text=True)
        self.assertIn('dlroW olleH', result_page_text)

    def test_message_results_scenario2(self):
        # TODO: Fill in this function to test the message_results route under 
        # another scenario.
        pass

    def test_message_results_edgecase1(self):
        # TODO: Fill in this function to test the message_results route under 
        # an edge case scenario.
        pass


#######################
# Calculator Tests
#######################

class CalculatorTests(TestCase):
    def test_calculator_results_scenario1(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific scenario.
        pass

    def test_calculator_results_scenario2(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific scenario.
        pass

    def test_calculator_results_scenario3(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific scenario.
        pass

    def test_calculator_results_scenario4(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific scenario.
        pass

    def test_calculator_results_edgecase1(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific EDGE CASE scenario.
        pass

    def test_calculator_results_edgecase2(self):
        # TODO: Fill in this function to test the calculator_results route under a
        # specific EDGE CASE scenario.
        pass