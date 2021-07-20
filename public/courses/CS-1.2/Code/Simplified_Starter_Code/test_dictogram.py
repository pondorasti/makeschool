#to run type: pytest test_dictogram.py
from dictogram import Dictogram

# known inputs and their expected results
fish_words = ['one', 'fish', 'two', 'fish', 'red', 'fish', 'blue', 'fish']
fish_dict = {'one': 1, 'fish': 4, 'two': 1, 'red': 1, 'blue': 1}

def test_entries():
    dictogram = Dictogram(fish_words).dictionary_histogram
    # Verify histogram as dictionary of entries like {word: count}
    assert len(dictogram) == 5
    assert len(dictogram) == len(fish_dict)

def test_contains():
    dictogram = Dictogram(fish_words).dictionary_histogram
    # All of these words should be found
    for word in fish_words:
        assert word in dictogram
    # None of these words should be found
    for word in ('fishy', 'food'):
        assert word not in dictogram

def test_frequency():
    dictogram = Dictogram(fish_words)
    # Verify frequency count of all words
    assert dictogram.frequency('one') == 1
    assert dictogram.frequency('two') == 1
    assert dictogram.frequency('red') == 1
    assert dictogram.frequency('blue') == 1
    assert dictogram.frequency('fish') == 4
 

def test_tokens():
    dictogram = Dictogram(fish_words)
    # Verify total count of all word tokens
    assert len(fish_words) == 8
    assert dictogram.tokens == 8

def test_types():
    dictogram = Dictogram(fish_words)
    # Verify count of distinct word types
    assert len(set(fish_words)) == 5
    assert dictogram.types == 5

def test_sample():
    dictogram = Dictogram(fish_words)
    # Create a list of 10,000 word samples from histogram
    samples_list = [dictogram.sample() for _ in range(10000)]
    # Create a histogram to count frequency of each word
    samples_hist = Dictogram(samples_list)
    # Check each word in original histogram
    for word, count in dictogram.dictionary_histogram.items():
        # Calculate word's observed frequency
        observed_freq = count / dictogram.tokens
        # Calculate word's sampled frequency
        samples = samples_hist.frequency(word)
        sampled_freq = samples / samples_hist.tokens
        # Verify word's sampled frequency is close to observed frequency
        lower_bound = observed_freq * 0.9  # 10% below = 90% = 0.9
        upper_bound = observed_freq * 1.1  # 10% above = 110% = 1.1
        assert lower_bound <= sampled_freq <= upper_bound