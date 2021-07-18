# Project - Travel App API Project Spec

Here is a link to some starter code for building this project:

[Trip Planner Flask Starter](https://github.com/Product-College-Labs/trip-planner)

## Overview

We will be building a trip planning app that stores a list of trips for a user.
The goal of this project is for you to practice everything you have learnt about building an API.

Users can create a trip, add waypoints to a trip (a list of stops a user will take in a trip) and mark a trip as completed.

### The API

Your API should contain/use:

1. a non-relational database to store all our trips.(mongodb)
2. a trips resource - you should be able to create, list, show, update and destroy trips.
3. completed trips are marked as completed.
4. unit tests for all routes.

## Client

When you are done with the Flask API, write an iOS client to connect and display the list of trips.
Authenticate the user, display trips and a detail of the trip with waypoints and completed status of each trip.


### Routes and Actions

Create unit tests for and then implement the following new resources and routes:

### ***Users***

| Action  | HTTP Verb | Path             | Effect                           |
|---------|-----------|------------------|----------------------------------|
| create  | POST      | /user           | Creates a new user               |
| index   |           |                 |                                  |
| show    | GET       | /user           | Shows a specific user            |
| update  | PUT/PATCH | /user           | Updates/replaces a specific user |
| destroy | DELETE    | /user           | Deletes a specific user          |


### ***Trips***

| Action  	| HTTP Verb 	| Path             	| Effect                           	|
|---------	|-----------	|------------------	|----------------------------------	|
| create  	| POST      	| /trips           	| Creates a new trip               	|
| index   	| GET       	| /trips           	| Shows/lists all trips            	|
| show    	| GET       	| /trips/<trip_id> 	| Shows a specific trip            	|
| update  	| PUT/PATCH 	| /trips/<trip_id> 	| Updates/replaces a specific trip 	|
| destroy 	| DELETE    	| /trips/<trip_id> 	| Deletes a specific trip          	|


## Project Milestones

Backend: 

- [x] User - Create/Update a user - post request
- [x] User - Get a user with a get request

- [x] Trips - Create a trip
- [x] Trips - Update a trip with completed status
- [x] Trips - Add waypoints to a trip (a list of named stops in a trip)

- [x] User - Sign up a user, hash the password
- [x] User - Sign in a user, check password with hash in database

iOS Client:

- [x] Authenticates user with HTTP Basic Auth
- [x] Display list of trips, trip waypoints and completed status of each trip

