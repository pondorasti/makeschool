#!python

from recursion import fibonacci
import unittest


class RecursionTest(unittest.TestCase):
    def test_fibonacci_with_small_integers(self):
        # Known fibonacci numbers with small integer arguments
        assert fibonacci(0) == 0  # base case
        assert fibonacci(1) == 1  # base case
        assert fibonacci(2) == 1
        assert fibonacci(3) == 2
        assert fibonacci(4) == 3
        assert fibonacci(5) == 5
        assert fibonacci(6) == 8
        assert fibonacci(7) == 13
        assert fibonacci(8) == 21
        assert fibonacci(9) == 34
        assert fibonacci(10) == 55

    def test_fibonacci_with_large_integers(self):
        # These could run for a long time, depending on your implementation...
        assert fibonacci(15) == 610
        assert fibonacci(20) == 6765
        assert fibonacci(25) == 75025
        # TODO: Improve the runtime of your fibonacci function for these cases
        # If you're not careful, you may need to be very patient for these...
        # assert fibonacci(30) == 832040
        # assert fibonacci(35) == 9227465
        # assert fibonacci(40) == 102334155

    def test_fibonacci_with_negative_integers(self):
        # Should raise a ValueError for n < 0
        with self.assertRaises(ValueError):
            fibonacci(-1)
        with self.assertRaises(ValueError):
            fibonacci(-5)

    def test_fibonacci_with_floating_point_numbers(self):
        # Should raise a ValueError for non-integer n
        with self.assertRaises(ValueError):
            fibonacci(2.0)
        with self.assertRaises(ValueError):
            fibonacci(3.14159)
        with self.assertRaises(ValueError):
            fibonacci('5')


if __name__ == '__main__':
    unittest.main()
