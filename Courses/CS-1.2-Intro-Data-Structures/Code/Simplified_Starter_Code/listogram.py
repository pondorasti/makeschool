from random import randint

class Listogram:

    def __init__(self, word_list):
        '''Initializes the listogram properties'''

        self.word_list = word_list
       
        self.list_histogram = self.build_listogram()

        self.tokens = self.get_num_tokens()
        self.types = self.unique_words()

    def build_listogram(self): 
        '''Creates a histogram list of lists using the word_list property and returns it'''

        #TODO: use your listogram function as a starting point to complete this method
        pass

    def get_num_tokens(self):
        '''gets the number of tokens in the listogram'''

        tokens = 0
        for item in self.list_histogram:
            tokens += item[1]
        return tokens

    def get_index(self, word, list_histogram):
        '''searches in the list histogram parameter and returns the index of the inner list that contains the word if present'''
        #TODO: use your get_index function as a starting point to complete this method
        pass

    def frequency(self, word):
        '''returns the frequency or count of the given word in the list of lists histogram'''
        #TODO: use your frequency and get_index function as a starting point to complete this method
        #You will need to adapt it a little bit to work with listogram
        pass
        
    def unique_words(self):
        '''returns the number of unique words in the list of lists histogram'''
        #TODO: use your unique words function as a starting point to complete this method
        #You will need to adapt it a little bit to work with listogram
        pass


    def sample(self):
        '''Randomly samples from the list of list histogram based on the frequency, returns a word'''

        #TODO: use your sample function as a starting point to complete this method 
        #You will need to adapt it a little bit to work with listogram

def print_listogram(word_list):
    '''Creates a list based histogram (listogram) and then prints out its properties and samples from it'''

    print()
    print('List of Lists Histogram:')
    print('word list: {}'.format(word_list))
    # Create a dictogram and display its contents
    listogram = Listogram(word_list)
    print('listogram: {}'.format(listogram.list_histogram))
    print('{} tokens, {} types'.format(listogram.tokens, listogram.types))
    for word in word_list[-2:]:
        freq = listogram.frequency(word)
        print('{!r} occurs {} times'.format(word, freq))
    print()
    print_dictogram_samples(listogram)

def print_dictogram_samples(listogram):
    '''Compares sampled frequency to observed frequency'''

    print('List of Lists Histogram samples:')
    # Sample the histogram 10,000 times and count frequency of results
    samples_list = [listogram.sample() for _ in range(10000)]
    samples_hist = Listogram(samples_list)
    print('samples: {}'.format(samples_hist.list_histogram))
    print()
    print('Sampled frequency and error from observed frequency:')
    header = '| word type | observed freq | sampled freq  |  error  |'
    divider = '-' * len(header)
    print(divider)
    print(header)
    print(divider)
    # Colors for error
    green = '\033[32m'
    yellow = '\033[33m'
    red = '\033[31m'
    reset = '\033[m'
    # Check each word in original histogram
    for item in listogram.list_histogram:
        word = item[0]
        count = item[1]
        # Calculate word's observed frequency
        observed_freq = count / listogram.tokens
        # Calculate word's sampled frequency
        samples = samples_hist.frequency(word)
        sampled_freq = samples / samples_hist.tokens
        # Calculate error between word's sampled and observed frequency
        error = (sampled_freq - observed_freq) / observed_freq
        color = green if abs(error) < 0.05 else yellow if abs(error) < 0.1 else red
        print('| {!r:<9} '.format(word)
            + '| {:>4} = {:>6.2%} '.format(count, observed_freq)
            + '| {:>4} = {:>6.2%} '.format(samples, sampled_freq)
            + '| {}{:>+7.2%}{} |'.format(color, error, reset))
    print(divider)
    print()

print_listogram(['one', 'fish', 'two', 'fish', 'red', 'fish', 'blue', 'fish'])

