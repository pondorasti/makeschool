from flask import Flask, render_template
from pymongo import MongoClient
from bson.objectid import ObjectId

app = Flask(__name__)

client = MongoClient()
db = client.reddit_clone_db

post_collection = db.posts

# TODO: Replace with your name
username = 'my-name-here'

@app.route('/')
def home():
  # TODO: Pass through a list of all posts from post_collection using '.find()'
  return render_template('index.html', username=username)

@app.route('/detail/<post_id>')
def detail(post_id):
  # TODO: Pass through the appropriate post from post_collection using '.find_one()'
  return render_template('detail.html', username=username)


@app.route('/vote/<vote_type>/<post_id>', methods=['POST'])
def vote(vote_type, post_id):
  print("Voting " + vote_type + " on " + post_id)
  post = post_collection.find_one({'_id': ObjectId(post_id)})

  if vote_type == 'up':
    # Modify the post to add the user's name to the post's 'upvotes' list
    # (and remove from downvotes list)
    if not username in post['upvotes']:
      post['upvotes'].append(username)
    if username in post['downvotes']:
      post['downvotes'].remove(username)
    post_collection.update_one({'_id': ObjectId(post_id)}, {'$set': post})

  elif vote_type == 'down':
    # TODO: Modify the post to add the user's name to the post's 'downvotes' list
    # (and remove from upvotes list)
    pass
  elif vote_type == 'none':
    # TODO: Modify the post to remove the user's name from the post's
    # 'upvotes' and 'downvotes' lists
    pass
  else:
    return 'Invalid vote type', 400

  return 'Success', 200