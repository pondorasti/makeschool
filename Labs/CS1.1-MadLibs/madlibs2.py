def play_madlibs():
    """Get parts of speech input from the user and display a madlibs story with parts of speech included. Uses a dictionary to store parts of speech and user input."""

    parts_of_speech = ["adjective1", "verb", "noun", "adjective2"]

    input_words = {}
    for part in parts_of_speech:
        word = input("Please enter " + part + ": ")
        input_words[part] = word

    #Using a dictionary over a list can help with readability when we build our story
    #However, note that dictionaries have to have unique names for their keys, so for example if we add another adjective we have to give it a unique name
    print("It was a " + input_words["adjective1"] + " day in San Francisco. I " + input_words["verb"] +" to Make School and met up with my friends to work on " + input_words["noun"] + ". It was a " + input_words["adjective2"] + " day!")


if __name__ == "__main__":
    play_madlibs()