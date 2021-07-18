
def play_madlibs():
    """Get parts of speech input from the user and display a madlibs story with parts of speech included. Uses lists to store parts of speech and user input."""

    parts_of_speech = ["adjective", "verb", "noun"]

    input_words = []
    for part in parts_of_speech:
        word = input("Please enter " + part + ": ")
        input_words.append(word)

    print("It was a " + input_words[0] + " day in San Francisco. I " + input_words[1] +" to Make School and met up with my friends to work on " + input_words[2] + ".")


if __name__ == "__main__":
    play_madlibs()