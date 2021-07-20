def read_file(filename):
    """Read the given file and return a list of lines of text read from it."""
    with open(filename, "r") as file:
        lines_list = file.readlines()
    return lines_list


def format_cats_list(cats_list):
    """Return a new list of formatted strings by lowercasing
    each cat name in the given list of cats."""
    formatted_cats_list = []
    for cat in cats_list:
        formatted_cats_list.append(cat.lower())
    return formatted_cats_lists  # Typo here will generate a stack trace


def print_cats(cats_list):
    """Format and print each string in the given list of cat names."""
    formatted_cats_list = format_cats_list(cats_list)
    for cat in formatted_cats_list:
        print(cat)


def process_cats():
    """Read the cats file, then format and print the cat names."""
    cats_list = read_file("cats.txt")
    print_cats(cats_list)


if __name__ == "__main__":
    process_cats()
