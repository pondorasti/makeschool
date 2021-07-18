#!python

from search import linear_search, binary_search
import unittest


class SearchTest(unittest.TestCase):
    def test_linear_search_with_items_in_list(self):
        # linear search can find items regardless of list order
        names = ['Winnie', 'Kojin', 'Brian', 'Nabil', 'Julia', 'Alex', 'Nick']
        # linear search should return the index of each item in the list
        assert linear_search(names, 'Winnie') == 0
        assert linear_search(names, 'Kojin') == 1
        assert linear_search(names, 'Brian') == 2
        assert linear_search(names, 'Nabil') == 3
        assert linear_search(names, 'Julia') == 4
        assert linear_search(names, 'Alex') == 5
        assert linear_search(names, 'Nick') == 6

    def test_linear_search_with_items_not_in_list(self):
        # linear search can find items regardless of list order
        names = ['Alex', 'Brian', 'Julia', 'Kojin', 'Nabil', 'Nick', 'Winnie']
        # linear search should return None for any item not in the list
        assert linear_search(names, 'Jeremy') is None
        assert linear_search(names, 'nobody') is None

    def test_binary_search_with_items_in_list(self):
        # binary search requires list values to be in sorted order
        names = ['Alex', 'Brian', 'Julia', 'Kojin', 'Nabil', 'Nick', 'Winnie']
        # binary search should return the index of each item in the list
        assert binary_search(names, 'Alex') == 0
        assert binary_search(names, 'Brian') == 1
        assert binary_search(names, 'Julia') == 2
        assert binary_search(names, 'Kojin') == 3
        assert binary_search(names, 'Nabil') == 4
        assert binary_search(names, 'Nick') == 5
        assert binary_search(names, 'Winnie') == 6

    def test_binary_search_with_items_not_in_list(self):
        # binary search requires list values to be in sorted order
        names = ['Alex', 'Brian', 'Julia', 'Kojin', 'Nabil', 'Nick', 'Winnie']
        # binary search should return None for any item not in the list
        assert binary_search(names, 'Jeremy') is None
        assert binary_search(names, 'nobody') is None


if __name__ == '__main__':
    unittest.main()
