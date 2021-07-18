"""A program demonstrating basic uses of booleans."""

def str2bool(str):
    """Tells whether a string is a Yes (True) or a No (False)"""
    if str.lower() in ["y", "yes"]:
        return True
    elif str.lower() in ["n", "no"]:
        return False
    else:
        raise Exception("Please enter Yes or No")

is_raining = str2bool(input("Is it raining?"))
is_weekend = str2bool(input("Is it a weekend?"))
is_holiday = str2bool(input("Is it a holiday?"))
is_library_open = str2bool(input("Is the library open?"))

if (is_weekend or is_holiday) and not is_raining:
    print("Let's go outside!")

if is_raining and is_library_open:
    print("I'm going to the library!")
