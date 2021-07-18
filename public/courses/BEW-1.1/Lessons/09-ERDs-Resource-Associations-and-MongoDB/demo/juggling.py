from pymongo import MongoClient

client = MongoClient()

client.drop_database('test_database')
db = client.test_database

new_post = {
  'title': 'Mastering the Three Ball Cascade',
  'subreddit': 'Jugglers Anonymous'
}

db.Posts.insert_one(new_post)

# Return all Posts in a specific subreddit:
juggling_posts = db.Posts.find({'subreddit': 'Jugglers Anonymous'})
for post in juggling_posts:
    print(post)

