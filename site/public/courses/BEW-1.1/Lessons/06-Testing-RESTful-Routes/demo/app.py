from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, world!'

@app.route('/fortune')
def fortune():
    return """
    <form action='/fortune_results'>
        What is your favorite animal?
        <input type='text' name='animal'><br>
        <input type='submit' value='Submit!'>
    </form>
    """

@app.route('/fortune_results')
def fortune_results():
    users_favorite_animal = request.args.get('animal')
    fortune = ''
    if users_favorite_animal == 'unicorn':
        fortune = 'You\'ll have a magical day!'
    elif users_favorite_animal == 'cat':
        fortune = 'Your day will be paw-some!'
    else:
        fortune = 'Nothing of note will happen today.'

    return f'Your fortune is: {fortune}'


if __name__ == '__main__':
    app.run(debug=True)