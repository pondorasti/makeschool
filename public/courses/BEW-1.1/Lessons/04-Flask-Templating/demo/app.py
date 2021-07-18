from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/hello')
def say_hello():
    """Say hello."""
    return render_template('greeting.html')

@app.route('/items')
def show_items():
    """Show a list of items."""
    items_to_show = [
        'Pumpkins',
        'Karaoke Machine',
        'Disco Ball',
        'Fog Machine'
    ]

    return render_template(
        'items_list.html', 
        items=items_to_show)
