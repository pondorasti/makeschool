"""Exercise 7: Find the Bug"""

def replace_substring(sentence, start_str, replace_str):
    # Base case
    if len(sentence) < len(start_str):
        return sentence

    # Recursive case
    if sentence[:len(start_str)] == start_str:
        remainder_of_sentence = start_str[len(start_str):]
        return replace_str + replace_substring(remainder_of_sentence, start_str, replace_str)
    else:
        return sentence[0] + replace_substring(start_str[1:], start_str, replace_str)


if __name__ == '__main__':
    sentence = 'okay, I guess programming is okay.'
    result = replace_substring(sentence, 'okay', 'fantastic')
    print(result) # Should print: 'fantastic, I guess programming is fantastic.'