#!python

import sys
import time


def get_lines(filename='/usr/share/dict/words'):
    """Return a list of strings on separate lines in the given text file with
    any leading and trailing whitespace characters removed from each line."""
    # Open file and remove whitespace from each line
    with open(filename) as file:
        lines = [line.strip() for line in file]
    return lines


def generate_prefixes(vocabulary):
    """Return a set of unique prefixes from the given list of strings."""
    # Generate prefixes using the first half of each string
    return set(word[:len(word)//2] for word in vocabulary)


def autocomplete_setup(vocabulary, algorithm='linear_search'):
    """Return the main data structure needed to set up autocomplete using the
    given vocabulary and algorithm, specified as linear_search, trie, etc."""
    if algorithm == 'linear_search':
        # Use the given vocabulary list
        return vocabulary
    elif algorithm == 'trie':
        from trie import Trie
        # Create a trie structure with the vocabulary
        return Trie(vocabulary)


def autocomplete(prefix, structure, algorithm='linear_search'):
    """Return all vocabulary entries that start with the given prefix using the
    given structure and algorithm, specified as linear_search, trie, etc."""
    if algorithm == 'linear_search':
        # Search the list using linear search
        return [word for word in structure if word.startswith(prefix)]
    elif algorithm == 'trie':
        # Search the trie structure for the prefix
        return structure.search(prefix)


def main():
    """Read command-line arguments and test autocomplete algorithms."""
    if len(sys.argv) == 1:
        script = sys.argv[0]  # Get script file name
        print('Usage: {} prefix'.format(script))
        print('Test autocomplete with dictionary words and the given prefix')
        print('Example: {} axl'.format(script))
        print('Completions of axl: axle, axled, axlesmith, axletree')
        print()
        print('Usage: {} prefixes-file vocabulary-file'.format(script))
        print('Test autocomplete with the given prefixes and vocabulary files')
        print('Example: {} prefixes.txt /usr/share/dict/words'.format(script))
        return

    elif len(sys.argv) == 2:
        # Test autocomplete with dictionary words and the given prefix
        prefix = sys.argv[1]
        vocabulary = get_lines('/usr/share/dict/words')

        # Start the clock for benchmarking
        start_time = time.time()

        # Set up autocomplete and mark the clock
        structure = autocomplete_setup(vocabulary)
        setup_time = time.time()

        # Run autocomplete and mark the clock
        completions = autocomplete(prefix, structure)
        end_time = time.time()

        print('Vocabulary size: {}'.format(len(vocabulary)))
        print('Completions of {}: {}'.format(prefix, ', '.join(completions)))
        print()
        print('Initial setup time: {:.6f} sec'.format(setup_time - start_time))
        print('Autocomplete time:  {:.6f} sec'.format(end_time - setup_time))
        print('Total time elapsed: {:.6f} sec'.format(end_time - start_time))

    elif len(sys.argv) == 3:
        # Open the given vocabulary and prefixes files
        vocabulary = get_lines(sys.argv[2])
        prefixes = get_lines(sys.argv[1])

        # Start the clock for benchmarking
        start_time = time.time()

        # Set up autocomplete and mark the clock
        structure = autocomplete_setup(vocabulary)
        setup_time = time.time()

        # Run autocomplete with each prefix
        num_completions = 0
        for prefix in prefixes:
            completions = autocomplete(prefix, structure)
            num_completions += len(completions)
            # print('Completions of {}: {}'.format(prefix, ', '.join(completions)))

        # Mark the clock
        end_time = time.time()

        print('Vocabulary size: {}'.format(len(vocabulary)))
        print('Found {} total completions of {} prefixes'
              .format(num_completions, len(prefixes)))
        print()
        print('Initial setup time: {:.6f} sec'.format(setup_time - start_time))
        print('Autocomplete time:  {:.6f} sec'.format(end_time - setup_time))
        print('Total time elapsed: {:.6f} sec'.format(end_time - start_time))


if __name__ == '__main__':
    main()
