
from listogram import Listogram

# known inputs and their expected results
fish_words = ['one', 'fish', 'two', 'fish', 'red', 'fish', 'blue', 'fish']
fish_list = [('one', 1), ('fish', 4), ('two', 1), ('red', 1), ('blue', 1)]

def test_entries():
    # NOTE: This test assumes Listogram is implemented as a list of tuples,
    # but if you implement it as a list of lists (or a list of count-lists)
    # you should modify the fish_list fixture above and/or this test (only)
    listogram = Listogram(fish_words)
    # Verify histogram as list of entries like [(word, count)]
    assert len(listogram.list_histogram) == 5
    assert len(listogram.list_histogram) == len(fish_list)  # Ignore item order

def test_frequency():
    histogram = Listogram(fish_words)
    # Verify frequency count of all words
    assert histogram.frequency('one') == 1
    assert histogram.frequency('two') == 1
    assert histogram.frequency('red') == 1
    assert histogram.frequency('blue') == 1
    assert histogram.frequency('fish') == 4
 

def test_tokens():
    listogram = Listogram(fish_words)
    # Verify total count of all word tokens
    assert len(fish_words) == 8
    assert listogram.tokens == 8

def test_types():
    listogram = Listogram(fish_words)
    # Verify count of distinct word types
    assert len(set(fish_words)) == 5
    assert listogram.types == 5

def test_sample():
    listogram = Listogram(fish_words)
    # Create a list of 10,000 word samples from histogram
    samples_list = [listogram.sample() for _ in range(10000)]
    # Create a histogram to count frequency of each word
    samples_hist = Listogram(samples_list)
    # Check each word in original histogram
    for item in listogram.list_histogram:
        word = item[0]
        count = item[1]
        # Calculate word's observed frequency
        observed_freq = count / listogram.tokens
        # Calculate word's sampled frequency
        samples = samples_hist.frequency(word)
        sampled_freq = samples / samples_hist.tokens
        # Verify word's sampled frequency is close to observed frequency
        lower_bound = observed_freq * 0.9  # 10% below = 90% = 0.9
        upper_bound = observed_freq * 1.1  # 10% above = 110% = 1.1
        assert lower_bound <= sampled_freq <= upper_bound
