import server
import unittest
import json
import bcrypt
import base64
from pymongo import MongoClient


class TripPlannerTestCase(unittest.TestCase):
    def setUp(self):

      self.app = server.app.test_client()
      # Run app in testing mode to retrieve exceptions and stack traces
      server.app.config['TESTING'] = True

      mongo = MongoClient('localhost', 27017)
      global db

      # Reduce encryption workloads for tests
      server.app.bcrypt_rounds = 4

      db = mongo.trip_planner_test
      server.app.db = db

      db.drop_collection('users')
      db.drop_collection('trips')

    # User tests, fill with test methods
    def testCreateUser(self):
        pass

if __name__ == '__main__':
    unittest.main()
