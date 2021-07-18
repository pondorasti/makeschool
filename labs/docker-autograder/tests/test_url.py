# https://github.com/gradescope/gradescope-utils/blob/master/gradescope_utils/autograder_utils/decorators.py
# https://github.com/gradescope/autograder_samples/blob/master/python/src/tests/test_simple.py

import re
import unittest
import requests
from gradescope_utils.autograder_utils.files import check_submitted_files
from gradescope_utils.autograder_utils.decorators import weight, number


class UrlTestCase(unittest.TestCase):

    def url_file_contains_valid_url(self):
        self.assertTrue(check_submitted_files(['URL']))

        with open('URL', "r") as file:
            test_url = file.read()
            self.assertGreater(len(test_url), 0, "File is empty!")

            self.assertRegexpMatches(
                test_url, r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', "URL file does not contain a valid URL. Make sure it starts with http:// or https://!")

            response = requests.get(test_url)
            self.assertEqual(response.status_code, 200, "URL is not active.")
