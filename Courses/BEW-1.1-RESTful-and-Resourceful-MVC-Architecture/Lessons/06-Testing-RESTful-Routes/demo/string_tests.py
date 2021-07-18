import unittest

def greet_by_name(name):
    """Greet user by name."""
    greeting = "Hello, " + name + "!"
    return greeting

class StringFunctionTests(unittest.TestCase):
    def test_greeting(self):
        """Test the greeting function."""
        self.assertEqual(greet_by_name('Dani'), 'Hello, Mark!')

if __name__ == '__main__':
    unittest.main()