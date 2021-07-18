from flask import Flask, request, render_template
from random import choice, sample

app = Flask(__name__)

compliments = [
    'awesome', 'terrific', 'fantastic', 'neato', 'fantabulous', 'wowza',
    'oh-so-not-meh', 'brilliant', 'ducky', 'coolio', 'incredible',
    'wonderful', 'smashing', 'lovely', 'tenacious', 'Pythonic']

@app.route('/')
def index():
    """Show the homepage and ask the user's name."""
    return render_template('index.html')

@app.route('/compliment')
def get_compliment():
    """Give the user a compliment"""
    name = request.args.get('name')
    num_compliments = int(request.args.get('num_compliments'))
    show_compliments = request.args.get('show_compliments')
    compliments_to_show = sample(compliments, num_compliments)

    return render_template(
        'compliments.html', 
        name=name,
        show_compliments=show_compliments,
        compliments=compliments_to_show)

if __name__ == '__main__':
    app.run(debug=True)
