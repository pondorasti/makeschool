from pymongo import MongoClient

client = MongoClient()
db = client.reddit_clone_db

post_collection = db.posts

posts = [
  {
    'text': 'Look at this cool website!',
    'content': 'Here is some long-form text about this page.',
    'url': 'https://google.com',
    'author': 'meredith',
    'upvotes': ['meredith'],
    'downvotes': [],
  },
  {
    'text': 'Take fun courses online',
    'content': 'Here is some long-form text about this page.',
    'url': 'https://coursera.org',
    'author': 'meredith',
    'upvotes': [],
    'downvotes': [],
  },
  {
    'text': 'Learn Python',
    'content': 'Here is some long-form text about this page.',
    'url': 'https://www.learnpython.org/',
    'author': 'meredith',
    'upvotes': ['meredith'],
    'downvotes': []
  }
]


post_collection.drop()

post_collection.insert_many(posts)