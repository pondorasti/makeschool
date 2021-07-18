"""Exercise 3: Set a Watch Expression"""

import re

def clean_sentence(sentence):
    """
    Change to lowercase and remove any characters that are not letters or 
    spaces.
    """
    return re.sub(r'[^\w\s]', '', sentence.lower())

def find_most_common_word(sentence):
    """Return the most common word in the sentence."""
    
    # Change to lowercase and strip out punctuation
    sentence = clean_sentence(sentence)

    list_of_words = sentence.split()
    word_to_count = dict()

    # Create a histogram of the occurrence of all words
    for word in list_of_words:
        if word not in word_to_count:
            word_to_count[word] = 1
        else:
            word_to_count[word] += 1
    
    most_common_word = ''
    highest_count = 0

    # Find highest count in the histogram
    for word, count in word_to_count.items():
        if count > highest_count:
            most_common_word, highest_count = word, count

    return most_common_word

if __name__ == '__main__':
    result = find_most_common_word(
        'One fish, two fish, red fish, blue fish')
    print("The most common word is: " + result)