
def check_input(word):
    """Check if the word is not an empty string and the word only contains characters from the alphabet"""
    if(len(word) == 0):
        print("Please enter something")
        return False
    elif(word.isalpha() != True):
        print("Words cannot have numbers in them")
        return False
    return True

def play_madlibs():
    """Get parts of speech input from the user and display a madlibs story with parts of speech included. Uses a dictionary to store parts of speech and user input."""

    parts_of_speech = ["adjective1", "verb", "noun", "adjective2"]

    input_words = {}
    for part in parts_of_speech:
        word = input("Please enter " + part + ": ")
        
        while (check_input(word) == False):
            word = input("Please enter " + part + ": ")
        input_words[part] = word

    print("It was a " + input_words["adjective1"] + " day in San Francisco. I " + input_words["verb"] +" to Make School and met up with my friends to work on " + input_words["noun"] + ". It was a " + input_words["adjective2"] + " day!")


if __name__ == "__main__":
    play_madlibs()

