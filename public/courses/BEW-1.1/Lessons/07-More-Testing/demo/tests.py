from app import app
from unittest import TestCase, main
from unittest.mock import patch, ANY

class AppTests(TestCase): 

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    @patch('app.requests.get')
    def test_weather_results(self, requests_get):
        mock_response = requests_get()
        mock_response.json.return_value = {
            'main': { 'temp': 62 }
        }
        result = self.app.get('/weather_results?city=Tokyo')
        self.assertEqual(result.status_code, 200)

        page_content = result.get_data(as_text=True)
        self.assertIn('It is now 62 degrees Fahrenheit', page_content)

        requests_get.assert_called_with(ANY, 
            params={'q': 'Tokyo', 'units': 'Imperial', 'appid': ANY})

# run the tests
if __name__ == '__main__':
    main()
