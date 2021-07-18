def reverse(str):
    """Reverses the characters in a string."""
    return str[::-1]

def reverse_letters_in_words(str):
    """Reverses the letters in each word of a string."""
    words = str.split()
    new_words = reverse(words[0])
    for word in words[1:]:
        new_words += ' ' + reverse(word)
    return new_words


result = reverse_letters_in_words('hello there')
print(result)