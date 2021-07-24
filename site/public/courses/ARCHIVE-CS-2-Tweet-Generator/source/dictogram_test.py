#!python

from dictogram import Dictogram
import unittest
# Python 2 and 3 compatibility: unittest module renamed this assertion method
if not hasattr(unittest.TestCase, 'assertCountEqual'):
    unittest.TestCase.assertCountEqual = unittest.TestCase.assertItemsEqual


class DictogramTest(unittest.TestCase):

    # Test fixtures: known inputs and their expected results
    fish_words = ['one', 'fish', 'two', 'fish', 'red', 'fish', 'blue', 'fish']
    fish_list = [('one', 1), ('fish', 4), ('two', 1), ('red', 1), ('blue', 1)]
    fish_dict = {'one': 1, 'fish': 4, 'two': 1, 'red': 1, 'blue': 1}

    def test_entries(self):
        dictogram = Dictogram(self.fish_words)
        # Verify histogram as dictionary of entries like {word: count}
        assert len(dictogram) == 5
        assert dictogram == self.fish_dict
        self.assertCountEqual(dictogram, self.fish_dict)  # Ignore item order
        # Verify histogram as list of entries like [(word, count)]
        listogram = dictogram.items()
        assert len(listogram) == 5
        self.assertCountEqual(listogram, self.fish_list)  # Ignore item order

    def test_contains(self):
        histogram = Dictogram(self.fish_words)
        # All of these words should be found
        for word in self.fish_words:
            assert word in histogram
        # None of these words should be found
        for word in ('fishy', 'food'):
            assert word not in histogram

    def test_frequency(self):
        histogram = Dictogram(self.fish_words)
        # Verify frequency count of all words
        assert histogram.frequency('one') == 1
        assert histogram.frequency('two') == 1
        assert histogram.frequency('red') == 1
        assert histogram.frequency('blue') == 1
        assert histogram.frequency('fish') == 4
        # Verify frequency count of unseen words
        assert histogram.frequency('food') == 0

    def test_add_count(self):
        histogram = Dictogram(self.fish_words)
        # Add more words to update frequency counts
        histogram.add_count('two', 2)
        histogram.add_count('blue', 3)
        histogram.add_count('fish', 4)
        histogram.add_count('food', 5)
        # Verify updated frequency count of all words
        assert histogram.frequency('one') == 1
        assert histogram.frequency('two') == 3
        assert histogram.frequency('red') == 1
        assert histogram.frequency('blue') == 4
        assert histogram.frequency('fish') == 8
        assert histogram.frequency('food') == 5
        # Verify count of distinct word types
        assert histogram.types == 6
        # Verify total count of all word tokens
        assert histogram.tokens == 8 + 14

    def test_tokens(self):
        histogram = Dictogram(self.fish_words)
        # Verify total count of all word tokens
        assert len(self.fish_words) == 8
        assert histogram.tokens == 8
        # Adding words again should double total count of all word tokens
        for word in self.fish_words:
            histogram.add_count(word)
        assert histogram.tokens == 8 * 2

    def test_types(self):
        histogram = Dictogram(self.fish_words)
        # Verify count of distinct word types
        assert len(set(self.fish_words)) == 5
        assert histogram.types == 5
        # Adding words again should not change count of distinct word types
        for word in self.fish_words:
            histogram.add_count(word)
        assert histogram.types == 5


if __name__ == '__main__':
    unittest.main()
