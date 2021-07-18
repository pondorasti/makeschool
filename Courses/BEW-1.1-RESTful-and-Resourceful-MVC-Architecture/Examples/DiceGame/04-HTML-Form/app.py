from random import randint
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def play_dice_game():
    """Plays a game by rolling two dice. If the rolls are the same, the user
    wins; if not, they lose. Returns a string representation of the outcome and
    rolls."""
    user_name = request.args.get("user_name")

    die1 = randint(1, 6)
    die2 = randint(1, 6)

    return render_template("index.html", die1=die1, die2=die2, user_name=user_name)

if __name__ == "__main__":
    app.run(debug=True)
