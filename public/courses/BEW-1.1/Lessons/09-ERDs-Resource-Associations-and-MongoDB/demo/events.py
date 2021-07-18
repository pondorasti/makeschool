from pymongo import MongoClient

client = MongoClient()

client.drop_database('test_database')
db = client.test_database

# Add a user to represent a single Guest
first_guest = {
  "name": "Dani",
  "rsvps": []
}

# Insert the new Guest
first_guest_inserted = db.Guests.insert_one(first_guest)
print(first_guest_inserted)
first_guest_id = first_guest_inserted.inserted_id

# Create a dictionary to represent a new Event.
# Add our first guest to the list of invitees:
new_event = {
  "title": "Burning Man",
  "description": "Hang out in the desert",
  "guests": [first_guest_id]
}

# Insert the Event object into the Events collection.
# Once added to the collection, we can store the saved Event ID for later use:
new_event_id = db.Events.insert_one(new_event).inserted_id

# Allow the first_guest to RSVP for the new_event:
db.Guests.find_one_and_update({'_id': first_guest_id}, {'$push': {'rsvps': new_event_id }})

# Print events
for event in db.Events.find():
    print(event)

# Print guests
for guest in db.Guests.find():
    print(guest)