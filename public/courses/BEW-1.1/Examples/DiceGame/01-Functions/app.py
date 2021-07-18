from random import randint

def play_dice_game():
    """Plays a game by rolling two dice. If the rolls are the same, the user
    wins; if not, they lose. Returns a string representation of the outcome and
    rolls."""
    die1 = randint(1, 6)
    die2 = randint(1, 6)

    if die1 == die2:
        return f"You won! You rolled {die1} and {die2}."
    else:
        return f"You lost :( You rolled {die1} and {die2}."