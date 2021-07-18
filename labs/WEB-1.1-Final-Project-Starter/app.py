from flask import Flask, request, redirect, render_template, url_for
from flask_pymongo import PyMongo
from bson.objectid import ObjectId

app = Flask(__name__)

############################################################
# SETUP
############################################################

app = Flask(__name__)

app.config["MONGO_URI"] = "mongodb://localhost:27017/plantsDatabase"
mongo = PyMongo(app)

############################################################
# ROUTES
############################################################

@app.route('/')
def list_page():
    """Display a list of items of RESOURCE."""
    # TODO: Use database query to get all items of resource

    return render_template('list.html')


@app.route('/create', methods=['GET', 'POST'])
def create_page():
    """Display a creation form & process form submission."""
    if request.method == 'POST':
        # TODO: Process form submission

        inserted_id = ''
        return redirect(url_for('detail_page', thing_id=inserted_id))
    
    else: # method is GET
        return render_template('create.html')


@app.route('/thing/<thing_id>')
def detail_page(thing_id):
    """Display a detail page for one item of RESOURCE."""
    # TODO: Use database query to get one item of resource

    return render_template('detail.html')


@app.route('/edit/<thing_id>', methods=['GET', 'POST'])
def edit_page(thing_id):
    """Display an edit form & process form submission."""
    if request.method == 'POST':
        # TODO: Process form submission

        return redirect(url_for('detail_page', thing_id=thing_id))

    else: # method is GET
        return render_template('edit.html')


@app.route('/delete/<thing_id>', methods=['POST'])
def delete():
    """Deletes an item of RESOURCE."""
    # TODO: Use database call to delete the item of resource as well as any
    # items of child resource.

    return redirect(url_for('list_page'))


if __name__ == '__main__':
    app.run(debug=True)